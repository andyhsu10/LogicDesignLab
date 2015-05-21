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
static const char *ng0 = "D:/GitHub/LogicDesignLab/Lab9/Lab9-1/speaker_ctl.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {6U, 0U};
static unsigned int ng8[] = {7U, 0U};
static unsigned int ng9[] = {8U, 0U};
static unsigned int ng10[] = {9U, 0U};
static unsigned int ng11[] = {10U, 0U};
static unsigned int ng12[] = {11U, 0U};
static unsigned int ng13[] = {12U, 0U};
static unsigned int ng14[] = {13U, 0U};
static unsigned int ng15[] = {14U, 0U};
static unsigned int ng16[] = {15U, 0U};
static unsigned int ng17[] = {16U, 0U};
static unsigned int ng18[] = {17U, 0U};
static unsigned int ng19[] = {18U, 0U};
static unsigned int ng20[] = {19U, 0U};
static unsigned int ng21[] = {20U, 0U};
static unsigned int ng22[] = {21U, 0U};
static unsigned int ng23[] = {22U, 0U};
static unsigned int ng24[] = {23U, 0U};
static unsigned int ng25[] = {24U, 0U};
static unsigned int ng26[] = {25U, 0U};
static unsigned int ng27[] = {26U, 0U};
static unsigned int ng28[] = {27U, 0U};
static unsigned int ng29[] = {28U, 0U};
static unsigned int ng30[] = {29U, 0U};
static unsigned int ng31[] = {30U, 0U};
static unsigned int ng32[] = {31U, 0U};



static void Cont_44_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5408);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Cont_48_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 5472);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t3 + 4);
    t11 = *((unsigned int *)t3);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t2, 0, 0);
    t16 = (t0 + 5280);
    *((int *)t16) = 1;

LAB1:    return;
}

static void Always_52_2(char *t0)
{
    char t4[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 5296);
    *((int *)t2) = 1;
    t3 = (t0 + 4496);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(53, ng0);
    t5 = (t0 + 2728);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t0 + 2248);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t0 + 2888);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t0 + 2408);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    xsi_vlogtype_concat(t4, 8, 8, 4U, t16, 1, t13, 4, t10, 1, t7, 2);
    t17 = ((char*)((ng1)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 8, t4, 8, t17, 8);
    t19 = (t0 + 3048);
    xsi_vlogvar_assign_value(t19, t18, 0, 0, 8);
    goto LAB2;

}

static void Always_55_3(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 5312);
    *((int *)t2) = 1;
    t3 = (t0 + 4744);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(56, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB10;

LAB9:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t4 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 2, 0LL);
    t12 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t12, t5, 2, 0, 1, 0LL);
    t13 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t13, t5, 3, 0, 4, 0LL);
    t14 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t14, t5, 7, 0, 1, 0LL);

LAB13:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB10:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB9;

LAB11:    xsi_set_current_line(56, ng0);
    t29 = ((char*)((ng2)));
    t30 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 2, 0LL);
    t31 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t31, t29, 2, 0, 1, 0LL);
    t32 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t32, t29, 3, 0, 4, 0LL);
    t33 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t33, t29, 7, 0, 1, 0LL);
    goto LAB13;

}

static void Always_61_4(char *t0)
{
    char t4[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    char *t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 4960U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5328);
    *((int *)t2) = 1;
    t3 = (t0 + 4992);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);
    t5 = (t0 + 2888);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t0 + 2408);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    xsi_vlogtype_concat(t4, 5, 5, 2U, t10, 1, t7, 4);

LAB5:    t11 = ((char*)((ng2)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t11, 5);
    if (t12 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng1)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng3)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng4)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng5)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng6)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng7)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng8)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng9)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng10)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng11)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng12)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng13)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng14)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng15)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng16)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng17)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng18)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng19)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng20)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng21)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng22)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng23)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng24)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB52;

LAB53:    t2 = ((char*)((ng25)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB54;

LAB55:    t2 = ((char*)((ng26)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng27)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB58;

LAB59:    t2 = ((char*)((ng28)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB60;

LAB61:    t2 = ((char*)((ng29)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB62;

LAB63:    t2 = ((char*)((ng30)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB64;

LAB65:    t2 = ((char*)((ng31)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB66;

LAB67:    t2 = ((char*)((ng32)));
    t12 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t12 == 1)
        goto LAB68;

LAB69:
LAB71:
LAB70:    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB72:    goto LAB2;

LAB6:    xsi_set_current_line(63, ng0);
    t13 = (t0 + 1368U);
    t14 = *((char **)t13);
    memset(t15, 0, 8);
    t13 = (t15 + 4);
    t16 = (t14 + 4);
    t17 = *((unsigned int *)t14);
    t18 = (t17 >> 15);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t16);
    t21 = (t20 >> 15);
    t22 = (t21 & 1);
    *((unsigned int *)t13) = t22;
    t23 = (t0 + 2568);
    xsi_vlogvar_assign_value(t23, t15, 0, 0, 1);
    goto LAB72;

LAB8:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 14);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 14);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB10:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 13);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 13);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB12:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 12);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 12);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB14:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 11);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 11);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB16:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 10);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 10);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB18:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 9);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 9);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB20:    xsi_set_current_line(70, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 8);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 8);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB22:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 7);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 7);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB24:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 6);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 6);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB26:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 5);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 5);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB28:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 4);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 4);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB30:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 3);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 3);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB32:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 2);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 2);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB34:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 1);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 1);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB36:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 0);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 0);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB38:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 15);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 15);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB40:    xsi_set_current_line(80, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 14);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 14);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB42:    xsi_set_current_line(81, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 13);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 13);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB44:    xsi_set_current_line(82, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 12);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 12);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB46:    xsi_set_current_line(83, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 11);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 11);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB48:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 10);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 10);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB50:    xsi_set_current_line(85, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 9);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 9);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB52:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 8);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 8);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB54:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 7);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 7);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB56:    xsi_set_current_line(88, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 6);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 6);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB58:    xsi_set_current_line(89, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 5);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 5);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB60:    xsi_set_current_line(90, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 4);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 4);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB62:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 3);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 3);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB64:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 2);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 2);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB66:    xsi_set_current_line(93, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 1);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 1);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

LAB68:    xsi_set_current_line(94, ng0);
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t15, 0, 8);
    t3 = (t15 + 4);
    t6 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 0);
    t19 = (t18 & 1);
    *((unsigned int *)t15) = t19;
    t20 = *((unsigned int *)t6);
    t21 = (t20 >> 0);
    t22 = (t21 & 1);
    *((unsigned int *)t3) = t22;
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t15, 0, 0, 1);
    goto LAB72;

}


extern void work_m_00000000003209680925_1009753269_init()
{
	static char *pe[] = {(void *)Cont_44_0,(void *)Cont_48_1,(void *)Always_52_2,(void *)Always_55_3,(void *)Always_61_4};
	xsi_register_didat("work_m_00000000003209680925_1009753269", "isim/test_speaker_isim_beh.exe.sim/work/m_00000000003209680925_1009753269.didat");
	xsi_register_executes(pe);
}
