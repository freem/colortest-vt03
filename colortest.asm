; VT03 color tester | attempt 2 (without old style color mode)
;==============================================================================;
; todo: VT32 Mapper 296 version, which uses a different palette format
; http://wiki.nesdev.com/w/index.php/NES_2.0_Mapper_296
;==============================================================================;
.include "nes.inc"
.include "vt03.inc"

;==============================================================================;
; available defines:

; _BIN - build ROM without NES 2.0 header

; _BIGROM - build ROM for OneBus hardware (as opposed to Waixing's VTxx emulator)
; the name comes from the fact that all OneBus ROMs start execution at $007FFFC,
; meaning the *smallest* possible rom is 512KiB.

; _VT32 - build ROM for VT32

;==============================================================================;
.ifndef _BIN
; NES 2.0 header
; mapper 256, console type VT03

	.db "NES",$1A
.ifdef _BIGROM
	.db 32 ; PRG-ROM - 16K step
	.db 0 ; CHR-ROM - none in OneBus...
.else
	.db 1 ; PRG-ROM - 16K step
	.db 2 ; CHR-ROM - 8K step (in this case, 2 pages of 4bpp tiles)
.endif

; flags 6
; 76543210
; ||||||||
; |||||||+-- hard wired nametable
; ||||||+--- battery
; |||||+---- trainer
; ||||+----- four screen
; ++++------ mapper low bits D0-D3
	.db 0

; flags 7
; 76543210
; ||||||||
; ||||||++-- console type (0=normal, 1=vs, 2=pc10, 3=extended)
; ||||++---- NES 2.0 identifier (10)
; ++++------ mapper mid bits D4-D7
	.db $0B

; flags 8
; 76543210
; ||||||||
; ||||++++-- mapper high bits D8-D11
; ++++------ submapper number
	.db 1

; prg/chr size msb
	.db 0

; prg-ram/eeprom
	.db 0

; chr-ram size
	.db 0

	.db 0 ; cpu/ppu timing (0=NTSC, 1=PAL, 2=multi, 3=Dendy)

; extended console type
; $0 - standard
; $1 - VS system
; $2 - playchoice
; $3 - famiclone where BCD mode actually works
; $4 - vt01 monochrome
; $5 - vt01 red/cyan
; $6 - vt02
; $7 - vt03
; $8 - vt09
; $9 - vt32
; $A - vt369
; $B - UM6578
.ifdef _VT32
	.db 9
.else
	.db 7
.endif

	.db 0 ; misc. roms

	.db 1 ; default expansion device
.endif

;==============================================================================;
.include "ram.inc" ; ram defs

;==============================================================================;
.ifdef _BIGROM
	.incbin "testchr.4bpp"
	; padding. lots and lots of padding.
	.dsb $78000,0
.endif

;==============================================================================;
; begin program code
.org $C000
.ifdef _VT32
	.db "VT32"
.else
	.db "VT03"
.endif
	.db " Color Test by freem",$00

;==============================================================================;
; 4bpp palette mode for backgrounds is weird...

; it's probably easiest to think of the new palette in chunks of 4 colors...
; this assumes you're using 16 colors for both backgrounds and sprites.
; I'm unsure of how it'd work out if you're using 2bpp for one or both
;-------+-------+-----------+--------------
;Pal-Lo |Pal-Hi | Pal Type  | Color Nums
;-------+-------+-----------+--------------
; $3F00 | $3F80 | BG pal 0  | colors 0-3
; $3F04 | $3F84 | BG pal 1  | colors 0-3
; $3F08 | $3F88 | BG pal 2  | colors 0-3
; $3F0C | $3F8C | BG pal 3  | colors 0-3
;-------+-------+-----------+--------------
; $3F10 | $3F90 | Spr pal 0 | colors 0-3
; $3F14 | $3F94 | Spr pal 1 | colors 0-3
; $3F18 | $3F98 | Spr pal 2 | colors 0-3
; $3F1C | $3F9C | Spr pal 3 | colors 0-3
;-------+-------+-----------+--------------
; $3F20 | $3FA0 | BG pal 0  | colors 4-7
; $3F24 | $3FA4 | BG pal 1  | colors 4-7
; $3F28 | $3FA8 | BG pal 2  | colors 4-7
; $3F2C | $3FAC | BG pal 3  | colors 4-7
;-------+-------+-----------+--------------
; $3F30 | $3FB0 | Spr pal 0 | colors 4-7
; $3F34 | $3FB4 | Spr pal 1 | colors 4-7
; $3F38 | $3FB8 | Spr pal 2 | colors 4-7
; $3F3C | $3FBC | Spr pal 3 | colors 4-7
;-------+-------+-----------+--------------
; $3F40 | $3FC0 | BG pal 0  | colors 8-11
; $3F44 | $3FC4 | BG pal 1  | colors 8-11
; $3F48 | $3FC8 | BG pal 2  | colors 8-11
; $3F4C | $3FCC | BG pal 3  | colors 8-11
;-------+-------+-----------+--------------
; $3F50 | $3FD0 | Spr pal 0 | colors 8-11
; $3F54 | $3FD4 | Spr pal 1 | colors 8-11
; $3F58 | $3FD8 | Spr pal 2 | colors 8-11
; $3F5C | $3FDC | Spr pal 3 | colors 8-11
;-------+-------+-----------+--------------
; $3F60 | $3FE0 | BG pal 0  | colors 12-15
; $3F64 | $3FE4 | BG pal 1  | colors 12-15
; $3F68 | $3FE8 | BG pal 2  | colors 12-15
; $3F6C | $3FEC | BG pal 3  | colors 12-15
;-------+-------+-----------+--------------
; $3F70 | $3FF0 | Spr pal 0 | colors 12-15
; $3F74 | $3FF4 | Spr pal 1 | colors 12-15
; $3F78 | $3FF8 | Spr pal 2 | colors 12-15
; $3F7C | $3FFC | Spr pal 3 | colors 12-15
;-------+-------+-----------+--------------

.ifdef _VT32
	.include "defaultpal_vt32.asm"
.else
	.include "defaultpal_vt03.asm"
.endif

;==============================================================================;
waitVBlank:
	inc vblanked
@waitLoop:
	lda vblanked
	bne @waitLoop
	rts

MainLoop:
	jsr io_readJoySafe
	jsr waitVBlank
	jsr ppu_ClearBuffer
	jsr HandleInput
	jmp MainLoop

;==============================================================================;
NUM_MENU_ITEMS = 5

AttribsBGPreview1: .db $40,$50,$50,$50,$50
AttribsBGPreview2: .db $C8,$FA,$FA,$FA,$FA

; Sprite preview X pos
SpritePreviewX: .db 184,200,216,232

; Sprite preview Y pos
SpritePreviewY:
	.db 184-1,176-1,168-1,160-1,152-1,144-1,136-1,128-1
	.db 120-1,112-1,104-1,96-1,88-1,80-1,72-1,64-2

Label_Header:
.ifdef _VT32
	.db "VT32"
.else
	.db "VT03"
.endif
	.db " Color Test"

Label_PalSet:   .db "Pal Set"
Label_BG:       .db "BG "
Label_SPR:      .db "SPR"
Label_PalIndex: .db "Pal Index"

; VT03, VT09
Label_Hue:      .db "Hue"
Label_Sat:      .db "Sat"
Label_Lum:      .db "Lum"

; VT32
Label_Red:      .db "Red"
Label_Green:    .db "Grn"
Label_Blue:     .db "Blu"

Label_Value:    .db "Hex"
Label_HiLo:     .db "HiLo"

Label_HelpCursor:  .db $80,$81,$00,"Cursor"
Label_HelpValue:   .db $82,$83,$00,"Value"
Label_HelpEnd:

SetupUI:
	; Label_Header $2069
	lda #$20
	ldx #$69
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #0
@lblHeader:
	lda Label_Header,y
	sta PPU_DATA
	iny
	cpy #Label_PalSet-Label_Header
	bne @lblHeader

	;--------------------------------;
	; line under it $2089
	lda #$20
	ldx #$89
	sta PPU_ADDR
	stx PPU_ADDR

	lda #$10
	sta PPU_DATA
	sta PPU_DATA
	sta PPU_DATA
	sta PPU_DATA
	sta PPU_DATA

	lda #0
	sta PPU_DATA

	lda #$FD
	ldx #$FE
	ldy #$FF
	sta PPU_DATA
	stx PPU_DATA
	sty PPU_DATA

	iny
	sty PPU_DATA

	lda #$10
	sta PPU_DATA
	sta PPU_DATA
	sta PPU_DATA
	sta PPU_DATA
	sta PPU_DATA

	;--------------------------------;
	; initial cursor position $2103
	lda #$21
	ldx #$03
	ldy #$1F
	sta PPU_ADDR
	stx PPU_ADDR
	sty PPU_DATA

	;--------------------------------;
	; Label_PalSet $2105
	lda #<Label_PalSet
	sta tmp00
	lda #>Label_PalSet
	sta tmp01
	ldx #$21
	ldy #$05
	lda #Label_BG-Label_PalSet
	jsr ppu_writeString

	;--------------------------------;
	; Label_PalIndex $2145
	lda #<Label_PalIndex
	sta tmp00
	lda #>Label_PalIndex
	sta tmp01
	ldx #$21
	ldy #$45
	lda #Label_Hue-Label_PalIndex
	jsr ppu_writeString

	;--------------------------------;
.ifdef _VT32
	; Label_Red $2185
	lda #<Label_Red
	sta tmp00
	lda #>Label_Red
	sta tmp01
	ldx #$21
	ldy #$85
	lda #Label_Green-Label_Red
	jsr ppu_writeString
.else
	; Label_Hue $2185
	lda #<Label_Hue
	sta tmp00
	lda #>Label_Hue
	sta tmp01
	ldx #$21
	ldy #$85
	lda #Label_Sat-Label_Hue
	jsr ppu_writeString
.endif

	;--------------------------------;
.ifdef _VT32
	; Label_Blue $21A5
	lda #<Label_Blue
	sta tmp00
	lda #>Label_Blue
	sta tmp01
	ldx #$21
	ldy #$A5
	lda #Label_Value-Label_Blue
	jsr ppu_writeString
.else
	; Label_Sat $21A5
	lda #<Label_Sat
	sta tmp00
	lda #>Label_Sat
	sta tmp01
	ldx #$21
	ldy #$A5
	lda #Label_Lum-Label_Sat
	jsr ppu_writeString
.endif

	;--------------------------------;
.ifdef _VT32
	; Label_Green $21C5
	lda #<Label_Green
	sta tmp00
	lda #>Label_Green
	sta tmp01
	ldx #$21
	ldy #$C5
	lda #Label_Blue-Label_Green
	jsr ppu_writeString
.else
	; Label_Lum $21C5
	lda #<Label_Lum
	sta tmp00
	lda #>Label_Lum
	sta tmp01
	ldx #$21
	ldy #$C5
	lda #Label_Red-Label_Lum
	jsr ppu_writeString
.endif

	;--------------------------------;
	; Label_Value $218E
	lda #<Label_Value
	sta tmp00
	lda #>Label_Value
	sta tmp01
	ldx #$21
	ldy #$8E
	lda #Label_HiLo-Label_Value
	jsr ppu_writeString

	;--------------------------------;
	; $ at $21AD, just before displayed hex value
	ldx #$21
	ldy #$AD
	lda #$24
	stx PPU_ADDR
	sty PPU_ADDR
	sta PPU_DATA

	;--------------------------------;
	; Label_HiLo $21CE
	lda #<Label_HiLo
	sta tmp00
	lda #>Label_HiLo
	sta tmp01
	ldx #$21
	ldy #$CE
	lda #Label_HelpCursor-Label_HiLo
	jsr ppu_writeString

	;--------------------------------;
	; default values
	; - pal set (BG1) $2110
	lda #$21
	ldx #$10
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #0
@valuePalSet:
	lda Label_BG,y
	sta PPU_DATA
	iny
	cpy #3
	bne @valuePalSet

	lda #0
	sta PPU_DATA
	lda curPalSet
	clc
	adc #$31
	sta PPU_DATA

	;--------------------------------;
	; - pal index $2150
	lda #$21
	ldx #$50
	sta PPU_ADDR
	stx PPU_ADDR
	lda curColorIndex
	clc
	adc #$90
	sta PPU_DATA

	;--------------------------------;
	; - hue, sat, lum ($2189, $21A9, $21C9)
	lda #$21
	ldx #$89
	sta PPU_ADDR
	stx PPU_ADDR
	lda curHue
	clc
	adc #$90
	sta PPU_DATA

	lda #$21
	ldx #$A9
	sta PPU_ADDR
	stx PPU_ADDR
	lda curSat
	clc
	adc #$90
	sta PPU_DATA

	lda #$21
	ldx #$C9
	sta PPU_ADDR
	stx PPU_ADDR
	lda curLum
	clc
	adc #$90
	sta PPU_DATA

	;--------------------------------;
	; - hex value ($21AE)
	jsr UpdateHexValueDisplay ; xxx: I am lazy

	;--------------------------------;
	; BG Palettes preview
	; - label & number ($2222, $2262, $22A2, $22E2)
	lda #$22
	sta PPU_ADDR
	sta PPU_ADDR
	lda #"B"
	ldx #"G"
	ldy #"1"
	sta PPU_DATA
	stx PPU_DATA
	sty PPU_DATA

	lda #$22
	ldx #$62
	sta PPU_ADDR
	stx PPU_ADDR
	lda #"B"
	ldx #"G"
	ldy #"2"
	sta PPU_DATA
	stx PPU_DATA
	sty PPU_DATA

	lda #$22
	ldx #$A2
	sta PPU_ADDR
	stx PPU_ADDR
	lda #"B"
	ldx #"G"
	ldy #"3"
	sta PPU_DATA
	stx PPU_DATA
	sty PPU_DATA

	lda #$22
	ldx #$E2
	sta PPU_ADDR
	stx PPU_ADDR
	lda #"B"
	ldx #"G"
	ldy #"4"
	sta PPU_DATA
	stx PPU_DATA
	sty PPU_DATA

	; - tiles
	; $2226
	lda #$22
	ldx #$26
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #1
@tilesBG1:
	sty PPU_DATA
	iny
	cpy #$10
	bne @tilesBG1
	ldx #$60
	stx PPU_DATA

	; $2266
	ldx #$66
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #1
@tilesBG2:
	sty PPU_DATA
	iny
	cpy #$10
	bne @tilesBG2
	ldx #$60
	stx PPU_DATA

	; $22A6
	ldx #$A6
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #1
@tilesBG3:
	sty PPU_DATA
	iny
	cpy #$10
	bne @tilesBG3
	ldx #$60
	stx PPU_DATA

	; $22E6
	ldx #$E6
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #1
@tilesBG4:
	sty PPU_DATA
	iny
	cpy #$10
	bne @tilesBG4
	ldx #$60
	stx PPU_DATA

	; - attributes
	; $23E1
	lda #$23
	ldx #$E1
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #0
@attribs1:
	lda AttribsBGPreview1,y
	sta PPU_DATA
	iny
	cpy #5
	bne @attribs1

	; $23E9
	lda #$23
	ldx #$E9
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #0
@attribs2:
	lda AttribsBGPreview2,y
	sta PPU_DATA
	iny
	cpy #5
	bne @attribs2

	;--------------------------------;
	; Sprite Palettes preview text
	; - numbers $2337
	lda #$23
	ldx #$37
	sta PPU_ADDR
	stx PPU_ADDR
	lda #0
	ldy #$31
@lblSprNums:
	sty PPU_DATA
	sta PPU_DATA
	iny
	cpy #$35
	bne @lblSprNums

	; - label $2359
	lda #$23
	ldx #$59
	sta PPU_ADDR
	stx PPU_ADDR
	lda #"S"
	ldx #"P"
	ldy #"R"
	sta PPU_DATA
	stx PPU_DATA
	sty PPU_DATA

	;--------------------------------;
	; set up sprite palette preview blocks
	; y, tilenum, attrib, x
	lda #0
	tax ; preview set number
	tay ; index into OAM_BUF
	sta tmp09 ; oambuf index

@nextSet:
	lda #0
	sta tmp08 ; index for sprite Y and tile number

@continueSet:
	; get index for sprite Y and tile number
	ldy tmp08
	lda SpritePreviewY,y
	; restore OAM_BUF index
	ldy tmp09
	sta OAM_BUF,y
	iny

	; tile num
	lda tmp08
	clc
	adc #1
	sta OAM_BUF,y
	iny

	; attrib
	txa
	sta OAM_BUF,y
	iny

	; SpritePreviewX
	lda SpritePreviewX,x
	sta OAM_BUF,y
	iny

	sty tmp09 ; save OAM_BUF index again

	; check if we're done with this set
	inc tmp08
	lda tmp08
	cmp #15
	bne @continueSet

	; if we are, add the "16-colors in a single tile" sprite
	ldy tmp08
	lda SpritePreviewY,y
	ldy tmp09
	sta OAM_BUF,y
	iny

	lda #$10
	sta OAM_BUF,y
	iny

	txa
	sta OAM_BUF,y
	iny

	lda SpritePreviewX,x
	sta OAM_BUF,y
	iny

	sty tmp09 ; save OAM_BUF index again

	; check if we're done with all sets
	inx
	cpx #4
	bne @nextSet

	;--------------------------------;
	; help labels
	; cursor $2329
	lda #$23
	ldx #$29
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #0
@lblHelpCursor:
	lda Label_HelpCursor,y
	sta PPU_DATA
	iny
	cpy #Label_HelpValue-Label_HelpCursor
	bne @lblHelpCursor

	; value $2349
	lda #$23
	ldx #$49
	sta PPU_ADDR
	stx PPU_ADDR
	ldy #0
@lblHelpValue:
	lda Label_HelpValue,y
	sta PPU_DATA
	iny
	cpy #Label_HelpEnd-Label_HelpValue
	bne @lblHelpValue

	rts

;==============================================================================;
; Input Handler
HandleInput:
	; select+start: soft reset
	lda pad1Trigger
	and #PAD_SELECT|PAD_START
	cmp #PAD_SELECT|PAD_START
	bne @HandleInputNormal

	jsr waitVBlank
	lda #0
	sta int_ppuCtrl
	sta int_ppuMask
	jmp Reset

@HandleInputNormal:
	lda pad1Trigger
	and #PAD_UP|PAD_DOWN|PAD_LEFT|PAD_RIGHT
	beq @exit

	; check up
	lda pad1Trigger
	and #PAD_UP
	beq @checkDown

	; cursor up
	lda cursorPos
	sta tmp00 ; previous cursor position
	bne @cursorUpNormal

	lda #NUM_MENU_ITEMS-1
	sta cursorPos
	bne @updateCursorUp

@cursorUpNormal:
	dec cursorPos

@updateCursorUp:
	jsr UpdateCursorDisplay

@checkDown:
	; check down
	lda pad1Trigger
	and #PAD_DOWN
	beq @checkLeft

	; cursor down
	lda cursorPos
	sta tmp00 ; previous cursor position
	cmp #NUM_MENU_ITEMS-1
	bne @cursorDownNormal

	lda #0
	sta cursorPos
	beq @updateCursorDown

@cursorDownNormal:
	inc cursorPos

@updateCursorDown:
	jsr UpdateCursorDisplay

@checkLeft:
	; check left
	lda pad1Trigger
	and #PAD_LEFT
	beq @checkRight

	; value left
	jsr ModifyValue_Left

@checkRight:
	; check right
	lda pad1Trigger
	and #PAD_RIGHT
	beq @exit

	; value right
	jsr ModifyValue_Right

@exit:
	rts

;==============================================================================;
; map of palette type and set to vram addresses
; this table only handles the lower byte; if you need the upper byte
; for new color mode, OR the lower byte with $80
;-----+---+-------------+-------------+-------------+--------------+
;Type |Set| Colors  0-3 | Colors  4-7 | Colors 8-11 | Colors 12-15 |
;-----+---+-------------+-------------+-------------+--------------+
; BG  | 1 | $3F00-$3F03 | $3F20-$3F23 | $3F40-$3F43 | $3F60-$3F63  |
; BG  | 2 | $3F04-$3F07 | $3F24-$3F27 | $3F44-$3F47 | $3F64-$3F67  |
; BG  | 3 | $3F08-$3F0B | $3F28-$3F2B | $3F48-$3F4B | $3F68-$3F6B  |
; BG  | 4 | $3F0C-$3F0F | $3F2C-$3F2F | $3F4C-$3F4F | $3F6C-$3F6F  |
;-----+---+-------------+-------------+-------------+--------------+
; SPR | 1 | $3F10-$3F13 | $3F30-$3F33 | $3F50-$3F53 | $3F70-$3F73  |
; SPR | 2 | $3F14-$3F17 | $3F34-$3F37 | $3F54-$3F57 | $3F74-$3F77  |
; SPR | 3 | $3F18-$3F1B | $3F38-$3F3B | $3F58-$3F5B | $3F78-$3F7B  |
; SPR | 4 | $3F1C-$3F1F | $3F3C-$3F3F | $3F5C-$3F5F | $3F7C-$3F7F  |
;-----+---+-------------+-------------+-------------+--------------+

; $3F_[X] maps to set number (regardless of BG or SPR)
; curPalSet & 3 is index into this table
PalSetOffsets: .db 0,4,8,$C

; starting value of $3F[X]_ depends on BG or Sprite
; curColorIndex >> 2 is index into this table; OR value with $10 if sprite.
; each entry is essentially (pal index << 3) | spr ? $10 : 0
PalColorOffsets:
	;   0-3 4-7 8-B C-F
	.db $00,$20,$40,$60 ; background palettes
	.db $10,$30,$50,$70 ; sprite palettes

; to calculate a full $3FXX address...
; 1) low portion from PalSetOffsets,(curPalSet&3) | $3F_[X] coarse
; 2) add (curColorIndex & 3) for proper indexing  | $3F_[X] fine
; 3) high portion from PalColorOffsets,curPalSet  | $3F[X]_
; 4) if this is a Sprite palette, OR value with $10

;==============================================================================;
ChangePalSet:
	; set up vram write
	ldy vramDataCurPos
	lda #$21
	sta vramBufData,y
	iny
	lda #$10
	sta vramBufData,y
	iny
	lda #5
	sta vramBufData,y
	iny

	; determine what to write
	lda curPalSet
	cmp #4
	bcs @spritePal

	; 0-3 BG
	ldx #0
@loopLabelBG:
	lda Label_BG,x
	sta vramBufData,y
	iny
	inx
	cpx #3
	bne @loopLabelBG

	lda #0
	sta vramBufData,y
	iny

	lda curPalSet
	clc
	adc #$31
	sta vramBufData,y
	iny
	sty vramDataCurPos

	jmp @palSetDone

@spritePal:
	; 4-7 SPR
	ldx #0
@loopLabelSPR:
	lda Label_SPR,x
	sta vramBufData,y
	iny
	inx
	cpx #3
	bne @loopLabelSPR

	lda #0
	sta vramBufData,y
	iny

	lda curPalSet
	clc
	adc #$2D
	sta vramBufData,y
	iny
	sty vramDataCurPos

@palSetDone:
	lda #1
	sta vramUpdateWaiting
	rts

;==============================================================================;
ChangePalIndex:
	; update display
	ldy vramDataCurPos
	lda #$21
	sta vramBufData,y
	iny
	lda #$50
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda curColorIndex
	clc
	adc #$90
	sta vramBufData,y
	iny

	sty vramDataCurPos
	lda #1
	sta vramUpdateWaiting

	rts

;==============================================================================;
ChangeHue:
	; 1) low portion from PalSetOffsets,(curPalSet&3) | $3F_[X] coarse
	lda curPalSet
	and #3
	tay
	lda PalSetOffsets,y
	sta tmp00

	; 2) add (curColorIndex & 3) for proper indexing  | $3F_[X] fine
	lda curColorIndex
	and #3
	clc
	adc tmp00
	sta tmp00

	; 3) high portion from PalColorOffsets,curPalSet  | $3F[X]_
	lda curColorIndex
	lsr
	lsr
	and #7
	tay
	lda PalColorOffsets,y
	ora tmp00
	sta tmp00

	; 4) if this is a Sprite palette, OR value with $10
	lda curPalSet
	cmp #4
	bcc @updateHue

	lda tmp00
	ora #$10
	sta tmp00

@updateHue:
	ldy tmp00
	lda newPalBufData,y
	and #$30
	ora curHue
	sta tmp01
	sta newPalBufData,y

	; set up palette update in vram buffer
	ldy vramDataCurPos
	lda #$3F
	sta vramBufData,y
	iny
	lda tmp00
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda tmp01
	sta vramBufData,y
	iny

	; update display
	lda #$21
	sta vramBufData,y
	iny
	lda #$89
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny

	lda curHue
	clc
	adc #$90
	sta vramBufData,y
	iny

	sty vramDataCurPos
	lda #1
	sta vramUpdateWaiting

	rts

;==============================================================================;
ChangeSat:
	; 1) low portion from PalSetOffsets,(curPalSet&3) | $3F_[X] coarse
	lda curPalSet
	and #3
	tay
	lda PalSetOffsets,y
	sta tmp00

	; 2) add (curColorIndex & 3) for proper indexing  | $3F_[X] fine
	lda curColorIndex
	and #3
	clc
	adc tmp00
	sta tmp00

	; 3) high portion from PalColorOffsets,curPalSet  | $3F[X]_
	lda curColorIndex
	lsr
	lsr
	and #7
	tay
	lda PalColorOffsets,y
	ora tmp00
	sta tmp00

	; 4) if this is a Sprite palette, OR value with $10
	lda curPalSet
	cmp #4
	bcc @updateSat

	lda tmp00
	ora #$10
	sta tmp00

@updateSat:
	; [new color mode]
	lda tmp00
	ora #$80
	tay
	lda newPalBufData,y
	and #3
	sta tmp01
	lda curSat
	asl
	asl
	ora tmp01
	sta tmp01
	sta newPalBufData,y

	ldy vramDataCurPos
	lda #$3F
	sta vramBufData,y
	iny
	lda tmp00
	ora #$80
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda tmp01
	sta vramBufData,y
	iny

@updateDisplay:
	; update display
	lda #$21
	sta vramBufData,y
	iny
	lda #$A9
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny

	lda curSat
	clc
	adc #$90
	sta vramBufData,y
	iny

	sty vramDataCurPos
	lda #1
	sta vramUpdateWaiting

	rts

;==============================================================================;
ChangeLum:
	; 1) low portion from PalSetOffsets,(curPalSet&3) | $3F_[X] coarse
	lda curPalSet
	and #3
	tay
	lda PalSetOffsets,y
	sta tmp00

	; 2) add (curColorIndex & 3) for proper indexing  | $3F_[X] fine
	lda curColorIndex
	and #3
	clc
	adc tmp00
	sta tmp00

	; 3) high portion from PalColorOffsets,curPalSet  | $3F[X]_
	lda curColorIndex
	lsr
	lsr
	and #7
	tay
	lda PalColorOffsets,y
	ora tmp00
	sta tmp00

	; 4) if this is a Sprite palette, OR value with $10
	lda curPalSet
	cmp #4
	bcc @checkMode

	lda tmp00
	ora #$10
	sta tmp00

@checkMode:
	; [new color mode]
	; luminance in LSB ($00-$7F)
	ldy tmp00
	lda newPalBufData,y
	and #$0F
	sta tmp01
	lda curLum
	and #3
	asl
	asl
	asl
	asl
	ora tmp01
	sta tmp01
	sta newPalBufData,y

	; luminance in MSB ($80-$FF)
	lda tmp00
	ora #$80
	tay
	lda newPalBufData,y
	and #$3C
	sta tmp02
	lda curLum
	lsr
	lsr
	and #3
	ora tmp02
	sta tmp02
	sta newPalBufData,y

	; set up vram buffer
	ldy vramDataCurPos
	lda #$3F
	sta vramBufData,y
	iny
	lda tmp00
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda tmp01
	sta vramBufData,y
	iny

	lda #$3F
	sta vramBufData,y
	iny
	lda tmp00
	ora #$80
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda tmp02
	sta vramBufData,y
	iny

@updateDisplay:
	; update display
	lda #$21
	sta vramBufData,y
	iny
	lda #$C9
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny

	lda curLum
	clc
	adc #$90
	sta vramBufData,y
	iny

	sty vramDataCurPos
	lda #1
	sta vramUpdateWaiting

	rts

;==============================================================================;
; ONLY RUN ON CHANGING PAL SET OR PAL INDEX!

UpdateValueDisplay:
	; 1) low portion from PalSetOffsets,(curPalSet&3) | $3F_[X] coarse
	lda curPalSet
	and #3
	tay
	lda PalSetOffsets,y
	sta tmp00

	; 2) add (curColorIndex & 3) for proper indexing  | $3F_[X] fine
	lda curColorIndex
	and #3
	clc
	adc tmp00
	sta tmp00

	; 3) high portion from PalColorOffsets,curPalSet  | $3F[X]_
	lda curColorIndex
	lsr
	lsr
	and #7
	tay
	lda PalColorOffsets,y
	ora tmp00
	sta tmp00

	; 4) if this is a Sprite palette, OR value with $10
	lda curPalSet
	cmp #4
	bcc @checkMode

	lda tmp00
	ora #$10
	sta tmp00

@checkMode:
	; [new color mode]
	; get values from address and address+$80

	; LSB
	ldy tmp00
	lda newPalBufData,y
	sta tmp01
	and #$0F
	sta curHue

	lda tmp01
	and #$30
	lsr
	lsr
	lsr
	lsr
	sta tmp02 ; lum low 2 bits

	; MSB
	lda tmp00
	ora #$80
	tay
	lda newPalBufData,y
	sta tmp03
	and #$03
	asl
	asl
	ora tmp02
	sta curLum

	lda tmp03
	lsr
	lsr
	and #$0F
	sta curSat

@afterPart1:
	; hue value display $2189
	ldy vramDataCurPos
	lda #$21
	sta vramBufData,y
	iny
	lda #$89
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda curHue
	clc
	adc #$90
	sta vramBufData,y
	iny

	; sat value display $21A9
	lda #$21
	sta vramBufData,y
	iny
	lda #$A9
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda curSat
	clc
	adc #$90
	sta vramBufData,y
	iny

	; lum value display $21C9
	lda #$21
	sta vramBufData,y
	iny
	lda #$C9
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda curLum
	clc
	adc #$90
	sta vramBufData,y
	iny

	; hex value display $21AE
	lda #$21
	sta vramBufData,y
	iny
	lda #$AE
	sta vramBufData,y
	iny
	lda #4
	sta vramBufData,y
	iny

	lda tmp03
	lsr
	lsr
	lsr
	lsr
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	lda tmp03
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	lda tmp01
	lsr
	lsr
	lsr
	lsr
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	lda tmp01
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	sty vramDataCurPos
	lda #1
	sta vramUpdateWaiting

	rts

;==============================================================================;
; this is for the "Hex" value near the middle of the screen.
UpdateHexValueDisplay:
	; 1) low portion from PalSetOffsets,(curPalSet&3) | $3F_[X] coarse
	lda curPalSet
	and #3
	tay
	lda PalSetOffsets,y
	sta tmp00

	; 2) add (curColorIndex & 3) for proper indexing  | $3F_[X] fine
	lda curColorIndex
	and #3
	clc
	adc tmp00
	sta tmp00

	; 3) high portion from PalColorOffsets,curPalSet  | $3F[X]_
	lda curColorIndex
	lsr
	lsr
	and #7
	tay
	lda PalColorOffsets,y
	ora tmp00
	sta tmp00

	; 4) if this is a Sprite palette, OR value with $10
	lda curPalSet
	cmp #4
	bcc @writeValue

	lda tmp00
	ora #$10
	sta tmp00

@writeValue:
	; hex value display $21AE
	ldy vramDataCurPos
	lda #$21
	sta vramBufData,y
	iny
	lda #$AE
	sta vramBufData,y
	iny
	lda #4
	sta vramBufData,y
	iny

	lda tmp00
	ora #$80
	tax
	lda newPalBufData,x
	lsr
	lsr
	lsr
	lsr
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	lda tmp00
	ora #$80
	tax
	lda newPalBufData,x
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	ldx tmp00
	lda newPalBufData,x
	lsr
	lsr
	lsr
	lsr
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	ldx tmp00
	lda newPalBufData,x
	and #$0F
	ora #$90
	sta vramBufData,y
	iny

	sty vramDataCurPos
	lda #1
	sta vramUpdateWaiting

	rts

;==============================================================================;
ModifyValue_Left:
	; yes I could be doing this more effectively, but this is a quickly hacked
	; together demo and I don't care about being effective when I have a
	; decent amount of space at my disposal
	lda cursorPos
	beq @palSet
	cmp #1
	beq @palIndex
	cmp #2
	beq @hue
	cmp #3
	beq @sat
	cmp #4
	beq @lum
	rts

;------------------------------------------------;
@palSet:
	lda curPalSet
	beq @wrapPalSet

	dec curPalSet
	jsr ChangePalSet
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

@wrapPalSet:
	lda #7
	sta curPalSet
	jsr ChangePalSet
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@palIndex:
	; depends on 2bpp vs. 4bpp (this demo only cares about 4bpp)
	lda curColorIndex
	beq @wrapPalIndex

	dec curColorIndex
	jsr ChangePalIndex
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

@wrapPalIndex:
	lda #15
	sta curColorIndex
	jsr ChangePalIndex
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@hue:
	lda curHue
	beq @wrapHue

	dec curHue
	jsr ChangeHue
	jmp UpdateHexValueDisplay

@wrapHue:
	lda #$F
	sta curHue
	jsr ChangeHue
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@sat:
	lda curSat
	beq @wrapSat

	dec curSat
	jsr ChangeSat
	jmp UpdateHexValueDisplay

@wrapSat:
	lda #$F
	sta curSat
	jsr ChangeSat
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@lum:
	lda curLum
	beq @wrapLum

	dec curLum
	jsr ChangeLum
	jmp UpdateHexValueDisplay

@wrapLum:
	lda #$F
	sta curLum
	jsr ChangeLum
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@exit:
	rts

;==============================================================================;

ModifyValue_Right:
	; see comment in ModifyValue_Left
	lda cursorPos
	beq @palSet
	cmp #1
	beq @palIndex
	cmp #2
	beq @hue
	cmp #3
	beq @sat
	cmp #4
	beq @lum
	rts

;------------------------------------------------;
@palSet:
	lda curPalSet
	cmp #7
	beq @wrapPalSet

	inc curPalSet
	jsr ChangePalSet
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

@wrapPalSet:
	lda #0
	sta curPalSet
	jsr ChangePalSet
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@palIndex:
	; depends on 2bpp vs. 4bpp (this demo only cares about 4bpp)
	lda curColorIndex
	cmp #15
	beq @wrapPalIndex

	inc curColorIndex
	jsr ChangePalIndex
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

@wrapPalIndex:
	lda #0
	sta curColorIndex
	jsr ChangePalIndex
	jsr UpdateValueDisplay
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@hue:
	lda curHue
	cmp #$F
	beq @wrapHue

	inc curHue
	jsr ChangeHue
	jmp UpdateHexValueDisplay

@wrapHue:
	lda #0
	sta curHue
	jsr ChangeHue
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@sat:
	lda curSat
	cmp #$F
	beq @wrapSat

	inc curSat
	jsr ChangeSat
	jmp UpdateHexValueDisplay

@wrapSat:
	lda #0
	sta curSat
	jsr ChangeSat
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@lum:
	lda curLum
	cmp #$F
	beq @wrapLum

	inc curLum
	jsr ChangeLum
	jmp UpdateHexValueDisplay

@wrapLum:
	lda #0
	sta curLum
	jsr ChangeLum
	jmp UpdateHexValueDisplay

;------------------------------------------------;
@exit:
	rts

;------------------------------------------------------------------------------;
; cursor positions table
Table_CursorDisplay_Hi: .db $21, $21, $21, $21, $21
Table_CursorDisplay_Lo: .db $03, $43, $83, $A3, $C3

; moving the cursor
; old index in tmp00
UpdateCursorDisplay:
	; blank out the old one
	ldy vramDataCurPos
	ldx tmp00
	lda Table_CursorDisplay_Hi,x
	sta vramBufData,y
	iny
	lda Table_CursorDisplay_Lo,x
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda #0
	sta vramBufData,y
	iny

	; write the new one
	ldx cursorPos
	lda Table_CursorDisplay_Hi,x
	sta vramBufData,y
	iny
	lda Table_CursorDisplay_Lo,x
	sta vramBufData,y
	iny
	lda #1
	sta vramBufData,y
	iny
	lda #$1F
	sta vramBufData,y
	iny
	sty vramDataCurPos

	lda #1
	sta vramUpdateWaiting

	rts

;==============================================================================;
; library code
.include "io.asm"
.include "ppu.asm"

;==============================================================================;
.org $E000

Reset:
	sei
	cld

	lda #0
	sta VT03_410B

.ifdef _BIGROM
	; second to last prg bank
	lda #$FE
	sta VT03_PRGBANK2

	; last prg bank
	lda #$FF
	sta VT03_PRGBANK3
.endif

	ldx #$40
	stx APU_FRAMECOUNT
	ldx #$FF
	txs

	inx
	txa
	sta PPU_CTRL
	sta PPU_MASK
	sta APU_DMC_FREQ

	bit PPU_STATUS
@wait1:
	bit PPU_STATUS
	bpl @wait1

	; clear RAM
@ClearRam:
	sta $00,x
	sta $300,x
	sta $400,x
	sta $500,x
	sta $600,x
	sta $700,x
	inx
	bne @ClearRam

	; clear Sprites
	ldx #0
	lda #$FF
@ClearOAM:
	sta OAM_BUF,x
	inx
	inx
	inx
	inx
	bne @ClearOAM

	; send sprite data to PPU
	lda #2
	sta OAM_DMA

@wait2:
	bit PPU_STATUS
	bpl @wait2

	; set up vrom
	lda #$00
	sta VT03_VROMBANK4
	lda #$02
	sta VT03_VROMBANK5

	ldy #4
	sty VT03_VROMBANK0
	iny
	sty VT03_VROMBANK1
	iny
	sty VT03_VROMBANK2
	iny
	sty VT03_VROMBANK3

	; VT03_VIDEOCONTROL0
	lda #%10000110
	sta int_vt03vc0
	sta VT03_VIDEOCONTROL0

	; VT03_VIDEOCONTROL1
	lda #0
	sta int_vt03vc1
	sta VT03_VIDEOCONTROL1

	; vt03 palette low bits to $3F00
	lda #$3F
	ldx #$00
	sta PPU_ADDR
	stx PPU_ADDR

	ldy #0
@pal_lo:
	lda DefaultPalette_Lo,y
	sta PPU_DATA
	sta newPalBufData,y
	iny
	cpy #$80
	bne @pal_lo

	; vt03 palette high bits to $3F80
	lda #$3F
	ldx #$80
	sta PPU_ADDR
	stx PPU_ADDR

	ldy #0
@pal_hi:
	lda DefaultPalette_Hi,y
	sta PPU_DATA
	sta newPalBufData+$80,y
	iny
	cpy #$80
	bne @pal_hi

	; set inital scroll
	ldx #$20
	lda #$00
	stx PPU_ADDR
	sta PPU_ADDR
	sta PPU_SCROLL
	sta PPU_SCROLL

	; clear nametable and set up UI
	lda #0
	jsr ppu_clearNT
	jsr SetupUI

	; turn on display and stuff
	lda #%10001000
	sta int_ppuCtrl
	sta PPU_CTRL

	lda #%00011110
	sta int_ppuMask
	sta PPU_MASK

	jmp MainLoop

;==============================================================================;
NMI:
	pha
	txa
	pha
	tya
	pha

	; increment framecount
	inc <frameCount
	bne @afterFrameCount
	inc <frameCount+1
@afterFrameCount:
	; update the sprites
	lda #0
	sta OAM_ADDR
	lda #>OAM_BUF
	sta OAM_DMA
	; update nametable stuff (if necessary)
	lda vramUpdateWaiting
	beq @afterVramUpdate

	; do nametable updates
	jsr ppu_WriteBuffer

	; reset necessary vars
	lda #0
	sta vramUpdateWaiting
	sta vramDataCurPos

@afterVramUpdate:
	; palette update (if necessary)
	lda palUpdateWaiting
	beq @afterPalUpdate

	jsr WritePalBuf_NewDma

@afterPalUpdate:
	; do non-PPU-bound things
	lda #0
	sta curSpriteIndex
	sta palUpdateWaiting

	lda int_scrollX
	sta PPU_SCROLL
	lda int_scrollY
	sta PPU_SCROLL

	lda int_vt03vc0
	sta VT03_VIDEOCONTROL0

	lda int_ppuCtrl
	sta PPU_CTRL
	lda int_ppuMask
	sta PPU_MASK

NMI_end:
	lda #0
	sta vblanked

	pla
	tay
	pla
	tax
	pla

IRQ:
	rti

;==============================================================================;
; New VT03 colors
; only reliably works when display is off due to size of transfer (0x100 bytes)
WritePalBuf_New:
	ldx #$3F
	ldy #$00
	stx PPU_ADDR
	sty PPU_ADDR
@palLoop:
	lda newPalBufData,y
	sta PPU_DATA
	iny
	bne @palLoop
	rts

;------------------------------------------------------------------------------;
; New VT03 colors via DMA
WritePalBuf_NewDma:
	lda #$3F
	sta PPU_ADDR

	; need to check NTSC/PAL
	; if we're on NTSC, we need to adjust the starting address,
	; based on a note from the VT03 datasheet.
	lda VT03_RS232_MAIN
	and #VT03_NPMASK
	eor #VT03_NPMASK ; flip the meaning so that we get a 1 if it's NTSC
	lsr
	lsr
	lsr
	sta PPU_ADDR

	; DMA 256 bytes to PPU_DATA
	lda #1
	sta VT03_DMACTRL

	lda #>newPalBufData
	sta VT03_DMAHI

	; restore dma
	lda #0
	sta VT03_DMACTRL
	rts

;==============================================================================;
; vectors
.org $fffa
	.dw NMI
	.dw Reset
	.dw IRQ

;==============================================================================;
; chr-rom
.ifndef _BIGROM
	.incbin "testchr.4bpp"
.endif
