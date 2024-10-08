;***********************MASK3:修整参数_主界面:panel_3**********************
//M(Mask3/$85022//)

	DEF VAR5=(I/0,1000//$85340,$85340,,/WR2/"panel_3_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[26]"/330,40,110/440,40,60//"UserGuide/section_30.html","S30D01");粗修次数
	DEF VAR6=(R/0,0.5//$85308,$85308,,$85043/WR2/"panel_3_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[28]"/330,60,110/440,60,110//"UserGuide/section_30.html","S30D02");粗修量
	DEF VAR7=(R/0,1000//$85306,$85306,,$85045/WR2/"panel_3_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[30]"/330,80,110/440,80,110//"UserGuide/section_30.html","S30D03");粗修速度

	DEF VAR8=(I/0,1000//$85341,$85341,,/WR2/"panel_3_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[27]"/330,110,110/440,110,60/,"#d3e8ff"/"UserGuide/section_30.html","S30D04");精修次数 ifIsNotHasWorm
	DEF VAR9=(R/0,0.5//$85309,$85309,,$85043/WR2/"panel_3_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[29]"/330,130,110/440,130,110/,"#d3e8ff"/"UserGuide/section_30.html","S30D05");精修量
	DEF VAR10=(R/0,1000//$85307,$85307,,$85045/WR2/"panel_3_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[31]"/330,150,110/440,150,110/,"#d3e8ff"/"UserGuide/section_30.html","S30D06");精修速度

	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR1/"panel_3_8_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS[2]"/330,180,110/440,180,110//"UserGuide/section_30.html","S30D07");砂轮线速度
	DEF VAR16=(I/0,//$85221,$85221,,$85044/WR1/"panel_3_15_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[37]"/330,200,110/440,200,110//"UserGuide/section_30.html","S30D08");修整时砂轮转速

	DEF STORE_AREA=(I/*0=$85322,1=$85323,2=$85324,3=$85326/0/$85321,$85321,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[157]"/330,230,110/440,230,60/,"#fff4f1"/"UserGuide/section_30.html","S30D09");齿形程序存储位置
	DEF MODEL_DIR=(S///$85456,$85456,,/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_DIR"/330,250,80/440,250,110/,"#fff4f1"/"UserGuide/section_30.html","S30D10");外部齿形文件夹名称
	DEF MODEL_NAME=(S///$85464,$85464,,/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_EXTERNAL"/330,270,80/440,270,110/,"#fff4f1"/"UserGuide/section_30.html","S30D11");存储齿形程序名
	DEF CIGAO=(R///$85602,$85602,,$85043/WR4//"/NC/_N_NC_GD2_ACX/LADAO[93]"/330,290,110/440,290,110/,"#fff4f1"/"UserGuide/section_30.html","S30D12");修整齿形齿高
	DEF TAIDAO=(R///$85637,$85637,,$85043/WR4//"/NC/_N_NC_GD2_ACX/LADAO[17]"/330,310,110/440,310,110/,"#fff4f1"/"UserGuide/section_30.html","S30D13");新砂轮抬刀高度

	DEF CIGAO_ROLL=(R///$85602,$85602,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[2]"/330,230,110/440,230,110/,"#fff4f1"/"UserGuide/section_30.html","S30D14");修整齿形齿高

	DEF SAFE_Z=(R//0/$85370,$85370,,$85043/WR4//"/NC/_N_NC_GD2_ACX/LADAO[185]"/330,350,110/440,350,110//);修整安全距离.Z

	DEF GRIND_CHOICE=(I/*0=$85078,1=$85077,2=$85079,3=$85081,4=$85080,5=$85086,6=$85092,7=$85093//$85131,$85131,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[38]"/0,0,0/250,230,70/,"#ffc5c5"/"UserGuide/section_30.html","S30D15");加工选择(0前刃、1齿形平磨，2齿顶后刃，3齿侧后刃)

	;*******************************************

	DEF SHALUN_LEIXIN=(I/*0=$85368,1=$85369//$85367,$85367,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[39]"/10,10,110/130,10,70/,"#ffc5c5"/"UserGuide/section_30.html","S30D16");砂轮类型

	DEF ZHIJIN_MSG=(R///$85329,$85329,,/WR4///10,40,200/0,0,0//);
	DEF VAR13=(R/0,1000//$85319,$85319,,$85043/WR4/"panel_3_7_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[24]"/10,60,110/130,60,110//"UserGuide/section_30.html","S30D17");新砂轮直径
	DEF VAR14=(R/0,1000//$85320,$85320,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[25]"/10,80,110/130,80,110/);砂轮当前直径
	DEF WHEEL_W_MIN=(R/0,1000//$85303,$85303,,$85043/WR4/"panel_3_10_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[36]"/10,100,130/130,100,110//"UserGuide/section_30.html","S30D18");外螺纹砂轮最小直径 ifIsExternal
	DEF WHEEL_RAD=(R/0,//$85331,$85331,,$85043/WR4//"/NC/_N_NC_GD2_ACX/LADAO[277]"/10,120,130/130,120,110//);直径方向-齿顶圆弧半径 - 圆拉刀前角加工A角度计算用

	DEF HOUDU_MSG=(R///$85330,$85330,,/WR4///10,40,200/0,0,0//);
	DEF VAR12=(R/0,200//$85316,$85316,,$85043/WR4/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[23]"/10,60,110/130,60,110//"UserGuide/section_30.html","S30D19");新砂轮厚度
	DEF HOUDU_CURR=(R///$85313,$85313,,$85043/WR4/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[113]"/10,80,110/130,80,110//"UserGuide/section_30.html","S30D20");当前砂轮厚度
	DEF HOUDU_MIN=(R///$85314,$85314,,$85043/WR4/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[114]"/10,100,110/130,100,110//"UserGuide/section_30.html","S30D21");最小砂轮厚度
	DEF HOUDU_DIA=(R///$85315,$85315,,$85043/WR4/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[115]"/10,120,110/130,120,110//"UserGuide/section_30.html","S30D22");基准砂轮直径
	DEF HOUDU_ZUIDU=(R///$85325,$85325,,$85042/WR4/"panel_3_9_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[178]"/10,140,110/130,140,110//"UserGuide/section_30.html","S30D23");砂轮锥度角
	DEF HOUDU_CURR_DIA=(R///$86010,$86010,,$85043/WR4//"/NC/_N_NC_GD2_ACX/PROCESS[22]"/10,160,110/130,160,110/"#de8d77");厚度方向-当前砂轮直径

	;************************************************

	DEF VAR1=(I/*1=$85345,4=$85348,6=$85371//$85387,,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/335,10,60/,"#ffc5c5"/"UserGuide/section_30.html","S30D24");Y_Z/Y  ifIsDressWare3
	DEF VAR4=(I/*0=$85327,1=$85328//$85350,,,/WR2/"panel_3_4_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[6]"/0,0,0/440,10,60/,"#ffc5c5"/"UserGuide/section_30.html","S30D25");砂轮状态

	DEF N_CX_X_TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器在前 ifIsFrontDress
	DEF EXTERNAL_SHAPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/DRESSER[140]"/0,0,0/0,0,0/);使用外部齿形程序

	DEF VAR20=(S1////WR4//"/NC/_N_NC_GD2_ACX/AXIS_VER"/0,0,0/0,0,0/);垂直轴
	DEF VAR21=(S1////WR4//"/NC/_N_NC_GD2_ACX/AXIS_HORI"/0,0,0/0,0,0/);水平轴
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF VAR30_0=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[3]"/0,0,0/0,0,0);插补-直径方向-修整基准.Y
	DEF VAR30_1=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[128]"/0,0,0/0,0,0);插补-厚度方向-修整基准.Y
	DEF VAR30_2=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[129]"/0,0,0/0,0,0);成型-直径方向-修整基准.Y
	DEF VAR30_3=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[130]"/0,0,0/0,0,0);成型-厚度方向-修整基准.Y
	DEF VAR30_4=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[222]"/0,0,0/0,0,0);金刚笔-直径方向-修整基准.Y
	DEF VAR30_5=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[227]"/0,0,0/0,0,0);金刚笔-厚度方向-修整基准.Y
	DEF VAR31=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/0,0,0/0,0,0/);NC用初始接触左
	DEF VAR41=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[11]"/0,0,0/0,0,0/);当前接触左
	DEF VAR33=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/0,0,0/0,0,0/);滚压轮初始接触位置
	DEF VAR34_0=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[1]"/0,0,0/0,0,0/);成型-修整轮直径
	DEF VAR34_1=(R////WR4//"/NC/_N_NC_GD2_ACX/LADAO[127]"/0,0,0/0,0,0/);插补-修整轮直径
	
	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WHEEL_RUN_MODE=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[145]"/0,0,0/0,0,0/);砂轮是否恒转速(0否1是)

	DEF LADAO_CHOICE=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[220]"/0,0,0/0,0,0/);拉刀类型(0平面拉刀/1圆拉刀)
	DEF LOAD_YUANLADAO=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[257]"/0,0,0/0,0,0);是否有圆拉刀

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto
	HS5=(["\\S_008.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_007.png",$85085],ac7,se1,pa0);
	HS7=(["\\S_009.png",$85099],ac7,se1,pa0);磨削基准

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85345,ac7,se2);"单滚轮" ifIsSingleAndRound
;
	VS2=($85348,ac7,se2);"滚压轮"
	VS3=($85371,ac7,se2);"金刚笔"
	VS5=($85037,ac7,se1);"历史记录"
;

	LOAD
		LINE(325,225,325,330,"#ff0000",1);实线
		LINE(325,225,345,225,"#ff0000",1);实线
		LINE(325,330,345,330,"#ff0000",1);实线

		call("UP3")
		IF WHEEL_RUN_MODE.VAL==0
			VAR15.WR=2
			VAR16.WR=1
		ELSE
			VAR15.WR=1
			VAR16.WR=2
		ENDIF
		;ifIsDressWare3Begin
		IF (VAR1.VAL<>1)AND(VAR1.VAL<>4)AND(VAR1.VAL<>6)
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
		LM("MASK1","a_process.com")
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
		LM("MASK0","a_data.com")
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

	PRESS(VS3)
		LM("MASK20","a_dressware.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK1","a_dress_data.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK15","a_dressware.com")
	END_PRESS

	CHANGE(VAR1);Y_Z/Y
		IF VAR1.VAL==1
			VS1.SE=1
			VS2.SE=2
			VS3.SE=2
		ELSE
			IF VAR1.VAL==4
				VS1.SE=2
				VS2.SE=1
				VS3.SE=2
			ELSE
				VS1.SE=2
				VS2.SE=2
				VS3.SE=1
			ENDIF
		ENDIF
		call("UP3")
		call("UP5")
		IF (VAR1.VAL==1)OR(VAR1.VAL==6)
			STORE_AREA.WR=1
			MODEL_DIR.WR=2
			MODEL_NAME.WR=2
			CIGAO.WR=2
			TAIDAO.WR=2
			CIGAO_ROLL.WR=4
		ELSE
			STORE_AREA.WR=4
			MODEL_DIR.WR=4
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
		call("UP5")
		call("UP1")
	END_CHANGE

	CHANGE(VAR4);砂轮状态
		call("UP1")
	END_CHANGE

	CHANGE(VAR14);VAR14
		call("ROTATE_LINE")
	END_CHANGE

	CHANGE(HOUDU_CURR);VAR14
		call("ROTATE_LINE")
		call("UP2")
	END_CHANGE

	CHANGE(HOUDU_DIA);VAR14
		call("ROTATE_LINE")
		call("UP2")
	END_CHANGE
	
	CHANGE(HOUDU_ZUIDU)
		call("UP2")
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
		call("UP5")
		call("UP1")
		call("ROTATE_LINE")

		IF SHALUN_LEIXIN.VAL==0
			ZHIJIN_MSG.WR=1
			VAR13.WR=2
			VAR14.WR=1
			WHEEL_W_MIN.WR=2
			IF LADAO_CHOICE.VAL==1
				WHEEL_RAD.WR=2
			ELSE
				WHEEL_RAD.WR=4
			ENDIF

			HOUDU_MSG.WR=4
			VAR12.WR=4
			HOUDU_CURR.WR=4
			HOUDU_MIN.WR=4
			HOUDU_DIA.WR=4
			HOUDU_ZUIDU.WR=4
			HOUDU_CURR_DIA.WR=4
		ELSE
			ZHIJIN_MSG.WR=4
			VAR13.WR=4
			VAR14.WR=4
			WHEEL_W_MIN.WR=4
			WHEEL_RAD.WR=4

			HOUDU_MSG.WR=1
			VAR12.WR=2
			HOUDU_CURR.WR=1
			HOUDU_MIN.WR=2
			HOUDU_DIA.WR=2
			HOUDU_ZUIDU.WR=2
			HOUDU_CURR_DIA.WR=1
		ENDIF
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
						ELSE
							IF VAR1.VAL==6
								VAR20.VAL="Y"
								VAR21.VAL="Z"
							ENDIF
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
			ELSE
				IF VAR1.VAL==6;金刚笔
					IF SHALUN_LEIXIN.VAL==0
						VAR31.VAL=VAR30_4.VAL+VAR13.VAL/2;初始接触位
					ELSE
						VAR31.VAL=VAR30_5.VAL+VAR12.VAL;初始接触位
					ENDIF
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

	SUB(UP2)
		IF SHALUN_LEIXIN.VAL==1
			HOUDU_CURR_DIA.VAL=HOUDU_DIA.VAL+HOUDU_CURR.VAL*TAN(SRAD(HOUDU_ZUIDU.VAL))*2
		ENDIF
	END_SUB
//END

