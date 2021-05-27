; zero page
.enum $0000
	; 16 bytes temp space
	tmp00 .dsb 1, $00
	tmp01 .dsb 1, $00
	tmp02 .dsb 1, $00
	tmp03 .dsb 1, $00
	tmp04 .dsb 1, $00
	tmp05 .dsb 1, $00
	tmp06 .dsb 1, $00
	tmp07 .dsb 1, $00
	tmp08 .dsb 1, $00
	tmp09 .dsb 1, $00
	tmp0A .dsb 1, $00
	tmp0B .dsb 1, $00
	tmp0C .dsb 1, $00
	tmp0D .dsb 1, $00
	tmp0E .dsb 1, $00
	tmp0F .dsb 1, $00

	vblanked   .dsb 1 ; are we in vblank?
	frameCount .dsw 1 ; frame counter

	; shadow regs
	int_ppuCtrl   .dsb 1 ; internal PPU_CTRL (last2000)
	int_ppuMask   .dsb 1 ; internal PPU_MASK (last2001)
	int_ppuStatus .dsb 1 ; internal PPU_STATUS read (last2002)
	int_scrollX   .dsb 1 ; internal PPU_SCROLL (first write)
	int_scrollY   .dsb 1 ; internal PPU_SCROLL (second write)
	int_last4016  .dsb 1 ; last write to $4016

	; vt03 shadow regs
	int_vt03vc0   .dsb 1 ; internal VT03_VIDEOCONTROL0
	int_vt03vc1   .dsb 1 ; internal VT03_VIDEOCONTROL1

	; input vars
	pad1Trigger .dsb 1 ; "UpDown" in some sources.
	pad2Trigger .dsb 1 ;
	pad1State .dsb 1 ; "Data" in some sources.
	pad2State .dsb 1 ;

	; vram buffer vars
	vramUpdateWaiting .dsb 1,$00 ; is a vram update waiting?
	vramDataCurPos    .dsb 1,$00 ; location in overall vram buffer
	palUpdateWaiting  .dsb 1,$00 ; is a palette update waiting?

	; sprite data shite
	curSpriteIndex .dsb 1,$00

	; color tester variables
	cursorPos     .dsb 1
	curPalSet     .dsb 1 ; 0-3=bg, 4-7=spr
	curColorIndex .dsb 1 ; 0-15 for 4bpp palettes

	curHue .dsb 1
	curSat .dsb 1
	curLum .dsb 1
.ende

; $200 for sprites

; $300 for vram buffer
.enum $0300
	vramBufData .dsb $E0 ; $0300-$03DF: vram buffer data
.ende

; $400 for new color format 4bpp palette buffer
.enum $0400
	newPalBufData .dsb $100 ; palette buf data (new style colors, 4bpp)
.ende

; $500
; $600
; $700
