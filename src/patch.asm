.word 1 ;  Main Block
.word @main_block_end - @main_block
.ascii "PSHP"
@main_block:

.func get_color
    subu    v0, v0, v1
    li      at, 0xD
    beql    at, v0, @@ret
    li      v0, PURPLE_PALETTE
@@ret:
    j       COLOR_HOOK + 8
    sb      v0, 0x32(s1)
.endfunc

.func get_sprite
    li      at, 6
    beql    at, v1, @@ret
    li      v1, 5
@@ret:
    j       SPRITE_HOOK + 8
    move    s0, a0  ; restore functionality
.endfunc

.func get_bounce
    li      at, 6
    beql    at, a1, @@cont
    addiu   at, a1, -1
    move    at, a1
@@cont:
    sll     v0, at, 1
    j       BOUNCE_HOOK + 8
    sll     a0, at, 3
.endfunc

@main_block_end:

.word 2 ;  Hook Block
.word BOUNCE_HOOK
.halfword get_bounce - @main_block
.byte 8
.byte 1

.word 2 ;  Hook Block
.word COLOR_HOOK
.halfword get_color - @main_block
.byte 8
.byte 1

.word 2 ;  Hook Block
.word SPRITE_HOOK
.halfword get_sprite - @main_block
.byte 8
.byte 1

.word 0 ;  Patch Block
.word RAW_MULTIPLIER
.word 4
.float 1.45

.word 0 ;  Patch Block
.word ELE_MULTIPLIER
.word 4
.float 1.2
