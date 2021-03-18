#if (MGH100_ABS_LARGE==DISABLE) /* ESC */

#define CAL_VRNT_SIZE 	0x10	
#define CAL_BRK_SIZE	0x1E10
#define CAL_ENG_SIZE    0xB88 
#define CAL_DIAG_SIZE	0x2D4	//700B

#define PF0_ESC_CAL_START_BASE 	ADDR_ESC_CAL
#define PF0_DIAG_CAL_STRT_BASE  (PF0_ESC_CAL_START_BASE + CAL_VRNT_SIZE)
#define PF0_BRK01_CAL_STRT_BASE (PF0_DIAG_CAL_STRT_BASE + CAL_DIAG_SIZE)
#define PF0_BRK02_CAL_STRT_BASE (PF0_BRK01_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK03_CAL_STRT_BASE (PF0_BRK02_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK04_CAL_STRT_BASE (PF0_BRK03_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK05_CAL_STRT_BASE (PF0_BRK04_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK06_CAL_STRT_BASE (PF0_BRK05_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK07_CAL_STRT_BASE (PF0_BRK06_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK08_CAL_STRT_BASE (PF0_BRK07_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK09_CAL_STRT_BASE (PF0_BRK08_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK10_CAL_STRT_BASE (PF0_BRK09_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK11_CAL_STRT_BASE (PF0_BRK10_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK12_CAL_STRT_BASE (PF0_BRK11_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK13_CAL_STRT_BASE (PF0_BRK12_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK14_CAL_STRT_BASE (PF0_BRK13_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK15_CAL_STRT_BASE (PF0_BRK14_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK16_CAL_STRT_BASE (PF0_BRK15_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK17_CAL_STRT_BASE (PF0_BRK16_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK18_CAL_STRT_BASE (PF0_BRK17_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK19_CAL_STRT_BASE (PF0_BRK18_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK20_CAL_STRT_BASE (PF0_BRK19_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK21_CAL_STRT_BASE (PF0_BRK20_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK22_CAL_STRT_BASE (PF0_BRK21_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK23_CAL_STRT_BASE (PF0_BRK22_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK24_CAL_STRT_BASE (PF0_BRK23_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_ENG01_CAL_STRT_BASE (PF0_BRK24_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_ENG02_CAL_STRT_BASE (PF0_ENG01_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG03_CAL_STRT_BASE (PF0_ENG02_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG04_CAL_STRT_BASE (PF0_ENG03_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG05_CAL_STRT_BASE (PF0_ENG04_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG06_CAL_STRT_BASE (PF0_ENG05_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG07_CAL_STRT_BASE (PF0_ENG06_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG08_CAL_STRT_BASE (PF0_ENG07_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG09_CAL_STRT_BASE (PF0_ENG08_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG10_CAL_STRT_BASE (PF0_ENG09_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG11_CAL_STRT_BASE (PF0_ENG10_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG12_CAL_STRT_BASE (PF0_ENG11_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG13_CAL_STRT_BASE (PF0_ENG12_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG14_CAL_STRT_BASE (PF0_ENG13_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG15_CAL_STRT_BASE (PF0_ENG14_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG16_CAL_STRT_BASE (PF0_ENG15_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG17_CAL_STRT_BASE (PF0_ENG16_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG18_CAL_STRT_BASE (PF0_ENG17_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG19_CAL_STRT_BASE (PF0_ENG18_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG20_CAL_STRT_BASE (PF0_ENG19_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG21_CAL_STRT_BASE (PF0_ENG20_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG22_CAL_STRT_BASE (PF0_ENG21_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG23_CAL_STRT_BASE (PF0_ENG22_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG24_CAL_STRT_BASE (PF0_ENG23_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG25_CAL_STRT_BASE (PF0_ENG24_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG26_CAL_STRT_BASE (PF0_ENG25_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG27_CAL_STRT_BASE (PF0_ENG26_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG28_CAL_STRT_BASE (PF0_ENG27_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG29_CAL_STRT_BASE (PF0_ENG28_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG30_CAL_STRT_BASE (PF0_ENG29_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG31_CAL_STRT_BASE (PF0_ENG30_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG32_CAL_STRT_BASE (PF0_ENG31_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG33_CAL_STRT_BASE (PF0_ENG32_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG34_CAL_STRT_BASE (PF0_ENG33_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG35_CAL_STRT_BASE (PF0_ENG34_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG36_CAL_STRT_BASE (PF0_ENG35_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG37_CAL_STRT_BASE (PF0_ENG36_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG38_CAL_STRT_BASE (PF0_ENG37_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG39_CAL_STRT_BASE (PF0_ENG38_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG40_CAL_STRT_BASE (PF0_ENG39_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG41_CAL_STRT_BASE (PF0_ENG40_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG42_CAL_STRT_BASE (PF0_ENG41_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG43_CAL_STRT_BASE (PF0_ENG42_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG44_CAL_STRT_BASE (PF0_ENG43_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG45_CAL_STRT_BASE (PF0_ENG44_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG46_CAL_STRT_BASE (PF0_ENG45_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG47_CAL_STRT_BASE (PF0_ENG46_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG48_CAL_STRT_BASE (PF0_ENG47_CAL_STRT_BASE + CAL_ENG_SIZE)

section_layout spe:tc:linear
{
    group (ordered, contiguous, align = 4, run_addr=(PF0_ESC_CAL_START_BASE))
    {
		select ".rodata.CalVrntCta";
    }
	group (ordered, contiguous, align = 4, run_addr=(PF0_DIAG_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmDiag01";	
	}
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
		select ".rodata.CalPrmEssBrk01";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK02_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk02";
		select ".rodata.CalPrmSigProcrBrk02";	
		select ".rodata.CalPrmEstmrBrk02";
		select ".rodata.CalPrmWslcBrk02";
		select ".rodata.CalPrmLatDynsCoorrBrk02";	
		select ".rodata.CalPrmBrkAssisCoorrBrk02";	
		select ".rodata.CalPrmLowPCoorrBrk02";	
		select ".rodata.CalPrmSsmBrk02";	
		select ".rodata.CalPrmVehLgtCoorrBrk02";
		select ".rodata.CalPrmAutoBrkCoorrBrk02";
		select ".rodata.CalPrmBrkTqCtrlrBrk02";	
		select ".rodata.CalPrmStrStabyCtrlBrk02";
		select ".rodata.CalPrmElecVacPmpBrk02";
		select ".rodata.CalPrmRgnBrkCtrlrBrk02";
		select ".rodata.CalPrmEssBrk02";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK03_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk03";
		select ".rodata.CalPrmSigProcrBrk03";	
		select ".rodata.CalPrmEstmrBrk03";
		select ".rodata.CalPrmWslcBrk03";
		select ".rodata.CalPrmLatDynsCoorrBrk03";	
		select ".rodata.CalPrmBrkAssisCoorrBrk03";	
		select ".rodata.CalPrmLowPCoorrBrk03";	
		select ".rodata.CalPrmSsmBrk03";	
		select ".rodata.CalPrmVehLgtCoorrBrk03";
		select ".rodata.CalPrmAutoBrkCoorrBrk03";
		select ".rodata.CalPrmBrkTqCtrlrBrk03";	
		select ".rodata.CalPrmStrStabyCtrlBrk03";
		select ".rodata.CalPrmElecVacPmpBrk03";
		select ".rodata.CalPrmRgnBrkCtrlrBrk03";
		select ".rodata.CalPrmEssBrk03";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK04_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk04";
		select ".rodata.CalPrmSigProcrBrk04";	
		select ".rodata.CalPrmEstmrBrk04";
		select ".rodata.CalPrmWslcBrk04";
		select ".rodata.CalPrmLatDynsCoorrBrk04";	
		select ".rodata.CalPrmBrkAssisCoorrBrk04";	
		select ".rodata.CalPrmLowPCoorrBrk04";	
		select ".rodata.CalPrmSsmBrk04";	
		select ".rodata.CalPrmVehLgtCoorrBrk04";
		select ".rodata.CalPrmAutoBrkCoorrBrk04";
		select ".rodata.CalPrmBrkTqCtrlrBrk04";	
		select ".rodata.CalPrmStrStabyCtrlBrk04";
		select ".rodata.CalPrmElecVacPmpBrk04";
		select ".rodata.CalPrmRgnBrkCtrlrBrk04";
		select ".rodata.CalPrmEssBrk04";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK05_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk05";
		select ".rodata.CalPrmSigProcrBrk05";	
		select ".rodata.CalPrmEstmrBrk05";
		select ".rodata.CalPrmWslcBrk05";
		select ".rodata.CalPrmLatDynsCoorrBrk05";	
		select ".rodata.CalPrmBrkAssisCoorrBrk05";	
		select ".rodata.CalPrmLowPCoorrBrk05";	
		select ".rodata.CalPrmSsmBrk05";	
		select ".rodata.CalPrmVehLgtCoorrBrk05";
		select ".rodata.CalPrmAutoBrkCoorrBrk05";
		select ".rodata.CalPrmBrkTqCtrlrBrk05";		
		select ".rodata.CalPrmStrStabyCtrlBrk05";
		select ".rodata.CalPrmElecVacPmpBrk05";
		select ".rodata.CalPrmRgnBrkCtrlrBrk05";
		select ".rodata.CalPrmEssBrk05";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK06_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk06";
		select ".rodata.CalPrmSigProcrBrk06";	
		select ".rodata.CalPrmEstmrBrk06";
		select ".rodata.CalPrmWslcBrk06";
		select ".rodata.CalPrmLatDynsCoorrBrk06";	
		select ".rodata.CalPrmBrkAssisCoorrBrk06";	
		select ".rodata.CalPrmLowPCoorrBrk06";	
		select ".rodata.CalPrmSsmBrk06";	
		select ".rodata.CalPrmVehLgtCoorrBrk06";
		select ".rodata.CalPrmAutoBrkCoorrBrk06";
		select ".rodata.CalPrmBrkTqCtrlrBrk06";	
		select ".rodata.CalPrmStrStabyCtrlBrk06";
		select ".rodata.CalPrmElecVacPmpBrk06";
		select ".rodata.CalPrmRgnBrkCtrlrBrk06";
		select ".rodata.CalPrmEssBrk06";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK07_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk07";
		select ".rodata.CalPrmSigProcrBrk07";	
		select ".rodata.CalPrmEstmrBrk07";
		select ".rodata.CalPrmWslcBrk07";
		select ".rodata.CalPrmLatDynsCoorrBrk07";	
		select ".rodata.CalPrmBrkAssisCoorrBrk07";	
		select ".rodata.CalPrmLowPCoorrBrk07";	
		select ".rodata.CalPrmSsmBrk07";	
		select ".rodata.CalPrmVehLgtCoorrBrk07";
		select ".rodata.CalPrmAutoBrkCoorrBrk07";
		select ".rodata.CalPrmBrkTqCtrlrBrk07";		
		select ".rodata.CalPrmStrStabyCtrlBrk07";
		select ".rodata.CalPrmElecVacPmpBrk07";
		select ".rodata.CalPrmRgnBrkCtrlrBrk07";
		select ".rodata.CalPrmEssBrk07";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK08_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk08";
		select ".rodata.CalPrmSigProcrBrk08";	
		select ".rodata.CalPrmEstmrBrk08";
		select ".rodata.CalPrmWslcBrk08";
		select ".rodata.CalPrmLatDynsCoorrBrk08";	
		select ".rodata.CalPrmBrkAssisCoorrBrk08";	
		select ".rodata.CalPrmLowPCoorrBrk08";	
		select ".rodata.CalPrmSsmBrk08";	
		select ".rodata.CalPrmVehLgtCoorrBrk08";
		select ".rodata.CalPrmAutoBrkCoorrBrk08";
		select ".rodata.CalPrmBrkTqCtrlrBrk08";		
		select ".rodata.CalPrmStrStabyCtrlBrk08";
		select ".rodata.CalPrmElecVacPmpBrk08";
		select ".rodata.CalPrmRgnBrkCtrlrBrk08";
		select ".rodata.CalPrmEssBrk08";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK09_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk09";
		select ".rodata.CalPrmSigProcrBrk09";	
		select ".rodata.CalPrmEstmrBrk09";
		select ".rodata.CalPrmWslcBrk09";
		select ".rodata.CalPrmLatDynsCoorrBrk09";	
		select ".rodata.CalPrmBrkAssisCoorrBrk09";	
		select ".rodata.CalPrmLowPCoorrBrk09";	
		select ".rodata.CalPrmSsmBrk09";	
		select ".rodata.CalPrmVehLgtCoorrBrk09";
		select ".rodata.CalPrmAutoBrkCoorrBrk09";
		select ".rodata.CalPrmBrkTqCtrlrBrk09";		
		select ".rodata.CalPrmStrStabyCtrlBrk09";
		select ".rodata.CalPrmElecVacPmpBrk09";
		select ".rodata.CalPrmRgnBrkCtrlrBrk09";
		select ".rodata.CalPrmEssBrk09";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK10_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk10";
		select ".rodata.CalPrmSigProcrBrk10";	
		select ".rodata.CalPrmEstmrBrk10";
		select ".rodata.CalPrmWslcBrk10";
		select ".rodata.CalPrmLatDynsCoorrBrk10";	
		select ".rodata.CalPrmBrkAssisCoorrBrk10";	
		select ".rodata.CalPrmLowPCoorrBrk10";	
		select ".rodata.CalPrmSsmBrk10";	
		select ".rodata.CalPrmVehLgtCoorrBrk10";
		select ".rodata.CalPrmAutoBrkCoorrBrk10";
		select ".rodata.CalPrmBrkTqCtrlrBrk10";		
		select ".rodata.CalPrmStrStabyCtrlBrk10";
		select ".rodata.CalPrmElecVacPmpBrk10";
		select ".rodata.CalPrmRgnBrkCtrlrBrk10";
		select ".rodata.CalPrmEssBrk10";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK11_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk11";
		select ".rodata.CalPrmSigProcrBrk11";	
		select ".rodata.CalPrmEstmrBrk11";
		select ".rodata.CalPrmWslcBrk11";
		select ".rodata.CalPrmLatDynsCoorrBrk11";	
		select ".rodata.CalPrmBrkAssisCoorrBrk11";	
		select ".rodata.CalPrmLowPCoorrBrk11";	
		select ".rodata.CalPrmSsmBrk11";	
		select ".rodata.CalPrmVehLgtCoorrBrk11";
		select ".rodata.CalPrmAutoBrkCoorrBrk11";
		select ".rodata.CalPrmBrkTqCtrlrBrk11";		
		select ".rodata.CalPrmStrStabyCtrlBrk11";
		select ".rodata.CalPrmElecVacPmpBrk11";
		select ".rodata.CalPrmRgnBrkCtrlrBrk11";
		select ".rodata.CalPrmEssBrk11";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK12_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk12";
		select ".rodata.CalPrmSigProcrBrk12";	
		select ".rodata.CalPrmEstmrBrk12";
		select ".rodata.CalPrmWslcBrk12";
		select ".rodata.CalPrmLatDynsCoorrBrk12";	
		select ".rodata.CalPrmBrkAssisCoorrBrk12";	
		select ".rodata.CalPrmLowPCoorrBrk12";	
		select ".rodata.CalPrmSsmBrk12";	
		select ".rodata.CalPrmVehLgtCoorrBrk12";
		select ".rodata.CalPrmAutoBrkCoorrBrk12";
		select ".rodata.CalPrmBrkTqCtrlrBrk12";		
		select ".rodata.CalPrmStrStabyCtrlBrk12";
		select ".rodata.CalPrmElecVacPmpBrk12";
		select ".rodata.CalPrmRgnBrkCtrlrBrk12";
		select ".rodata.CalPrmEssBrk12";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK13_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk13";
		select ".rodata.CalPrmSigProcrBrk13";	
		select ".rodata.CalPrmEstmrBrk13";
		select ".rodata.CalPrmWslcBrk13";
		select ".rodata.CalPrmLatDynsCoorrBrk13";	
		select ".rodata.CalPrmBrkAssisCoorrBrk13";	
		select ".rodata.CalPrmLowPCoorrBrk13";	
		select ".rodata.CalPrmSsmBrk13";	
		select ".rodata.CalPrmVehLgtCoorrBrk13";
		select ".rodata.CalPrmAutoBrkCoorrBrk13";
		select ".rodata.CalPrmBrkTqCtrlrBrk13";		
		select ".rodata.CalPrmStrStabyCtrlBrk13";
		select ".rodata.CalPrmElecVacPmpBrk13";
		select ".rodata.CalPrmRgnBrkCtrlrBrk13";
		select ".rodata.CalPrmEssBrk13";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK14_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk14";
		select ".rodata.CalPrmSigProcrBrk14";	
		select ".rodata.CalPrmEstmrBrk14";
		select ".rodata.CalPrmWslcBrk14";
		select ".rodata.CalPrmLatDynsCoorrBrk14";	
		select ".rodata.CalPrmBrkAssisCoorrBrk14";	
		select ".rodata.CalPrmLowPCoorrBrk14";	
		select ".rodata.CalPrmSsmBrk14";	
		select ".rodata.CalPrmVehLgtCoorrBrk14";
		select ".rodata.CalPrmAutoBrkCoorrBrk14";
		select ".rodata.CalPrmBrkTqCtrlrBrk14";		
		select ".rodata.CalPrmStrStabyCtrlBrk14";
		select ".rodata.CalPrmElecVacPmpBrk14";
		select ".rodata.CalPrmRgnBrkCtrlrBrk14";
		select ".rodata.CalPrmEssBrk14";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK15_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk15";
		select ".rodata.CalPrmSigProcrBrk15";	
		select ".rodata.CalPrmEstmrBrk15";
		select ".rodata.CalPrmWslcBrk15";
		select ".rodata.CalPrmLatDynsCoorrBrk15";	
		select ".rodata.CalPrmBrkAssisCoorrBrk15";	
		select ".rodata.CalPrmLowPCoorrBrk15";	
		select ".rodata.CalPrmSsmBrk15";	
		select ".rodata.CalPrmVehLgtCoorrBrk15";
		select ".rodata.CalPrmAutoBrkCoorrBrk15";
		select ".rodata.CalPrmBrkTqCtrlrBrk15";		
		select ".rodata.CalPrmStrStabyCtrlBrk15";
		select ".rodata.CalPrmElecVacPmpBrk15";
		select ".rodata.CalPrmRgnBrkCtrlrBrk15";
		select ".rodata.CalPrmEssBrk15";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK16_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk16";
		select ".rodata.CalPrmSigProcrBrk16";	
		select ".rodata.CalPrmEstmrBrk16";
		select ".rodata.CalPrmWslcBrk16";
		select ".rodata.CalPrmLatDynsCoorrBrk16";	
		select ".rodata.CalPrmBrkAssisCoorrBrk16";	
		select ".rodata.CalPrmLowPCoorrBrk16";	
		select ".rodata.CalPrmSsmBrk16";	
		select ".rodata.CalPrmVehLgtCoorrBrk16";
		select ".rodata.CalPrmAutoBrkCoorrBrk16";
		select ".rodata.CalPrmBrkTqCtrlrBrk16";		
		select ".rodata.CalPrmStrStabyCtrlBrk16";
		select ".rodata.CalPrmElecVacPmpBrk16";
		select ".rodata.CalPrmRgnBrkCtrlrBrk16";
		select ".rodata.CalPrmEssBrk16";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK17_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk17";
		select ".rodata.CalPrmSigProcrBrk17";	
		select ".rodata.CalPrmEstmrBrk17";
		select ".rodata.CalPrmWslcBrk17";
		select ".rodata.CalPrmLatDynsCoorrBrk17";	
		select ".rodata.CalPrmBrkAssisCoorrBrk17";	
		select ".rodata.CalPrmLowPCoorrBrk17";	
		select ".rodata.CalPrmSsmBrk17";	
		select ".rodata.CalPrmVehLgtCoorrBrk17";
		select ".rodata.CalPrmAutoBrkCoorrBrk17";
		select ".rodata.CalPrmBrkTqCtrlrBrk17";		
		select ".rodata.CalPrmStrStabyCtrlBrk17";
		select ".rodata.CalPrmElecVacPmpBrk17";
		select ".rodata.CalPrmRgnBrkCtrlrBrk17";
		select ".rodata.CalPrmEssBrk17";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK18_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk18";
		select ".rodata.CalPrmSigProcrBrk18";	
		select ".rodata.CalPrmEstmrBrk18";
		select ".rodata.CalPrmWslcBrk18";
		select ".rodata.CalPrmLatDynsCoorrBrk18";	
		select ".rodata.CalPrmBrkAssisCoorrBrk18";	
		select ".rodata.CalPrmLowPCoorrBrk18";	
		select ".rodata.CalPrmSsmBrk18";	
		select ".rodata.CalPrmVehLgtCoorrBrk18";
		select ".rodata.CalPrmAutoBrkCoorrBrk18";
		select ".rodata.CalPrmBrkTqCtrlrBrk18";		
		select ".rodata.CalPrmStrStabyCtrlBrk18";
		select ".rodata.CalPrmElecVacPmpBrk18";
		select ".rodata.CalPrmRgnBrkCtrlrBrk18";
		select ".rodata.CalPrmEssBrk18";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK19_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk19";
		select ".rodata.CalPrmSigProcrBrk19";	
		select ".rodata.CalPrmEstmrBrk19";
		select ".rodata.CalPrmWslcBrk19";
		select ".rodata.CalPrmLatDynsCoorrBrk19";	
		select ".rodata.CalPrmBrkAssisCoorrBrk19";	
		select ".rodata.CalPrmLowPCoorrBrk19";	
		select ".rodata.CalPrmSsmBrk19";	
		select ".rodata.CalPrmVehLgtCoorrBrk19";
		select ".rodata.CalPrmAutoBrkCoorrBrk19";
		select ".rodata.CalPrmBrkTqCtrlrBrk19";		
		select ".rodata.CalPrmStrStabyCtrlBrk19";
		select ".rodata.CalPrmElecVacPmpBrk19";
		select ".rodata.CalPrmRgnBrkCtrlrBrk19";
		select ".rodata.CalPrmEssBrk19";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK20_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk20";
		select ".rodata.CalPrmSigProcrBrk20";	
		select ".rodata.CalPrmEstmrBrk20";
		select ".rodata.CalPrmWslcBrk20";
		select ".rodata.CalPrmLatDynsCoorrBrk20";	
		select ".rodata.CalPrmBrkAssisCoorrBrk20";	
		select ".rodata.CalPrmLowPCoorrBrk20";	
		select ".rodata.CalPrmSsmBrk20";	
		select ".rodata.CalPrmVehLgtCoorrBrk20";
		select ".rodata.CalPrmAutoBrkCoorrBrk20";
		select ".rodata.CalPrmBrkTqCtrlrBrk20";		
		select ".rodata.CalPrmStrStabyCtrlBrk20";
		select ".rodata.CalPrmElecVacPmpBrk20";
		select ".rodata.CalPrmRgnBrkCtrlrBrk20";
		select ".rodata.CalPrmEssBrk20";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK21_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk21";
		select ".rodata.CalPrmSigProcrBrk21";	
		select ".rodata.CalPrmEstmrBrk21";
		select ".rodata.CalPrmWslcBrk21";
		select ".rodata.CalPrmLatDynsCoorrBrk21";	
		select ".rodata.CalPrmBrkAssisCoorrBrk21";	
		select ".rodata.CalPrmLowPCoorrBrk21";	
		select ".rodata.CalPrmSsmBrk21";	
		select ".rodata.CalPrmVehLgtCoorrBrk21";
		select ".rodata.CalPrmAutoBrkCoorrBrk21";
		select ".rodata.CalPrmBrkTqCtrlrBrk21";		
		select ".rodata.CalPrmStrStabyCtrlBrk21";
		select ".rodata.CalPrmElecVacPmpBrk21";
		select ".rodata.CalPrmRgnBrkCtrlrBrk21";
		select ".rodata.CalPrmEssBrk21";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK22_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk22";
		select ".rodata.CalPrmSigProcrBrk22";	
		select ".rodata.CalPrmEstmrBrk22";
		select ".rodata.CalPrmWslcBrk22";
		select ".rodata.CalPrmLatDynsCoorrBrk22";	
		select ".rodata.CalPrmBrkAssisCoorrBrk22";	
		select ".rodata.CalPrmLowPCoorrBrk22";	
		select ".rodata.CalPrmSsmBrk22";	
		select ".rodata.CalPrmVehLgtCoorrBrk22";
		select ".rodata.CalPrmAutoBrkCoorrBrk22";
		select ".rodata.CalPrmBrkTqCtrlrBrk22";		
		select ".rodata.CalPrmStrStabyCtrlBrk22";
		select ".rodata.CalPrmElecVacPmpBrk22";
		select ".rodata.CalPrmRgnBrkCtrlrBrk22";
		select ".rodata.CalPrmEssBrk22";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK23_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk23";
		select ".rodata.CalPrmSigProcrBrk23";	
		select ".rodata.CalPrmEstmrBrk23";
		select ".rodata.CalPrmWslcBrk23";
		select ".rodata.CalPrmLatDynsCoorrBrk23";	
		select ".rodata.CalPrmBrkAssisCoorrBrk23";	
		select ".rodata.CalPrmLowPCoorrBrk23";	
		select ".rodata.CalPrmSsmBrk23";	
		select ".rodata.CalPrmVehLgtCoorrBrk23";
		select ".rodata.CalPrmAutoBrkCoorrBrk23";
		select ".rodata.CalPrmBrkTqCtrlrBrk23";		
		select ".rodata.CalPrmStrStabyCtrlBrk23";
		select ".rodata.CalPrmElecVacPmpBrk23";
		select ".rodata.CalPrmRgnBrkCtrlrBrk23";
		select ".rodata.CalPrmEssBrk23";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK24_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk24";
		select ".rodata.CalPrmSigProcrBrk24";	
		select ".rodata.CalPrmEstmrBrk24";
		select ".rodata.CalPrmWslcBrk24";
		select ".rodata.CalPrmLatDynsCoorrBrk24";	
		select ".rodata.CalPrmBrkAssisCoorrBrk24";	
		select ".rodata.CalPrmLowPCoorrBrk24";	
		select ".rodata.CalPrmSsmBrk24";	
		select ".rodata.CalPrmVehLgtCoorrBrk24";
		select ".rodata.CalPrmAutoBrkCoorrBrk24";
		select ".rodata.CalPrmBrkTqCtrlrBrk24";		
		select ".rodata.CalPrmStrStabyCtrlBrk24";
		select ".rodata.CalPrmElecVacPmpBrk24";
		select ".rodata.CalPrmRgnBrkCtrlrBrk24";
		select ".rodata.CalPrmEssBrk24";
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
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG02_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng02";
		select ".rodata.CalPrmSigProcrEng02";
		select ".rodata.CalPrmWslcEng02";
		select ".rodata.CalPrmWspcEng02";
		select ".rodata.CalPrmAwdCtrlrEng02";
		select ".rodata.CalPrmBrkAssisCoorrEng02";	
		select ".rodata.CalPrmSsmEng02";
		select ".rodata.CalPrmVehLgtCoorrEng02";
		select ".rodata.CalPrmAutoBrkCoorrEng02";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG03_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng03";
		select ".rodata.CalPrmSigProcrEng03";
		select ".rodata.CalPrmWslcEng03";
		select ".rodata.CalPrmWspcEng03";
		select ".rodata.CalPrmAwdCtrlrEng03";
		select ".rodata.CalPrmBrkAssisCoorrEng03";	
		select ".rodata.CalPrmSsmEng03";
		select ".rodata.CalPrmVehLgtCoorrEng03";
		select ".rodata.CalPrmAutoBrkCoorrEng03";				
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG04_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng04";
		select ".rodata.CalPrmSigProcrEng04";
		select ".rodata.CalPrmWslcEng04";
		select ".rodata.CalPrmWspcEng04";
		select ".rodata.CalPrmAwdCtrlrEng04";
		select ".rodata.CalPrmBrkAssisCoorrEng04";	
		select ".rodata.CalPrmSsmEng04";	
		select ".rodata.CalPrmVehLgtCoorrEng04";
		select ".rodata.CalPrmAutoBrkCoorrEng04";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG05_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng05";
		select ".rodata.CalPrmSigProcrEng05";
		select ".rodata.CalPrmWslcEng05";
		select ".rodata.CalPrmWspcEng05";
		select ".rodata.CalPrmAwdCtrlrEng05";
		select ".rodata.CalPrmBrkAssisCoorrEng05";	
		select ".rodata.CalPrmSsmEng05";	
		select ".rodata.CalPrmVehLgtCoorrEng05";
		select ".rodata.CalPrmAutoBrkCoorrEng05";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG06_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng06";
		select ".rodata.CalPrmSigProcrEng06";
		select ".rodata.CalPrmWslcEng06";
		select ".rodata.CalPrmWspcEng06";
		select ".rodata.CalPrmAwdCtrlrEng06";
		select ".rodata.CalPrmBrkAssisCoorrEng06";	
		select ".rodata.CalPrmSsmEng06";
		select ".rodata.CalPrmVehLgtCoorrEng06";
		select ".rodata.CalPrmAutoBrkCoorrEng06";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG07_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng07";
		select ".rodata.CalPrmSigProcrEng07";
		select ".rodata.CalPrmWslcEng07";
		select ".rodata.CalPrmWspcEng07";
		select ".rodata.CalPrmAwdCtrlrEng07";
		select ".rodata.CalPrmBrkAssisCoorrEng07";	
		select ".rodata.CalPrmSsmEng07";
		select ".rodata.CalPrmVehLgtCoorrEng07";
		select ".rodata.CalPrmAutoBrkCoorrEng07";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG08_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng08";
		select ".rodata.CalPrmSigProcrEng08";
		select ".rodata.CalPrmWslcEng08";
		select ".rodata.CalPrmWspcEng08";
		select ".rodata.CalPrmAwdCtrlrEng08";
		select ".rodata.CalPrmBrkAssisCoorrEng08";	
		select ".rodata.CalPrmSsmEng08";
		select ".rodata.CalPrmVehLgtCoorrEng08";
		select ".rodata.CalPrmAutoBrkCoorrEng08";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG09_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng09";
		select ".rodata.CalPrmSigProcrEng09";
		select ".rodata.CalPrmWslcEng09";
		select ".rodata.CalPrmWspcEng09";
		select ".rodata.CalPrmAwdCtrlrEng09";
		select ".rodata.CalPrmBrkAssisCoorrEng09";	
		select ".rodata.CalPrmSsmEng09";
		select ".rodata.CalPrmVehLgtCoorrEng09";
		select ".rodata.CalPrmAutoBrkCoorrEng09";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG10_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng10";
		select ".rodata.CalPrmSigProcrEng10";
		select ".rodata.CalPrmWslcEng10";
		select ".rodata.CalPrmWspcEng10";
		select ".rodata.CalPrmAwdCtrlrEng10";
		select ".rodata.CalPrmBrkAssisCoorrEng10";	
		select ".rodata.CalPrmSsmEng10";	
		select ".rodata.CalPrmVehLgtCoorrEng10";
		select ".rodata.CalPrmAutoBrkCoorrEng10";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG11_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng11";
		select ".rodata.CalPrmSigProcrEng11";
		select ".rodata.CalPrmWslcEng11";
		select ".rodata.CalPrmWspcEng11";
		select ".rodata.CalPrmAwdCtrlrEng11";
		select ".rodata.CalPrmBrkAssisCoorrEng11";	
		select ".rodata.CalPrmSsmEng11";
		select ".rodata.CalPrmVehLgtCoorrEng11";
		select ".rodata.CalPrmAutoBrkCoorrEng11";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG12_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng12";
		select ".rodata.CalPrmSigProcrEng12";
		select ".rodata.CalPrmWslcEng12";
		select ".rodata.CalPrmWspcEng12";
		select ".rodata.CalPrmAwdCtrlrEng12";
		select ".rodata.CalPrmBrkAssisCoorrEng12";	
		select ".rodata.CalPrmSsmEng12";
		select ".rodata.CalPrmVehLgtCoorrEng12";
		select ".rodata.CalPrmAutoBrkCoorrEng12";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG13_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng13";
		select ".rodata.CalPrmSigProcrEng13";
		select ".rodata.CalPrmWslcEng13";
		select ".rodata.CalPrmWspcEng13";
		select ".rodata.CalPrmAwdCtrlrEng13";
		select ".rodata.CalPrmBrkAssisCoorrEng13";	
		select ".rodata.CalPrmSsmEng13";
		select ".rodata.CalPrmVehLgtCoorrEng13";
		select ".rodata.CalPrmAutoBrkCoorrEng13";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG14_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng14";
		select ".rodata.CalPrmSigProcrEng14";
		select ".rodata.CalPrmWslcEng14";
		select ".rodata.CalPrmWspcEng14";
		select ".rodata.CalPrmAwdCtrlrEng14";
		select ".rodata.CalPrmBrkAssisCoorrEng14";	
		select ".rodata.CalPrmSsmEng14";
		select ".rodata.CalPrmVehLgtCoorrEng14";
		select ".rodata.CalPrmAutoBrkCoorrEng14";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG15_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng15";
		select ".rodata.CalPrmSigProcrEng15";
		select ".rodata.CalPrmWslcEng15";
		select ".rodata.CalPrmWspcEng15";
		select ".rodata.CalPrmAwdCtrlrEng15";
		select ".rodata.CalPrmBrkAssisCoorrEng15";	
		select ".rodata.CalPrmSsmEng15";
		select ".rodata.CalPrmVehLgtCoorrEng15";
		select ".rodata.CalPrmAutoBrkCoorrEng15";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG16_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng16";
		select ".rodata.CalPrmSigProcrEng16";
		select ".rodata.CalPrmWslcEng16";
		select ".rodata.CalPrmWspcEng16";
		select ".rodata.CalPrmAwdCtrlrEng16";
		select ".rodata.CalPrmBrkAssisCoorrEng16";	
		select ".rodata.CalPrmSsmEng16";	
		select ".rodata.CalPrmVehLgtCoorrEng16";
		select ".rodata.CalPrmAutoBrkCoorrEng16";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG17_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng17";
		select ".rodata.CalPrmSigProcrEng17";
		select ".rodata.CalPrmWslcEng17";
		select ".rodata.CalPrmWspcEng17";
		select ".rodata.CalPrmAwdCtrlrEng17";
		select ".rodata.CalPrmBrkAssisCoorrEng17";	
		select ".rodata.CalPrmSsmEng17";
		select ".rodata.CalPrmVehLgtCoorrEng17";
		select ".rodata.CalPrmAutoBrkCoorrEng17";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG18_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng18";
		select ".rodata.CalPrmSigProcrEng18";
		select ".rodata.CalPrmWslcEng18";
		select ".rodata.CalPrmWspcEng18";
		select ".rodata.CalPrmAwdCtrlrEng18";
		select ".rodata.CalPrmBrkAssisCoorrEng18";	
		select ".rodata.CalPrmSsmEng18";
		select ".rodata.CalPrmVehLgtCoorrEng18";
		select ".rodata.CalPrmAutoBrkCoorrEng18";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG19_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng19";
		select ".rodata.CalPrmSigProcrEng19";
		select ".rodata.CalPrmWslcEng19";
		select ".rodata.CalPrmWspcEng19";
		select ".rodata.CalPrmAwdCtrlrEng19";
		select ".rodata.CalPrmBrkAssisCoorrEng19";	
		select ".rodata.CalPrmSsmEng19";	
		select ".rodata.CalPrmVehLgtCoorrEng19";
		select ".rodata.CalPrmAutoBrkCoorrEng19";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG20_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng20";
		select ".rodata.CalPrmSigProcrEng20";
		select ".rodata.CalPrmWslcEng20";
		select ".rodata.CalPrmWspcEng20";
		select ".rodata.CalPrmAwdCtrlrEng20";
		select ".rodata.CalPrmBrkAssisCoorrEng20";	
		select ".rodata.CalPrmSsmEng20";
		select ".rodata.CalPrmVehLgtCoorrEng20";
		select ".rodata.CalPrmAutoBrkCoorrEng20";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG21_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng21";
		select ".rodata.CalPrmSigProcrEng21";
		select ".rodata.CalPrmWslcEng21";
		select ".rodata.CalPrmWspcEng21";
		select ".rodata.CalPrmAwdCtrlrEng21";
		select ".rodata.CalPrmBrkAssisCoorrEng21";	
		select ".rodata.CalPrmSsmEng21";	
		select ".rodata.CalPrmVehLgtCoorrEng21";
		select ".rodata.CalPrmAutoBrkCoorrEng21";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG22_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng22";
		select ".rodata.CalPrmSigProcrEng22";
		select ".rodata.CalPrmWslcEng22";
		select ".rodata.CalPrmWspcEng22";
		select ".rodata.CalPrmAwdCtrlrEng22";
		select ".rodata.CalPrmBrkAssisCoorrEng22";	
		select ".rodata.CalPrmSsmEng22";	
		select ".rodata.CalPrmVehLgtCoorrEng22";
		select ".rodata.CalPrmAutoBrkCoorrEng22";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG23_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng23";
		select ".rodata.CalPrmSigProcrEng23";
		select ".rodata.CalPrmWslcEng23";
		select ".rodata.CalPrmWspcEng23";
		select ".rodata.CalPrmAwdCtrlrEng23";
		select ".rodata.CalPrmBrkAssisCoorrEng23";	
		select ".rodata.CalPrmSsmEng23";		
		select ".rodata.CalPrmVehLgtCoorrEng23";
		select ".rodata.CalPrmAutoBrkCoorrEng23";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG24_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng24";
		select ".rodata.CalPrmSigProcrEng24";
		select ".rodata.CalPrmWslcEng24";
		select ".rodata.CalPrmWspcEng24";
		select ".rodata.CalPrmAwdCtrlrEng24";
		select ".rodata.CalPrmBrkAssisCoorrEng24";	
		select ".rodata.CalPrmSsmEng24";	
		select ".rodata.CalPrmVehLgtCoorrEng24";
		select ".rodata.CalPrmAutoBrkCoorrEng24";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG25_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng25";
		select ".rodata.CalPrmSigProcrEng25";
		select ".rodata.CalPrmWslcEng25";
		select ".rodata.CalPrmWspcEng25";
		select ".rodata.CalPrmAwdCtrlrEng25";
		select ".rodata.CalPrmBrkAssisCoorrEng25";	
		select ".rodata.CalPrmSsmEng25";	
		select ".rodata.CalPrmVehLgtCoorrEng25";
		select ".rodata.CalPrmAutoBrkCoorrEng25";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG26_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng26";
		select ".rodata.CalPrmSigProcrEng26";
		select ".rodata.CalPrmWslcEng26";
		select ".rodata.CalPrmWspcEng26";
		select ".rodata.CalPrmAwdCtrlrEng26";
		select ".rodata.CalPrmBrkAssisCoorrEng26";	
		select ".rodata.CalPrmSsmEng26";	
		select ".rodata.CalPrmVehLgtCoorrEng26";
		select ".rodata.CalPrmAutoBrkCoorrEng26";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG27_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng27";
		select ".rodata.CalPrmSigProcrEng27";
		select ".rodata.CalPrmWslcEng27";
		select ".rodata.CalPrmWspcEng27";
		select ".rodata.CalPrmAwdCtrlrEng27";
		select ".rodata.CalPrmBrkAssisCoorrEng27";	
		select ".rodata.CalPrmSsmEng27";	
		select ".rodata.CalPrmVehLgtCoorrEng27";
		select ".rodata.CalPrmAutoBrkCoorrEng27";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG28_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng28";
		select ".rodata.CalPrmSigProcrEng28";
		select ".rodata.CalPrmWslcEng28";
		select ".rodata.CalPrmWspcEng28";
		select ".rodata.CalPrmAwdCtrlrEng28";
		select ".rodata.CalPrmBrkAssisCoorrEng28";	
		select ".rodata.CalPrmSsmEng28";	
		select ".rodata.CalPrmVehLgtCoorrEng28";
		select ".rodata.CalPrmAutoBrkCoorrEng28";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG29_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng29";
		select ".rodata.CalPrmSigProcrEng29";
		select ".rodata.CalPrmWslcEng29";
		select ".rodata.CalPrmWspcEng29";
		select ".rodata.CalPrmAwdCtrlrEng29";
		select ".rodata.CalPrmBrkAssisCoorrEng29";	
		select ".rodata.CalPrmSsmEng29";	
		select ".rodata.CalPrmVehLgtCoorrEng29";
		select ".rodata.CalPrmAutoBrkCoorrEng29";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG30_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng30";
		select ".rodata.CalPrmSigProcrEng30";
		select ".rodata.CalPrmWslcEng30";
		select ".rodata.CalPrmWspcEng30";
		select ".rodata.CalPrmAwdCtrlrEng30";
		select ".rodata.CalPrmBrkAssisCoorrEng30";	
		select ".rodata.CalPrmSsmEng30";	
		select ".rodata.CalPrmVehLgtCoorrEng30";
		select ".rodata.CalPrmAutoBrkCoorrEng30";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG31_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng31";
		select ".rodata.CalPrmSigProcrEng31";
		select ".rodata.CalPrmWslcEng31";
		select ".rodata.CalPrmWspcEng31";
		select ".rodata.CalPrmAwdCtrlrEng31";
		select ".rodata.CalPrmBrkAssisCoorrEng31";	
		select ".rodata.CalPrmSsmEng31";	
		select ".rodata.CalPrmVehLgtCoorrEng31";
		select ".rodata.CalPrmAutoBrkCoorrEng31";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG32_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng32";
		select ".rodata.CalPrmSigProcrEng32";
		select ".rodata.CalPrmWslcEng32";
		select ".rodata.CalPrmWspcEng32";
		select ".rodata.CalPrmAwdCtrlrEng32";
		select ".rodata.CalPrmBrkAssisCoorrEng32";	
		select ".rodata.CalPrmSsmEng32";	
		select ".rodata.CalPrmVehLgtCoorrEng32";	
		select ".rodata.CalPrmAutoBrkCoorrEng32";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG33_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng33";
		select ".rodata.CalPrmSigProcrEng33";
		select ".rodata.CalPrmWslcEng33";
		select ".rodata.CalPrmWspcEng33";
		select ".rodata.CalPrmAwdCtrlrEng33";
		select ".rodata.CalPrmBrkAssisCoorrEng33";	
		select ".rodata.CalPrmSsmEng33";	
		select ".rodata.CalPrmVehLgtCoorrEng33";
		select ".rodata.CalPrmAutoBrkCoorrEng33";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG34_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng34";
		select ".rodata.CalPrmSigProcrEng34";
		select ".rodata.CalPrmWslcEng34";
		select ".rodata.CalPrmWspcEng34";
		select ".rodata.CalPrmAwdCtrlrEng34";
		select ".rodata.CalPrmBrkAssisCoorrEng34";	
		select ".rodata.CalPrmSsmEng34";	
		select ".rodata.CalPrmVehLgtCoorrEng34";
		select ".rodata.CalPrmAutoBrkCoorrEng34";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG35_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng35";
		select ".rodata.CalPrmSigProcrEng35";
		select ".rodata.CalPrmWslcEng35";
		select ".rodata.CalPrmWspcEng35";
		select ".rodata.CalPrmAwdCtrlrEng35";
		select ".rodata.CalPrmBrkAssisCoorrEng35";	
		select ".rodata.CalPrmSsmEng35";	
		select ".rodata.CalPrmVehLgtCoorrEng35";
		select ".rodata.CalPrmAutoBrkCoorrEng35";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG36_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng36";
		select ".rodata.CalPrmSigProcrEng36";
		select ".rodata.CalPrmWslcEng36";
		select ".rodata.CalPrmWspcEng36";
		select ".rodata.CalPrmAwdCtrlrEng36";
		select ".rodata.CalPrmBrkAssisCoorrEng36";	
		select ".rodata.CalPrmSsmEng36";	
		select ".rodata.CalPrmVehLgtCoorrEng36";	
		select ".rodata.CalPrmAutoBrkCoorrEng36";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG37_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng37";
		select ".rodata.CalPrmSigProcrEng37";
		select ".rodata.CalPrmWslcEng37";
		select ".rodata.CalPrmWspcEng37";
		select ".rodata.CalPrmAwdCtrlrEng37";
		select ".rodata.CalPrmBrkAssisCoorrEng37";	
		select ".rodata.CalPrmSsmEng37";	
		select ".rodata.CalPrmVehLgtCoorrEng37";
		select ".rodata.CalPrmAutoBrkCoorrEng37";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG38_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng38";
		select ".rodata.CalPrmSigProcrEng38";
		select ".rodata.CalPrmWslcEng38";
		select ".rodata.CalPrmWspcEng38";
		select ".rodata.CalPrmAwdCtrlrEng38";
		select ".rodata.CalPrmBrkAssisCoorrEng38";	
		select ".rodata.CalPrmSsmEng38";	
		select ".rodata.CalPrmVehLgtCoorrEng38";
		select ".rodata.CalPrmAutoBrkCoorrEng38";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG39_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng39";
		select ".rodata.CalPrmSigProcrEng39";
		select ".rodata.CalPrmWslcEng39";
		select ".rodata.CalPrmWspcEng39";
		select ".rodata.CalPrmAwdCtrlrEng39";
		select ".rodata.CalPrmBrkAssisCoorrEng39";	
		select ".rodata.CalPrmSsmEng39";	
		select ".rodata.CalPrmVehLgtCoorrEng39";
		select ".rodata.CalPrmAutoBrkCoorrEng39";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG40_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng40";
		select ".rodata.CalPrmSigProcrEng40";
		select ".rodata.CalPrmWslcEng40";
		select ".rodata.CalPrmWspcEng40";
		select ".rodata.CalPrmAwdCtrlrEng40";
		select ".rodata.CalPrmBrkAssisCoorrEng40";	
		select ".rodata.CalPrmSsmEng40";	
		select ".rodata.CalPrmVehLgtCoorrEng40";
		select ".rodata.CalPrmAutoBrkCoorrEng40";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG41_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng41";
		select ".rodata.CalPrmSigProcrEng41";
		select ".rodata.CalPrmWslcEng41";
		select ".rodata.CalPrmWspcEng41";
		select ".rodata.CalPrmAwdCtrlrEng41";
		select ".rodata.CalPrmBrkAssisCoorrEng41";	
		select ".rodata.CalPrmSsmEng41";	
		select ".rodata.CalPrmVehLgtCoorrEng41";
		select ".rodata.CalPrmAutoBrkCoorrEng41";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG42_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng42";
		select ".rodata.CalPrmSigProcrEng42";
		select ".rodata.CalPrmWslcEng42";
		select ".rodata.CalPrmWspcEng42";
		select ".rodata.CalPrmAwdCtrlrEng42";
		select ".rodata.CalPrmBrkAssisCoorrEng42";	
		select ".rodata.CalPrmSsmEng42";	
		select ".rodata.CalPrmVehLgtCoorrEng42";
		select ".rodata.CalPrmAutoBrkCoorrEng42";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG43_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng43";
		select ".rodata.CalPrmSigProcrEng43";
		select ".rodata.CalPrmWslcEng43";
		select ".rodata.CalPrmWspcEng43";
		select ".rodata.CalPrmAwdCtrlrEng43";
		select ".rodata.CalPrmBrkAssisCoorrEng43";	
		select ".rodata.CalPrmSsmEng43";	
		select ".rodata.CalPrmVehLgtCoorrEng43";
		select ".rodata.CalPrmAutoBrkCoorrEng43";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG44_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng44";
		select ".rodata.CalPrmSigProcrEng44";
		select ".rodata.CalPrmWslcEng44";
		select ".rodata.CalPrmWspcEng44";
		select ".rodata.CalPrmAwdCtrlrEng44";
		select ".rodata.CalPrmBrkAssisCoorrEng44";	
		select ".rodata.CalPrmSsmEng44";	
		select ".rodata.CalPrmVehLgtCoorrEng44";
		select ".rodata.CalPrmAutoBrkCoorrEng44";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG45_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng45";
		select ".rodata.CalPrmSigProcrEng45";
		select ".rodata.CalPrmWslcEng45";
		select ".rodata.CalPrmWspcEng45";
		select ".rodata.CalPrmAwdCtrlrEng45";
		select ".rodata.CalPrmBrkAssisCoorrEng45";	
		select ".rodata.CalPrmSsmEng45";	
		select ".rodata.CalPrmVehLgtCoorrEng45";
		select ".rodata.CalPrmAutoBrkCoorrEng45";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG46_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng46";
		select ".rodata.CalPrmSigProcrEng46";
		select ".rodata.CalPrmWslcEng46";
		select ".rodata.CalPrmWspcEng46";
		select ".rodata.CalPrmAwdCtrlrEng46";
		select ".rodata.CalPrmBrkAssisCoorrEng46";	
		select ".rodata.CalPrmSsmEng46";	
		select ".rodata.CalPrmVehLgtCoorrEng46";
		select ".rodata.CalPrmAutoBrkCoorrEng46";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG47_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng47";
		select ".rodata.CalPrmSigProcrEng47";
		select ".rodata.CalPrmWslcEng47";
		select ".rodata.CalPrmWspcEng47";
		select ".rodata.CalPrmAwdCtrlrEng47";
		select ".rodata.CalPrmBrkAssisCoorrEng47";	
		select ".rodata.CalPrmSsmEng47";	
		select ".rodata.CalPrmVehLgtCoorrEng47";
		select ".rodata.CalPrmAutoBrkCoorrEng47";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG48_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng48";
		select ".rodata.CalPrmSigProcrEng48";
		select ".rodata.CalPrmWslcEng48";
		select ".rodata.CalPrmWspcEng48";
		select ".rodata.CalPrmAwdCtrlrEng48";
		select ".rodata.CalPrmBrkAssisCoorrEng48";	
		select ".rodata.CalPrmSsmEng48";	
		select ".rodata.CalPrmVehLgtCoorrEng48";
		select ".rodata.CalPrmAutoBrkCoorrEng48";	
	}
}

#else /* MGH100_ABS_LARGE --> ABS SOLO LARGE */

#define CAL_VRNT_SIZE 		0x10	//16B
#define CAL_BRK_SIZE		0x960	//2.4K
#define CAL_ENG_SIZE    	0x1F4	//500B
#define CAL_DIAG_SIZE		0x200	//500B

#define PF0_ESC_CAL_START_BASE (0x80020000)
#define PF0_HEADER_CAL_STRT_BASE (PF0_ESC_CAL_START_BASE + 0x10)
#define PF0_DIAG_CAL_STRT_BASE  (PF0_HEADER_CAL_STRT_BASE + CAL_VRNT_SIZE)
#define PF0_BRK01_CAL_STRT_BASE (PF0_DIAG_CAL_STRT_BASE + CAL_DIAG_SIZE)
#define PF0_BRK02_CAL_STRT_BASE (PF0_BRK01_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK03_CAL_STRT_BASE (PF0_BRK02_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_BRK04_CAL_STRT_BASE (PF0_BRK03_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_ENG01_CAL_STRT_BASE (PF0_BRK04_CAL_STRT_BASE + CAL_BRK_SIZE)
#define PF0_ENG02_CAL_STRT_BASE (PF0_ENG01_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG03_CAL_STRT_BASE (PF0_ENG02_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG04_CAL_STRT_BASE (PF0_ENG03_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG05_CAL_STRT_BASE (PF0_ENG04_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG06_CAL_STRT_BASE (PF0_ENG05_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG07_CAL_STRT_BASE (PF0_ENG06_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG08_CAL_STRT_BASE (PF0_ENG07_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG09_CAL_STRT_BASE (PF0_ENG08_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG10_CAL_STRT_BASE (PF0_ENG09_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG11_CAL_STRT_BASE (PF0_ENG10_CAL_STRT_BASE + CAL_ENG_SIZE)
#define PF0_ENG12_CAL_STRT_BASE (PF0_ENG11_CAL_STRT_BASE + CAL_ENG_SIZE)

section_layout spe:tc:linear
{
	group (ordered, contiguous, align = 4, run_addr=(PF0_ESC_CAL_START_BASE))
    {
		select ".rodata.cal0_header";
    }
    group (ordered, contiguous, align = 4, run_addr=(PF0_HEADER_CAL_STRT_BASE))
    {
		select ".rodata.CalVrntCta";
    }
	group (ordered, contiguous, align = 4, run_addr=(PF0_DIAG_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmDiag01";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK01_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk01";
		select ".rodata.CalPrmSigProcrBrk01";	
		select ".rodata.CalPrmWslcBrk01";
		select ".rodata.CalPrmBrkTqCtrlrBrk01";
		select ".rodata.CalPrmElecVacPmpBrk01";
		select ".rodata.CalPrmEssBrk01";		
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK02_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk02";
		select ".rodata.CalPrmSigProcrBrk02";	
		select ".rodata.CalPrmWslcBrk02";
		select ".rodata.CalPrmBrkTqCtrlrBrk02";	
		select ".rodata.CalPrmElecVacPmpBrk02";	
		select ".rodata.CalPrmEssBrk02";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK03_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk03";
		select ".rodata.CalPrmSigProcrBrk03";	
		select ".rodata.CalPrmWslcBrk03";
		select ".rodata.CalPrmBrkTqCtrlrBrk03";	
		select ".rodata.CalPrmElecVacPmpBrk03";	
		select ".rodata.CalPrmEssBrk03";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_BRK04_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnBrk04";
		select ".rodata.CalPrmSigProcrBrk04";	
		select ".rodata.CalPrmWslcBrk04";
		select ".rodata.CalPrmBrkTqCtrlrBrk04";	
		select ".rodata.CalPrmElecVacPmpBrk04";	
		select ".rodata.CalPrmEssBrk04";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG01_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng01";
		select ".rodata.CalPrmSigProcrEng01";
		select ".rodata.CalPrmWslcEng01";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG02_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng02";
		select ".rodata.CalPrmSigProcrEng02";
		select ".rodata.CalPrmWslcEng02";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG03_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng03";
		select ".rodata.CalPrmSigProcrEng03";
		select ".rodata.CalPrmWslcEng03";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG04_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng04";
		select ".rodata.CalPrmSigProcrEng04";
		select ".rodata.CalPrmWslcEng04";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG05_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng05";
		select ".rodata.CalPrmSigProcrEng05";
		select ".rodata.CalPrmWslcEng05";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG06_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng06";
		select ".rodata.CalPrmSigProcrEng06";
		select ".rodata.CalPrmWslcEng06";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG07_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng07";
		select ".rodata.CalPrmSigProcrEng07";
		select ".rodata.CalPrmWslcEng07";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG08_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng08";
		select ".rodata.CalPrmSigProcrEng08";
		select ".rodata.CalPrmWslcEng08";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG09_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng09";
		select ".rodata.CalPrmSigProcrEng09";
		select ".rodata.CalPrmWslcEng09";	
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG10_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng10";
		select ".rodata.CalPrmSigProcrEng10";
		select ".rodata.CalPrmWslcEng10";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG11_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng11";
		select ".rodata.CalPrmSigProcrEng11";
		select ".rodata.CalPrmWslcEng11";
	}
	group (ordered, contiguous, align = 4, run_addr=(PF0_ENG12_CAL_STRT_BASE))
	{
		select ".rodata.CalPrmCmnEng12";
		select ".rodata.CalPrmSigProcrEng12";
		select ".rodata.CalPrmWslcEng12";	
	}
}

#endif
