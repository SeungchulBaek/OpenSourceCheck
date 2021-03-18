section_layout spe:tc:linear
{
  group (ordered, contiguous, align = 4, run_addr=mem:reserved_cal)
  {
    select ".rodata.cal0_header";
  }
}