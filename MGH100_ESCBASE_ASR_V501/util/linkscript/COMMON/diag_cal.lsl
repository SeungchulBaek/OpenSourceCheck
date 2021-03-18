/*Eletronics Diag Cal section */
#define CONTROL_DIAG_CAL_SIZE 200

section_layout spe:tc:linear
{
    group (ordered, contiguous, align=4, run_addr=(PF0_DIAG_CAL_STRT_BASE+CONTROL_DIAG_CAL_SIZE))
    {
        select ".rodata.CalPrmDiag02";
    }
}