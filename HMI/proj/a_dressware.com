;

;

;

;ifIsXZSRBegin
;**********************MASK12:修整参数_XZ单滚轮:panel_12:;**********************
//M(Mask12/$85380/"panel_12_1_chs.png"/)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM

	DEF VAR12=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_12_7_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[3]"/330,20,110/440,20,110//"UserGuide/section_4.html","S4D12");回零时砂轮与修整轮中间距
	DEF para_switch2=(I/*0=$85015,1=$85016//$85063,$85063,,/WR2/"panel_12_7_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[11]"/0,0,0/530,20,18/);参数锁定开关

	DEF VAR11=(R/-2000,2000//$85607,$85626,,$85043/WR2/"panel_12_1_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,40,110/440,40,110//"UserGuide/section_4.html","S4D13");砂轮修整轮中心
	DEF para_switch=(I/*0=$85015,1=$85016//$85063,$85063,,/WR2/"panel_12_1_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[4]"/0,0,0/530,40,18/);参数锁定开关

	DEF CIGAO=(R///$85602,$85602,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[93]"/330,60,110/440,60,110//);修整齿形齿高

	DEF X_DRESS_POS=(R///$85634,$85634,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[5]"/330,80,110/440,80,110//"UserGuide/section_4.html","S4D14");X轴修正位
	DEF A_DRESS_POS=(R///$85635,$85635,,$85042/WR2//"/NC/_N_NC_GD2_ACX/INI[154]"/330,100,110/440,100,110//"UserGuide/section_4.html","S4D14");A轴修正位
	DEF B_DRESS_POS=(R///$85636,$85636,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[7]"/330,120,110/440,120,110//"UserGuide/section_4.html","S4D14");B轴修正位

	DEF PIANZHUAN=(R/0,90//$85477,$85477,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[8]"/330,150,120/440,150,110/);修整齿形偏转角度

	DEF VAR0=(R/0,300//$85614,$85614,,$85043/WR4//""/0,0,0/0,0,0/);滚轮间距

	DEF VAR1=(R/0,10//$85612,$85612,,$85043/WR2/"panel_12_2_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[5]"/330,180,110/440,180,110//"UserGuide/section_4.html","S4D1");圆弧半径
	DEF VAR2=(R/0,10//$85611,$85611,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[6]"/0,0,0/0,0,0/);右圆弧半径

	DEF VAR3=(R///$85627,$85627,,$85043/WR1/"panel_12_3_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,210,110/440,210,110//"UserGuide/section_4.html","S4D14");初始接触位置
	DEF VAR4=(R///$85630,$85630,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[14]"/0,0,0/0,0,0/);初始右端接触位置

	DEF VAR5=(R///$85628,$85628,,$85043/WR2/"panel_12_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,230,110/440,230,110//"UserGuide/section_4.html","S4D15");当前接触位置
	DEF VAR6=(R///$85632,$85632,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[12]"/0,0,0/0,0,0/);当前右端接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_12_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,260,110/440,260,110//"UserGuide/section_4.html","S4D4");修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_12_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,280,110/440,280,110//"UserGuide/section_4.html","S4D5");修整轮线速度
	
	DEF DWHEEL_RPM=(I/0,//$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,300,110/440,300,110/);修整轮转速

	DEF VAR10=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器
	DEF N_CX_X_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器前后
	DEF cixindiaoyong=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[115]"/0,0,0/0,0,0/);调用默认齿形程序0/通用齿形程序1

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

;
;
	;VS1=($85390,ac7,se1);"齿形一" ifIsArc
	;VS2=($85391,ac7,se1);"齿形二" ifIsArc
	;VS3=($85392,ac7,se1);"齿形二" ifIsArc
	;VS4=($85393,ac7,se1);"齿形二" ifIsArc

	VS5=($85380,ac7,se3);"单滚轮" ifIsSingleAndRound
;
	VS7=($85379,ac7,se2);"滚压轮"
;

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK51","a_grind.com")
		ELSE
			LM("MASK18","a_grind.com")
		ENDIF
	END_PRESS

	PRESS(HS2)
		LM("MASK2","a_process.com")
	END_PRESS

	PRESS(HS3)
		LM("MASK3","a_dress.com")
	END_PRESS

	PRESS(HS4)
		LM("MASK21","a_auto.com")
	END_PRESS

	PRESS(HS5)
		LM("MASK31","a_centerwaiyuan.com")
	END_PRESS
	
	PRESS(HS6)
		LM("MASK32","a_centerduanmian.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK23","a_centermain.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS1)
		LM("MASK1","a_shapecommon.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_shapecommon.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_shapecommon.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK4","a_shapecommon.com")
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","a_dressware.com")
		ELSE;XZ/X
			LM("MASK12","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","a_dressware.com")
		ELSE;XZ/X
			LM("MASK14","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","a_dressware.com")
		ELSE;XZ/X
			IF TYPE.VAL==0;WAI
				LM("MASK16","a_dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","a_dressware.com")
				ELSE
					LM("MASK19","a_dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","a_dressware.com")
	END_PRESS

	CHANGE(VAR1)
		VAR2.VAL=VAR1.VAL
	END_CHANGE

	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL
	END_CHANGE

	CHANGE(VAR5)
		VAR6.VAL=VAR5.VAL
	END_CHANGE

	CHANGE(VAR12)
		call("UP3")
	END_CHANGE

	CHANGE(VAR7);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
		call("UP3")
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(para_switch)
		call("UP1")
	END_CHANGE

	CHANGE(para_switch2)
		call("UP2")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR1.WR=1
			VAR3.WR=1
			VAR5.WR=1
			VAR7.WR=1
			VAR11.WR=1
			VAR12.WR=1
			para_switch.WR=1
			para_switch2.WR=1
		ELSE
			VAR1.WR=2
			VAR3.WR=1
			VAR5.WR=2
			VAR7.WR=2
			para_switch.WR=2
			para_switch2.WR=2
			CALL("UP1")
			CALL("UP2")
		ENDIF
	END_CHANGE

	SUB(UP1)
		IF para_switch.VAL==0
			VAR11.WR=2
		ELSE
			VAR11.WR=1
		ENDIF
	END_SUB

	SUB(UP2)
		IF para_switch2.VAL==0
			VAR12.WR=2
		ELSE
			VAR12.WR=1
		ENDIF
	END_SUB

	SUB(UP3)
		IF TYPE.VAL<>1;不是内螺纹
			VAR3.VAL=-(VAR12.VAL-VAR7.VAL/2-VAR10.VAL/2);初始接触
		ELSE
			VAR3.VAL=-(VAR12.VAL+VAR7.VAL/2+VAR10.VAL/2);初始接触位
		ENDIF
		VAR4.VAL=VAR3.VAL
	END_SUB

//END

;ifIsXWaiBegin
;**********************MASK16:修整参数_滚压轮X_外:panel_16:;**********************
//M(Mask16/$85379/"panel_16_1_chs.png"/)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM

	DEF VAR0=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_16_2_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[3]"/325,10,110/440,10,110//"UserGuide/section_4.html","S4D12");回零时两轮中间距
	DEF para_switch=(I/*0=$85015,1=$85016//$85063,$85063,,/WR2/"panel_16_2_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[6]"/0,0,0/530,10,18/);参数锁定开关

	DEF VAR12=(R/-2000,2000//$85626,$85626,,$85043/WR2/"panel_16_7_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[22]"/325,30,110/440,30,110//"UserGuide/section_4.html","S4D13");砂轮修整轮中心

	DEF X_DRESS_POS=(R///$85634,$85634,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[98]"/330,70,110/440,70,110//"UserGuide/section_4.html","S4D14");X轴修正位
	DEF A_DRESS_POS=(R///$85635,$85635,,$85042/WR2//"/NC/_N_NC_GD2_ACX/INI[154]"/330,90,110/440,90,110//"UserGuide/section_4.html","S4D14");A轴修正位
	DEF B_DRESS_POS=(R///$85636,$85636,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[7]"/330,110,110/440,110,110//"UserGuide/section_4.html","S4D14");B轴修正位

	DEF PIANZHUAN=(R/0,90//$85477,$85477,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[15]"/330,140,120/440,140,110/);修整齿形偏转角度

	DEF VAR11=(R/0,80//$85604,$85604,,$85047/WR2/"panel_16_1_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[19]"/325,170,110/440,170,110//"UserGuide/section_4.html","S4D10");滚压轮停留时间
	
	DEF VAR2=(R/0,50//$85602,$85602,,$85043/WR2/"panel_16_3_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[2]"/325,200,110/440,200,110//"UserGuide/section_4.html","S4D11");齿高
	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_16_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/325,220,110/440,220,110//"UserGuide/section_4.html","S4D4");修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_16_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/325,240,110/440,240,110//"UserGuide/section_4.html","S4D5");修整轮线速度
	DEF VAR9=(I/0,//$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/325,260,110/440,260,110/);修整轮转速

	DEF VAR1=(R///$85633,$85633,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/325,290,110/440,290,110/);NC用初始接触
	DEF VAR3=(R///$85627,$85627,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/325,310,110/440,310,110//"UserGuide/section_4.html","S4D14");初始接触位置
	DEF VAR5=(R///$85628,$85628,,$85043/WR2/"panel_16_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/325,330,110/440,330,110//"UserGuide/section_4.html","S4D15");当前接触位置

	DEF VAR10=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器
	DEF N_CX_X_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器前后
	DEF cixindiaoyong=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[115]"/0,0,0/0,0,0/);调用默认齿形程序0/通用齿形程序1

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

;
;
	;VS1=($85390,ac7,se2);"齿形一" ifIsArc
	;VS2=($85391,ac7,se2);"齿形二" ifIsArc
	;VS3=($85392,ac7,se2);"齿形二" ifIsArc
	;VS4=($85393,ac7,se2);"齿形二" ifIsArc

	VS5=($85380,ac7,se2);"单滚轮" ifIsSingleAndRound
;
	VS7=($85379,ac7,se3);"滚压轮"
;

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK51","a_grind.com")
		ELSE
			LM("MASK18","a_grind.com")
		ENDIF
	END_PRESS

	PRESS(HS2)
		LM("MASK2","a_process.com")
	END_PRESS

	PRESS(HS3)
		LM("MASK3","a_dress.com")
	END_PRESS

	PRESS(HS4)
		LM("MASK21","a_auto.com")
	END_PRESS

	PRESS(HS5)
		LM("MASK31","a_centerwaiyuan.com")
	END_PRESS
	
	PRESS(HS6)
		LM("MASK32","a_centerduanmian.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK23","a_centermain.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS1)
		LM("MASK1","a_shapecommon.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_shapecommon.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_shapecommon.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK4","a_shapecommon.com")
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","a_dressware.com")
		ELSE;XZ/X
			LM("MASK12","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","a_dressware.com")
		ELSE;XZ/X
			LM("MASK14","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","a_dressware.com")
		ELSE;XZ/X
			IF TYPE.VAL==0;WAI
				LM("MASK16","a_dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","a_dressware.com")
				ELSE
					LM("MASK19","a_dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","a_dressware.com")
	END_PRESS

	CHANGE(VAR0)
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR2)
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR7)
		CALL("UP1")
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(VAR8)
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE
	
	CHANGE(para_switch)
		CALL("UP3")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR2.WR=1
			VAR7.WR=1
			VAR12.WR=1
			VAR20.WR=1
			VAR21.WR=1
			para_switch.WR=1
		ELSE
			VAR2.WR=2
			VAR7.WR=2
			VAR12.WR=2
			VAR20.WR=2
			VAR21.WR=2
			para_switch.WR=2
			CALL("UP3")
		ENDIF
	END_CHANGE

	SUB(UP1)
		VAR3.VAL=-(VAR0.VAL-VAR7.VAL/2-VAR10.VAL/2);初始接触
		VAR1.VAL=VAR3.VAL-VAR2.VAL;NC用初始接触
	END_SUB

	SUB(UP3)
		IF para_switch.VAL==0
			VAR0.WR=2
		ELSE
			VAR0.WR=1
		ENDIF
	END_SUB

//END
;ifIsXWaiEnd

;

;

;

