;

;**********************MASK1:双圆弧:panel_9:;**********************
//M(Mask1/$85390//)

	DEF VAR0=(R/0,20//$85478,$85478,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[9]"/325,10,120/440,10,110/);左齿顶圆弧半径
	DEF VAR1=(R/0,20//$85470,$85470,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[1]"/325,30,120/440,30,110/);右齿顶圆弧半径
	DEF VAR2=(R/0,50//$85471,$85471,,$85042/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[2]"/325,60,120/440,60,110/);齿高
	DEF VAR3=(R/0,90//$85472,$85472,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[3]"/325,90,120/440,90,110/);前刃角度
	DEF VAR4=(R/0,90//$85473,$85473,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[4]"/325,110,120/440,110,110/);后刃角度
	DEF VAR5=(R/0,90//$85474,$85474,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[5]"/325,130,120/440,130,110/);刃背角度
	DEF VAR6=(R/0,100//$85475,$85475,,$85042/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[6]"/325,160,120/440,160,110/);前刃长度
	DEF VAR7=(R/0,200//$85476,$85476,,$85042/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[7]"/325,180,120/440,180,110/);刃总长

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器
	DEF N_CX_X_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器前后

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

;
;
	VS1=($85390,ac7,se3);"齿形一" ifIsArc
	VS2=($85391,ac7,se1);"齿形二" ifIsArc
	VS3=($85392,ac7,se1);"齿形二" ifIsArc
	VS4=($85393,ac7,se1);"齿形二" ifIsArc

	VS5=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
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

//END

;
//M(Mask2/$85391//)

	DEF VAR14=(R/0,100//$85365,$85365,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[34]"/325,10,120/440,10,110/);B值长度
	DEF VAR2=(R/0,90//$85353,$85353,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[13]"/325,30,120/440,30,110/);齿形偏转角

	DEF VAR0=(R/0,20//$85351,$85351,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[11]"/325,60,120/440,60,110/);齿一左半径
	DEF VAR1=(R/0,20//$85352,$85352,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[12]"/325,80,120/440,80,110/);齿一右半径

	DEF VAR3=(R/0,100//$85354,$85354,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[15]"/325,110,120/440,110,110/);齿一厚度
	DEF VAR9=(R/0,100//$85360,$85360,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[21]"/325,130,120/440,130,110/);齿二厚度

	DEF VAR4=(R/0,100//$85355,$85355,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[16]"/325,160,120/440,160,110/);齿一二间距
	DEF VAR10=(R/0,100//$85361,$85361,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[28]"/325,180,120/440,180,110/);齿三四间距

	DEF VAR5=(R/0,90//$85356,$85356,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[17]"/325,210,120/440,210,110/);齿二左角
	DEF VAR6=(R/0,90//$85357,$85357,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[18]"/325,230,120/440,230,110/);齿二右角
	DEF VAR7=(R/0,100//$85358,$85358,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[19]"/325,250,120/440,250,110/);齿二左半径
	DEF VAR8=(R/0,100//$85359,$85359,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[20]"/325,270,120/440,270,110/);齿二右半径

	DEF VAR11=(R/0,100//$85362,$85362,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[30]"/325,300,120/440,300,110/);基准齿高

	DEF VAR12=(R/0,100//$85363,$85363,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[31]"/325,330,120/440,330,110/);齿一二齿高
	DEF VAR13=(R/0,100//$85364,$85364,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[33]"/325,350,120/440,350,110/);齿三四齿高

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器
	DEF N_CX_X_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器前后

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

;
;
	VS1=($85390,ac7,se1);"齿形一" ifIsArc
	VS2=($85391,ac7,se3);"齿形二" ifIsArc
	VS3=($85392,ac7,se1);"齿形二" ifIsArc
	VS4=($85393,ac7,se1);"齿形二" ifIsArc

	VS5=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
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

//END

;**********************MASK3:双圆弧:panel_9:;**********************
//M(Mask3/$85392//)

	DEF VAR0=(R/0,20//$85479,$85479,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[41]"/325,10,120/440,10,110/);左齿顶圆弧半径
	DEF VAR1=(R/0,90//$85480,$85480,,$85042/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[42]"/325,40,120/440,40,110/);右齿顶圆弧半径
	DEF VAR2=(R/0,90//$85481,$85481,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[43]"/325,60,120/440,60,110/);齿高
	DEF VAR3=(R/0,90//$85482,$85482,,$85042/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[44]"/325,90,120/440,90,110/);前刃角度
	DEF VAR4=(R/0,90//$85483,$85483,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[45]"/325,110,120/440,110,110/);后刃角度

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器
	DEF N_CX_X_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器前后

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回


	VS1=($85390,ac7,se1);"齿形一" ifIsArc
	VS2=($85391,ac7,se1);"齿形二" ifIsArc
	VS3=($85392,ac7,se3);"齿形二" ifIsArc
	VS4=($85393,ac7,se1);"齿形二" ifIsArc

	VS5=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound

	VS7=($85379,ac7,se2);"滚压轮"


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

//END

;**********************MASK3:双圆弧:panel_9:;**********************
//M(Mask4/$85393//)

	DEF VAR0=(R/0,20//$85449,$85449,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[61]"/325,10,120/440,10,110/);齿形4-齿顶高H
	DEF VAR1=(R/0,90//$85450,$85450,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[62]"/325,30,120/440,30,110/);齿形4-齿底高H
	DEF VAR2=(R/0,90//$85451,$85451,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[63]"/325,60,120/440,60,110/);齿形4-齿顶圆弧半径R-1
	DEF VAR3=(R/0,90//$85455,$85455,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[67]"/325,80,120/440,80,110/);齿形4-齿顶圆弧半径R-2
	DEF VAR4=(R/0,90//$85452,$85452,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[64]"/325,100,120/440,100,110/);齿形4-齿底圆弧半径R
	DEF VAR5=(R/0,90//$85453,$85453,,$85042/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[65]"/325,120,120/440,120,110/);齿形4-齿侧角
	DEF VAR6=(R/0,90//$85454,$85454,,$85043/WR2/"panel_7_7_chs.png"/"/NC/_N_NC_GD2_ACX/LADAO[66]"/325,140,120/440,140,110/);齿形4-齿底延长

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器
	DEF N_CX_X_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[38]"/0,0,0/0,0,0/);成型X修整时修整器前后

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se3,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回


	VS1=($85390,ac7,se1);"齿形一" ifIsArc
	VS2=($85391,ac7,se1);"齿形二" ifIsArc
	VS3=($85392,ac7,se1);"齿形二" ifIsArc
	VS4=($85393,ac7,se3);"齿形二" ifIsArc

	VS5=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound

	VS7=($85379,ac7,se2);"滚压轮"


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

//END