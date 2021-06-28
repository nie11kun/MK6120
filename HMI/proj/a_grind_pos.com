//M(Mask1/$85076//);加工数据

	DEF GRID={TYP="R",TGL="% POSITION_CURR_1",X=10,W=540,H=365};

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se3,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);
	HS7=(["\\S_005.png",$85029],ac7,se1,pa0);备份恢复

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85082,ac7,se3);
	VS2=($85083,ac7,se1);
	VS3=($85084,ac7,se1);

	LOAD
		LG("POSITION_CURR_1","GRID","a_grind_pos.com")
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
		LM("MASK1","a_grind_pos.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind_pos.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_grind_pos.com")
	END_PRESS

//END

//M(Mask2/$85076//);加工数据

	DEF GRID={TYP="R",TGL="% POSITION_CURR_2",X=10,W=540,H=365};

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se3,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);
	HS7=(["\\S_005.png",$85029],ac7,se1,pa0);备份恢复

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85082,ac7,se1);
	VS2=($85083,ac7,se3);
	VS3=($85084,ac7,se1);

	LOAD
		LG("POSITION_CURR_2","GRID","a_grind_pos.com")
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
		LM("MASK1","a_grind_pos.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind_pos.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_grind_pos.com")
	END_PRESS

//END

//M(Mask3/$85076//);加工数据

	DEF GRID={TYP="R",TGL="% POSITION_CURR_3",X=10,W=540,H=365};

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工

	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se3,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);
	HS7=(["\\S_005.png",$85029],ac7,se1,pa0);备份恢复

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85082,ac7,se1);
	VS2=($85083,ac7,se1);
	VS3=($85084,ac7,se3);

	LOAD
		LG("POSITION_CURR_3","GRID","a_grind_pos.com")
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
		LM("MASK1","a_grind_pos.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK2","a_grind_pos.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK3","a_grind_pos.com")
	END_PRESS

//END

//G(POSITION_CURR_1/0/51)
	(I///$85563,$85563/WR3//"1"/40/1)
	(R///$85583,$85583/WR3//"GRIND_RESULT[0]"/80/1);前刃底面当前接触Y1
	(R///$85584,$85584/WR3//"GRIND_RESULT[150]"/80/1);前刃当前接触Z1
	(R///$85593,$85593/WR3//"GRIND_RESULT[750]"/80/1);后刃底面当前接触Y1
	(R///$85585,$85585/WR3//"GRIND_RESULT[300]"/80/1);后背当前接触Z1
	(R///$85586,$85586/WR3//"GRIND_RESULT[450]"/80/1);顶部后刃当前接触Y1
	(R///$85588,$85588/WR3//"GRIND_RESULT[600]"/80/1);侧刃当前接触Y1
//END

//G(POSITION_CURR_2/0/51)
	(I///$85563,$85563/WR3//"51"/40/1)
	(R///$85583,$85583/WR3//"GRIND_RESULT[50]"/80/1);前刃底面当前接触Y1
	(R///$85584,$85584/WR3//"GRIND_RESULT[200]"/80/1);前刃当前接触Z1
	(R///$85593,$85593/WR3//"GRIND_RESULT[800]"/80/1);后刃底面当前接触Y1
	(R///$85585,$85585/WR3//"GRIND_RESULT[350]"/80/1);后背当前接触Z1
	(R///$85586,$85586/WR3//"GRIND_RESULT[500]"/80/1);顶部后刃当前接触Y1
	(R///$85588,$85588/WR3//"GRIND_RESULT[650]"/80/1);侧刃当前接触Y1
//END

//G(POSITION_CURR_3/0/51)
	(I///$85563,$85563/WR3//"101"/40/1)
	(R///$85583,$85583/WR3//"GRIND_RESULT[100]"/80/1);前刃底面当前接触Y1
	(R///$85584,$85584/WR3//"GRIND_RESULT[250]"/80/1);前刃当前接触Z1
	(R///$85593,$85593/WR3//"GRIND_RESULT[850]"/80/1);后刃底面当前接触Y1
	(R///$85585,$85585/WR3//"GRIND_RESULT[400]"/80/1);后背当前接触Z1
	(R///$85586,$85586/WR3//"GRIND_RESULT[550]"/80/1);顶部后刃当前接触Y1
	(R///$85588,$85588/WR3//"GRIND_RESULT[700]"/80/1);侧刃当前接触Y1
//END
