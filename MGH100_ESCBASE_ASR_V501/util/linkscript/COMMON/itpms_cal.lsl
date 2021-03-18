#define CAL_VRNT_SIZE_ITPMS		0x10	//16B
#define CAL_VRNT_SIZE_TIRE		0x800
#define CAL_VRNT_SIZE_MISSION	0x100
#define PF0_ITPMS_CAL_START_BASE ADDR_ITPMS_CAL
#define PF0_TIRE1_CAL_STRT_BASE (PF0_ITPMS_CAL_START_BASE + CAL_VRNT_SIZE_ITPMS)
#define PF0_TIRE2_CAL_STRT_BASE (PF0_TIRE1_CAL_STRT_BASE + CAL_VRNT_SIZE_TIRE)
#define PF0_TIRE3_CAL_STRT_BASE (PF0_TIRE2_CAL_STRT_BASE + CAL_VRNT_SIZE_TIRE)
#define PF0_TIRE4_CAL_STRT_BASE (PF0_TIRE3_CAL_STRT_BASE + CAL_VRNT_SIZE_TIRE)
#define PF0_MISSON1_CAL_STRT_BASE (PF0_TIRE4_CAL_STRT_BASE + CAL_VRNT_SIZE_TIRE)
#define PF0_MISSON2_CAL_STRT_BASE (PF0_MISSON1_CAL_STRT_BASE + CAL_VRNT_SIZE_MISSION)
#define PF0_MISSON3_CAL_STRT_BASE (PF0_MISSON2_CAL_STRT_BASE + CAL_VRNT_SIZE_MISSION)
#define PF0_MISSON4_CAL_STRT_BASE (PF0_MISSON3_CAL_STRT_BASE + CAL_VRNT_SIZE_MISSION)
#define PF0_MISSON5_CAL_STRT_BASE (PF0_MISSON4_CAL_STRT_BASE + CAL_VRNT_SIZE_MISSION)
#define PF0_MISSON6_CAL_STRT_BASE (PF0_MISSON5_CAL_STRT_BASE + CAL_VRNT_SIZE_MISSION)
#define PF0_MISSON7_CAL_STRT_BASE (PF0_MISSON6_CAL_STRT_BASE + CAL_VRNT_SIZE_MISSION)
#define PF0_MISSON8_CAL_STRT_BASE (PF0_MISSON7_CAL_STRT_BASE + CAL_VRNT_SIZE_MISSION)

section_layout spe:tc:linear
{
//	group (ordered, contiguous, align = 4, run_addr=(PF0_ITPMS_CAL_START_BASE))
//    {
//		select ".rodata.CalVrntCtaItpms";
//    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_TIRE1_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmTire01";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_TIRE2_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmTire02";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_TIRE3_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmTire03";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_TIRE4_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmTire04";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON1_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission01";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON2_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission02";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON3_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission03";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON4_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission04";
    }		
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON5_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission05";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON6_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission06";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON7_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission07";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_MISSON8_CAL_STRT_BASE))
    {
        select ".rodata.CalPrmMission08";
    }	
}