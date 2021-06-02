;

;

;

;ifIsXZSRBegin
;**********************MASK12:修整参数_XZ单滚轮:panel_12:;**********************
//M(Mask12/$85380//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM
	DEF A_IM=(R///$85122,$85122,,/WR1//"$AA_IM[A]"/10,70,20/30,70,60/3);A_IM
	DEF B_IM=(R///$85121,$85121,,/WR1//"$AA_IM[B]"/10,90,20/30,90,60/3);B_IM

	DEF VAR12_0=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_12_7_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[3]"/130,10,110/240,10,110//"UserGuide/section_4.html","S4D12");修整基准.Y
	DEF VAR11_0=(R/-2000,2000//$85607,$85626,,$85043/WR2/"panel_12_1_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[22]"/130,30,110/240,30,110//"UserGuide/section_4.html","S4D13");修整基准.Z

	DEF X_DRESS_POS_0=(R///$85634,$85634,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[5]"/130,60,110/240,60,110//"UserGuide/section_4.html","S4D14");X轴修正位
	DEF A_DRESS_POS_0=(R///$85635,$85635,,$85042/WR2//"/NC/_N_NC_GD2_ACX/INI[154]"/130,80,110/240,80,110//"UserGuide/section_4.html","S4D14");A轴修正位
	DEF B_DRESS_POS_0=(R///$85636,$85636,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[7]"/130,100,110/240,100,110//"UserGuide/section_4.html","S4D14");B轴修正位

	DEF VAR12_1=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_12_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[128]"/330,10,110/440,10,110//"UserGuide/section_4.html","S4D12");修整基准.Y
	DEF VAR11_1=(R/-2000,2000//$85607,$85626,,$85043/WR2/"panel_12_1_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[124]"/330,30,110/440,30,110//"UserGuide/section_4.html","S4D13");修整基准.Z

	DEF X_DRESS_POS_1=(R///$85634,$85634,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[122]"/330,60,110/440,60,110//"UserGuide/section_4.html","S4D14");X轴修正位
	DEF A_DRESS_POS_1=(R///$85635,$85635,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[116]"/330,80,110/440,80,110//"UserGuide/section_4.html","S4D14");A轴修正位
	DEF B_DRESS_POS_1=(R///$85636,$85636,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[117]"/330,100,110/440,100,110//"UserGuide/section_4.html","S4D14");B轴修正位

	DEF VAR1=(R/0,10//$85612,$85612,,$85043/WR2/"panel_12_2_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[5]"/330,130,110/440,130,110//"UserGuide/section_4.html","S4D1");圆弧半径
	DEF VAR3=(R///$85627,$85627,,$85043/WR1/"panel_12_3_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,150,110/440,150,110//"UserGuide/section_4.html","S4D14");初始接触位置
	DEF VAR5=(R///$85628,$85628,,$85043/WR2/"panel_12_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,170,110/440,170,110//"UserGuide/section_4.html","S4D15");当前接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_12_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,200,110/440,200,110//"UserGuide/section_4.html","S4D4");修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_12_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,220,110/440,220,110//"UserGuide/section_4.html","S4D5");修整轮线速度
	DEF DWHEEL_RPM=(I/0,//$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,240,110/440,240,110/);修整轮转速

	DEF SHALUN_LEIXIN=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[39]"/0,0,0/0,0,0/);砂轮类型
	DEF NEW_DIA=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径
	DEF NEW_HOUDU=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[23]"/0,0,0/0,0,0/);新砂轮厚度

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
	HS5=(["\\S_003.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

;
;
	VS1=($85380,ac7,se3);"单滚轮" ifIsSingleAndRound
;
	VS2=($85379,ac7,se2);"滚压轮"
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
		LM("MASK1","a_grind_pos.com")
	END_PRESS
	
	PRESS(HS6)
		LM("MASK1","a_auto_pos.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK23","a_centermain.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS1)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","a_dressware.com")
		ELSE;XZ/X
			LM("MASK12","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS2)
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

	CHANGE(VAR12_0)
		call("UP3")
	END_CHANGE

	CHANGE(VAR12_1)
		call("UP3")
	END_CHANGE

	CHANGE(VAR7);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
		call("UP3")
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE

	SUB(UP3)
		IF SHALUN_LEIXIN.VAL==0
			VAR3.VAL=VAR12_0.VAL+VAR7.VAL/2+NEW_DIA.VAL/2;初始接触
		ELSE
			VAR3.VAL=VAR12_1.VAL+VAR7.VAL/2+NEW_HOUDU.VAL;初始接触
		ENDIF
	END_SUB

//END

;ifIsXWaiBegin
;**********************MASK16:修整参数_滚压轮X_外:panel_16:;**********************
//M(Mask16/$85379//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM
	DEF A_IM=(R///$85122,$85122,,/WR1//"$AA_IM[A]"/10,70,20/30,70,60/3);A_IM
	DEF B_IM=(R///$85121,$85121,,/WR1//"$AA_IM[B]"/10,90,20/30,90,60/3);B_IM

	DEF VAR0_0=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_16_2_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[129]"/125,10,110/240,10,110//"UserGuide/section_4.html","S4D12");修整基准.Y
	DEF VAR12_0=(R/-2000,2000//$85626,$85626,,$85043/WR2/"panel_16_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[125]"/125,30,110/240,30,110//"UserGuide/section_4.html","S4D13");修整基准.Z

	DEF X_DRESS_POS_0=(R///$85634,$85634,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[98]"/130,60,110/240,60,110//"UserGuide/section_4.html","S4D14");X轴修正位
	DEF A_DRESS_POS_0=(R///$85635,$85635,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[118]"/130,80,110/240,80,110//"UserGuide/section_4.html","S4D14");A轴修正位
	DEF B_DRESS_POS_0=(R///$85636,$85636,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[119]"/130,100,110/240,100,110//"UserGuide/section_4.html","S4D14");B轴修正位

	DEF VAR0_1=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_16_2_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[130]"/325,10,110/440,10,110//"UserGuide/section_4.html","S4D12");修整基准.Y
	DEF VAR12_1=(R/-2000,2000//$85626,$85626,,$85043/WR2/"panel_16_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[126]"/325,30,110/440,30,110//"UserGuide/section_4.html","S4D13");修整基准.Z

	DEF X_DRESS_POS_1=(R///$85634,$85634,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[123]"/330,60,110/440,60,110//"UserGuide/section_4.html","S4D14");X轴修正位
	DEF A_DRESS_POS_1=(R///$85635,$85635,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[120]"/330,80,110/440,80,110//"UserGuide/section_4.html","S4D14");A轴修正位
	DEF B_DRESS_POS_1=(R///$85636,$85636,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[121]"/330,100,110/440,100,110//"UserGuide/section_4.html","S4D14");B轴修正位

	DEF VAR11=(R/0,80//$85604,$85604,,$85047/WR2/"panel_16_1_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[19]"/325,130,110/440,130,110//"UserGuide/section_4.html","S4D10");滚压轮停留时间
	
	DEF VAR1=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/0,0,0/0,0,0/);NC用初始接触
	DEF VAR3=(R///$85627,$85627,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/325,160,110/440,160,110//"UserGuide/section_4.html","S4D14");初始接触位置
	DEF VAR5=(R///$85628,$85628,,$85043/WR2/"panel_16_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/325,180,110/440,180,110//"UserGuide/section_4.html","S4D15");当前接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_16_5_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[127]"/325,210,110/440,210,110//"UserGuide/section_4.html","S4D4");修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_16_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/325,230,110/440,230,110//"UserGuide/section_4.html","S4D5");修整轮线速度
	DEF VAR9=(I/0,//$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/325,250,110/440,250,110/);修整轮转速

	DEF VAR2=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[2]"/0,0,0/0,0,0/);齿高
	DEF SHALUN_LEIXIN=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[39]"/0,0,0/0,0,0/);砂轮类型
	DEF NEW_DIA=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径
	DEF NEW_HOUDU=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[23]"/0,0,0/0,0,0/);新砂轮厚度

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
	HS5=(["\\S_003.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

;
;
	VS1=($85380,ac7,se2);"单滚轮" ifIsSingleAndRound
;
	VS2=($85379,ac7,se3);"滚压轮"
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
		LM("MASK1","a_grind_pos.com")
	END_PRESS
	
	PRESS(HS6)
		LM("MASK1","a_auto_pos.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK23","a_centermain.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS1)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","a_dressware.com")
		ELSE;XZ/X
			LM("MASK12","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS2)
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

	CHANGE(VAR0_0);修整基准.Y
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR0_1);修整基准.Y
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR2);齿高
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR7);修整轮直径
		CALL("UP1")
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(VAR8)
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	SUB(UP1)
		IF SHALUN_LEIXIN.VAL==0
			VAR3.VAL=VAR0_0.VAL+VAR7.VAL/2+NEW_DIA.VAL/2;初始接触
		ELSE
			VAR3.VAL=VAR0_1.VAL+VAR7.VAL/2+NEW_HOUDU.VAL;初始接触
		ENDIF
		VAR1.VAL=VAR3.VAL-VAR2.VAL;NC用初始接触
	END_SUB

//END
;ifIsXWaiEnd

;

;

;

