.word GET_SHARPNESS_HOOK_1
.word 20
.area 20, 0
    li      v0, NEW_SHARPNESS_TABLES
    sll     a0, v1, 0x4
    sll     v1, v1, 0x1
    subu    a0, a0, v1
.endarea

.word GET_SHARPNESS_HOOK_2
.word 16
.area 16, 0
    li      v0, NEW_SHARPNESS_TABLES
    sll     a0, v1, 0x4
    sll     v1, v1, 0x1
.endarea

.word PURPLE_COLOR
.word 4
    .byte   0x93
    .byte   0x4f
    .byte   0xd8
    .byte   0xFF

.word COLOR_COUNT1
.word 4
    li      s1, 7

.word COLOR_COUNT2
.word 4
    slti    v0, s7, 6

.include "sharpness_table.asm"

.word -1
.word 0
