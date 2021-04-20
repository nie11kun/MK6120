;**************MASK21:内/外/磨削中心自动对刀:panel_21********************
//M(Mask21/$85026//)

	;ifIsCeTouCeLiangBegin
	DEF KAIGUAN=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[32]"/0,0,0/0,0,0);自动对刀是否有接近开关测量机构
	DEF CETOU=(I//1//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[50]"/0,0,0/0,0,0);自动对刀是否有测量头测量结构
	DEF CETOU_1=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[53]"/0,0,0/0,0,0);测量头(0-测量机构1/1-测量机构2)
	;ifIsCeTouCeLiangEnd

	DEF VAR0=(R///$85570,$85570,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[21]"/320,30,150/440,30,110//);自动测量起始X位置
	DEF VAR1=(R///$85571,$85571,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[22]"/320,50,150/440,50,110//);自动测量起始Y位置
	DEF VAR2=(R///$85572,$85572,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[23]"/320,70,150/440,70,110//);自动测量起始Z位置
	DEF VAR3=(R///$85573,$85573,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[24]"/320,90,150/440,90,110//);自动测量起始A位置
	DEF VAR4=(R///$85574,$85574,,$85042/WR2//"/NC/_N_NC_GD2_ACX/LADAO[25]"/320,110,150/440,110,110//);自动测量起始B位置

	DEF VAR7=(R///$85577,$85577,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[28]"/20,30,150/140,30,60//);自动测量当前测量齿槽
	DEF VAR5=(R///$85575,$85575,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[26]"/20,50,150/140,50,110//);自动测量Y轴前刃测量位
	DEF VAR8=(R///$85580,$85580,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[29]"/20,70,150/140,70,110//);自动测量底面相对前刃距离Z
	DEF VAR9=(R///$85581,$85581,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[30]"/20,90,150/140,90,110//);自动测量顶面相对前刃距离Z
	DEF VAR6=(R///$85582,$85582,,$85043/WR2//"/NC/_N_NC_GD2_ACX/LADAO[37]"/20,110,150/140,110,110//);测头半径

	DEF GRID={TYP="R",TGL="%Measure",X=10,W=540,H=200}

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	DEF SIGNAL=(I/*0=$85013,1=$85014//$85534,$85534,,/WR1//"/Plc/DB2700.DBX1.0"/20,10,40/60,10,50/);测头信号

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	;
	HS4=(["\\S_006.png",$85069],ac7,se3,pa0);自动对刀 ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	LOAD
		LG("Measure","GRID","a_auto.com")
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
		LM("MASK50","a_auto.com")
	END_PRESS
	
//END

//G(Measure/0/51)
	(I///$85563,$85563/WR3//"1"/40/1)
	(R///$85578,$85578/WR3//"MEASURE_RESULT[300]"/80/1);顶刃Y
	(R///$85579,$85579/WR3//"MEASURE_RESULT[350]"/80/1);顶刃偏移Y
	(R///$85564,$85564/WR3//"MEASURE_RESULT[0]"/80/1);底面Y
	(R///$85565,$85565/WR3//"MEASURE_RESULT[50]"/80/1);底面偏移Y
	(R///$85566,$85566/WR3//"MEASURE_RESULT[100]"/100/1);前刃上z
	(R///$85590,$85590/WR3//"MEASURE_RESULT[450]"/100/1);前刃下z
	(R///$85567,$85567/WR3//"MEASURE_RESULT[150]"/80/1);齿距z
	(R///$85568,$85568/WR3//"MEASURE_RESULT[200]"/100/1);后背上z
	(R///$85591,$85591/WR3//"MEASURE_RESULT[500]"/100/1);后背下z
	(R///$85569,$85569/WR3//"MEASURE_RESULT[250]"/80/1);齿厚z
	(R///$85589,$85589/WR3//"MEASURE_RESULT[400]"/80/1);齿高Y
//END
