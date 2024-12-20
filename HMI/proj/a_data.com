;**************MASK0:基准数据:panel_0********************
//M(Mask0/$85766//)

	DEF MSG_1=(I///$85740,$85740,,/WR1///20,10,200/0,0,0/,,"#2b00ff"/);
	DEF VAR00=(R///$85741,$85741,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[371]"/20,30,150/140,30,60//"UserGuide/section_50.html","S50D01");圆拉刀-磨削基准-B轴0度-头架中心-砂轮一-基准.X
	DEF VAR02=(R///$85742,$85742,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[372]"/20,50,150/140,50,60//"UserGuide/section_50.html","S50D02");圆拉刀-磨削基准-B轴0度-头架中心-砂轮一-基准.Y
	DEF VAR03=(R///$85743,$85743,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[373]"/20,70,150/140,70,60//"UserGuide/section_50.html","S50D03");圆拉刀-磨削基准-B轴0度-头架中心-砂轮一-基准.Z

	DEF MSG_2=(I///$85740,$85740,,/WR1///320,10,200/0,0,0/,,"#2b00ff"/);
	DEF VAR04=(R///$85744,$85744,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[374]"/320,30,150/440,30,60//"UserGuide/section_50.html","S50D04");圆拉刀-磨削基准-B轴0度-头架中心-砂轮二-基准.X
	DEF VAR05=(R///$85745,$85745,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[375]"/320,50,150/440,50,60//"UserGuide/section_50.html","S50D05");圆拉刀-磨削基准-B轴0度-头架中心-砂轮二-基准.Y
	DEF VAR06=(R///$85746,$85746,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[376]"/320,70,150/440,70,60//"UserGuide/section_50.html","S50D06");圆拉刀-磨削基准-B轴0度-头架中心-砂轮二-基准.Z

	DEF MSG_3=(I///$85747,$85747,,/WR1///20,100,200/0,0,0/,,"#2b00ff"/);
	DEF VAR07=(R///$85748,$85748,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[377]"/20,120,150/140,120,60//"UserGuide/section_50.html","S50D07");圆拉刀-磨削基准-B轴90度-头架中心-砂轮一-基准.X
	DEF VAR08=(R///$85749,$85749,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[378]"/20,140,150/140,140,60//"UserGuide/section_50.html","S50D08");圆拉刀-磨削基准-B轴90度-头架中心-砂轮一-基准.Y
	DEF VAR09=(R///$85750,$85750,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[379]"/20,160,150/140,160,60//"UserGuide/section_50.html","S50D09");圆拉刀-磨削基准-B轴90度-头架中心-砂轮一-基准.Z

	DEF MSG_4=(I///$85751,$85751,,/WR1///320,100,200/0,0,0/,,"#2b00ff"/);
	DEF VAR10=(R///$85752,$85752,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[380]"/320,120,150/440,120,60//"UserGuide/section_50.html","S50D10");圆拉刀-磨削基准-B轴-90度-头架中心-砂轮二-基准.X
	DEF VAR11=(R///$85753,$85753,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[381]"/320,140,150/440,140,60//"UserGuide/section_50.html","S50D11");圆拉刀-磨削基准-B轴-90度-头架中心-砂轮二-基准.Y
	DEF VAR12=(R///$85754,$85754,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[382]"/320,160,150/440,160,60//"UserGuide/section_50.html","S50D12");圆拉刀-磨削基准-B轴-90度-头架中心-砂轮二-基准.Z

	DEF MSG_5=(I///$85761,$85761,,/WR1///20,190,200/0,0,0/,,"#2b00ff"/);
	DEF VAR13=(R/0,//$85762,$85762,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[383]"/20,210,150/140,210,60/,"#e1ffe3"/"UserGuide/section_50.html","S50D13");测量基准-测头距离砂轮一-径向距离
	DEF VAR14=(R/0,//$85763,$85763,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[384]"/20,230,150/140,230,60/,"#e1ffe3"/"UserGuide/section_50.html","S50D14");测量基准-测头距离砂轮一-轴向距离
	DEF VAR15=(R/0,//$85764,$85764,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[385]"/20,250,150/140,250,60/,"#e1ffe3"/"UserGuide/section_50.html","S50D15");测量基准-测头距离砂轮一-垂直距离

	DEF MSG_6=(I///$85765,$85765,,/WR1///320,190,200/0,0,0/,,"#2b00ff"/);
	DEF VAR16=(R/0,//$85762,$85762,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[392]"/320,210,150/440,210,60/,"#e1ffe3"/"UserGuide/section_50.html","S50D16");测量基准-测头距离砂轮二-径向距离
	DEF VAR17=(R/0,//$85763,$85763,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[393]"/320,230,150/440,230,60/,"#e1ffe3"/"UserGuide/section_50.html","S50D17");测量基准-测头距离砂轮二-轴向距离
	DEF VAR18=(R/0,//$85764,$85764,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[394]"/320,250,150/440,250,60/,"#e1ffe3"/"UserGuide/section_50.html","S50D18");测量基准-测头距离砂轮二-垂直距离

	DEF LOAD_YUANLADAO=(I////WR4//"/NC/_N_NC_GD2_ACX/LADAO[257]"/0,0,0/0,0,0);是否有圆拉刀

	LOAD
		LS("MENU_1");默认调用 MENU_1
		VS1.SE=3

		IF LOAD_YUANLADAO.VAL==0
			MSG_1.WR=4
			VAR00.WR=4
			VAR02.WR=4
			VAR03.WR=4
			MSG_2.WR=4
			VAR04.WR=4
			VAR05.WR=4
			VAR06.WR=4
			MSG_3.WR=4
			VAR07.WR=4
			VAR08.WR=4
			VAR09.WR=4
			MSG_4.WR=4
			VAR10.WR=4
			VAR11.WR=4
			VAR12.WR=4
		ENDIF
	END_LOAD
//END

;**************MASK1:基准校准********************
//M(Mask1/$85767//)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM
	DEF Y_IM=(R///$85126,$85126,,/WR1//"$AA_IM[Y]"/120,10,20/140,10,60/3);Y_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/230,10,20/250,10,60/3);Z_IM
	DEF A_IM=(R///$85122,$85122,,/WR1//"$AA_IM[A]"/10,30,20/30,30,60/3);A_IM
	DEF B_IM=(R///$85121,$85121,,/WR1//"$AA_IM[B]"/120,30,20/140,30,60/3);B_IM

	DEF LINE0=(V///$85755,$85755,,/WR1,ac4///10,60,300/0,,0/,,"#2b00ff");
	DEF MSG0=(I///$85768,$85768,,/WR1///10,80,400/0,0,0/,,"#2b00ff"/);
	DEF VAR00=(R///$85769,$85769,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[314]"/10,100,200/200,100,60//"UserGuide/section_51.html","S51D01");砂轮1-基准磨杆1_长度(磨杆1需要长于磨杆2)
	DEF VAR01=(R///$85770,$85770,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[315]"/10,120,200/200,120,60//"UserGuide/section_51.html","S51D02");砂轮1-基准磨杆1_直径
	DEF VAR02=(R///$85771,$85771,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[361]"/10,140,200/200,140,60//"UserGuide/section_51.html","S51D03");砂轮1-基准磨杆1_B轴0度_A轴0度_向前接触坐标_X
	DEF VAR03=(R///$85772,$85772,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[316]"/290,100,200/470,100,60//"UserGuide/section_51.html","S51D04");砂轮1-基准磨杆1_B轴0度_A轴0度_向左接触坐标_Z
	DEF VAR04=(R///$85773,$85773,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[317]"/290,120,200/470,120,60//"UserGuide/section_51.html","S51D05");砂轮1-基准磨杆1_B轴0度_A轴0度_向下接触坐标_Y
	DEF VAR05=(R///$85774,$85774,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[318]"/290,140,200/470,140,60//"UserGuide/section_51.html","S51D06");砂轮1-基准磨杆1_B轴0度_A轴90度_向左接触坐标_Z
	DEF VAR06=(R///$85775,$85775,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[319]"/290,160,200/470,160,60//"UserGuide/section_51.html","S51D07");砂轮1-基准磨杆1_B轴0度_A轴90度_向下接触坐标_Y

	DEF VAR16=(R///$85777,$85777,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[326]"/10,160,200/200,160,60/"#02be76"/"UserGuide/section_51.html","S51D08");砂轮1-基准长度(磨杆长度为0时)
	DEF VAR17=(R///$85778,$85778,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[327]"/10,180,200/200,180,60/"#02be76"/"UserGuide/section_51.html","S51D09");砂轮1-中心偏移(磨杆距离回转中心偏移)

	DEF LINE2=(V///$85755,$85755,,/WR1,ac4///10,200,300/0,,0/,,"#2b00ff");
	DEF MSG2=(I///$85779,$85779,,/WR1///10,220,400/0,0,0/,,"#2b00ff"/);
	DEF VAR20=(R///$85769,$85769,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[328]"/10,240,200/200,240,60//"UserGuide/section_51.html","S51D10");砂轮2-基准磨杆1_长度(磨杆1需要长于磨杆2)
	DEF VAR21=(R///$85770,$85770,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[329]"/10,260,200/200,260,60//"UserGuide/section_51.html","S51D11");砂轮2-基准磨杆1_直径
	DEF VAR22=(R///$85771,$85771,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[362]"/10,280,200/200,280,60//"UserGuide/section_51.html","S51D12");砂轮2-基准磨杆1_B轴0度_A轴0度_向前接触坐标_X
	DEF VAR23=(R///$85800,$85800,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[330]"/290,240,200/470,240,60//"UserGuide/section_51.html","S51D13");砂轮2-基准磨杆1_B轴180度_A轴0度_向左接触坐标_Z
	DEF VAR24=(R///$85801,$85801,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[331]"/290,260,200/470,260,60//"UserGuide/section_51.html","S51D14");砂轮2-基准磨杆1_B轴180度_A轴0度_向下接触坐标_Y
	DEF VAR25=(R///$85802,$85802,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[332]"/290,280,200/470,280,60//"UserGuide/section_51.html","S51D15");砂轮2-基准磨杆1_B轴180度_A轴90度_向左接触坐标_Z
	DEF VAR26=(R///$85803,$85803,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[333]"/290,300,200/470,300,60//"UserGuide/section_51.html","S51D16");砂轮2-基准磨杆1_B轴180度_A轴90度_向下接触坐标_Y

	DEF VAR36=(R///$85777,$85777,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[340]"/10,300,200/200,300,60/"#02be76"/"UserGuide/section_51.html","S51D17");砂轮2-基准长度(磨杆长度为0时)
	DEF VAR37=(R///$85778,$85778,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[341]"/10,320,200/200,320,60/"#02be76"/"UserGuide/section_51.html","S51D18");砂轮2-中心偏移(磨杆距离回转中心偏移)

	DEF LINE4=(V///$85755,$85755,,/WR1,ac4///10,340,300/0,,0/,,"#2b00ff");
	DEF MSG4=(I///$85781,$85781,,/WR1///10,360,400/0,0,0/,,"#2b00ff"/);
	DEF VAR40=(R///$85782,$85782,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[344]"/10,380,200/200,380,60//"UserGuide/section_51.html","S51D19");A轴测量角度1(大于零的一个角度)
	DEF VAR41=(R///$85783,$85783,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[345]"/290,380,200/470,380,60//"UserGuide/section_51.html","S51D20");A轴测量角度2(大于零的一个角度)

	DEF LINE5=(V///$85755,$85755,,/WR1,ac4///10,400,300/0,,0/,,"#2b00ff");
	DEF MSG5=(I///$85784,$85784,,/WR1///10,420,400/0,0,0/,,"#2b00ff"/);
	DEF VAR50=(R///$85785,$85785,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[342]"/10,440,200/200,440,60//"UserGuide/section_51.html","S51D21");测头1-测头总长度(包括前端球)
	DEF VAR51=(R///$85786,$85786,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[343]"/10,460,200/200,460,60//"UserGuide/section_51.html","S51D22");测头1-测头测量球半径
	DEF VAR52=(R///$85787,$85787,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[366]"/10,480,200/200,480,60//"UserGuide/section_51.html","S51D23");测头1-B轴0度_A轴测量角度1_向前接触坐标_X
	DEF VAR53=(R///$85788,$85788,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[346]"/290,440,200/470,440,60//"UserGuide/section_51.html","S51D24");测头1-B轴0度_A轴测量角度1_向右接触坐标_Z
	DEF VAR54=(R///$85789,$85789,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[347]"/290,460,200/470,460,60//"UserGuide/section_51.html","S51D25");测头1-B轴0度_A轴测量角度1_向下接触坐标_Y

	DEF LINE6=(V///$85755,$85755,,/WR1,ac4///10,500,300/0,,0/,,"#2b00ff");
	DEF MSG6=(I///$85794,$85794,,/WR1///10,520,400/0,0,0/,,"#2b00ff"/);
	DEF VAR60=(R///$85785,$85785,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[352]"/10,540,200/200,540,60//"UserGuide/section_51.html","S51D26");测头2-测头总长度(包括前端球)
	DEF VAR61=(R///$85786,$85786,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[353]"/10,560,200/200,560,60//"UserGuide/section_51.html","S51D27");测头2-测头测量球半径
	DEF VAR62=(R///$85788,$85788,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[354]"/290,560,200/470,560,60//"UserGuide/section_51.html","S51D28");测头2-B轴0度_A轴测量角度1_向右接触坐标_Z
	DEF VAR63=(R///$85789,$85789,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[355]"/290,580,200/470,580,60//"UserGuide/section_51.html","S51D29");测头2-B轴0度_A轴测量角度1_向下接触坐标_Y
	DEF VAR64=(R///$85790,$85790,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[356]"/290,600,200/470,600,60//"UserGuide/section_51.html","S51D30");测头2-B轴0度_A轴测量角度2_向右接触坐标_Z
	DEF VAR65=(R///$85791,$85791,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[357]"/290,620,200/470,620,60//"UserGuide/section_51.html","S51D31");测头2-B轴0度_A轴测量角度2_向下接触坐标_Y

	DEF VAR66=(R///$85795,$85795,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[358]"/10,580,200/200,580,60/"#02be76"/"UserGuide/section_51.html","S51D32");测头-A轴0度时测量杆和垂直方向的夹角
	DEF VAR67=(R///$85796,$85796,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[359]"/10,600,200/200,600,60/"#02be76"/"UserGuide/section_51.html","S51D33");测头-基准长度(测量杆长度为0时)
	DEF VAR68=(R///$85797,$85797,,/WR1//"/NC/_N_NC_GD2_ACX/LADAO[360]"/10,620,200/200,620,60/"#02be76"/"UserGuide/section_51.html","S51D34");测头-中心偏移(测量杆距离回转中心的偏移距离)

	DEF CALC=(I/*0=$85041,1=$85040//$85767,$85767,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[313]"/360,10,100/470,10,60/,"#ffc5c5","#ff0000"/"UserGuide/section_51.html","S51D35");测头-砂轮-相对位置计算(0否1是)

	LOAD
		LS("MENU_1");默认调用 MENU_1
		VS2.SE=3
	END_LOAD
//END

//S(MENU_1)

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀 ifIsAuto
	HS5=(["\\S_008.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_007.png",$85085],ac7,se1,pa0);
	HS7=(["\\S_009.png",$85099],ac7,se3,pa0);磨削基准
	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS1=($85766,ac7,se1);基准数据
	VS2=($85767,ac7,se1);基准校准

	PRESS(HS1)
		LM("MASK51","a_grind.com")
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
		LM("MASK0","a_data.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK1","a_data.com")
	END_PRESS

//END
