;**************MASK0:磨削基准:panel_0********************
//M(Mask0/$85099//)

	DEF X_IM=(R///$85118,$85118,,/WR4//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR4//"$AA_IM[Y]"/10,30,20/30,30,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR4//"$AA_IM[Z]"/10,50,20/30,50,60/3);Z_IM
	DEF A_IM=(R///$85122,$85122,,/WR4//"$AA_IM[A]"/10,70,20/30,70,60/3);A_IM
	DEF B_IM=(R///$85121,$85121,,/WR4//"$AA_IM[B]"/10,90,20/30,90,60/3);B_IM
	DEF C_IM=(R///$85120,$85120,,/WR4//"$AA_IM[C]"/10,110,20/30,110,60/3);C_IM

	DEF MSG_1=(I///$85740,$85740,,/WR1///20,10,200/0,0,0//);
	DEF VAR00=(R///$85741,$85741,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[371]"/20,30,150/140,30,60//);圆拉刀-磨削基准-B轴0度-头架中心-砂轮一-基准.X
	DEF VAR02=(R///$85742,$85742,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[372]"/20,50,150/140,50,60//);圆拉刀-磨削基准-B轴0度-头架中心-砂轮一-基准.Y
	DEF VAR03=(R///$85743,$85743,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[373]"/20,70,150/140,70,60//);圆拉刀-磨削基准-B轴0度-头架中心-砂轮一-基准.Z

	DEF MSG_2=(I///$85740,$85740,,/WR1///320,10,200/0,0,0//);
	DEF VAR04=(R///$85744,$85744,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[374]"/320,30,150/440,30,60//);圆拉刀-磨削基准-B轴0度-头架中心-砂轮二-基准.X
	DEF VAR05=(R///$85745,$85745,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[375]"/320,50,150/440,50,60//);圆拉刀-磨削基准-B轴0度-头架中心-砂轮二-基准.Y
	DEF VAR06=(R///$85746,$85746,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[376]"/320,70,150/440,70,60//);圆拉刀-磨削基准-B轴0度-头架中心-砂轮二-基准.Z

	DEF MSG_3=(I///$85747,$85747,,/WR1///20,100,200/0,0,0//);
	DEF VAR07=(R///$85748,$85748,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[377]"/20,120,150/140,120,60//);圆拉刀-磨削基准-B轴90度-头架中心-砂轮一-基准.X
	DEF VAR08=(R///$85749,$85749,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[378]"/20,140,150/140,140,60//);圆拉刀-磨削基准-B轴90度-头架中心-砂轮一-基准.Y
	DEF VAR09=(R///$85750,$85750,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[379]"/20,160,150/140,160,60//);圆拉刀-磨削基准-B轴90度-头架中心-砂轮一-基准.Z

	DEF MSG_4=(I///$85751,$85751,,/WR1///320,100,200/0,0,0//);
	DEF VAR10=(R///$85752,$85752,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[380]"/320,120,150/440,120,60//);圆拉刀-磨削基准-B轴-90度-头架中心-砂轮二-基准.X
	DEF VAR11=(R///$85753,$85753,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[381]"/320,140,150/440,140,60//);圆拉刀-磨削基准-B轴-90度-头架中心-砂轮二-基准.Y
	DEF VAR12=(R///$85754,$85754,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[382]"/320,160,150/440,160,60//);圆拉刀-磨削基准-B轴-90度-头架中心-砂轮二-基准.Z

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
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);
	HS7=(["\\S_007.png",$85099],ac7,se3,pa0);磨削基准

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	LOAD
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
		
//END