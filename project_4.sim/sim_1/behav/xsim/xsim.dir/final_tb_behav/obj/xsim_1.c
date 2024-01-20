/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_372(char*, char *);
IKI_DLLESPEC extern void execute_373(char*, char *);
IKI_DLLESPEC extern void execute_32(char*, char *);
IKI_DLLESPEC extern void execute_33(char*, char *);
IKI_DLLESPEC extern void execute_34(char*, char *);
IKI_DLLESPEC extern void execute_35(char*, char *);
IKI_DLLESPEC extern void execute_36(char*, char *);
IKI_DLLESPEC extern void execute_38(char*, char *);
IKI_DLLESPEC extern void execute_39(char*, char *);
IKI_DLLESPEC extern void execute_46(char*, char *);
IKI_DLLESPEC extern void execute_49(char*, char *);
IKI_DLLESPEC extern void execute_50(char*, char *);
IKI_DLLESPEC extern void execute_55(char*, char *);
IKI_DLLESPEC extern void execute_56(char*, char *);
IKI_DLLESPEC extern void execute_59(char*, char *);
IKI_DLLESPEC extern void execute_318(char*, char *);
IKI_DLLESPEC extern void execute_368(char*, char *);
IKI_DLLESPEC extern void execute_369(char*, char *);
IKI_DLLESPEC extern void execute_370(char*, char *);
IKI_DLLESPEC extern void execute_371(char*, char *);
IKI_DLLESPEC extern void execute_41(char*, char *);
IKI_DLLESPEC extern void execute_52(char*, char *);
IKI_DLLESPEC extern void execute_54(char*, char *);
IKI_DLLESPEC extern void execute_67(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_71(char*, char *);
IKI_DLLESPEC extern void execute_76(char*, char *);
IKI_DLLESPEC extern void execute_79(char*, char *);
IKI_DLLESPEC extern void execute_80(char*, char *);
IKI_DLLESPEC extern void execute_85(char*, char *);
IKI_DLLESPEC extern void execute_88(char*, char *);
IKI_DLLESPEC extern void execute_89(char*, char *);
IKI_DLLESPEC extern void execute_94(char*, char *);
IKI_DLLESPEC extern void execute_97(char*, char *);
IKI_DLLESPEC extern void execute_98(char*, char *);
IKI_DLLESPEC extern void execute_103(char*, char *);
IKI_DLLESPEC extern void execute_106(char*, char *);
IKI_DLLESPEC extern void execute_107(char*, char *);
IKI_DLLESPEC extern void execute_112(char*, char *);
IKI_DLLESPEC extern void execute_115(char*, char *);
IKI_DLLESPEC extern void execute_116(char*, char *);
IKI_DLLESPEC extern void execute_121(char*, char *);
IKI_DLLESPEC extern void execute_124(char*, char *);
IKI_DLLESPEC extern void execute_125(char*, char *);
IKI_DLLESPEC extern void execute_130(char*, char *);
IKI_DLLESPEC extern void execute_133(char*, char *);
IKI_DLLESPEC extern void execute_134(char*, char *);
IKI_DLLESPEC extern void execute_137(char*, char *);
IKI_DLLESPEC extern void execute_138(char*, char *);
IKI_DLLESPEC extern void execute_139(char*, char *);
IKI_DLLESPEC extern void execute_145(char*, char *);
IKI_DLLESPEC extern void execute_148(char*, char *);
IKI_DLLESPEC extern void execute_149(char*, char *);
IKI_DLLESPEC extern void execute_225(char*, char *);
IKI_DLLESPEC extern void execute_249(char*, char *);
IKI_DLLESPEC extern void execute_244(char*, char *);
IKI_DLLESPEC extern void execute_317(char*, char *);
IKI_DLLESPEC extern void execute_320(char*, char *);
IKI_DLLESPEC extern void execute_366(char*, char *);
IKI_DLLESPEC extern void execute_367(char*, char *);
IKI_DLLESPEC extern void execute_329(char*, char *);
IKI_DLLESPEC extern void execute_330(char*, char *);
IKI_DLLESPEC extern void execute_334(char*, char *);
IKI_DLLESPEC extern void execute_335(char*, char *);
IKI_DLLESPEC extern void execute_339(char*, char *);
IKI_DLLESPEC extern void execute_340(char*, char *);
IKI_DLLESPEC extern void execute_344(char*, char *);
IKI_DLLESPEC extern void execute_345(char*, char *);
IKI_DLLESPEC extern void execute_328(char*, char *);
IKI_DLLESPEC extern void execute_364(char*, char *);
IKI_DLLESPEC extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_5(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[77] = {(funcp)execute_372, (funcp)execute_373, (funcp)execute_32, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_36, (funcp)execute_38, (funcp)execute_39, (funcp)execute_46, (funcp)execute_49, (funcp)execute_50, (funcp)execute_55, (funcp)execute_56, (funcp)execute_59, (funcp)execute_318, (funcp)execute_368, (funcp)execute_369, (funcp)execute_370, (funcp)execute_371, (funcp)execute_41, (funcp)execute_52, (funcp)execute_54, (funcp)execute_67, (funcp)execute_70, (funcp)execute_71, (funcp)execute_76, (funcp)execute_79, (funcp)execute_80, (funcp)execute_85, (funcp)execute_88, (funcp)execute_89, (funcp)execute_94, (funcp)execute_97, (funcp)execute_98, (funcp)execute_103, (funcp)execute_106, (funcp)execute_107, (funcp)execute_112, (funcp)execute_115, (funcp)execute_116, (funcp)execute_121, (funcp)execute_124, (funcp)execute_125, (funcp)execute_130, (funcp)execute_133, (funcp)execute_134, (funcp)execute_137, (funcp)execute_138, (funcp)execute_139, (funcp)execute_145, (funcp)execute_148, (funcp)execute_149, (funcp)execute_225, (funcp)execute_249, (funcp)execute_244, (funcp)execute_317, (funcp)execute_320, (funcp)execute_366, (funcp)execute_367, (funcp)execute_329, (funcp)execute_330, (funcp)execute_334, (funcp)execute_335, (funcp)execute_339, (funcp)execute_340, (funcp)execute_344, (funcp)execute_345, (funcp)execute_328, (funcp)execute_364, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_3, (funcp)transaction_5, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_55};
const int NumRelocateId= 77;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/final_tb_behav/xsim.reloc",  (void **)funcTab, 77);
	iki_vhdl_file_variable_register(dp + 437303072);
	iki_vhdl_file_variable_register(dp + 437303128);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/final_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/final_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/final_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/final_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/final_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
