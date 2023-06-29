;**************MASK21:内/外/磨削中心自动对刀:panel_21********************
//M(Mask1/$85085//)

	DEF GRID={TYP="R",TGL="%Measure_1",X=10,W=540,H=365}

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF LOAD_YUANLADAO=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[257]"/0,0,0/0,0,0);是否有圆拉刀

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	;
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀 ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se3,pa0);
	HS7=(["\\S_007.png",$85099],ac7,se1,pa0);磨削基准

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85082,ac7,se3);
	VS2=($85083,ac7,se1);
	VS3=($85084,ac7,se1);

	LOAD
		IF LOAD_YUANLADAO.VAL==0
			HS7.SE=2
			HS7.ST=""
		ENDIF

		LG("Measure_1","GRID","a_auto_pos.com")
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
		LM("MASK32","a_centerduanmian.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK0","a_data.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS1)
		LM("MASK1","a_auto_pos.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_auto_pos.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_auto_pos.com")
	END_PRESS
	
//END

;**************MASK21:内/外/磨削中心自动对刀:panel_21********************
//M(Mask2/$85085//)

	DEF GRID={TYP="R",TGL="%Measure_2",X=10,W=540,H=365}

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF LOAD_YUANLADAO=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[257]"/0,0,0/0,0,0);是否有圆拉刀

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	;
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀 ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se3,pa0);
	HS7=(["\\S_007.png",$85099],ac7,se1,pa0);磨削基准

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85082,ac7,se1);
	VS2=($85083,ac7,se3);
	VS3=($85084,ac7,se1);

	LOAD
		IF LOAD_YUANLADAO.VAL==0
			HS7.SE=2
			HS7.ST=""
		ENDIF

		LG("Measure_2","GRID","a_auto_pos.com")
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
		LM("MASK32","a_centerduanmian.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK0","a_data.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS1)
		LM("MASK1","a_auto_pos.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_auto_pos.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_auto_pos.com")
	END_PRESS
	
//END

;**************MASK21:内/外/磨削中心自动对刀:panel_21********************
//M(Mask3/$85085//)

	DEF GRID={TYP="R",TGL="%Measure_3",X=10,W=540,H=365}

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF LOAD_YUANLADAO=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[257]"/0,0,0/0,0,0);是否有圆拉刀

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	;
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀 ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se3,pa0);
	HS7=(["\\S_007.png",$85099],ac7,se1,pa0);磨削基准

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85082,ac7,se1);
	VS2=($85083,ac7,se1);
	VS3=($85084,ac7,se3);

	LOAD
		IF LOAD_YUANLADAO.VAL==0
			HS7.SE=2
			HS7.ST=""
		ENDIF
		
		LG("Measure_3","GRID","a_auto_pos.com")
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
		LM("MASK32","a_centerduanmian.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK0","a_data.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS1)
		LM("MASK1","a_auto_pos.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_auto_pos.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_auto_pos.com")
	END_PRESS
	
//END

//G(Measure_1/0/51)
	(I///$85563,$85563/WR3//"1"/40/1)
	(R///$85566,$85566/WR2//"MEASURE_RESULT[300]"/100/1);前刃上z
	(R///$85590,$85590/WR2//"MEASURE_RESULT[1350]"/100/1);前刃下z
	(R///$85568,$85568/WR3//"MEASURE_RESULT[600]"/100/1);后背上z
	(R///$85591,$85591/WR3//"MEASURE_RESULT[1500]"/100/1);后背下z
	(R///$85564,$85564/WR3//"MEASURE_RESULT[0]"/80/1);底面Y
	(R///$85578,$85578/WR3//"MEASURE_RESULT[900]"/80/1);顶刃Y
	(R///$85565,$85565/WR3//"MEASURE_RESULT[150]"/80/1);底面偏移Y
	(R///$85579,$85579/WR3//"MEASURE_RESULT[1050]"/80/1);顶刃偏移Y
	(R///$85567,$85567/WR3//"MEASURE_RESULT[450]"/80/1);齿距z
	(R///$85556,$85556/WR3//"MEASURE_RESULT[1800]"/80/1);齿距累计误差
	(R///$85569,$85569/WR3//"MEASURE_RESULT[750]"/80/1);齿厚z
	(R///$85589,$85589/WR3//"MEASURE_RESULT[1200]"/80/1);齿高Y
	(R///$85592,$85592/WR3//"MEASURE_RESULT[1650]"/80/1);前刃底角R
//END

//G(Measure_2/0/51)
	(I///$85563,$85563/WR3//"51"/40/1)
	(R///$85566,$85566/WR2//"MEASURE_RESULT[350]"/100/1);前刃上z
	(R///$85590,$85590/WR2//"MEASURE_RESULT[1400]"/100/1);前刃下z
	(R///$85568,$85568/WR3//"MEASURE_RESULT[650]"/100/1);后背上z
	(R///$85591,$85591/WR3//"MEASURE_RESULT[1550]"/100/1);后背下z
	(R///$85564,$85564/WR3//"MEASURE_RESULT[50]"/80/1);底面Y
	(R///$85578,$85578/WR3//"MEASURE_RESULT[950]"/80/1);顶刃Y
	(R///$85565,$85565/WR3//"MEASURE_RESULT[200]"/80/1);底面偏移Y
	(R///$85579,$85579/WR3//"MEASURE_RESULT[1100]"/80/1);顶刃偏移Y
	(R///$85567,$85567/WR3//"MEASURE_RESULT[500]"/80/1);齿距z
	(R///$85556,$85556/WR3//"MEASURE_RESULT[1850]"/80/1);齿距累计误差
	(R///$85569,$85569/WR3//"MEASURE_RESULT[800]"/80/1);齿厚z
	(R///$85589,$85589/WR3//"MEASURE_RESULT[1250]"/80/1);齿高Y
	(R///$85592,$85592/WR3//"MEASURE_RESULT[1700]"/80/1);前刃底角R
//END

//G(Measure_3/0/51)
	(I///$85563,$85563/WR3//"101"/40/1)
	(R///$85566,$85566/WR2//"MEASURE_RESULT[400]"/100/1);前刃上z
	(R///$85590,$85590/WR2//"MEASURE_RESULT[1450]"/100/1);前刃下z
	(R///$85568,$85568/WR3//"MEASURE_RESULT[700]"/100/1);后背上z
	(R///$85591,$85591/WR3//"MEASURE_RESULT[1600]"/100/1);后背下z
	(R///$85564,$85564/WR3//"MEASURE_RESULT[100]"/80/1);底面Y
	(R///$85578,$85578/WR3//"MEASURE_RESULT[1000]"/80/1);顶刃Y
	(R///$85565,$85565/WR3//"MEASURE_RESULT[250]"/80/1);底面偏移Y
	(R///$85579,$85579/WR3//"MEASURE_RESULT[1150]"/80/1);顶刃偏移Y
	(R///$85567,$85567/WR3//"MEASURE_RESULT[550]"/80/1);齿距z
	(R///$85556,$85556/WR3//"MEASURE_RESULT[1900]"/80/1);齿距累计误差
	(R///$85569,$85569/WR3//"MEASURE_RESULT[850]"/80/1);齿厚z
	(R///$85589,$85589/WR3//"MEASURE_RESULT[1300]"/80/1);齿高Y
	(R///$85592,$85592/WR3//"MEASURE_RESULT[1750]"/80/1);前刃底角R
//END
