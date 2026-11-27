.ascii "0.01" ;  Mod format version

.word 1 ;  Main Block
.word @main_block_end - @main_block
.ascii "PSHC"
@main_block:
.func get_sharpness_1
    sw      ra, -0x4(sp)
    bal     @@get_offset
    nop
@@get_offset:
    addiu   v0, SHARPNESS_TABLES - @@get_offset
    lw      ra, -0x4(sp)
    sll     a0, v1, 0x4
    sll     v1, v1, 0x1
    j       GET_SHARPNESS_HOOK_1 + 20
    subu    a0, a0, v1
.endfunc

.func get_sharpness_2
    sw      ra, -0x4(sp)
    bal     @@get_offset
    nop
@@get_offset:
    addiu   v0, SHARPNESS_TABLES - @@get_offset
    lw      ra, -0x4(sp)
    sll     a0, v1, 0x4
    j       GET_SHARPNESS_HOOK_2 + 16
    sll     v1, v1, 0x1
.endfunc


SHARPNESS_TABLES:
.include "sharpness_table.asm"
.align 16
@main_block_end:

.word 2 ;  Hook Block
.word GET_SHARPNESS_HOOK_1
.halfword get_sharpness_1 - @main_block
.byte 8
.byte 0

.word 2 ;  Hook Block
.word GET_SHARPNESS_HOOK_2
.halfword get_sharpness_2 - @main_block
.byte 8
.byte 0

.word 0 ;  Patch Block
.word PURPLE_COLOR
.word 4
    .byte   0x93
    .byte   0x4f
    .byte   0xd8
    .byte   0xFF

.word 0 ;  Patch Block
.word COLOR_COUNT1
.word 4
    li      s1, 7

.word 0 ;  Patch Block
.word COLOR_COUNT2
.word 4
    slti    v0, s7, 6

.word -1 ;  End Block

