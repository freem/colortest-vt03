; VT03/VT09 Default Palette Colors
;==============================================================================;
; Default Palette Colors low 6 bits
DefaultPalette_Lo:
	;--------- s,l,h
	.db $00 ; black (BG Palette 1 color index #0)
	VT03Pal_Lo 0,$F,0 ; (BG Palette 1 color index #1)
	VT03Pal_Lo 0,$E,0 ; (BG Palette 1 color index #2)
	VT03Pal_Lo 0,$D,0 ; (BG Palette 1 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 2 color index #0)
	VT03Pal_Lo 7,5,6  ; (BG Palette 2 color index #1)
	VT03Pal_Lo 7,6,6  ; (BG Palette 2 color index #2)
	VT03Pal_Lo 7,7,6  ; (BG Palette 2 color index #3)
	;-----------------;
	.db $00 ; (BG Palette 3 color index #0)
	VT03Pal_Lo 7,5,$A ; (BG Palette 3 color index #1)
	VT03Pal_Lo 7,6,$A ; (BG Palette 3 color index #2)
	VT03Pal_Lo 7,7,$A ; (BG Palette 3 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 4 color index #0)
	VT03Pal_Lo 7,5,1  ; (BG Palette 4 color index #1)
	VT03Pal_Lo 7,6,1  ; (BG Palette 4 color index #2)
	VT03Pal_Lo 7,7,1  ; (BG Palette 4 color index #3)

	;--------- s,l,h
	.db $00 ; (Sprite Palette 1 color index #0)
	VT03Pal_Lo 2,$E,1 ; (Sprite Palette 1 color index #1)
	VT03Pal_Lo 2,$D,1 ; (Sprite Palette 1 color index #2)
	VT03Pal_Lo 2,$C,1 ; (Sprite Palette 1 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 2 color index #0)
	VT03Pal_Lo 5,3,5  ; (Sprite Palette 2 color index #1)
	VT03Pal_Lo 5,4,5  ; (Sprite Palette 2 color index #2)
	VT03Pal_Lo 5,5,5  ; (Sprite Palette 2 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 3 color index #0)
	VT03Pal_Lo 5,3,$A ; (Sprite Palette 3 color index #1)
	VT03Pal_Lo 5,4,$A ; (Sprite Palette 3 color index #2)
	VT03Pal_Lo 5,5,$A ; (Sprite Palette 3 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 4 color index #0)
	VT03Pal_Lo 5,3,1 ; (Sprite Palette 4 color index #1)
	VT03Pal_Lo 5,4,1 ; (Sprite Palette 4 color index #2)
	VT03Pal_Lo 5,5,1 ; (Sprite Palette 4 color index #3)

	;--------------------------------------------------------------------------;

	;--------- s,l,h
	VT03Pal_Lo 0,$C,0  ; (BG Palette 1 color index #4)
	VT03Pal_Lo 0,$B,0  ; (BG Palette 1 color index #5)
	VT03Pal_Lo 0,$A,0  ; (BG Palette 1 color index #6)
	VT03Pal_Lo 0,9,0   ; (BG Palette 1 color index #7)
	;------------------;
	VT03Pal_Lo 7,8,6   ; (BG Palette 2 color index #4)
	VT03Pal_Lo 7,9,6   ; (BG Palette 2 color index #5)
	VT03Pal_Lo 7,$A,6  ; (BG Palette 2 color index #6)
	VT03Pal_Lo 7,$B,6  ; (BG Palette 2 color index #7)
	;------------------;
	VT03Pal_Lo 7,8,$A  ; (BG Palette 3 color index #4)
	VT03Pal_Lo 7,9,$A  ; (BG Palette 3 color index #5)
	VT03Pal_Lo 7,$A,$A ; (BG Palette 3 color index #6)
	VT03Pal_Lo 7,$B,$A ; (BG Palette 3 color index #7)
	;------------------;
	VT03Pal_Lo 7,8,1   ; (BG Palette 4 color index #4)
	VT03Pal_Lo 7,9,1   ; (BG Palette 4 color index #5)
	VT03Pal_Lo 7,$A,1  ; (BG Palette 4 color index #6)
	VT03Pal_Lo 7,$B,1  ; (BG Palette 4 color index #7)

	VT03Pal_Lo 2,$B,1 ; (Sprite Palette 1 color index #4)
	VT03Pal_Lo 2,$A,1 ; (Sprite Palette 1 color index #5)
	VT03Pal_Lo 2,9,1 ; (Sprite Palette 1 color index #6)
	VT03Pal_Lo 2,8,1 ; (Sprite Palette 1 color index #7)
	;-----------------;
	VT03Pal_Lo 5,6,5  ; (Sprite Palette 2 color index #4)
	VT03Pal_Lo 5,7,5  ; (Sprite Palette 2 color index #5)
	VT03Pal_Lo 5,8,5  ; (Sprite Palette 2 color index #6)
	VT03Pal_Lo 5,9,5  ; (Sprite Palette 2 color index #7)
	;-----------------;
	VT03Pal_Lo 5,6,$A ; (Sprite Palette 3 color index #4)
	VT03Pal_Lo 5,7,$A ; (Sprite Palette 3 color index #5)
	VT03Pal_Lo 5,8,$A ; (Sprite Palette 3 color index #6)
	VT03Pal_Lo 5,9,$A ; (Sprite Palette 3 color index #7)
	;-----------------;
	VT03Pal_Lo 5,6,1  ; (Sprite Palette 4 color index #4)
	VT03Pal_Lo 5,7,1  ; (Sprite Palette 4 color index #5)
	VT03Pal_Lo 5,8,1  ; (Sprite Palette 4 color index #6)
	VT03Pal_Lo 5,9,1  ; (Sprite Palette 4 color index #7)

	;--------------------------------------------------------------------------;

	;--------- s,l,h
	VT03Pal_Lo 0,8,0 ; (BG Palette 1 color index #8)
	VT03Pal_Lo 0,7,0 ; (BG Palette 1 color index #9)
	VT03Pal_Lo 0,6,0 ; (BG Palette 1 color index #10)
	VT03Pal_Lo 0,5,0 ; (BG Palette 1 color index #11)
	;-----------------;
	VT03Pal_Lo 7,4,7 ; (BG Palette 2 color index #8)
	VT03Pal_Lo 7,5,7 ; (BG Palette 2 color index #9)
	VT03Pal_Lo 7,6,7 ; (BG Palette 2 color index #10)
	VT03Pal_Lo 7,7,7 ; (BG Palette 2 color index #11)
	;-----------------;
	VT03Pal_Lo 7,4,$C ; (BG Palette 3 color index #8)
	VT03Pal_Lo 7,5,$C ; (BG Palette 3 color index #9)
	VT03Pal_Lo 7,6,$C ; (BG Palette 3 color index #10)
	VT03Pal_Lo 7,7,$C ; (BG Palette 3 color index #11)
	;-----------------;
	VT03Pal_Lo 7,4,4 ; (BG Palette 4 color index #8)
	VT03Pal_Lo 7,5,4 ; (BG Palette 4 color index #9)
	VT03Pal_Lo 7,6,4 ; (BG Palette 4 color index #10)
	VT03Pal_Lo 7,7,4 ; (BG Palette 4 color index #11)

	; sprites 16x
	VT03Pal_Lo 2,7,1  ; (Sprite Palette 1 color index #8)
	VT03Pal_Lo 2,6,1  ; (Sprite Palette 1 color index #9)
	VT03Pal_Lo 2,5,1  ; (Sprite Palette 1 color index #10)
	VT03Pal_Lo 2,4,1  ; (Sprite Palette 1 color index #11)
	;-----------------;
	VT03Pal_Lo 5,$A,5 ; (Sprite Palette 2 color index #8)
	VT03Pal_Lo 5,$B,5 ; (Sprite Palette 2 color index #9)
	VT03Pal_Lo 5,$C,5 ; (Sprite Palette 2 color index #10)
	VT03Pal_Lo 5,$D,5 ; (Sprite Palette 2 color index #11)
	;-----------------;
	VT03Pal_Lo 5,$A,$A ; (Sprite Palette 3 color index #8)
	VT03Pal_Lo 5,$B,$A ; (Sprite Palette 3 color index #9)
	VT03Pal_Lo 5,$C,$A ; (Sprite Palette 3 color index #10)
	VT03Pal_Lo 5,$D,$A ; (Sprite Palette 3 color index #11)
	;-----------------;
	VT03Pal_Lo 5,$A,1 ; (Sprite Palette 4 color index #8)
	VT03Pal_Lo 5,$B,1 ; (Sprite Palette 4 color index #9)
	VT03Pal_Lo 5,$C,1 ; (Sprite Palette 4 color index #10)
	VT03Pal_Lo 5,$D,1 ; (Sprite Palette 4 color index #11)

	;--------------------------------------------------------------------------;

	;--------- s,l,h
	VT03Pal_Lo 1,5,1  ; (BG Palette 1 color index #12)
	VT03Pal_Lo 1,6,1  ; (BG Palette 1 color index #13)
	VT03Pal_Lo 1,7,1  ; (BG Palette 1 color index #14)
	VT03Pal_Lo 1,8,1  ; (BG Palette 1 color index #15)
	;-----------------;
	VT03Pal_Lo 7,8,7  ; (BG Palette 2 color index #12)
	VT03Pal_Lo 7,9,7  ; (BG Palette 2 color index #13)
	VT03Pal_Lo 7,$A,7 ; (BG Palette 2 color index #14)
	VT03Pal_Lo 7,$B,7 ; (BG Palette 2 color index #15)
	;-----------------;
	VT03Pal_Lo 7,8,$C ; (BG Palette 3 color index #12)
	VT03Pal_Lo 7,9,$C ; (BG Palette 3 color index #13)
	VT03Pal_Lo 7,$A,$C ; (BG Palette 3 color index #14)
	VT03Pal_Lo 7,$B,$C ; (BG Palette 3 color index #15)
	;-----------------;
	VT03Pal_Lo 7,8,4  ; (BG Palette 4 color index #12)
	VT03Pal_Lo 7,9,4  ; (BG Palette 4 color index #13)
	VT03Pal_Lo 7,$A,4 ; (BG Palette 4 color index #14)
	VT03Pal_Lo 7,$B,4 ; (BG Palette 4 color index #15)

	; sprites 16x
	VT03Pal_Lo 1,0,$C ; (Sprite Palette 1 color index #12)
	VT03Pal_Lo 1,0,5  ; (Sprite Palette 1 color index #13)
	VT03Pal_Lo 1,0,8  ; (Sprite Palette 1 color index #14)
	VT03Pal_Lo 0,$F,0 ; (Sprite Palette 1 color index #15)
	;-----------------;
	VT03Pal_Lo 4,$D,5 ; (Sprite Palette 2 color index #12)
	VT03Pal_Lo 3,$D,5 ; (Sprite Palette 2 color index #13)
	VT03Pal_Lo 2,$D,5 ; (Sprite Palette 2 color index #14)
	VT03Pal_Lo 1,$D,5 ; (Sprite Palette 2 color index #15)
	;-----------------;
	VT03Pal_Lo 4,$D,$A ; (Sprite Palette 3 color index #12)
	VT03Pal_Lo 3,$D,$A ; (Sprite Palette 3 color index #13)
	VT03Pal_Lo 2,$D,$A ; (Sprite Palette 3 color index #14)
	VT03Pal_Lo 1,$D,$A ; (Sprite Palette 3 color index #15)
	;-----------------;
	VT03Pal_Lo 4,$D,1 ; (Sprite Palette 4 color index #12)
	VT03Pal_Lo 3,$D,1 ; (Sprite Palette 4 color index #13)
	VT03Pal_Lo 2,$D,1 ; (Sprite Palette 4 color index #14)
	VT03Pal_Lo 1,$D,1 ; (Sprite Palette 4 color index #15)

;==============================================================================;
; Default Palette Colors high 6 bits
DefaultPalette_Hi:
	.db $00 ; black (BG Palette 1 color index #0)
	;--------- s,l,h
	VT03Pal_Hi 0,$F,0 ; white (BG Palette 1 color index #1)
	VT03Pal_Hi 0,$E,0 ; RGB ff0000, table $10C (BG Palette 1 color index #2)
	VT03Pal_Hi 0,$D,0  ; RGB ff8000, table $521 (BG Palette 1 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 2 color index #0)
	VT03Pal_Hi 7,5,6  ; (BG Palette 2 color index #1)
	VT03Pal_Hi 7,6,6  ; (BG Palette 2 color index #2)
	VT03Pal_Hi 7,7,6  ; (BG Palette 2 color index #3)
	;-----------------;
	.db $00 ; (BG Palette 3 color index #0)
	VT03Pal_Hi 7,5,$A ; (BG Palette 3 color index #1)
	VT03Pal_Hi 7,6,$A ; (BG Palette 3 color index #2)
	VT03Pal_Hi 7,7,$A ; (BG Palette 3 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 4 color index #0)
	VT03Pal_Hi 7,5,1  ; (BG Palette 4 color index #1)
	VT03Pal_Hi 7,6,1  ; (BG Palette 4 color index #2)
	VT03Pal_Hi 7,7,1  ; (BG Palette 4 color index #3)

	;--------- s,l,h
	.db $00 ; black (Sprite Palette 1 color index #0)
	VT03Pal_Hi 2,$E,1 ; (Sprite Palette 1 color index #1)
	VT03Pal_Hi 2,$D,1 ; (Sprite Palette 1 color index #2)
	VT03Pal_Hi 2,$C,1 ; (Sprite Palette 1 color index #3)
	;-----------------;
	.db $00 ; black (Sprite Palette 2 color index #0)
	VT03Pal_Hi 5,3,5 ; (Sprite Palette 2 color index #1)
	VT03Pal_Hi 5,4,5 ; (Sprite Palette 2 color index #2)
	VT03Pal_Hi 5,5,5 ; (Sprite Palette 2 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 3 color index #0)
	VT03Pal_Hi 5,3,$A ; (Sprite Palette 3 color index #1)
	VT03Pal_Hi 5,4,$A ; (Sprite Palette 3 color index #2)
	VT03Pal_Hi 5,5,$A ; (Sprite Palette 3 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 4 color index #0)
	VT03Pal_Hi 5,3,1 ; (Sprite Palette 4 color index #1)
	VT03Pal_Hi 5,4,1 ; (Sprite Palette 4 color index #2)
	VT03Pal_Hi 5,5,1 ; (Sprite Palette 4 color index #3)

	;--------------------------------------------------------------------------;

	;--------- s,l,h
	VT03Pal_Hi 0,$C,0  ; (BG Palette 1 color index #4)
	VT03Pal_Hi 0,$B,0  ; (BG Palette 1 color index #5)
	VT03Pal_Hi 0,$A,0  ; (BG Palette 1 color index #6)
	VT03Pal_Hi 0,9,0   ; (BG Palette 1 color index #7)
	;------------------;
	VT03Pal_Hi 7,8,6   ; (BG Palette 2 color index #4)
	VT03Pal_Hi 7,9,6   ; (BG Palette 2 color index #5)
	VT03Pal_Hi 7,$A,6  ; (BG Palette 2 color index #6)
	VT03Pal_Hi 7,$B,6  ; (BG Palette 2 color index #7)
	;------------------;
	VT03Pal_Hi 7,8,$A  ; (BG Palette 3 color index #4)
	VT03Pal_Hi 7,9,$A  ; (BG Palette 3 color index #5)
	VT03Pal_Hi 7,$A,$A ; (BG Palette 3 color index #6)
	VT03Pal_Hi 7,$B,$A ; (BG Palette 3 color index #7)
	;------------------;
	VT03Pal_Hi 7,8,1   ; (BG Palette 4 color index #4)
	VT03Pal_Hi 7,9,1   ; (BG Palette 4 color index #5)
	VT03Pal_Hi 7,$A,1  ; (BG Palette 4 color index #6)
	VT03Pal_Hi 7,$B,1  ; (BG Palette 4 color index #7)

	VT03Pal_Hi 2,$B,1 ; (Sprite Palette 1 color index #4)
	VT03Pal_Hi 2,$A,1 ; (Sprite Palette 1 color index #5)
	VT03Pal_Hi 2,9,1 ; (Sprite Palette 1 color index #6)
	VT03Pal_Hi 2,8,1  ; (Sprite Palette 1 color index #7)
	;-----------------;
	VT03Pal_Hi 5,6,5  ; (Sprite Palette 2 color index #4)
	VT03Pal_Hi 5,7,5  ; (Sprite Palette 2 color index #5)
	VT03Pal_Hi 5,8,5  ; (Sprite Palette 2 color index #6)
	VT03Pal_Hi 5,9,5  ; (Sprite Palette 2 color index #7)
	;-----------------;
	VT03Pal_Hi 5,6,$A ; (Sprite Palette 3 color index #4)
	VT03Pal_Hi 5,7,$A ; (Sprite Palette 3 color index #5)
	VT03Pal_Hi 5,8,$A ; (Sprite Palette 3 color index #6)
	VT03Pal_Hi 5,9,$A ; (Sprite Palette 3 color index #7)
	;-----------------;
	VT03Pal_Hi 5,6,1  ; (Sprite Palette 4 color index #4)
	VT03Pal_Hi 5,7,1  ; (Sprite Palette 4 color index #5)
	VT03Pal_Hi 5,8,1  ; (Sprite Palette 4 color index #6)
	VT03Pal_Hi 5,9,1  ; (Sprite Palette 4 color index #7)

	;--------------------------------------------------------------------------;

	;--------- s,l,h
	VT03Pal_Hi 0,8,0  ; (BG Palette 1 color index #8)
	VT03Pal_Hi 0,7,0  ; (BG Palette 1 color index #9)
	VT03Pal_Hi 0,6,0  ; (BG Palette 1 color index #10)
	VT03Pal_Hi 0,5,0  ; (BG Palette 1 color index #11)
	;-----------------;
	VT03Pal_Hi 7,4,7  ; (BG Palette 2 color index #8)
	VT03Pal_Hi 7,5,7  ; (BG Palette 2 color index #9)
	VT03Pal_Hi 7,6,7  ; (BG Palette 2 color index #10)
	VT03Pal_Hi 7,7,7  ; (BG Palette 2 color index #11)
	;-----------------;
	VT03Pal_Hi 7,4,$C ; (BG Palette 3 color index #8)
	VT03Pal_Hi 7,5,$C ; (BG Palette 3 color index #9)
	VT03Pal_Hi 7,6,$C ; (BG Palette 3 color index #10)
	VT03Pal_Hi 7,7,$C ; (BG Palette 3 color index #11)
	;-----------------;
	VT03Pal_Hi 7,4,4  ; (BG Palette 4 color index #8)
	VT03Pal_Hi 7,5,4  ; (BG Palette 4 color index #9)
	VT03Pal_Hi 7,6,4  ; (BG Palette 4 color index #10)
	VT03Pal_Hi 7,7,4  ; (BG Palette 4 color index #11)

	; sprites 16x
	VT03Pal_Hi 2,7,1  ; (Sprite Palette 1 color index #8)
	VT03Pal_Hi 2,6,1  ; (Sprite Palette 1 color index #9)
	VT03Pal_Hi 2,5,1  ; (Sprite Palette 1 color index #10)
	VT03Pal_Hi 2,4,1  ; (Sprite Palette 1 color index #11)
	;-----------------;
	VT03Pal_Hi 5,$A,5  ; (Sprite Palette 2 color index #8)
	VT03Pal_Hi 5,$B,5  ; (Sprite Palette 2 color index #9)
	VT03Pal_Hi 5,$C,5  ; (Sprite Palette 2 color index #10)
	VT03Pal_Hi 5,$D,5  ; (Sprite Palette 2 color index #11)
	;-----------------;
	VT03Pal_Hi 5,$A,$A  ; (Sprite Palette 3 color index #8)
	VT03Pal_Hi 5,$B,$A  ; (Sprite Palette 3 color index #9)
	VT03Pal_Hi 5,$C,$A  ; (Sprite Palette 3 color index #10)
	VT03Pal_Hi 5,$D,$A  ; (Sprite Palette 3 color index #11)
	;-----------------;
	VT03Pal_Hi 5,$A,1  ; (Sprite Palette 4 color index #8)
	VT03Pal_Hi 5,$B,1  ; (Sprite Palette 4 color index #9)
	VT03Pal_Hi 5,$C,1  ; (Sprite Palette 4 color index #10)
	VT03Pal_Hi 5,$D,1  ; (Sprite Palette 4 color index #11)

	;--------------------------------------------------------------------------;

	;--------- s,l,h
	VT03Pal_Hi 1,5,1 ; (BG Palette 1 color index #12)
	VT03Pal_Hi 1,6,1 ; (BG Palette 1 color index #13)
	VT03Pal_Hi 1,7,1 ; (BG Palette 1 color index #14)
	VT03Pal_Hi 1,8,1 ; (BG Palette 1 color index #15)
	;-----------------;
	VT03Pal_Hi 7,8,7  ; (BG Palette 2 color index #12)
	VT03Pal_Hi 7,9,7  ; (BG Palette 2 color index #13)
	VT03Pal_Hi 7,$A,7 ; (BG Palette 2 color index #14)
	VT03Pal_Hi 7,$B,7 ; (BG Palette 2 color index #15)
	;-----------------;
	VT03Pal_Hi 7,8,$C  ; (BG Palette 3 color index #12)
	VT03Pal_Hi 7,9,$C  ; (BG Palette 3 color index #13)
	VT03Pal_Hi 7,$A,$C ; (BG Palette 3 color index #14)
	VT03Pal_Hi 7,$B,$C ; (BG Palette 3 color index #15)
	;-----------------;
	VT03Pal_Hi 7,8,4  ; (BG Palette 4 color index #12)
	VT03Pal_Hi 7,9,4  ; (BG Palette 4 color index #13)
	VT03Pal_Hi 7,$A,4 ; (BG Palette 4 color index #14)
	VT03Pal_Hi 7,$B,4 ; (BG Palette 4 color index #15)

	; sprites 16x
	VT03Pal_Hi 1,0,$C  ; (Sprite Palette 1 color index #12)
	VT03Pal_Hi 1,0,5  ; (Sprite Palette 1 color index #13)
	VT03Pal_Hi 1,0,8  ; (Sprite Palette 1 color index #14)
	VT03Pal_Hi 0,$F,0  ; (Sprite Palette 1 color index #15)
	;-----------------;
	VT03Pal_Hi 4,$D,5 ; (Sprite Palette 2 color index #12)
	VT03Pal_Hi 3,$D,5 ; (Sprite Palette 2 color index #13)
	VT03Pal_Hi 2,$D,5 ; (Sprite Palette 2 color index #14)
	VT03Pal_Hi 1,$D,5 ; (Sprite Palette 2 color index #15)
	;-----------------;
	VT03Pal_Hi 4,$D,$A ; (Sprite Palette 3 color index #12)
	VT03Pal_Hi 3,$D,$A ; (Sprite Palette 3 color index #13)
	VT03Pal_Hi 2,$D,$A ; (Sprite Palette 3 color index #14)
	VT03Pal_Hi 1,$D,$A ; (Sprite Palette 3 color index #15)
	;-----------------;
	VT03Pal_Hi 4,$D,1 ; (Sprite Palette 4 color index #12)
	VT03Pal_Hi 3,$D,1 ; (Sprite Palette 4 color index #13)
	VT03Pal_Hi 2,$D,1 ; (Sprite Palette 4 color index #14)
	VT03Pal_Hi 1,$D,1 ; (Sprite Palette 4 color index #15)
