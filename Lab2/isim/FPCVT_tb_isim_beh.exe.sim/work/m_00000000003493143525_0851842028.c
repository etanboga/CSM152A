/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/152/Desktop/Lab2/TC2SM.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {2048U, 0U};
static unsigned int ng4[] = {2047U, 0U};



static void Always_32_0(char *t0)
{
    char t6[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned int t20;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB5:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 11);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 11);
    t13 = (t12 & 1);
    *((unsigned int *)t4) = t13;
    t14 = (t0 + 1768);
    xsi_vlogvar_assign_value(t14, t6, 0, 0, 1);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 1, t5, 32);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 1, t2, 32);
    if (t15 == 1)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB7:    xsi_set_current_line(38, ng0);
    t7 = (t0 + 1048U);
    t14 = *((char **)t7);
    memset(t6, 0, 8);
    t7 = (t6 + 4);
    t16 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t16);
    t11 = (t10 >> 0);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t12 & 2047U);
    t13 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t13 & 2047U);
    t17 = (t0 + 1608);
    xsi_vlogvar_assign_value(t17, t6, 0, 0, 11);
    goto LAB11;

LAB9:    xsi_set_current_line(39, ng0);

LAB12:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 1048U);
    t5 = *((char **)t3);

LAB13:    t3 = ((char*)((ng3)));
    t18 = xsi_vlog_unsigned_case_compare(t5, 12, t3, 32);
    if (t18 == 1)
        goto LAB14;

LAB15:
LAB17:
LAB16:    xsi_set_current_line(42, ng0);

LAB19:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    *((unsigned int *)t6) = t9;
    *((unsigned int *)t2) = 0;
    if (*((unsigned int *)t7) != 0)
        goto LAB21;

LAB20:    t19 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t19 & 4294967295U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 4294967295U);
    t14 = ((char*)((ng2)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 32, t6, 32, t14, 32);
    t16 = (t0 + 1928);
    xsi_vlogvar_assign_value(t16, t21, 0, 0, 12);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    memset(t6, 0, 8);
    t14 = (t6 + 4);
    t16 = (t7 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (t8 >> 0);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t16);
    t11 = (t10 >> 0);
    *((unsigned int *)t14) = t11;
    t12 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t12 & 2047U);
    t13 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t13 & 2047U);
    t17 = (t0 + 1608);
    xsi_vlogvar_assign_value(t17, t6, 0, 0, 11);

LAB18:    goto LAB11;

LAB14:    xsi_set_current_line(41, ng0);
    t7 = ((char*)((ng4)));
    t14 = (t0 + 1608);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 11);
    goto LAB18;

LAB21:    t10 = *((unsigned int *)t6);
    t11 = *((unsigned int *)t7);
    *((unsigned int *)t6) = (t10 | t11);
    t12 = *((unsigned int *)t2);
    t13 = *((unsigned int *)t7);
    *((unsigned int *)t2) = (t12 | t13);
    goto LAB20;

}


extern void work_m_00000000003493143525_0851842028_init()
{
	static char *pe[] = {(void *)Always_32_0};
	xsi_register_didat("work_m_00000000003493143525_0851842028", "isim/FPCVT_tb_isim_beh.exe.sim/work/m_00000000003493143525_0851842028.didat");
	xsi_register_executes(pe);
}
