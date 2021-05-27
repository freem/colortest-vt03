; File: vt03.inc
; VT03-specific defines.

; Topic: VT03
; The VT03 is a Famiclone with extended graphics and sound capabilities.

; Constant: VT03_VIDEOCONTROL0
; One of the VT03's main video control registers. ($2010)
;
; (start code)
; [Write]
;
; 76543210
; CxxbsSBM
; ||||||||
; |||||||+-- Sprite mode (0: 16 colors; 1: 16 pixels)
; ||||||+--- Background 16 colors (0: disabled; 1: enabled)
; |||||+---- Sprite 16 colors or pixels enable flag (0: disabled; 1: enabled)
; ||||+----- Sprite address extension (0: disabled; 1: enabled)
; |||+------ Background address extension (0: disabled; 1: enabled)
; |++------- unused?
; +--------- Color Mode/COLCOMP (0: NES/compatible; 1: new color mapping)
; (end)
VT03_VIDEOCONTROL0 = $2010

; Constant: VT03_VIDEOCONTROL1
; Another one of the VT03's main video control registers. ($2011)
;
; (start code)
; [Write]
;
; 76543210
; xxVVIBCE
; ||||||||
; |||||||+-- Video Extension Address EVA12 selector (0: regular BKPAGE; 1: HV)
; ||||||+--- Composited Video DA (0: enabled; 1: disabled)
; |||||+---- B/W two color mode (0: disabled; 1: enabled)
; ||||+----- Internal VRAM (0: enabled; 1: disabled)
; ||++------ LCD display height (00: 240 lines; 01: 160 lines; 10: 120 lines; 11: 80 lines)
; ++-------- unused?
; (end)
VT03_VIDEOCONTROL1 = $2011 ; VideoModeControl1

; Topic: Video Memory Bank Mapping
; (to be written.)

; Video Address Normal Mode (Case $201A & 0x07)
;    0: ($4100&0x0F)<<21+($2018&0x70)<<14+VBANK<<10 (default)
;    1: ($4100&0x0F)<<21+($2018&0x70)<<14+(($201A&0x80)|(VBANK&0x7F))<<10
;    2: ($4100&0x0F)<<21+($2018&0x70)<<14+(($201A&0xC0)|(VBANK&0x3F))<<10
;    4: ($4100&0x0F)<<21+($2018&0x70)<<14+(($201A&0xE0)|(VBANK&0x1F))<<10
;    5: ($4100&0x0F)<<21+($2018&0x70)<<14+(($201A&0xF0)|(VBANK&0x0F))<<10
;    6: ($4100&0x0F)<<21+($2018&0x70)<<14+(($201A&0xF8)|(VBANK&0x07))<<10

; Video Address Extension Mode (Case $201A & 0x07)
;    0: ($4100&0x0F)<<21+VBANK<<13+EVA<<10 (default)
;    1: ($4100&0x0F)<<21+(($201A&0x80)|(VBANK&0x7F))<<13+EVA<<10
;    2: ($4100&0x0F)<<21+(($201A&0xC0)|(VBANK&0x3F))<<13+EVA<<10
;    4: ($4100&0x0F)<<21+(($201A&0xE0)|(VBANK&0x1F))<<13+EVA<<10
;    5: ($4100&0x0F)<<21+(($201A&0xF0)|(VBANK&0x0F))<<13+EVA<<10
;    6: ($4100&0x0F)<<21+(($201A&0xF8)|(VBANK&0x07))<<13+EVA<<10

; When $4105&0x80 is nonzero, $0000-$0FFF and $1000-$1FFF are swapped.

; EVA table:
;                                     | EVA2   | EVA1   | EVA0   |
;-------------------------------------+--------+--------+--------+
; BG Extension Addr Mode $2011&0x02=1 | HV     | BG4    | BG3    |
; BG Extension Addr Mode $2011&0x02=0 | BKPAGE | BG4    | BG3    |
; Sprite Extension Address Mode       | SPWVA2 | SPEVA1 | SPEVA0 |
; R/W Extension Address Mode          | VRWB2  | VRWB1  | VRWB0  |
;-------------------------------------+--------+--------+--------+
; When BG or 16x8 sprites are 16 colors, actual addresses should be shifted one
; bit to the left...

VT03_VROMBANK0 = $2012 ; VROMBank0 (PPU $1000-$13FF)
VT03_VROMBANK1 = $2013 ; VROMBank1 (PPU $1400-$17FF)
VT03_VROMBANK2 = $2014 ; VROMBank2 (PPU $1800-$1BFF)
VT03_VROMBANK3 = $2015 ; VROMBank3 (PPU $1C00-$1FFF)
VT03_VROMBANK4 = $2016 ; VROMBank4 (PPU $0000-$07FF; reg&0xFE)
VT03_VROMBANK5 = $2017 ; VROMBank5 (PPU $0800-$0FFF; reg&0xFE)

; Constant: Video Bank 1 Register, BKPAGE, Video RW Bank
; bleh ($2018)
;
; (start code)
; [Write]
; 76543210
; ||||||||
; |||||+++-- Video bank when accessing video data (VRWB2-VRWB0)
; ||||+----- "Reg. BKPAGE is address EVA12 when EVA12S=0"
; |+++------ Video Bank 1 Register (VA20-VA18)
; +--------- unused
; (end)
VT03_VROMBANKM = $2018 ; VROMBankM

; note: VT16 does not have gun port registers according to datasheet

; Constant: Reset gun port
; Clear the X and Y coordinates of both guns.
VT03_GUNRESET = $2019

; $201A [W] Video Bank0 register 6, Video Bank0 selector
;
; (start code)
; [Write]
; 76543210
; ||||||||
; |||||+++-- Video Bank0 selector
; +++++----- Video Bank0 register 6
;(end)

; Constant: Gun Port 1 X Coordinate
; Get the X coordinate of Gun port 1.
VT03_GUN1X = $201C

; Constant: Gun Port 1 Y Coordinate
; Get the Y coordinate of Gun port 1.
VT03_GUN1Y = $201D

; Constant: Gun Port 2 X Coordinate
; Get the X coordinate of Gun port 2.
VT03_GUN2X = $201E

; Constant: Gun Port 2 Y Coordinate
; Get the Y coordinate of Gun port 2.
VT03_GUN2Y = $201F

; Constant: DMA High Address Byte
; Set DMA address high byte (i.e. $[XX]X0)
VT03_DMAHI = $4014

; todo: second audio chip stuff
;VT03_PULSE3
;VT03_PULSE4
;VT03_TRI2
;VT03_NOISE2

; Constant: DWS/PCM Settings
;
; (start code)
; [Write]
;
; 76543210
; ||||||||
; xxx||||+-- ~A14 DWS/PCM DMA Address A14's complement
; xxx|||+--- ~A15 DWS/PCM DMA Address A15's complement
; xxx||+---- DA1 enable/disable (0: enabled (default); 1: disabled )
; xxx|+----- DA2 enable/disable (0: disabled (default); 1: enabled)
; xxx+------ DWS/PCM Mode (0: DWS; 1: PCM)
; (end)
VT03_DAMODE = $4030

; Constant: Write PCM Data
VT03_PCM = $4031

; Constant: DMA Settings
;
; (start code)
; [Write]
;
; 76543210
; ||||||||
; |||||||+-- DMA Type (0: Sprite/$2004; 1: VRAM/$2007)
; ||||+++--- DMA Length (000: 256 bytes; 100: 16 bytes; 101: 32 bytes; 110: 64 bytes; 111: 128 bytes)
; ++++------ DMA Source address bit[7:4] (i.e. $XX[X]0)
; (end)
VT03_DMACTRL = $4034

; Constants: DMA Size Flags
; Various values provided to make setting the DMA size easier.
;
; VT03_DMALEN_16 - 16 bytes
; VT03_DMALEN_32 - 32 bytes
; VT03_DMALEN_64 - 64 bytes
; VT03_DMALEN_128 - 128 bytes
; VT03_DMALEN_256 - 256 bytes
; VT03_DMALEN_MASK - Mask for the relevant bits of the DMA size value
VT03_DMALEN_16  = %00001000
VT03_DMALEN_32  = %00001010
VT03_DMALEN_64  = %00001100
VT03_DMALEN_128 = %00001110
VT03_DMALEN_256 = %00000000
VT03_DMALEN_MASK = VT03_DMALEN_128

; Constant: Program Bank 1, Video Bank 2
; This register controls the extended banking features of the VT03. ($4100, "ROMHighBank")
;
; (start code)
; [Write]
;
; 76543210
; PPPPVVVV
; ||||||||
; ||||++++---- Video Bank 2   (VA24-VA21)
; ++++-------- Program Bank 1 (PA24-PA21)
;
; (end)
VT03_ROMHIGHBANK = $4100

; Constants: IRQ Registers
; These registers are related to the VT03's on-board IRQ.
;
; VT03_IRQ_TIMER - 8-bit timer value ($4101, "IRQTimer1")
; VT03_IRQ_START - Loads value from VT03_IRQ_TIMER and starts timer ($4102, "IRQTimer2")
; VT03_IRQ_DISABLE - Disable VT03 IRQ ($4103, "IRQTimerClose")
; VT03_IRQ_ENABLE - Enable VT03 IRQ ($4104, "IRQTimerOpen")
VT03_IRQ_TIMER   = $4101
VT03_IRQ_START   = $4102
VT03_IRQ_DISABLE = $4103
VT03_IRQ_ENABLE  = $4104

; $4105: "V Bank0 decode type, P Bank0 decode type, Inter Char VRAM"
; This really requires further explanation that I don't have time to format correctly
;
; (start code)
; [Write]
;
; 76543210
; ||||||||
; |||xxxxx
; ||+------- Internal VRAM as CHR-RAM (0: disabled, 1: enabled)
; |+-------- Program Bank 0 decoding
; +--------- Video Bank 0 decoding
; (end)

; Constant: VT03_HVSCROLL
; Horizontal/Vertical Scroll Select. ($4106)
;
; Only the first bit is used, so the only valid values are...
; - 0 = Horizontal
; - 1 = Vertical
VT03_HVSCROLL = $4106

; Constants: Program Bank Registers
; These registers control the loaded sections for Program Bank 0.
;
; VT03_PRGBANK0 - PQ00-PQ07 ($4107, "ProgramBank0")
; VT03_PRGBANK1 - PQ10-PQ17 ($4108, "ProgramBank1")
; VT03_PRGBANK2 - PQ20-PQ27 ($4109, "ProgramBank2")
; VT03_PRGBANK3 - PQ30-PQ37 ($410A, "ProgramBank3")
VT03_PRGBANK0 = $4107
VT03_PRGBANK1 = $4108
VT03_PRGBANK2 = $4109
VT03_PRGBANK3 = $410A

; Constant: $410B
; $410B has a really long name so I'm putting it on another line or two:
; Timer interrupt clock selector, Program Bank 0 register 2 enable/disable,
; RS232 enable/disable, Bus output normal/tristate, Program Bank 0 selector
;
; (start code)
; [Write]
;
; 76543210
; ||||||||
; |||||+++-- Program Bank 0 Selector
; ||||+----- XRWB on $6000-$FFFF write switch (0: disable XRWB; 1: enable XRWB)
; |||+------ Bus output control (0: normal; 1: tri-state)
; ||+------- RS232 (0: disabled; 1: enabled)
; |+-------- Program Bank 0 Register 2 enable (0: disabled; 1: enabled)
; +--------- Timer interrupt clock select (0: AD12; 1: HSYNC)
; (end)
VT03_410B = $410B

; ($410C is not documented; does it exist?)

; Constant: I/O Port Control
; Sets modes and enable flags for the various I/O ports.
;
; (start code)
; [Write]
;
; 76543210
; ||||||||
; |||||||+-- I/O Port 1 Mode (0: input; 1: output)
; ||||||+--- I/O Port 1 Enable (0: disabled; 1: enabled)
; |||||+---- I/O Port 2 Mode (0: input; 1: output)
; ||||+----- I/O Port 2 Enable (0: disabled; 1: enabled)
; |||+------ I/O Port 3 Mode (0: input; 1: output)
; ||+------- I/O Port 3 Enable (0: disabled; 1: enabled)
; |+-------- I/O Port 4 Mode (0: input; 1: output)
; +--------- I/O Port 4 Enable (0: disabled; 1: enabled)
; (end)
VT03_IOPORTCONTROL = $410D ; I/O port control

VT03_IOPORT01 = $410E ; I/O ports 0,1
VT03_IOPORT23 = $410F ; I/O port 2,3

; todo: VT16 and VT18 have regs from $4110 to $4113

; Constants: RS232 Timer Registers
; The RS232 timer value is split into two registers.
;
; VT03_RS232_TIMER_LO - Low byte of RS232 timer ($4114)
; VT03_RS232_TIMER_HI - High byte of RS232 timer ($4115)
VT03_RS232_TIMER_LO = $4114
VT03_RS232_TIMER_HI = $4115

; todo: VT16 and VT18 have regs from $4116 to $4118

; Constant: RS232 Register ($4119)
;
; (start code)
;
; [Write]
; 76543210
; xxMxxxxT
; ||||||||
; |||||||+-- TX bit 8
; |||++++--- unused
; ||+------- Mode (0: 10 bits mode (start, end, bit7-0); 1: 11 bits mode (start, end, bit8, bit7-0))
; ++-------- unused
;
; [Read]
; 76543210
; rsTFPxER
; ||||||||
; |||||||+-- RX bit 8
; ||||||+--- Error status (0: no error; 1: error detected)
; |||||+---- unused?
; ||||+----- XPORN (0: NTSC; 1: PAL)
; |||+------ XF5OR6 (0: 60Hz; 1: 50Hz)
; ||+------- RINGF (1: currently receiving data)
; |+-------- TIFLAG (1: finished sending data)
; +--------- RIFLAG (1: finished receiving data)
;
; (end)
VT03_RS232_MAIN = $4119 ; RS232 register (write), RS232 flags (read)

VT03_NPMASK = $08 ; NTSC/PAL
VT03_HZMASK = $10 ; 60hz/50hz

; Constants: RS232 TX/RX Registers
;
; VT03_RS232_TX - RS232 TX data (write; $411A)
; VT03_RS232_RX - RS232 RX data (read; $411B)
VT03_RS232_TX = $411A
VT03_RS232_RX = $411B

; todo: VT16 regs from $411C to $411F, $4124-$4129
; todo: VT16 reg $412B (read: random; write: UIO input/output select)
; todo: VT16 reg $412C

; todo: VT18 regs from $411C to $412C

; todo: add reference to
; http://wiki.nesdev.com/w/index.php/VT03%2B_Enhanced_Palette

; Macro: VT03Pal_Lo
; Write the LSB value for a color in VTxx new color mode to ROM.
; 
; Parameters:
; - *s* - Saturation
; - *l* - Luminance
; - *h* - Hue/Phase
;
; (begin code)
; 76543210
; ||||||||
; 00LLHHHH
; (end)
.macro VT03Pal_Lo s,l,h
	.db #(l<<4)&$30 | h & $0F
.endm

; Macro: VT03Pal_Hi
; Write the LSB value for a color in VTxx new color mode to ROM.
; 
; Parameters:
; - *s* - Saturation
; - *l* - Luminance
; - *h* - Hue/Phase
;
; (begin code)
; 76543210
; ||||||||
; 00SSSSLL
; (end)
.macro VT03Pal_Hi s,l,h
	.db #(s & $0F)<<2|(l>>2)
.endm
