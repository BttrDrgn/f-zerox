#include "common.h"

void func_8007F4E0(s32 arg0, s32 arg1) {
    D_800CD510 = 1;
    D_800E4264 = arg0;
    D_800E4260 = arg1;
}

#pragma GLOBAL_ASM("asm/nonmatchings/game_194E0/func_8007F500.s")
// void func_8007F500(void) {
//     static struct UnkStruct_0 D_800E42C9;
//     D_800E42C9.unk0 = 0;
//     D_800E42C9.unk1 = 0;
//     D_800E42C9.unk2 = 0;
//     D_800E42C9.unk3 = 0;
//     D_800E42CC = 0;
// }

#pragma GLOBAL_ASM("asm/nonmatchings/game_194E0/func_8007F520.s")

#pragma GLOBAL_ASM("asm/nonmatchings/game_194E0/func_8007F5EC.s")
