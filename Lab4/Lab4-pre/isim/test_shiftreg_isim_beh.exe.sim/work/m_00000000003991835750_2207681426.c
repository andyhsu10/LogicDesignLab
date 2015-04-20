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
static const char *ng0 = "D:/OneDrive/LogicDesignLab/Lab4/Lab4-pre/shifter.v";
static unsigned int ng1[] = {85U, 0U};
static int ng2[] = {1, 0};
static int ng3[] = {7, 0};
static int ng4[] = {6, 0};
static int ng5[] = {5, 0};
static int ng6[] = {4, 0};
static int ng7[] = {3, 0};
static int ng8[] = {2, 0};
static int ng9[] = {0, 0};



static void Always_34_0(char *t0)
{
    char t4[8];
    char t31[8];
    char t39[8];
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
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned int t45;
    int t46;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);
    t5 = (t0 + 1528U);
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

LAB12:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t15 = (t10 ^ t11);
    t16 = (t9 | t15);
    t17 = *((unsigned int *)t5);
    t18 = *((unsigned int *)t6);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB17;

LAB14:    if (t19 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t4) = 1;

LAB17:    t13 = (t4 + 4);
    t22 = *((unsigned int *)t13);
    t24 = (~(t22));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(49, ng0);

LAB38:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 1928);
    t5 = (t0 + 1928);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t4, t12, 2, t13, 32, 1);
    t14 = (t4 + 4);
    t7 = *((unsigned int *)t14);
    t46 = (!(t7));
    if (t46 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 7);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 7);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB41;

LAB42:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 6);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 6);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB43;

LAB44:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 5);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 5);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB45;

LAB46:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 4);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 4);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB47;

LAB48:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 3);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 3);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB49;

LAB50:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 2);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 2);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB51;

LAB52:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 1);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 1);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng9)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB53;

LAB54:
LAB20:
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

LAB11:    xsi_set_current_line(36, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 8, 0LL);
    goto LAB13;

LAB16:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(38, ng0);

LAB21:    xsi_set_current_line(39, ng0);
    t14 = (t0 + 1928);
    t23 = (t14 + 56U);
    t29 = *((char **)t23);
    memset(t31, 0, 8);
    t30 = (t31 + 4);
    t32 = (t29 + 4);
    t28 = *((unsigned int *)t29);
    t33 = (t28 >> 0);
    t34 = (t33 & 1);
    *((unsigned int *)t31) = t34;
    t35 = *((unsigned int *)t32);
    t36 = (t35 >> 0);
    t37 = (t36 & 1);
    *((unsigned int *)t30) = t37;
    t38 = (t0 + 1928);
    t40 = (t0 + 1928);
    t41 = (t40 + 72U);
    t42 = *((char **)t41);
    t43 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t39, t42, 2, t43, 32, 1);
    t44 = (t39 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (!(t45));
    if (t46 == 1)
        goto LAB22;

LAB23:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 7);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 7);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB24;

LAB25:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 6);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 6);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB26;

LAB27:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 5);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 5);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB28;

LAB29:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 4);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 4);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB30;

LAB31:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 3);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 3);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB32;

LAB33:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 2);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 2);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB34;

LAB35:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 1);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 1);
    t15 = (t11 & 1);
    *((unsigned int *)t6) = t15;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t23 = (t14 + 72U);
    t29 = *((char **)t23);
    t30 = ((char*)((ng9)));
    xsi_vlog_generic_convert_bit_index(t31, t29, 2, t30, 32, 1);
    t32 = (t31 + 4);
    t16 = *((unsigned int *)t32);
    t46 = (!(t16));
    if (t46 == 1)
        goto LAB36;

LAB37:    goto LAB20;

LAB22:    xsi_vlogvar_wait_assign_value(t38, t31, 0, *((unsigned int *)t39), 1, 0LL);
    goto LAB23;

LAB24:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB25;

LAB26:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB27;

LAB28:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB29;

LAB30:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB31;

LAB32:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB33;

LAB34:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB35;

LAB36:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB37;

LAB39:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB40;

LAB41:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB42;

LAB43:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB44;

LAB45:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB46;

LAB47:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB48;

LAB49:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB50;

LAB51:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB52;

LAB53:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t31), 1, 0LL);
    goto LAB54;

}


extern void work_m_00000000003991835750_2207681426_init()
{
	static char *pe[] = {(void *)Always_34_0};
	xsi_register_didat("work_m_00000000003991835750_2207681426", "isim/test_shiftreg_isim_beh.exe.sim/work/m_00000000003991835750_2207681426.didat");
	xsi_register_executes(pe);
}
