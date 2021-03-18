#define ELEC_DIAG_CAL_START_ADDR (0x80009000)

section_layout spe:tc:linear
{
	group (ordered, contiguous, align = 4, run_addr=ELEC_DIAG_CAL_START_ADDR)
	{
		select ".rodata.CalPrmDiag02";
	}
}