section_layout spe:tc:linear
{
    group (ordered, contiguous, align = 4, run_addr=mem:ivss_cal)
    {
        select ".rodata.CalPrmIvssBrk01";
		
    }
   group (ordered, contiguous, align = 4, run_addr=mem:ivss_cal)
    {
        select ".rodata.CalPrmIvssBrk02";
		
    }
}