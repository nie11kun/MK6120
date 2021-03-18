
;**********************MASK51:环形槽:panel_51:**********************
//M(Mask51/$85025//)

	DEF MAINPIC = (V///,$85123////0,0,600,370/0,0,0)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM
	DEF X_DRF=(R///$85116,$85116,,/WR1//"$AC_DRF[X]"/120,10,50/170,10,60/7);DRF_X
	DEF Y_DRF=(R///$85127,$85127,,/WR1//"$AC_DRF[Y]"/120,30,50/170,30,60/7);DRF_Y
	DEF Z_DRF=(R///$85117,$85117,,/WR1//"$AC_DRF[Z]"/120,50,50/170,50,60/7);DRF_Z

	DEF PIECE_VOLUME=(I/*0=$85166,1=$85167/1/$85170,$85170,,/WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/10,60,110/110,60,80/);单件/批量磨削方式选择

	DEF SLOT_AMOUNT=(I///$85903,$85903,,/WR1//"/NC/_N_NC_GD2_ACX/RING[2]"/10,90,110/110,90,60/);总槽数
	
	DEF SLOT_NEED=(I///$85906,$85906,,/WR1//"/NC/_N_NC_GD2_ACX/RING[5]"/10,110,110/110,110,60/);需加工槽数
	DEF SLOT_CURRENT=(I///$85907,$85907,,/WR1//"/NC/_N_NC_GD2_ACX/RING[6]"/10,130,110/110,130,60/);已加工槽数

	DEF Z_CURRENT=(R///$85909,$85909,,/WR1//"/NC/_N_NC_GD2_ACX/RING[10]"/10,160,110/110,160,60/);当前槽起始磨削位置Z
	DEF X_CURRENT_INIT=(R///$85908,$85908,,/WR1//"/NC/_N_NC_GD2_ACX/RING[9]"/10,180,110/110,180,60/);当前槽起始磨削位置Y
	DEF X_CURRENT_CURRENT=(R///$85919,$85919,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[5]"/10,200,110/110,200,60/);当前磨削接触位

	DEF SLOT_INIT=(I/0,//$85904,$85904,,/WR2//"/NC/_N_NC_GD2_ACX/RING[3]"/360,10,110/460,10,60//"UserGuide/section_1.html","S1D43");起始磨削槽
	DEF SLOT_END=(I/0,//$85905,$85905,,/WR2//"/NC/_N_NC_GD2_ACX/RING[4]"/360,30,110/460,30,60//"UserGuide/section_1.html","S1D44");终止磨削槽

	DEF GRIND_START=(R///$85922,$85922,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[1]"/360,60,110/460,60,60//"UserGuide/section_1.html","S1D44");磨削起始.X
	DEF GRIND_END=(R///$85923,$85923,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[2]"/360,80,110/460,80,60//"UserGuide/section_1.html","S1D44");磨削终点.
	
	DEF GRIND_A=(R///$85924,$85924,,$85042/WR2//"/NC/_N_NC_GD2_ACX/INI[18]"/360,110,110/460,110,110//"UserGuide/section_1.html","S1D44");A轴磨削位
	DEF GRIND_B=(R///$85925,$85925,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[6]"/360,130,110/460,130,110//"UserGuide/section_1.html","S1D44");B轴磨削位

	DEF GRIND_ZUIDU=(R///$85914,$85914,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[12]"/360,160,110/460,160,110//"UserGuide/section_1.html","S1D44");磨削x向锥度调整

	DEF Z_POSITION_INIT=(R///$85920,$85920,,/WR2//"/NC/_N_NC_GD2_ACX/INI[3]"/360,180,110/460,180,60/6/"UserGuide/section_1.html","S1D45");工件右端
	DEF X_POSITION_INIT=(R///$85921,$85921,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[14]"/360,200,110/460,200,60/6/"UserGuide/section_1.html","S1D46");初始磨削接触位
;
	DEF GRIND_SAFE=(R///$85172,$85172,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[17]"/360,220,202/460,220,60//"UserGuide/section_1.html","S1D13");磨削安全位置  ifIsExternal
	DEF X_QUIT=(R///$85106,$85106,,/WR2//"/NC/_N_NC_GD2_ACX/INI[24]"/360,240,202/460,240,60//"UserGuide/section_1.html","S1D14");退刀位置

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	;环形槽组螺距
	DEF PITCH_1=(R/0,//$85915,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[11]"/0,0,0/132,295,60//"UserGuide/section_1.html","S1D47");
	DEF PITCH_2=(R/0,//$85916,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[21]"/0,0,0/222,295,60//"UserGuide/section_1.html","S1D47");
	DEF PITCH_3=(R/0,//$85917,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[31]"/0,0,0/312,295,60//"UserGuide/section_1.html","S1D47");
	DEF PITCH_4=(R/0,//$85918,,,/WR2//"/NC/_N_NC_GD2_ACX/RING[41]"/0,0,0/402,295,60//"UserGuide/section_1.html","S1D47");

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

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se3,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=("")

	PRESS(HS1)
		LM("MASK51","a_grind.com")
	END_PRESS

	PRESS(HS2)
		IF VAR45.VAL==0;基本工艺
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK29","a_process.com")
			ELSE
				LM("MASK2","a_process.com")
			ENDIF
		ELSE
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK30","a_process.com")
			ELSE
				LM("MASK20","a_process.com")
			ENDIF
		ENDIF
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

	CHANGE(PITCH_1)
		IF PITCH_1.VAL==0
			SLOTS_1.VAL=0
		ENDIF
	END_CHANGE

	CHANGE(PITCH_2)
		IF PITCH_2.VAL==0
			SLOTS_2.VAL=0
		ENDIF
	END_CHANGE

	CHANGE(PITCH_3)
		IF PITCH_3.VAL==0
			SLOTS_3.VAL=0
		ENDIF
	END_CHANGE

	CHANGE(PITCH_4)
		IF PITCH_4.VAL==0
			SLOTS_4.VAL=0
		ENDIF
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

;
