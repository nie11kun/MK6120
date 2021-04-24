
;**********************MASK51:环形槽:panel_51:**********************
//M(Mask51/$85025//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM
	DEF X_DRF=(R///$85116,$85116,,/WR1//"$AC_DRF[X]"/120,10,50/170,10,60/7);DRF_X
	DEF Y_DRF=(R///$85127,$85127,,/WR1//"$AC_DRF[Y]"/120,30,50/170,30,60/7);DRF_Y
	DEF Z_DRF=(R///$85117,$85117,,/WR1//"$AC_DRF[Z]"/120,50,50/170,50,60/7);DRF_Z

	DEF Z_CURRENT_INIT=(R///$85909,$85909,,/WR1//"/NC/_N_NC_GD2_ACX/RING[10]"/10,80,110/110,80,60/);当前槽起始磨削位置Z
	DEF Z_CURRENT_CURRENT=(R///$85926,$85926,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[20]"/10,100,110/110,100,60/);当前槽当前磨削位置Z
	DEF X_CURRENT_INIT=(R///$85908,$85908,,/WR1//"/NC/_N_NC_GD2_ACX/RING[9]"/10,130,110/110,130,60/);当前槽起始磨削位置Y
	DEF X_CURRENT_CURRENT=(R///$85919,$85919,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[5]"/10,150,110/110,150,60/);当前磨削接触位Y
	
	DEF GRIND_A=(R///$85927,$85927,,/WR1//"/NC/_N_NC_GD2_ACX/INI[21]"/10,180,110/110,180,60//"UserGuide/section_1.html","S1D44");A轴磨削位
	DEF GRIND_B=(R///$85928,$85928,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[6]"/10,200,110/110,200,60//"UserGuide/section_1.html","S1D44");B轴磨削位
	DEF GRIND_SAFE=(R///$85168,$85168,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[17]"/10,220,110/110,220,60//"UserGuide/section_1.html","S1D13");磨削安全位置  ifIsExternal

	DEF Y_QUIT=(R///$85106,$85106,,/WR2//"/NC/_N_NC_GD2_ACX/INI[24]"/360,60,202/460,60,60//"UserGuide/section_1.html","S1D14");退刀位置Y
	DEF X_QUIT=(R///$85128,$85128,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[13]"/360,80,202/460,80,60//"UserGuide/section_1.html","S1D14");退刀位置X

	DEF PIECE_VOLUME=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2//"/NC/_N_NC_GD2_ACX/INI[27]"/360,30,202/460,30,80/);单件/批量磨削方式选择
	DEF GRIND_CHOICE=(I/*0=$85078,1=$85077,2=$85079,3=$85081,4=$85080//$85131,$85131,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[38]"/360,10,202/460,10,80/);加工选择(0前刃、1齿形平磨，2齿顶后刃，3齿侧后刃)

	DEF X_POSITION_INIT=(R///$85921,$85921,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[14]"/360,110,110/460,110,60//"UserGuide/section_1.html","S1D46");初始磨削接触位

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se1);工件参数
	VS2=($85076,ac7,se1);加工数据
	VS3=($85078,ac7,se1);前刃磨削
	VS4=($85080,ac7,se1);后背磨削
	VS5=($85079,ac7,se1);顶刃磨削
	VS6=($85077,ac7,se1);平磨参数
	VS7=($85081,ac7,se1);平磨参数

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

//END

;

//M(Mask1/$85075//)
	DEF MAINPIC = (V///,$85123////0,0,600,370/0,0,0)

	DEF SLOT_AMOUNT=(I///$85903,$85903,,/WR1//"/NC/_N_NC_GD2_ACX/RING[2]"/10,10,110/110,10,60/);总槽数
	DEF SLOT_NEED=(I///$85906,$85906,,/WR1//"/NC/_N_NC_GD2_ACX/RING[5]"/10,30,110/110,30,60/);需加工槽数
	DEF SLOT_CURRENT=(I///$85907,$85907,,/WR1//"/NC/_N_NC_GD2_ACX/RING[6]"/10,50,110/110,50,60/);已加工槽数

	DEF SLOT_INIT=(I/0,//$85904,$85904,,/WR2//"/NC/_N_NC_GD2_ACX/RING[3]"/10,80,110/110,80,60//"UserGuide/section_1.html","S1D43");起始磨削槽
	DEF SLOT_END=(I/0,//$85905,$85905,,/WR2//"/NC/_N_NC_GD2_ACX/RING[4]"/10,100,110/110,100,60//"UserGuide/section_1.html","S1D44");终止磨削槽

	DEF QIAN_ANG=(R///$85149,$85149,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[31]"/360,10,110/460,10,60//);齿形参数：前刃角度
	DEF HOU_ANG=(R///$85150,$85150,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[32]"/360,30,110/460,30,60//);齿形参数：后背角度
	DEF HOU_LENGTH=(R///$85151,$85151,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[33]"/360,50,110/460,50,60//);齿形参数：后背厚度
	DEF DING_ANG=(R///$85152,$85152,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[34]"/360,70,110/460,70,60//);齿形参数：顶部后刃角度
	DEF PITCH=(R///$85153,$85153,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[35]"/360,90,110/460,90,60//);齿形参数：齿距
	DEF HEIGHT=(R///$85154,$85154,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[36]"/360,110,110/460,110,60//);齿形参数：齿高

	;环形槽组螺距
	;DEF PITCH_1=(R/0,//$85915,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[11]"/0,0,0/132,295,60//"UserGuide/section_1.html","S1D47");
	;DEF PITCH_2=(R/0,//$85916,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[21]"/0,0,0/222,295,60//"UserGuide/section_1.html","S1D47");
	;DEF PITCH_3=(R/0,//$85917,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[31]"/0,0,0/312,295,60//"UserGuide/section_1.html","S1D47");
	;DEF PITCH_4=(R/0,//$85918,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[41]"/0,0,0/402,295,60//"UserGuide/section_1.html","S1D47");

	;环形槽组槽数
	DEF SLOTS_1=(I/0,//$85915,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[12]"/0,0,0/132,320,60//"UserGuide/section_1.html","S1D48");
	DEF SLOTS_2=(I/0,//$85916,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[22]"/0,0,0/222,320,60//"UserGuide/section_1.html","S1D48");
	DEF SLOTS_3=(I/0,//$85917,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[32]"/0,0,0/312,320,60//"UserGuide/section_1.html","S1D48");
	DEF SLOTS_4=(I/0,//$85918,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[42]"/0,0,0/402,320,60//"UserGuide/section_1.html","S1D48");

	;环形槽组齿升量
	DEF Y_DELTA_1=(R///$85915,,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[8]"/0,0,0/132,344,60//"UserGuide/section_1.html","S1D49");
	DEF Y_DELTA_2=(R///$85916,,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[9]"/0,0,0/222,344,60//"UserGuide/section_1.html","S1D49");
	DEF Y_DELTA_3=(R///$85917,,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[10]"/0,0,0/312,344,60//"UserGuide/section_1.html","S1D49");
	DEF Y_DELTA_4=(R///$85918,,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[11]"/0,0,0/402,344,60//"UserGuide/section_1.html","S1D49");

	;环形槽组水平偏移
	;DEF Z_DELTA_1=(R///$85915,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[13]"/0,0,0/132,320,60//"UserGuide/section_1.html","S1D49");
	;DEF Z_DELTA_2=(R///$85916,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[23]"/0,0,0/222,320,60//"UserGuide/section_1.html","S1D49");
	;DEF Z_DELTA_3=(R///$85917,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[33]"/0,0,0/312,320,60//"UserGuide/section_1.html","S1D49");
	;DEF Z_DELTA_4=(R///$85918,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[43]"/0,0,0/402,320,60//"UserGuide/section_1.html","S1D49");

	;环形槽组垂直偏移
	;DEF X_DELTA_1=(R///$85915,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[14]"/0,0,0/132,344,60//"UserGuide/section_1.html","S1D50");
	;DEF X_DELTA_2=(R///$85916,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[24]"/0,0,0/222,344,60//"UserGuide/section_1.html","S1D50");
	;DEF X_DELTA_3=(R///$85917,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[34]"/0,0,0/312,344,60//"UserGuide/section_1.html","S1D50");
	;DEF X_DELTA_4=(R///$85918,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[44]"/0,0,0/402,344,60//"UserGuide/section_1.html","S1D50");

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se3);工件参数
	VS2=($85076,ac7,se1);加工数据
	VS3=($85078,ac7,se1);前刃磨削
	VS4=($85080,ac7,se1);后背磨削
	VS5=($85079,ac7,se1);顶刃磨削
	VS6=($85077,ac7,se1);平磨参数
	VS7=($85081,ac7,se1);平磨参数

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

	CHANGE(SLOTS_1)
		call("UP1")
	END_CHANGE

	CHANGE(SLOTS_2)
		call("UP1")
	END_CHANGE

	CHANGE(SLOTS_3)
		call("UP1")
	END_CHANGE

	CHANGE(SLOTS_4)
		call("UP1")
	END_CHANGE

	CHANGE(SLOT_END)
		IF SLOT_END.VAL>SLOT_AMOUNT
			SLOT_END.VAL=SLOT_AMOUNT
		ENDIF
		call("UP2")
	END_CHANGE

	CHANGE(SLOT_INIT)
		IF SLOT_INIT<1
			SLOT_INIT=1
		ENDIF
		call("UP2")
	END_CHANGE

	CHANGE(SLOT_AMOUNT)
		IF SLOT_END.VAL>SLOT_AMOUNT
			SLOT_END.VAL=SLOT_AMOUNT
		ENDIF
	END_CHANGE

	SUB(UP1)
		SLOT_AMOUNT.VAL=SLOTS_1+SLOTS_2+SLOTS_3+SLOTS_4
	END_SUB

	SUB(UP2)
		SLOT_NEED.VAL=SLOT_END.VAL-SLOT_INIT.VAL+1
	END_SUB
	
//END

//M(Mask2/$85076//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM

	DEF GRID={TYP="R",TGL="% POSITION_CURR",X=10,W=540,H=300};

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se1);工件参数
	VS2=($85076,ac7,se3);加工数据
	VS3=($85078,ac7,se1);前刃磨削
	VS4=($85080,ac7,se1);后背磨削
	VS5=($85079,ac7,se1);顶刃磨削
	VS6=($85077,ac7,se1);平磨参数
	VS7=($85081,ac7,se1);平磨参数

	LOAD
		LG("POSITION_CURR","GRID","a_grind.com")
	END_LOAD

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

//END

//M(Mask4/$85078//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM

	DEF Z_POSITION_INIT=(R///$85920,$85920,,/WR2//"/NC/_N_NC_GD2_ACX/INI[3]"/360,170,202/460,170,60//"UserGuide/section_1.html","S1D45");工件右端
	DEF DIMIANCISHENG=(I/*0=$85157,1=$85162//$85156,$85156,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[92]"/360,190,202/460,190,60//);底面加工是否有齿升量-0没有/1有
	DEF JINDAOMODE=(I/*0=$85190,1=$85191//$85189,$85189,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[95]"/360,210,202/460,210,60//);前刃后背加工是否斜向进刀(0否1是)
	DEF CIJU_MODE=(I/*0=$85194,1=$85195//$85193,$85193,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[97]"/360,250,202/460,250,60//);磨削齿距模式(0测量齿距/1标准齿距)

	DEF GRIND_START=(R///$85922,$85922,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[1]"/360,10,110/460,10,60//"UserGuide/section_1.html","S1D44");磨削起始.X
	DEF GRIND_END=(R///$85923,$85923,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[2]"/360,30,110/460,30,60//"UserGuide/section_1.html","S1D44");磨削终点.
	
	DEF GRIND_A=(R///$85924,$85924,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[43]"/360,60,110/460,60,110//"UserGuide/section_1.html","S1D44");A轴磨削位
	DEF GRIND_B=(R///$85925,$85925,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[44]"/360,80,110/460,80,110//"UserGuide/section_1.html","S1D44");B轴磨削位

	DEF GRIND_ZUIDU=(R///$85914,$85914,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[12]"/360,110,110/460,110,110//"UserGuide/section_1.html","S1D44");磨削x向锥度调整

	DEF GRIND_SAFE=(R///$85172,$85172,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[45]"/360,140,202/460,140,60//"UserGuide/section_1.html","S1D13");磨削安全位置  ifIsExternal

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工
	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se1);工件参数
	VS2=($85076,ac7,se1);加工数据
	VS3=($85078,ac7,se3);前刃磨削
	VS4=($85080,ac7,se1);后背磨削
	VS5=($85079,ac7,se1);顶刃磨削
	VS6=($85077,ac7,se1);平磨参数
	VS7=($85081,ac7,se1);平磨参数

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

//END

//M(Mask6/$85080//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM

	DEF Z_POSITION_INIT=(R///$85920,$85920,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[58]"/360,170,202/460,170,60//"UserGuide/section_1.html","S1D45");工件右端
	DEF DIMIANCISHENG=(I/*0=$85157,1=$85162//$85156,$85156,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[92]"/360,190,202/460,190,60//);底面加工是否有齿升量-0没有/1有
	DEF JINDAOMODE=(I/*0=$85190,1=$85191//$85189,$85189,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[95]"/360,210,202/460,210,60//);前刃后背加工是否斜向进刀(0否1是)
	DEF CIJU_MODE=(I/*0=$85194,1=$85195//$85193,$85193,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[97]"/360,250,202/460,250,60//);磨削齿距模式(0测量齿距/1标准齿距)

	DEF GRIND_START=(R///$85922,$85922,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[59]"/360,10,110/460,10,60//"UserGuide/section_1.html","S1D44");磨削起始.X
	DEF GRIND_END=(R///$85923,$85923,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[60]"/360,30,110/460,30,60//"UserGuide/section_1.html","S1D44");磨削终点.
	
	DEF GRIND_A=(R///$85924,$85924,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[55]"/360,60,110/460,60,110//"UserGuide/section_1.html","S1D44");A轴磨削位
	DEF GRIND_B=(R///$85925,$85925,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[56]"/360,80,110/460,80,110//"UserGuide/section_1.html","S1D44");B轴磨削位

	DEF GRIND_SAFE=(R///$85172,$85172,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[57]"/360,140,202/460,140,60//"UserGuide/section_1.html","S1D13");磨削安全位置  ifIsExternal

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工
	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se1);工件参数
	VS2=($85076,ac7,se1);加工数据
	VS3=($85078,ac7,se1);前刃磨削
	VS4=($85080,ac7,se3);后背磨削
	VS5=($85079,ac7,se1);顶刃磨削
	VS6=($85077,ac7,se1);平磨参数
	VS7=($85081,ac7,se1);平磨参数

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

//END

//M(Mask5/$85079//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM

	DEF Z_POSITION_INIT=(R///$85920,$85920,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[52]"/360,170,202/460,170,60//"UserGuide/section_1.html","S1D45");工件右端

	DEF GRIND_START=(R///$85922,$85922,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[53]"/360,10,110/460,10,60//"UserGuide/section_1.html","S1D44");磨削起始.X
	DEF GRIND_END=(R///$85923,$85923,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[54]"/360,30,110/460,30,60//"UserGuide/section_1.html","S1D44");磨削终点.
	
	DEF GRIND_A=(R///$85924,$85924,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[49]"/360,60,110/460,60,110//"UserGuide/section_1.html","S1D44");A轴磨削位
	DEF GRIND_B=(R///$85925,$85925,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[50]"/360,80,110/460,80,110//"UserGuide/section_1.html","S1D44");B轴磨削位

	DEF GRIND_SAFE=(R///$85172,$85172,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[51]"/360,140,202/460,140,60//"UserGuide/section_1.html","S1D13");磨削安全位置  ifIsExternal

	DEF CIJU_MODE=(I/*0=$85194,1=$85195//$85193,$85193,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[97]"/360,250,202/460,250,60//);磨削齿距模式(0测量齿距/1标准齿距)

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工
	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se1);工件参数
	VS2=($85076,ac7,se1);加工数据
	VS3=($85078,ac7,se1);前刃磨削
	VS4=($85080,ac7,se1);后背磨削
	VS5=($85079,ac7,se3);顶刃磨削
	VS6=($85077,ac7,se1);平磨参数
	VS7=($85081,ac7,se1);平磨参数

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

//END

//M(Mask3/$85077//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM

	DEF GRIND_START=(R///$85129,$85129,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[41]"/360,10,110/460,10,60//);平磨起点Z
	DEF GRIND_X=(R///$85132,$85132,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[40]"/360,30,110/460,30,60//);齿形平磨初始位x
	DEF GRIND_BUCHANG=(R///$85192,$85192,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[96]"/360,50,110/460,50,60//);通磨长度延长量

	DEF GRIND_A=(R///$85924,$85924,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[46]"/360,80,110/460,80,110//"UserGuide/section_1.html","S1D44");A轴磨削位
	DEF GRIND_B=(R///$85925,$85925,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[47]"/360,100,110/460,100,110//"UserGuide/section_1.html","S1D44");B轴磨削位
	DEF GRIND_SAFE=(R///$85172,$85172,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[48]"/360,120,202/460,120,60//"UserGuide/section_1.html","S1D13");磨削安全位置  ifIsExternal

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工
	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se1);工件参数
	VS2=($85076,ac7,se1);加工数据
	VS3=($85078,ac7,se1);前刃磨削
	VS4=($85080,ac7,se1);后背磨削
	VS5=($85079,ac7,se1);顶刃磨削
	VS6=($85077,ac7,se3);平磨参数
	VS7=($85081,ac7,se1);平磨参数

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

//END

//M(Mask7/$85081//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM
	
	DEF GRIND_START_Z=(R///$85155,$85155,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[71]"/360,10,110/460,10,60//);首齿起始z
	DEF GRIND_X=(R///$85132,$85132,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[72]"/360,30,110/460,30,60//);磨削位x
	DEF LENGTH_CI=(R///$85133,$85133,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[73]"/360,50,110/460,50,60//);齿厚

	DEF GRIND_A=(R///$85924,$85924,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[68]"/360,80,110/460,80,110//"UserGuide/section_1.html","S1D44");A轴磨削位
	DEF GRIND_B=(R///$85925,$85925,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[69]"/360,100,110/460,100,110//"UserGuide/section_1.html","S1D44");B轴磨削位
	DEF GRIND_SAFE=(R///$85172,$85172,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[70]"/360,120,202/460,120,60//"UserGuide/section_1.html","S1D13");磨削安全位置  ifIsExternal

	DEF CIJU_MODE=(I/*0=$85194,1=$85195//$85193,$85193,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[97]"/360,250,202/460,250,60//);磨削齿距模式(0测量齿距/1标准齿距)

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工
	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85075,ac7,se1);工件参数
	VS2=($85076,ac7,se1);加工数据
	VS3=($85078,ac7,se1);前刃磨削
	VS4=($85080,ac7,se1);后背磨削
	VS5=($85079,ac7,se1);顶刃磨削
	VS6=($85077,ac7,se1);平磨参数
	VS7=($85081,ac7,se3);平磨参数

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK4","a_grind.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK6","a_grind.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK5","a_grind.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK3","a_grind.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK7","a_grind.com")
	END_PRESS

//END

//G(POSITION_CURR/0/51)
	(I///$85563,$85563/WR3//"1"/40/1)
	(R///$85583,$85583/WR3//"GRIND_RESULT[0]"/80/1);前刃底面当前接触Y1
	(R///$85584,$85584/WR3//"GRIND_RESULT[50]"/80/1);前刃当前接触Z1
	(R///$85593,$85593/WR3//"GRIND_RESULT[250]"/80/1);后刃底面当前接触Y1
	(R///$85585,$85585/WR3//"GRIND_RESULT[100]"/80/1);后背当前接触Z1
	(R///$85586,$85586/WR3//"GRIND_RESULT[150]"/80/1);顶部后刃当前接触Y1
	(R///$85588,$85588/WR3//"GRIND_RESULT[200]"/80/1);侧刃当前接触Y1
//END
