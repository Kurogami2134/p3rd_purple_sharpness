.psp

.relativeinclude on

LOAD_ADD        equ 0x088009F0
SPRITE_HOOK     equ 0x09D5EAC4
COLOR_HOOK      equ 0x09D620F0
BOUNCE_HOOK     equ 0x09C1E630
PURPLE_PALETTE  equ 0x14
RAW_MULTIPLIER  equ 0x09C42914
ELE_MULTIPLIER  equ 0x09C4292C

PURPLE_COLOR    equ 0x0896FE80
COLOR_COUNT1    equ 0x088402B4
COLOR_COUNT2    equ 0x08840354

GET_SHARPNESS_HOOK_1    equ 0x08840280
GET_SHARPNESS_HOOK_2    equ 0x088A7FB0

NEW_SHARPNESS_TABLES    equ 0x8800A000

.createfile "../bin/psp.bin", LOAD_ADD - 8
.word LOAD_ADD
.word @main_block_end - LOAD_ADD

.include "patch.asm"

@main_block_end:

.word BOUNCE_HOOK
.word 8
    j       get_bounce
    nop

.word COLOR_HOOK
.word 8
    j       get_color
    subu    v0, v0, v1

.word SPRITE_HOOK
.word 4
    j       get_sprite

.word RAW_MULTIPLIER
.word 4
.float 1.45

.word ELE_MULTIPLIER
.word 4
.float 1.2

.close

.createfile "../bin/purple.bin", 0

.include "main.asm"

.close
