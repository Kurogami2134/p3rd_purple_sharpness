.func get_color
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
