#forked from mkst/sssv
#*******************************************************************
#		Makefile For Application
#
#			F-Zero X
#
#
#
#******************************************************************


BASENAME  = f-zerox
VERSION  := us

# Colors

NO_COL  := \033[0m
RED     := \033[0;31m
RED2    := \033[1;31m
GREEN   := \033[0;32m
YELLOW  := \033[0;33m
BLUE    := \033[0;34m
PINK    := \033[0;35m
CYAN    := \033[0;36m

# Directories

BUILD_DIR = build
ASM_DIRS  = asm asm/data asm/libultra #For libultra handwritten files
BIN_DIRS  = assets
SRC_DIR   = src

SRC_DIRS  = $(SRC_DIR) $(SRC_DIR)/os $(SRC_DIR)/os/libc $(SRC_DIR)/os/audio

TOOLS_DIR = tools

# Files

S_FILES         = $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s))
C_FILES         = $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
BIN_FILES       = $(foreach dir,$(BIN_DIRS),$(wildcard $(dir)/*.bin))

O_FILES := $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file).o) \
           $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file).o) \
           $(foreach file,$(BIN_FILES),$(BUILD_DIR)/$(file).o)


# Tools

CROSS    = mips64-elf-

AS       = $(CROSS)as
CPP      = cpp
LD       = $(CROSS)ld
OBJCOPY  = $(CROSS)objcopy
PYTHON   = python3
GCC      = gcc

XGCC     = mips64-elf-gcc

GREP     = grep -rl

#For segments without GLOBAL_ASM
QEMU_IRIX = /usr/bin/qemu-irix
CC       = $(QEMU_IRIX) -silent -L $(TOOLS_DIR)/ido5.3_cc $(TOOLS_DIR)/ido5.3_cc/usr/bin/cc
SPLAT    = $(TOOLS_DIR)/splat/split.py



OPT_FLAGS      = -O2
LOOP_UNROLL    =

MIPSISET       = -mips2 -32

INCLUDE_CFLAGS = -I . -I include -I include/2.0I -I include/2.0I/PR -I include/libc -I assets

ASFLAGS        = -EB -mtune=vr4300 -march=vr4300 -mabi=32 -I include
OBJCOPYFLAGS   = -O binary

# Files requiring pre/post-processing
GLOBAL_ASM_C_FILES := $(shell $(GREP) GLOBAL_ASM $(SRC_DIR) </dev/null 2>/dev/null)
GLOBAL_ASM_O_FILES := $(foreach file,$(GLOBAL_ASM_C_FILES),$(BUILD_DIR)/$(file).o)


DEFINES := -D_LANGUAGE_C -D_FINALROM -DF3DEX_GBI -DWIN32 -DSSSV -DNDEBUG


DEFINES += -DVERSION_US

VERIFY = verify

#Soon
#ifeq ($(NON_MATCHING),1)
#DEFINES += -DNON_MATCHING
#VERIFY = no_verify
#PROGRESS_NONMATCHING = --non-matching
#endif

CFLAGS := -Wab,-r4300_mul -non_shared -G 0 -Xcpluscomm -fullwarn  -nostdinc -g0
CFLAGS += $(DEFINES)
# ignore compiler warnings about anonymous structs
CFLAGS += -woff 649,838
CFLAGS += $(INCLUDE_CFLAGS)

CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unknown-pragmas -Wunused-function -Wno-unused-parameter -Wno-unused-variable -Wno-missing-braces -Wno-int-conversion
CC_CHECK := $(GCC) -fsyntax-only -fno-builtin -fsigned-char -std=gnu90 -m32 $(CHECK_WARNINGS) $(INCLUDE_CFLAGS) $(DEFINES)

GCC_FLAGS := $(INCLUDE_CFLAGS) $(DEFINES)
GCC_FLAGS += -G 0 -mno-shared -march=vr4300 -mfix4300 -mabi=32 -mhard-float
GCC_FLAGS += -mdivide-breaks -fno-stack-protector -fno-common -fno-zero-initialized-in-bss -fno-PIC -mno-abicalls -fno-strict-aliasing -fno-inline-functions -ffreestanding -fwrapv
GCC_FLAGS += -Wall -Wextra -Wno-missing-braces

TARGET     = $(BUILD_DIR)/$(BASENAME).$(VERSION)
LD_SCRIPT  = $(BASENAME).$(VERSION).ld

LD_FLAGS   = -T $(LD_SCRIPT) -T undefined_funcs_auto.txt  -T undefined_syms_auto.txt
LD_FLAGS  += -Map $(TARGET).map --no-check-sections

ifeq ($(VERSION),us)
LD_FLAGS_EXTRA  =
LD_FLAGS_EXTRA += $(foreach sym,$(UNDEFINED_SYMS),-u $(sym))
else
LD_FLAGS_EXTRA  =
endif

ASM_PROCESSOR_DIR := $(TOOLS_DIR)/asm-processor
ASM_PROCESSOR      = $(PYTHON) $(ASM_PROCESSOR_DIR)/asm_processor.py

### Optimisation Overrides
$(BUILD_DIR)/src/os/%.c.o: OPT_FLAGS := -O1
$(BUILD_DIR)/src/os/audio/%.c.o: OPT_FLAGS := -O2
$(BUILD_DIR)/src/os/libc/%.c.o: OPT_FLAGS := -O3

### Targets

default: all

all: $(VERIFY)

dirs:
	$(foreach dir,$(SRC_DIRS) $(ASM_DIRS) $(BIN_DIRS),$(shell mkdir -p $(BUILD_DIR)/$(dir)))



check: .baserom.$(VERSION).ok

verify: $(TARGET).z64
	@sha1sum -c f-zerox.us.sha1

no_verify: $(TARGET).z64
	@echo "Skipping SHA1SUM check!"


splat: $(SPLAT)

extract: splat tools
	$(PYTHON) $(SPLAT) $(BASENAME).$(VERSION).yaml


clean:
	rm -rf build

distclean: clean
	rm -rf asm
	rm -rf assets
	rm -f *auto.txt


### Recipes

.baserom.$(VERSION).ok: baserom.$(VERSION).z64
	@echo "$$(cat $(BASENAME).$(VERSION).sha1)  $<" | sha1sum --check
	@touch $@

$(TARGET).elf: dirs $(BASENAME).$(VERSION).ld $(BUILD_DIR)/$(LIBULTRA) $(O_FILES) $(LANG_RNC_O_FILES) $(IMAGE_O_FILES)
	@$(LD) $(LD_FLAGS) $(LD_FLAGS_EXTRA) -o $@
	@printf "[$(PINK) Linker $(NO_COL)]  $<\n"

ifndef PERMUTER
$(GLOBAL_ASM_O_FILES): $(BUILD_DIR)/%.c.o: %.c  include/variables.h include/structs.h
	@$(CC_CHECK) $<
	@printf "[$(YELLOW) check $(NO_COL)] $<\n"
	@$(ASM_PROCESSOR) $(OPT_FLAGS) $< > $(BUILD_DIR)/$<
	@$(CC) -c $(CFLAGS) $(OPT_FLAGS) $(LOOP_UNROLL) $(MIPSISET) -o $@ $(BUILD_DIR)/$<
	@$(ASM_PROCESSOR) $(OPT_FLAGS) $< --post-process $@ \
		--assembler "$(AS) $(ASFLAGS)" --asm-prelude $(ASM_PROCESSOR_DIR)/prelude.inc
	@printf "[$(GREEN) ido5.3 $(NO_COL)]  $<\n"
endif

# non asm-processor recipe
$(BUILD_DIR)/%.c.o: %.c
	@$(CC) -c $(CFLAGS) $(OPT_FLAGS) $(LOOP_UNROLL) $(MIPSISET) -o $@ $<
	@printf "[$(GREEN) ido5.3 $(NO_COL)]  $<\n"



$(BUILD_DIR)/$(LIBULTRA): $(LIBULTRA)
	@mkdir -p $$(dirname $@)
#	@cp $< $@
#	@$(PYTHON) $(TOOLS_DIR)/set_o32abi_bit.py $@



$(BUILD_DIR)/%.s.o: %.s
	@$(AS) $(ASFLAGS) -o $@ $<
	@printf "[$(GREEN)  ASSEMBLER   $(NO_COL)]  $<\n"

$(BUILD_DIR)/%.bin.o: %.bin
	@$(LD) -r -b binary -o $@ $<
	@printf "[$(PINK) Linker $(NO_COL)]  $<\n"

$(TARGET).bin: $(TARGET).elf
	@$(OBJCOPY) $(OBJCOPYFLAGS) $< $@
	@printf "[$(CYAN) Objcopy $(NO_COL)]  $<\n"

$(TARGET).z64: $(TARGET).bin
	@cp $< $@


# fake targets for better error handling
$(SPLAT):
	$(info Repo cloned without submodules, attempting to fetch them now...)
	@which git >/dev/null || echo "ERROR: git binary not found on PATH"
	@which git >/dev/null
	git submodule update --init --recursive

baserom.$(VERSION).z64:
	$(error Place the F-Zero X ROM, named '$@', in the root of this repo and try again.)

### Settings
.SECONDARY:
.PHONY: all clean default
SHELL = /bin/bash -e -o pipefail