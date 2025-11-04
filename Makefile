AS = asm6f
INFILE = colortest.asm
OUTFILE_WAIXING = colortest-vt03_waixing.nes
OUTFILE_ONEBUS = colortest-vt03_onebus.nes
OUTFILE_EMUVT = colortest-vt03_emuvt.bin
OUTFILE_VT32 = colortest-vt32_onebus.nes

.phony: all, clean, waixing, onebus, emuvt, vt32

all: waixing onebus emuvt vt32

waixing:
	$(AS) $(INFILE) $(OUTFILE_WAIXING)

onebus:
	$(AS) $(INFILE) $(OUTFILE_ONEBUS) -d_BIGROM

emuvt:
	$(AS) $(INFILE) $(OUTFILE_EMUVT) -d_BIN -d_BIGROM

vt32:
	$(AS) $(INFILE) $(OUTFILE_VT32) -d_BIGROM -d_VT32

clean:
	rm $(OUTFILE_WAIXING) $(OUTFILE_ONEBUS) $(OUTFILE_EMUVT) $(OUTFILE_VT32)
