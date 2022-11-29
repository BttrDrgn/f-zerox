#include "common.h"

#pragma GLOBAL_ASM("asm/nonmatchings/game_197D0/func_8007F7D0.s")

#pragma GLOBAL_ASM("asm/nonmatchings/game_197D0/func_8007F86C.s")

void func_8007F904(void) {
    func_8007F86C(&D_800CD520, &D_80400008, &D_800E4350, &D_800E44D0, &D_800E4650);
}

void func_8007F94C(void) {
    D_800E4348 = osViGetCurrentFramebuffer();
}

#pragma GLOBAL_ASM("asm/nonmatchings/game_197D0/func_8007F970.s")

#pragma GLOBAL_ASM("asm/nonmatchings/game_197D0/func_8007F9E0.s")

#pragma GLOBAL_ASM("asm/nonmatchings/game_197D0/func_8007FA64.s")

#pragma GLOBAL_ASM("asm/nonmatchings/game_197D0/func_8007FB80.s")

void func_8007FC68(s32 arg0) {
    s8* sp1C;

    sprintf(&sp1C, &D_800D46C0, arg0);
    func_8007FB80(0x61, 0x50, &D_800D46C8);
    func_8007FB80(0xC9, 0x50, &sp1C);
}

void func_8007FCB8(void) {
    func_8007F94C();
    func_8007F970();
    func_8007FB80(0x28, 0x6E, &D_800D46D8);
}

void func_8007FCF4(void) {
    func_8007F94C();
    func_8007F970();
    func_8007FB80(0x2D, 0x5A, &D_800D46FC);
    func_8007FB80(0x2D, 0x6E, &D_800D471C);
    func_8007FB80(0x2D, 0x82, &D_800D473C);
}

void func_8007FD58(void) {
    func_8007F94C();
    func_8007F970();
    func_8007FB80(0x2D, 0x6E, &D_800D474C);
    func_8007FB80(0x2D, 0x82, &D_800D476C);
    func_8007FB80(0x2D, 0x96, &D_800D478C);
    func_8007FB80(0x2D, 0xAA, &D_800D479C);
}

void func_8007FDD0(void) {
    func_8007F94C();
    func_8007F970();
    func_8007FB80(0x35, 0x6E, &D_800D47B4);
    func_8007FB80(0x35, 0x82, &D_800D47D0);
    func_8007FB80(0x35, 0x96, &D_800D47EC);
    func_8007FB80(0x35, 0xAA, &D_800D480C);
}

void func_8007FE48(void) {
    func_8007F94C();
    func_8007F970();
    func_8007FB80(0x38, 0x64, &D_800D481C);
    func_8007FB80(0x38, 0x78, &D_800D4834);
}

void func_8007FE98(void) {
    func_8007F94C();
    func_8007F970();
    func_8007FB80(0x3B, 0x6E, &D_800D4854);
}

void func_8007FED4(void) {
    func_8007F94C();
    func_8007F970();
    func_8007FB80(0x37, 0x64, &D_800D4870);
    func_8007FB80(0x37, 0x78, &D_800D488C);
}
