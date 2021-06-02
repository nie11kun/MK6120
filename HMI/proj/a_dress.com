;***********************MASK3:修整参数_主界面:panel_3**********************
//M(Mask3/$85022//)

	DEF VAR5=(I/0,1000//$85340,$85340,,/WR2/"panel_3_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[26]"/330,60,110/440,60,60//"UserGuide/section_3.html","S3D7");粗修次数
	DEF VAR6=(R/0,0.5//$85308,$85308,,$85043/WR2/"panel_3_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[28]"/330,80,110/440,80,110//"UserGuide/section_3.html","S3D8");粗修量
	DEF VAR7=(R/0,1000//$85306,$85306,,$85045/WR2/"panel_3_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[30]"/330,100,110/440,100,110//"UserGuide/section_3.html","S3D9");粗修速度

	DEF VAR8=(I/0,1000//$85341,$85341,,/WR2/"panel_3_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[27]"/330,130,110/440,130,60//"UserGuide/section_3.html","S3D10");精修次数 ifIsNotHasWorm
	DEF VAR9=(R/0,0.5//$85309,$85309,,$85043/WR2/"panel_3_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[29]"/330,150,110/440,150,110//"UserGuide/section_3.html","S3D11");精修量
	DEF VAR10=(R/0,1000//$85307,$85307,,$85045/WR2/"panel_3_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[31]"/330,170,110/440,170,110//"UserGuide/section_3.html","S3D12");精修速度

	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR1/"panel_3_8_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS[2]"/330,200,110/440,200,110//"UserGuide/section_3.html","S3D15");砂轮线速度
	DEF VAR16=(I/0,//$85221,$85221,,$85044/WR1/"panel_3_15_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[37]"/330,220,110/440,220,110//"UserGuide/section_3.html","S3D19");修整时砂轮转速

	DEF MODEL_NAME=(S///$85464,$85464,,/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_EXTERNAL"/330,250,80/440,250,110/);存储齿形程序名
	DEF CIGAO=(R///$85602,$85602,,$85043/WR4//"/NC/_N_NC_GD2_ACX/LADAO[93]"/330,270,110/440,270,110//);修整齿形齿高
	DEF TAIDAO=(R///$85637,$85637,,$85043/WR4//"/NC/_N_NC_GD2_ACX/LADAO[17]"/330,290,110/440,290,110//);新砂轮抬刀高度

	DEF CIGAO_ROLL=(R///$85602,$85602,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[2]"/330,270,110/440,270,110//);修整齿形齿高

	;*******************************************

	DEF SHALUN_LEIXIN=(I/*0=$85368,1=$85369//$85367,$85367,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[39]"/10,10,110/110,10,60//);砂轮类型

	DEF VAR13=(R/0,1000//$85319,$85319,,$85043/WR2/"panel_3_7_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[24]"/10,40,110/110,40,110//"UserGuide/section_3.html","S3D14");新砂轮直径
	DEF VAR14=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[25]"/10,60,110/110,60,110/);砂轮当前直径
	DEF WHEEL_W_MIN=(R/0,1000//$85303,$85303,,$85043/WR2/"panel_3_10_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[36]"/10,80,130/110,80,110//"UserGuide/section_3.html","S3D5");外螺纹砂轮最小直径 ifIsExternal

	DEF VAR12=(R/0,200//$85316,$85316,,$85043/WR2/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[23]"/10,170,110/110,170,110//"UserGuide/section_3.html","S3D13");新砂轮厚度
	DEF HOUDU_CURR=(R///$85313,$85313,,$85043/WR1/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[113]"/10,190,110/110,190,110//"UserGuide/section_3.html","S3D13");当前砂轮厚度
	DEF HOUDU_MIN=(R///$85314,$85314,,$85043/WR2/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[114]"/10,210,110/110,210,110//"UserGuide/section_3.html","S3D13");最小砂轮厚度
	DEF HOUDU_DIA=(R///$85315,$85315,,$85043/WR2/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[115]"/10,230,110/110,230,110//"UserGuide/section_3.html","S3D13");砂轮直径

	;************************************************

	DEF VAR1=(I/*1=$85345,4=$85348//$85387,,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/335,10,60//"UserGuide/section_3.html","S3D2");Y_Z/Y  ifIsDressWare3
	DEF VAR4=(I/*0=$85327,1=$85328//$85350,,,/WR2/"panel_3_4_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[6]"/0,0,0/440,10,60//"UserGuide/section_3.html","S3D16");砂轮状态

	DEF N_CX_X_TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器在前 ifIsFrontDress
	DEF EXTERNAL_SHAPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/DRESSER[140]"/0,0,0/0,0,0/);使用外部齿形程序

	DEF VAR20=(S1////WR4//"/NC/_N_NC_GD2_ACX/AXIS_VER"/0,0,0/0,0,0/);垂直轴
	DEF VAR21=(S1////WR4//"/NC/_N_NC_GD2_ACX/AXIS_HORI"/0,0,0/0,0,0/);水平轴
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF VAR30_0=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[3]"/0,0,0/0,0,0);插补-直径方向-修整基准.Y
	DEF VAR30_1=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[128]"/0,0,0/0,0,0);插补-厚度方向-修整基准.Y
	DEF VAR30_2=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[129]"/0,0,0/0,0,0);成型-直径方向-修整基准.Y
	DEF VAR30_3=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[130]"/0,0,0/0,0,0);成型-厚度方向-修整基准.Y
	DEF VAR31=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/0,0,0/0,0,0/);NC用初始接触左
	DEF VAR41=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[11]"/0,0,0/0,0,0/);当前接触左
	DEF VAR33=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/0,0,0/0,0,0/);滚压轮初始接触位置
	DEF VAR34_0=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[1]"/0,0,0/0,0,0/);成型-修整轮直径
	DEF VAR34_1=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[127]"/0,0,0/0,0,0/);插补-修整轮直径
	
	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WHEEL_RUN_MODE=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[145]"/0,0,0/0,0,0/);砂轮是否恒转速(0否1是)

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85380,ac7,se2);"单滚轮" ifIsSingleAndRound
;
	VS2=($85379,ac7,se2);"滚压轮"
;

	LOAD
		call("UP3")
		IF WHEEL_RUN_MODE.VAL==0
			VAR15.WR=2
			VAR16.WR=1
		ELSE
			VAR15.WR=1
			VAR16.WR=2
		ENDIF
		;ifIsDressWare3Begin
		IF (VAR1.VAL<>1)AND(VAR1.VAL<>4)
			VAR1.VAL=1
		ENDIF
		;ifIsDressWare3End
	END_LOAD
	
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
		IF (VAR1.VAL==0) OR (VAR1.VAL==2);VW/V
			LM("MASK4","a_dressware.com")
		ELSE;XZ/X
			LM("MASK12","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS2)
		IF (VAR1.VAL==0) OR (VAR1.VAL==2);VW/V
			LM("MASK11","a_dressware.com")
		ELSE;XZ/X
			LM("MASK16","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","a_dressware.com")
	END_PRESS

	CHANGE(VAR1);Y_Z/Y
		IF VAR1.VAL==1
			VS1.SE=1
			VS2.SE=2
		ELSE
			VS1.SE=2
			VS2.SE=1
		ENDIF
		call("UP3")
		call("UP5")
		IF VAR1.VAL==1
			MODEL_NAME.WR=2
			CIGAO.WR=2
			TAIDAO.WR=2
			CIGAO_ROLL.WR=4
		ELSE
			MODEL_NAME.WR=4
			CIGAO.WR=4
			TAIDAO.WR=4
			CIGAO_ROLL.WR=2
		ENDIF
	END_CHANGE

	CHANGE(VAR13);新砂轮直径
		call("UP5")
		call("UP1")
	END_CHANGE

	CHANGE(VAR12);
		call("UP1")
		call("UP5")
	END_CHANGE

	CHANGE(VAR4);砂轮状态
		call("UP1")
	END_CHANGE

	CHANGE(VAR14);VAR14
		call("ROTATE_LINE")
	END_CHANGE

	CHANGE(HOUDU_CURR);VAR14
		call("ROTATE_LINE")
	END_CHANGE

	CHANGE(HOUDU_DIA);VAR14
		call("ROTATE_LINE")
	END_CHANGE
	
	CHANGE(VAR15)
		call("ROTATE_LINE")
	END_CHANGE
	
	CHANGE(VAR16)
		call("ROTATE_LINE")
	END_CHANGE
	
	CHANGE(WHEEL_RUN_MODE)
		IF WHEEL_RUN_MODE.VAL==0
			VAR15.WR=2
			VAR16.WR=1
		ELSE
			VAR15.WR=1
			VAR16.WR=2
		ENDIF
	END_CHANGE

	CHANGE(SHALUN_LEIXIN)
		call("UP1")
		call("UP5")
		call("ROTATE_LINE")
	END_CHANGE

	CHANGE(CIGAO_ROLL)
		call("UP5")
	END_CHANGE

	SUB(UP1)
		IF (VAR4.VAL==0);新砂轮
			IF SHALUN_LEIXIN.VAL==0
				VAR14.VAL=VAR13.VAL
			ELSE
				HOUDU_CURR.VAL=VAR12.VAL
			ENDIF
		ELSE
			IF VAR31.VAL>=VAR41.VAL;初始大于当前
				IF SHALUN_LEIXIN.VAL==0;
					VAR14.VAL=VAR13.VAL-(VAR31.VAL-VAR41.VAL)*2
				ELSE
					HOUDU_CURR.VAL=VAR12.VAL-(VAR31.VAL-VAR41.VAL)
				ENDIF
			ELSE
				IF SHALUN_LEIXIN.VAL==0
					VAR14.VAL=VAR13.VAL
				ELSE
					HOUDU_CURR.VAL=VAR12.VAL
				ENDIF
			ENDIF
		ENDIF
	END_SUB

	SUB(UP3)
		IF VAR1.VAL==0
			VAR20.VAL="V"
			VAR21.VAL="W"
		ELSE
			IF VAR1.VAL==1
				VAR20.VAL="Y"
				VAR21.VAL="Z"
			ELSE
				IF VAR1.VAL==2
					VAR20.VAL="V"
					VAR21.VAL=""
				ELSE
					IF VAR1.VAL==3
						VAR20.VAL="V"
						VAR21.VAL=""
					ELSE
						IF VAR1.VAL==4
							VAR20.VAL="Y"
							VAR21.VAL=""
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	END_SUB

	SUB(UP5)
		IF VAR1.VAL==4;成型Y
			IF SHALUN_LEIXIN.VAL==0
				VAR33.VAL=VAR30_2.VAL+VAR34_1.VAL/2+VAR13.VAL/2;初始接触位
			ELSE
				VAR33.VAL=VAR30_3.VAL+VAR34_1.VAL/2+VAR12.VAL;初始接触位
			ENDIF
			VAR31.VAL=VAR33.VAL-CIGAO_ROLL.VAL;NC用初始接触
		ELSE
			IF VAR1.VAL==1;YZ
				IF SHALUN_LEIXIN.VAL==0
					VAR31.VAL=VAR30_0.VAL+VAR34_0.VAL/2+VAR13.VAL/2;初始接触位
				ELSE
					VAR31.VAL=VAR30_1.VAL+VAR34_0.VAL/2+VAR12.VAL;初始接触位
				ENDIF
			ENDIF
		ENDIF
	END_SUB

	SUB(ROTATE_LINE)
		IF SHALUN_LEIXIN==0
			IF WHEEL_RUN_MODE.VAL==0
				VAR16.VAL=VAR15.VAL*60000/(PI*VAR14.VAL);修整时砂轮转速计算
			ELSE
				VAR15.VAL=VAR16.VAL*PI*VAR14.VAL/60000
			ENDIF
		ELSE
			IF WHEEL_RUN_MODE.VAL==0
				VAR16.VAL=VAR15.VAL*60000/(PI*HOUDU_DIA.VAL);修整时砂轮转速计算
			ELSE
				VAR15.VAL=VAR16.VAL*PI*HOUDU_DIA.VAL/60000
			ENDIF
		ENDIF
	END_SUB

//END

