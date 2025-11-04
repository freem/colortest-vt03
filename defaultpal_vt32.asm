; VT32 Default Palette Colors
;==============================================================================;
; Default Palette Colors low 6 bits
DefaultPalette_Lo:
	;--------- r,g,b
	.db $00 ; black (BG Palette 1 color index #0)
	VT32Pal_Lo $F,$F,$F ; (BG Palette 1 color index #1)
	VT32Pal_Lo $E,$E,$E ; (BG Palette 1 color index #2)
	VT32Pal_Lo $D,$D,$D ; (BG Palette 1 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 2 color index #0)
	VT32Pal_Lo $F,0,0  ; (BG Palette 2 color index #1)
	VT32Pal_Lo $E,0,0  ; (BG Palette 2 color index #2)
	VT32Pal_Lo $D,0,0  ; (BG Palette 2 color index #3)
	;-----------------;
	.db $00 ; (BG Palette 3 color index #0)
	VT32Pal_Lo 0,$F,0 ; (BG Palette 3 color index #1)
	VT32Pal_Lo 0,$E,0 ; (BG Palette 3 color index #2)
	VT32Pal_Lo 0,$D,0 ; (BG Palette 3 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 4 color index #0)
	VT32Pal_Lo 0,0,$F  ; (BG Palette 4 color index #1)
	VT32Pal_Lo 0,0,$E  ; (BG Palette 4 color index #2)
	VT32Pal_Lo 0,0,$D  ; (BG Palette 4 color index #3)

	;--------- r,g,b
	.db $00 ; (Sprite Palette 1 color index #0)
	VT32Pal_Lo 0,$F,$F ; (Sprite Palette 1 color index #1)
	VT32Pal_Lo 0,$E,$E ; (Sprite Palette 1 color index #2)
	VT32Pal_Lo 0,$D,$D ; (Sprite Palette 1 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 2 color index #0)
	VT32Pal_Lo $F,0,$F  ; (Sprite Palette 2 color index #1)
	VT32Pal_Lo $E,0,$E  ; (Sprite Palette 2 color index #2)
	VT32Pal_Lo $D,0,$D  ; (Sprite Palette 2 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 3 color index #0)
	VT32Pal_Lo $F,$F,0 ; (Sprite Palette 3 color index #1)
	VT32Pal_Lo $E,$E,0 ; (Sprite Palette 3 color index #2)
	VT32Pal_Lo $D,$D,0 ; (Sprite Palette 3 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 4 color index #0)
	VT32Pal_Lo 1,3,5 ; (Sprite Palette 4 color index #1)
	VT32Pal_Lo 1,4,5 ; (Sprite Palette 4 color index #2)
	VT32Pal_Lo 1,5,5 ; (Sprite Palette 4 color index #3)

	;--------------------------------------------------------------------------;

	;--------- r,g,b
	VT32Pal_Lo $C,$C,$C  ; (BG Palette 1 color index #4)
	VT32Pal_Lo $B,$B,$B  ; (BG Palette 1 color index #5)
	VT32Pal_Lo $A,$A,$A  ; (BG Palette 1 color index #6)
	VT32Pal_Lo 9,9,9   ; (BG Palette 1 color index #7)
	;------------------;
	VT32Pal_Lo $C,0,0   ; (BG Palette 2 color index #4)
	VT32Pal_Lo $B,0,0   ; (BG Palette 2 color index #5)
	VT32Pal_Lo $A,0,0  ; (BG Palette 2 color index #6)
	VT32Pal_Lo 9,0,0  ; (BG Palette 2 color index #7)
	;------------------;
	VT32Pal_Lo 0,$C,0  ; (BG Palette 3 color index #4)
	VT32Pal_Lo 0,$B,0  ; (BG Palette 3 color index #5)
	VT32Pal_Lo 0,$A,0 ; (BG Palette 3 color index #6)
	VT32Pal_Lo 0,9,0 ; (BG Palette 3 color index #7)
	;------------------;
	VT32Pal_Lo 0,0,$C   ; (BG Palette 4 color index #4)
	VT32Pal_Lo 0,0,$B   ; (BG Palette 4 color index #5)
	VT32Pal_Lo 0,0,$A  ; (BG Palette 4 color index #6)
	VT32Pal_Lo 0,0,9  ; (BG Palette 4 color index #7)

	VT32Pal_Lo 0,$C,$C ; (Sprite Palette 1 color index #4)
	VT32Pal_Lo 0,$B,$B ; (Sprite Palette 1 color index #5)
	VT32Pal_Lo 0,$A,$A ; (Sprite Palette 1 color index #6)
	VT32Pal_Lo 0,9,9 ; (Sprite Palette 1 color index #7)
	;-----------------;
	VT32Pal_Lo $C,0,$C  ; (Sprite Palette 2 color index #4)
	VT32Pal_Lo $B,0,$B  ; (Sprite Palette 2 color index #5)
	VT32Pal_Lo $A,0,$A  ; (Sprite Palette 2 color index #6)
	VT32Pal_Lo 9,0,9  ; (Sprite Palette 2 color index #7)
	;-----------------;
	VT32Pal_Lo $C,$C,0 ; (Sprite Palette 3 color index #4)
	VT32Pal_Lo $B,$B,0 ; (Sprite Palette 3 color index #5)
	VT32Pal_Lo $A,$A,0 ; (Sprite Palette 3 color index #6)
	VT32Pal_Lo 9,9,0 ; (Sprite Palette 3 color index #7)
	;-----------------;
	VT32Pal_Lo 1,6,5  ; (Sprite Palette 4 color index #4)
	VT32Pal_Lo 1,7,5  ; (Sprite Palette 4 color index #5)
	VT32Pal_Lo 1,8,5  ; (Sprite Palette 4 color index #6)
	VT32Pal_Lo 1,9,5  ; (Sprite Palette 4 color index #7)

	;--------------------------------------------------------------------------;

	;--------- r,g,b
	VT32Pal_Lo 8,8,8 ; (BG Palette 1 color index #8)
	VT32Pal_Lo 7,7,7 ; (BG Palette 1 color index #9)
	VT32Pal_Lo 6,6,6 ; (BG Palette 1 color index #10)
	VT32Pal_Lo 5,5,5 ; (BG Palette 1 color index #11)
	;-----------------;
	VT32Pal_Lo 8,0,0 ; (BG Palette 2 color index #8)
	VT32Pal_Lo 7,0,0 ; (BG Palette 2 color index #9)
	VT32Pal_Lo 6,0,0 ; (BG Palette 2 color index #10)
	VT32Pal_Lo 5,0,0 ; (BG Palette 2 color index #11)
	;-----------------;
	VT32Pal_Lo 0,8,0 ; (BG Palette 3 color index #8)
	VT32Pal_Lo 0,7,0 ; (BG Palette 3 color index #9)
	VT32Pal_Lo 0,6,0 ; (BG Palette 3 color index #10)
	VT32Pal_Lo 0,5,0 ; (BG Palette 3 color index #11)
	;-----------------;
	VT32Pal_Lo 0,0,8 ; (BG Palette 4 color index #8)
	VT32Pal_Lo 0,0,7 ; (BG Palette 4 color index #9)
	VT32Pal_Lo 0,0,6 ; (BG Palette 4 color index #10)
	VT32Pal_Lo 0,0,5 ; (BG Palette 4 color index #11)

	; sprites 16x
	VT32Pal_Lo 0,8,8  ; (Sprite Palette 1 color index #8)
	VT32Pal_Lo 0,7,7  ; (Sprite Palette 1 color index #9)
	VT32Pal_Lo 0,6,6  ; (Sprite Palette 1 color index #10)
	VT32Pal_Lo 0,5,5  ; (Sprite Palette 1 color index #11)
	;-----------------;
	VT32Pal_Lo 8,0,8 ; (Sprite Palette 2 color index #8)
	VT32Pal_Lo 7,0,7 ; (Sprite Palette 2 color index #9)
	VT32Pal_Lo 6,0,6 ; (Sprite Palette 2 color index #10)
	VT32Pal_Lo 5,0,5 ; (Sprite Palette 2 color index #11)
	;-----------------;
	VT32Pal_Lo 8,8,0 ; (Sprite Palette 3 color index #8)
	VT32Pal_Lo 7,7,0 ; (Sprite Palette 3 color index #9)
	VT32Pal_Lo 6,6,0 ; (Sprite Palette 3 color index #10)
	VT32Pal_Lo 5,5,0 ; (Sprite Palette 3 color index #11)
	;-----------------;
	VT32Pal_Lo 1,$A,5 ; (Sprite Palette 4 color index #8)
	VT32Pal_Lo 1,$B,5 ; (Sprite Palette 4 color index #9)
	VT32Pal_Lo 1,$C,5 ; (Sprite Palette 4 color index #10)
	VT32Pal_Lo 1,$D,5 ; (Sprite Palette 4 color index #11)

	;--------------------------------------------------------------------------;

	;--------- r,g,b
	VT32Pal_Lo 4,4,4  ; (BG Palette 1 color index #12)
	VT32Pal_Lo 3,3,3  ; (BG Palette 1 color index #13)
	VT32Pal_Lo 2,2,2  ; (BG Palette 1 color index #14)
	VT32Pal_Lo 1,1,1  ; (BG Palette 1 color index #15)
	;-----------------;
	VT32Pal_Lo 4,0,0  ; (BG Palette 2 color index #12)
	VT32Pal_Lo 3,0,0  ; (BG Palette 2 color index #13)
	VT32Pal_Lo 2,0,0 ; (BG Palette 2 color index #14)
	VT32Pal_Lo 1,0,0 ; (BG Palette 2 color index #15)
	;-----------------;
	VT32Pal_Lo 0,4,0 ; (BG Palette 3 color index #12)
	VT32Pal_Lo 0,3,0 ; (BG Palette 3 color index #13)
	VT32Pal_Lo 0,2,0 ; (BG Palette 3 color index #14)
	VT32Pal_Lo 0,1,0 ; (BG Palette 3 color index #15)
	;-----------------;
	VT32Pal_Lo 0,0,4  ; (BG Palette 4 color index #12)
	VT32Pal_Lo 0,0,3  ; (BG Palette 4 color index #13)
	VT32Pal_Lo 0,0,2 ; (BG Palette 4 color index #14)
	VT32Pal_Lo 0,0,1 ; (BG Palette 4 color index #15)

	; sprites 16x
	VT32Pal_Lo 0,4,4 ; (Sprite Palette 1 color index #12)
	VT32Pal_Lo 0,3,3  ; (Sprite Palette 1 color index #13)
	VT32Pal_Lo 0,2,2  ; (Sprite Palette 1 color index #14)
	VT32Pal_Lo 0,1,1 ; (Sprite Palette 1 color index #15)
	;-----------------;
	VT32Pal_Lo 4,0,4 ; (Sprite Palette 2 color index #12)
	VT32Pal_Lo 3,0,3 ; (Sprite Palette 2 color index #13)
	VT32Pal_Lo 2,0,2 ; (Sprite Palette 2 color index #14)
	VT32Pal_Lo 1,0,1 ; (Sprite Palette 2 color index #15)
	;-----------------;
	VT32Pal_Lo 4,4,0 ; (Sprite Palette 3 color index #12)
	VT32Pal_Lo 3,3,0 ; (Sprite Palette 3 color index #13)
	VT32Pal_Lo 2,2,0 ; (Sprite Palette 3 color index #14)
	VT32Pal_Lo 1,1,0 ; (Sprite Palette 3 color index #15)
	;-----------------;
	VT32Pal_Lo 1,$D,4 ; (Sprite Palette 4 color index #12)
	VT32Pal_Lo 1,$D,3 ; (Sprite Palette 4 color index #13)
	VT32Pal_Lo 1,$D,2 ; (Sprite Palette 4 color index #14)
	VT32Pal_Lo 1,$D,1 ; (Sprite Palette 4 color index #15)

;==============================================================================;
; Default Palette Colors high 6 bits
DefaultPalette_Hi:
	.db $00 ; black (BG Palette 1 color index #0)
	;--------- r,g,b
	VT32Pal_Hi $F,$F,$F ; white (BG Palette 1 color index #1)
	VT32Pal_Hi $E,$E,$E ; RGB ff0000, table $10C (BG Palette 1 color index #2)
	VT32Pal_Hi $D,$D,$D  ; RGB ff8000, table $521 (BG Palette 1 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 2 color index #0)
	VT32Pal_Hi $F,0,0  ; (BG Palette 2 color index #1)
	VT32Pal_Hi $E,0,0  ; (BG Palette 2 color index #2)
	VT32Pal_Hi $D,0,0  ; (BG Palette 2 color index #3)
	;-----------------;
	.db $00 ; (BG Palette 3 color index #0)
	VT32Pal_Hi 0,$F,0 ; (BG Palette 3 color index #1)
	VT32Pal_Hi 0,$E,0 ; (BG Palette 3 color index #2)
	VT32Pal_Hi 0,$D,0 ; (BG Palette 3 color index #3)
	;-----------------;
	.db $00  ; (BG Palette 4 color index #0)
	VT32Pal_Hi 0,0,$F  ; (BG Palette 4 color index #1)
	VT32Pal_Hi 0,0,$E  ; (BG Palette 4 color index #2)
	VT32Pal_Hi 0,0,$D  ; (BG Palette 4 color index #3)

	;--------- r,g,b
	.db $00 ; black (Sprite Palette 1 color index #0)
	VT32Pal_Hi 0,$F,$F ; (Sprite Palette 1 color index #1)
	VT32Pal_Hi 0,$E,$E ; (Sprite Palette 1 color index #2)
	VT32Pal_Hi 0,$D,$D ; (Sprite Palette 1 color index #3)
	;-----------------;
	.db $00 ; black (Sprite Palette 2 color index #0)
	VT32Pal_Hi $F,0,$F ; (Sprite Palette 2 color index #1)
	VT32Pal_Hi $E,0,$E ; (Sprite Palette 2 color index #2)
	VT32Pal_Hi $D,0,$D ; (Sprite Palette 2 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 3 color index #0)
	VT32Pal_Hi $F,$F,0 ; (Sprite Palette 3 color index #1)
	VT32Pal_Hi $E,$E,0 ; (Sprite Palette 3 color index #2)
	VT32Pal_Hi $D,$D,0 ; (Sprite Palette 3 color index #3)
	;-----------------;
	.db $00 ; (Sprite Palette 4 color index #0)
	VT32Pal_Hi 1,3,5 ; (Sprite Palette 4 color index #1)
	VT32Pal_Hi 1,4,5 ; (Sprite Palette 4 color index #2)
	VT32Pal_Hi 1,5,5 ; (Sprite Palette 4 color index #3)

	;--------------------------------------------------------------------------;

	;--------- r,g,b
	VT32Pal_Hi $C,$C,$C  ; (BG Palette 1 color index #4)
	VT32Pal_Hi $B,$B,$B  ; (BG Palette 1 color index #5)
	VT32Pal_Hi $A,$A,$A  ; (BG Palette 1 color index #6)
	VT32Pal_Hi 9,9,9   ; (BG Palette 1 color index #7)
	;------------------;
	VT32Pal_Hi $C,0,0   ; (BG Palette 2 color index #4)
	VT32Pal_Hi $B,0,0   ; (BG Palette 2 color index #5)
	VT32Pal_Hi $A,0,0  ; (BG Palette 2 color index #6)
	VT32Pal_Hi 9,0,0  ; (BG Palette 2 color index #7)
	;------------------;
	VT32Pal_Hi 0,$C,0  ; (BG Palette 3 color index #4)
	VT32Pal_Hi 0,$B,0  ; (BG Palette 3 color index #5)
	VT32Pal_Hi 0,$A,0 ; (BG Palette 3 color index #6)
	VT32Pal_Hi 0,9,0 ; (BG Palette 3 color index #7)
	;------------------;
	VT32Pal_Hi 0,0,$C   ; (BG Palette 4 color index #4)
	VT32Pal_Hi 0,0,$B   ; (BG Palette 4 color index #5)
	VT32Pal_Hi 0,0,$A  ; (BG Palette 4 color index #6)
	VT32Pal_Hi 0,0,$9  ; (BG Palette 4 color index #7)

	VT32Pal_Hi 0,$C,$C ; (Sprite Palette 1 color index #4)
	VT32Pal_Hi 0,$B,$B ; (Sprite Palette 1 color index #5)
	VT32Pal_Hi 0,$A,$A ; (Sprite Palette 1 color index #6)
	VT32Pal_Hi 0,9,9  ; (Sprite Palette 1 color index #7)
	;-----------------;
	VT32Pal_Hi $C,0,$C  ; (Sprite Palette 2 color index #4)
	VT32Pal_Hi $B,0,$B  ; (Sprite Palette 2 color index #5)
	VT32Pal_Hi $A,0,$A  ; (Sprite Palette 2 color index #6)
	VT32Pal_Hi 9,0,9  ; (Sprite Palette 2 color index #7)
	;-----------------;
	VT32Pal_Hi $C,$C,0 ; (Sprite Palette 3 color index #4)
	VT32Pal_Hi $B,$B,0 ; (Sprite Palette 3 color index #5)
	VT32Pal_Hi $A,$A,0 ; (Sprite Palette 3 color index #6)
	VT32Pal_Hi 9,9,0 ; (Sprite Palette 3 color index #7)
	;-----------------;
	VT32Pal_Hi 1,6,5  ; (Sprite Palette 4 color index #4)
	VT32Pal_Hi 1,7,5  ; (Sprite Palette 4 color index #5)
	VT32Pal_Hi 1,8,5  ; (Sprite Palette 4 color index #6)
	VT32Pal_Hi 1,9,5  ; (Sprite Palette 4 color index #7)

	;--------------------------------------------------------------------------;

	;--------- r,g,b
	VT32Pal_Hi 8,8,8  ; (BG Palette 1 color index #8)
	VT32Pal_Hi 7,7,7  ; (BG Palette 1 color index #9)
	VT32Pal_Hi 6,6,6  ; (BG Palette 1 color index #10)
	VT32Pal_Hi 5,5,5  ; (BG Palette 1 color index #11)
	;-----------------;
	VT32Pal_Hi 8,0,0  ; (BG Palette 2 color index #8)
	VT32Pal_Hi 7,0,0  ; (BG Palette 2 color index #9)
	VT32Pal_Hi 6,0,0  ; (BG Palette 2 color index #10)
	VT32Pal_Hi 5,0,0  ; (BG Palette 2 color index #11)
	;-----------------;
	VT32Pal_Hi 0,8,0 ; (BG Palette 3 color index #8)
	VT32Pal_Hi 0,7,0 ; (BG Palette 3 color index #9)
	VT32Pal_Hi 0,6,0 ; (BG Palette 3 color index #10)
	VT32Pal_Hi 0,5,0 ; (BG Palette 3 color index #11)
	;-----------------;
	VT32Pal_Hi 0,0,8  ; (BG Palette 4 color index #8)
	VT32Pal_Hi 0,0,7  ; (BG Palette 4 color index #9)
	VT32Pal_Hi 0,0,6  ; (BG Palette 4 color index #10)
	VT32Pal_Hi 0,0,5  ; (BG Palette 4 color index #11)

	; sprites 16x
	VT32Pal_Hi 0,8,8  ; (Sprite Palette 1 color index #8)
	VT32Pal_Hi 0,7,7  ; (Sprite Palette 1 color index #9)
	VT32Pal_Hi 0,6,6  ; (Sprite Palette 1 color index #10)
	VT32Pal_Hi 0,5,5  ; (Sprite Palette 1 color index #11)
	;-----------------;
	VT32Pal_Hi 8,0,8  ; (Sprite Palette 2 color index #8)
	VT32Pal_Hi 7,0,7  ; (Sprite Palette 2 color index #9)
	VT32Pal_Hi 6,0,6  ; (Sprite Palette 2 color index #10)
	VT32Pal_Hi 5,0,5  ; (Sprite Palette 2 color index #11)
	;-----------------;
	VT32Pal_Hi 8,8,0  ; (Sprite Palette 3 color index #8)
	VT32Pal_Hi 7,7,0  ; (Sprite Palette 3 color index #9)
	VT32Pal_Hi 6,6,0  ; (Sprite Palette 3 color index #10)
	VT32Pal_Hi 5,5,0  ; (Sprite Palette 3 color index #11)
	;-----------------;
	VT32Pal_Hi 1,$A,5  ; (Sprite Palette 4 color index #8)
	VT32Pal_Hi 1,$B,5  ; (Sprite Palette 4 color index #9)
	VT32Pal_Hi 1,$C,5  ; (Sprite Palette 4 color index #10)
	VT32Pal_Hi 1,$D,5  ; (Sprite Palette 4 color index #11)

	;--------------------------------------------------------------------------;

	;--------- r,g,b
	VT32Pal_Hi 4,4,4 ; (BG Palette 1 color index #12)
	VT32Pal_Hi 3,3,3 ; (BG Palette 1 color index #13)
	VT32Pal_Hi 2,2,2 ; (BG Palette 1 color index #14)
	VT32Pal_Hi 1,1,1 ; (BG Palette 1 color index #15)
	;-----------------;
	VT32Pal_Hi 4,0,0  ; (BG Palette 2 color index #12)
	VT32Pal_Hi 3,0,0  ; (BG Palette 2 color index #13)
	VT32Pal_Hi 2,0,0 ; (BG Palette 2 color index #14)
	VT32Pal_Hi 1,0,0 ; (BG Palette 2 color index #15)
	;-----------------;
	VT32Pal_Hi 0,4,0  ; (BG Palette 3 color index #12)
	VT32Pal_Hi 0,3,0  ; (BG Palette 3 color index #13)
	VT32Pal_Hi 0,2,0 ; (BG Palette 3 color index #14)
	VT32Pal_Hi 0,1,0 ; (BG Palette 3 color index #15)
	;-----------------;
	VT32Pal_Hi 0,0,4  ; (BG Palette 4 color index #12)
	VT32Pal_Hi 0,0,3  ; (BG Palette 4 color index #13)
	VT32Pal_Hi 0,0,2 ; (BG Palette 4 color index #14)
	VT32Pal_Hi 0,0,1 ; (BG Palette 4 color index #15)

	; sprites 16x
	VT32Pal_Hi 0,4,4  ; (Sprite Palette 1 color index #12)
	VT32Pal_Hi 0,3,3  ; (Sprite Palette 1 color index #13)
	VT32Pal_Hi 0,2,2  ; (Sprite Palette 1 color index #14)
	VT32Pal_Hi 0,1,1  ; (Sprite Palette 1 color index #15)
	;-----------------;
	VT32Pal_Hi 4,0,4 ; (Sprite Palette 2 color index #12)
	VT32Pal_Hi 3,0,3 ; (Sprite Palette 2 color index #13)
	VT32Pal_Hi 2,0,2 ; (Sprite Palette 2 color index #14)
	VT32Pal_Hi 1,0,1 ; (Sprite Palette 2 color index #15)
	;-----------------;
	VT32Pal_Hi 4,4,0 ; (Sprite Palette 3 color index #12)
	VT32Pal_Hi 3,3,0 ; (Sprite Palette 3 color index #13)
	VT32Pal_Hi 2,2,0 ; (Sprite Palette 3 color index #14)
	VT32Pal_Hi 1,1,0 ; (Sprite Palette 3 color index #15)
	;-----------------;
	VT32Pal_Hi 1,$D,4 ; (Sprite Palette 4 color index #12)
	VT32Pal_Hi 1,$D,3 ; (Sprite Palette 4 color index #13)
	VT32Pal_Hi 1,$D,2 ; (Sprite Palette 4 color index #14)
	VT32Pal_Hi 1,$D,1 ; (Sprite Palette 4 color index #15)
