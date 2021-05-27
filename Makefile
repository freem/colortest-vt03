AS = asm6f
INFILE = colortest.asm
OUTFILE_WAIXING = colortest-vt03_waixing.nes
OUTFILE_ONEBUS = colortest-vt03_onebus.nes
OUTFILE_EMUVT = colortest-vt03_emuvt.bin

.phony: all, clean

all:
	$(AS) $(INFILE) $(OUTFILE_WAIXING)
	$(AS) $(INFILE) $(OUTFILE_ONEBUS) -d_BIGROM
	$(AS) $(INFILE) $(OUTFILE_EMUVT) -d_BIN -d_BIGROM

clean:
	rm $(OUTFILE_WAIXING) $(OUTFILE_ONEBUS) $(OUTFILE_EMUVT)
