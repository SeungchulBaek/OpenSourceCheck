#define CAL_VRNT_SIZE 		0x10	//16B
#define CAL_BRK_SIZE		0x1F40	//7.5K
#define CAL_ENG_SIZE    	0xAF0	//3K

#define PF0_ESC_CAL_START_BASE (0x80000100)
#define PF0_BRK01_CAL_STRT_BASE (PF0_ESC_CAL_START_BASE)
#define PF0_ENG01_CAL_STRT_BASE (PF0_BRK01_CAL_STRT_BASE + CAL_BRK_SIZE)

section_layout spe:tc:linear
{
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK01_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk01";
		select ".rodata.CalPrmSigProcrBrk01";
		select ".rodata.CalPrmEstmrBrk01";
		select ".rodata.CalPrmWslcBrk01";
		select ".rodata.CalPrmLatDynsCoorrBrk01";	
		select ".rodata.CalPrmBrkAssisCoorrBrk01";	
		select ".rodata.CalPrmLowPCoorrBrk01";	
		select ".rodata.CalPrmSsmBrk01";	
		select ".rodata.CalPrmVehLgtCoorrBrk01";
		select ".rodata.CalPrmAutoBrkCoorrBrk01";
		select ".rodata.CalPrmBrkTqCtrlrBrk01";
		select ".rodata.CalPrmStrStabyCtrlBrk01";
		select ".rodata.CalPrmElecVacPmpBrk01";
		select ".rodata.CalPrmRgnBrkCtrlrBrk01";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG01_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng01";
		select ".rodata.CalPrmSigProcrEng01";
		select ".rodata.CalPrmWslcEng01";
		select ".rodata.CalPrmWspcEng01";
		select ".rodata.CalPrmAwdCtrlrEng01";
		select ".rodata.CalPrmBrkAssisCoorrEng01";	
		select ".rodata.CalPrmSsmEng01";
		select ".rodata.CalPrmVehLgtCoorrEng01";
		select ".rodata.CalPrmAutoBrkCoorrEng01";	
	}
}