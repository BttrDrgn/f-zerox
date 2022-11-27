SECTIONS
{
    __romPos = 0;
    _gp = 0x0;
    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    .header : AT(header_ROM_START) SUBALIGN(16)
    {
        header_DATA_START = .;
        header_s = .;
        build/asm/header.s.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    .boot : AT(boot_ROM_START) SUBALIGN(16)
    {
        boot_DATA_START = .;
        boot_bin = .;
        build/assets/boot.bin.o(.data);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);
    }
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    boot_VRAM_END = .;

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    .main 0x80067000 : AT(main_ROM_START) SUBALIGN(16)
    {
        main_TEXT_START = .;
        build/asm/entrypoint.s.o(.text);
        build/asm/game_1AE0.s.o(.text);
        build/asm/game_2A60.s.o(.text);
        build/asm/game_2B00.s.o(.text);
        build/asm/game_2B20.s.o(.text);
        build/asm/game_73F0.s.o(.text);
        build/asm/game_EA90.s.o(.text);
        build/asm/game_F0B0.s.o(.text);
        build/asm/game_F1C0.s.o(.text);
        build/asm/game_10490.s.o(.text);
        build/asm/game_11CF0.s.o(.text);
        build/asm/game_14440.s.o(.text);
        build/asm/game_18410.s.o(.text);
        build/asm/game_194E0.s.o(.text);
        build/asm/game_197D0.s.o(.text);
        build/asm/game_19F40.s.o(.text);
        build/asm/game_36ED0.s.o(.text);
        build/asm/game_44620.s.o(.text);
        build/asm/game_446D0.s.o(.text);
        build/asm/game_459A0.s.o(.text);
        build/asm/game_4EBC0.s.o(.text);
        build/asm/game_4EC40.s.o(.text);
        build/asm/game_4FFB0.s.o(.text);
        build/asm/game_511D0.s.o(.text);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);
        main_DATA_START = .;
        entrypoint_s = .;
        build/asm/entrypoint.s.o(.data);
        game_1AE0_s = .;
        build/asm/game_1AE0.s.o(.data);
        game_2A60_s = .;
        build/asm/game_2A60.s.o(.data);
        game_2B00_s = .;
        build/asm/game_2B00.s.o(.data);
        game_2B20_s = .;
        build/asm/game_2B20.s.o(.data);
        game_73F0_s = .;
        build/asm/game_73F0.s.o(.data);
        game_EA90_s = .;
        build/asm/game_EA90.s.o(.data);
        game_F0B0_s = .;
        build/asm/game_F0B0.s.o(.data);
        game_F1C0_s = .;
        build/asm/game_F1C0.s.o(.data);
        game_10490_s = .;
        build/asm/game_10490.s.o(.data);
        game_11CF0_s = .;
        build/asm/game_11CF0.s.o(.data);
        game_14440_s = .;
        build/asm/game_14440.s.o(.data);
        game_18410_s = .;
        build/asm/game_18410.s.o(.data);
        game_194E0_s = .;
        build/asm/game_194E0.s.o(.data);
        game_197D0_s = .;
        build/asm/game_197D0.s.o(.data);
        game_19F40_s = .;
        build/asm/game_19F40.s.o(.data);
        game_36ED0_s = .;
        build/asm/game_36ED0.s.o(.data);
        game_44620_s = .;
        build/asm/game_44620.s.o(.data);
        game_446D0_s = .;
        build/asm/game_446D0.s.o(.data);
        game_459A0_s = .;
        build/asm/game_459A0.s.o(.data);
        game_4EBC0_s = .;
        build/asm/game_4EBC0.s.o(.data);
        game_4EC40_s = .;
        build/asm/game_4EC40.s.o(.data);
        game_4FFB0_s = .;
        build/asm/game_4FFB0.s.o(.data);
        game_511D0_s = .;
        build/asm/game_511D0.s.o(.data);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);
        main_RODATA_START = .;
        build/asm/entrypoint.s.o(.rodata);
        build/asm/game_1AE0.s.o(.rodata);
        build/asm/game_2A60.s.o(.rodata);
        build/asm/game_2B00.s.o(.rodata);
        build/asm/game_2B20.s.o(.rodata);
        build/asm/game_73F0.s.o(.rodata);
        build/asm/game_EA90.s.o(.rodata);
        build/asm/game_F0B0.s.o(.rodata);
        build/asm/game_F1C0.s.o(.rodata);
        build/asm/game_10490.s.o(.rodata);
        build/asm/game_11CF0.s.o(.rodata);
        build/asm/game_14440.s.o(.rodata);
        build/asm/game_18410.s.o(.rodata);
        build/asm/game_194E0.s.o(.rodata);
        build/asm/game_197D0.s.o(.rodata);
        build/asm/game_19F40.s.o(.rodata);
        build/asm/game_36ED0.s.o(.rodata);
        build/asm/game_44620.s.o(.rodata);
        build/asm/game_446D0.s.o(.rodata);
        build/asm/game_459A0.s.o(.rodata);
        build/asm/game_4EBC0.s.o(.rodata);
        build/asm/game_4EC40.s.o(.rodata);
        build/asm/game_4FFB0.s.o(.rodata);
        build/asm/game_511D0.s.o(.rodata);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);
    }
    main_bss_VRAM = ADDR(.main_bss);
    .main_bss (NOLOAD) : SUBALIGN(16)
    {
        main_BSS_START = .;
        build/asm/entrypoint.s.o(.bss);
        build/asm/game_1AE0.s.o(.bss);
        build/asm/game_2A60.s.o(.bss);
        build/asm/game_2B00.s.o(.bss);
        build/asm/game_2B20.s.o(.bss);
        build/asm/game_73F0.s.o(.bss);
        build/asm/game_EA90.s.o(.bss);
        build/asm/game_F0B0.s.o(.bss);
        build/asm/game_F1C0.s.o(.bss);
        build/asm/game_10490.s.o(.bss);
        build/asm/game_11CF0.s.o(.bss);
        build/asm/game_14440.s.o(.bss);
        build/asm/game_18410.s.o(.bss);
        build/asm/game_194E0.s.o(.bss);
        build/asm/game_197D0.s.o(.bss);
        build/asm/game_19F40.s.o(.bss);
        build/asm/game_36ED0.s.o(.bss);
        build/asm/game_44620.s.o(.bss);
        build/asm/game_446D0.s.o(.bss);
        build/asm/game_459A0.s.o(.bss);
        build/asm/game_4EBC0.s.o(.bss);
        build/asm/game_4EC40.s.o(.bss);
        build/asm/game_4FFB0.s.o(.bss);
        build/asm/game_511D0.s.o(.bss);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);
    }
    __romPos += SIZEOF(.main);
    __romPos = ALIGN(__romPos, 16);
    main_ROM_END = __romPos;
    main_VRAM_END = .;

    _55620_ROM_START = __romPos;
    _55620_VRAM = ADDR(._55620);
    ._55620 : AT(_55620_ROM_START) SUBALIGN(16)
    {
        _55620_DATA_START = .;
        _55620_bin = .;
        build/assets/55620.bin.o(.data);
        _55620_DATA_END = .;
        _55620_DATA_SIZE = ABSOLUTE(_55620_DATA_END - _55620_DATA_START);
    }
    __romPos += SIZEOF(._55620);
    _55620_ROM_END = __romPos;
    _55620_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
