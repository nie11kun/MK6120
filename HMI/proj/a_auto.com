;**************MASK21:内/外/磨削中心自动对刀:panel_21********************
//M(Mask21/$85026/"panel_21_2_chs.png"/)
	;+++++++++++++++++++++++++++++++++++++++
	;ifIsKaiGuanCeLiangBegin
	DEF KAIGUAN=(I//1//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[32]"/0,0,0/0,0,0);自动对刀是否有接近开关测量机构
	DEF KAIGUAN_1=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[52]"/0,0,0/0,0,0);接近开关(0-测量机构1/1-测量机构2)
	DEF CETOU=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[50]"/0,0,0/0,0,0);自动对刀是否有测量头测量结构
	;ifIsKaiGuanCeLiangEnd

	;

	;

	;如果是磨削中心屏蔽下面参数++++++++++++++++++
	;ifIsNotCenterBegin
	DEF VAR3=(R/-500,500//$85505,$85505,,$85043/WR4/"panel_21_6_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[24]"/330,70,110/440,70,110/7,10/"UserGuide/section_5.html","S5D18");内螺纹测头球中心/接近开关探测面与磨杆距离(X向)
	;ifIsNotCenterEnd

	;

	DEF VAR0=(R/-100,100//$85529,$85529,,$85043/WR2/"panel_21_31_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[42]"/320,10,150/440,10,110//"UserGuide/section_5.html","S5D1");对刀结果调整

	DEF VAR1=(R/-2000,2000//$85528,$85528,,$85043/WR4/"panel_21_1_chs.png"/"/NC/_N_NC_GD2_ACX/INI[43]"/320,40,150/440,40,110/7,10/"UserGuide/section_5.html","S5D2");砂轮中心与接近开关重合Z坐标，外螺纹自动对刀用
	DEF VAR16=(R/-2000,2000//$85535,$85535,,$85043/WR4/"panel_21_1_chs.png"/"/NC/_N_NC_GD2_ACX/INI[43]"/320,40,150/440,40,110/7,10/"UserGuide/section_5.html","S5D3");砂轮中心与测头中心重合Z坐标，外螺纹自动对刀用

	DEF VAR17=(R/-2000,2000//$85536,$85536,,$85043/WR4/"panel_21_1_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[51]"/320,70,150/440,70,110/7,10/"UserGuide/section_5.html","S5D4");外螺纹自动对刀测量头中心(左)到接近开关(右)的水平距离

	DEF VAR2=(R/-2000,2000//$85503,$85503,,$85043/WR4/"panel_21_4_chs.png"/"/NC/_N_NC_GD2_ACX/INI[49]"/330,40,110/440,40,110//"UserGuide/section_5.html","S5D5");内螺纹自动对刀测头Z轴方向起始位置

	DEF VAR4=(R/-500,500//$85527,$85527,,$85043/WR4/"panel_21_7_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[11]"/330,90,110/440,90,110/7,10/"UserGuide/section_5.html","S5D6");内螺纹测头/开关与砂轮距离(Z向)

	DEF VAR7=(R/-2000,2000//$85513,$85513,,$85043/WR4/"panel_21_10_chs.png"/"/NC/_N_NC_GD2_ACX/INI[53]"/330,120,110/440,120,110//"UserGuide/section_5.html","S5D7");内螺纹自动对刀开关测量方式下，开关进入工件开始测量Z起始位置
	DEF VAR8=(R/0,359//$85504,$85504,,$85042/WR4/"panel_21_5_chs.png"/"/NC/_N_NC_GD2_ACX/INI[50]"/330,120,110/440,120,110//"UserGuide/section_5.html","S5D8");内螺纹测头自动对刀工件C方向合适角度

	DEF VAR5=(R/0,500//$85512,$85512,,$85043/WR4/"panel_21_9_chs.png"/"/NC/_N_NC_GD2_ACX/INI[52]"/330,150,110/440,150,110//"UserGuide/section_5.html","S5D9");内螺纹工件小径(开关)
	DEF VAR6=(R/0,500//$85506,$85506,,$85043/WR4/"panel_21_8_chs.png"/"/NC/_N_NC_GD2_ACX/INI[35]"/330,150,110/440,150,110//"UserGuide/section_5.html","S5D10");内螺纹工件大径(测量头)

	DEF VAR9=(R/0,10//$85507,$85507,,$85043/WR4/"panel_21_11_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[10]"/330,180,110/440,180,110//"UserGuide/section_5.html","S5D11");测头半径

	DEF VAR10=(R/0,500//$85508,$85508,,$85043/WR4/"panel_21_12_chs.png"/"/NC/_N_NC_GD2_ACX/INI[36]"/330,210,110/440,210,110//"UserGuide/section_5.html","S5D12");工件端面到反相器孔距离

	DEF VAR15=(R/0,100//$85531,$85531,,$85043/WR2/"panel_21_23_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[55]"/330,240,110/440,240,110//"UserGuide/section_5.html","S5D13");缺口的深度

	DEF VAR11=(I/*0=$85510,1=$85511//$85509,,,/WR4/"panel_21_3_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[23]"/0,0,0/440,270,60//"UserGuide/section_5.html","S5D14");(0=圆形孔,1=腰型孔)

	DEF VAR12=(R/0,359//$85514,$85514,,$85042/WR4/"panel_21_20_chs.png"/"/NC/_N_NC_GD2_ACX/INI[32]"/330,300,110/440,300,110//"UserGuide/section_5.html","S5D15");腰型孔角度(展开图尺寸)
	DEF VAR13=(R/0,100//$85515,$85515,,$85043/WR4/"panel_21_21_chs.png"/"/NC/_N_NC_GD2_ACX/INI[33]"/330,320,110/440,320,110//"UserGuide/section_5.html","S5D16");腰型孔长(展开图尺寸)
	DEF VAR14=(R/0,100//$85516,$85516,,$85043/WR4/"panel_21_22_chs.png"/"/NC/_N_NC_GD2_ACX/INI[34]"/330,340,110/440,340,110//"UserGuide/section_5.html","S5D17");腰型孔宽(展开图尺寸)

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	DEF SIGNAL=(I/*0=$85013,1=$85014//$85534,$85534,,/WR1//"/Plc/DB2700.DBX1.0"/10,10,40/50,10,50/);测头信号

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	;
	HS4=(["\\S_006.png",$85069],ac7,se3,pa0);自动对刀 ifIsAuto

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

;

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK51","a_grind.com")
		ELSE
			LM("MASK18","a_grind.com")
		ENDIF
	END_PRESS

	PRESS(HS2)
		IF TECH.VAL==0;基本工艺
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

	PRESS(VS1)
		LM("MASK50","a_auto.com")
	END_PRESS
	
	CHANGE(CETOU)
		call("UP1")
	END_CHANGE

	CHANGE(KAIGUAN)
		call("UP1")
	END_CHANGE

	CHANGE(VAR11)
		call("UP1")
	END_CHANGE

	SUB(UP1)
		IF TYPE.VAL<>1;不是内螺纹
			IF CETOU.VAL==0
				VAR1.WR=2
				VAR16.WR=4
				VAR17.WR=4
			ELSE
				VAR1.WR=4
				VAR16.WR=2
				IF KAIGUAN.VAL==0
					VAR17.WR=4
				ELSE
					VAR17.WR=2
				ENDIF
			ENDIF
			VAR2.WR=4
			VAR3.WR=4
			VAR4.WR=4
			VAR5.WR=4
			VAR6.WR=4
			VAR7.WR=4
			VAR8.WR=4
			VAR9.WR=4
			VAR10.WR=4
			VAR11.WR=4
			VAR12.WR=4
			VAR13.WR=4
			VAR14.WR=4
			VAR15.WR=4
			VAR20.WR=4
			VAR21.WR=4
			VAR22.WR=4
			VAR23.WR=4
			VAR24.WR=4
			VAR25.WR=4
			VAR26.WR=4
			VAR27.WR=4
			VAR28.WR=4
		ELSE
			VAR1.WR=4
			VAR16.WR=4
			VAR17.WR=4
			VAR2.WR=2
			VAR3.WR=2
			VAR4.WR=2
			IF (KAIGUAN.VAL==1) AND (CETOU.VAL==0);接近开关测量结构
				VAR5.WR=2
				VAR6.WR=4
				VAR7.WR=2
				VAR8.WR=4
				VAR9.WR=4
				VAR10.WR=4
				VAR11.WR=4
				VAR12.WR=4
				VAR13.WR=4
				VAR14.WR=4
				VAR15.WR=4
				VAR20.WR=4
				VAR21.WR=4
				VAR22.WR=4
				VAR23.WR=4
				VAR24.WR=4
				VAR25.WR=4
				VAR26.WR=4
				VAR27.WR=4
				VAR28.WR=4
			ELSE
				IF (KAIGUAN.VAL==0) AND (CETOU.VAL==1);测量头测量结构
					VAR5.WR=4
					VAR6.WR=2
					VAR7.WR=4
					VAR8.WR=2
					VAR9.WR=2
					VAR10.WR=2
					VAR11.WR=2
					VAR15.WR=2
					VAR20.WR=2
					VAR21.WR=2
					VAR22.WR=2
					VAR23.WR=2
					VAR24.WR=2
					VAR25.WR=2
					VAR26.WR=2
					VAR27.WR=2
					VAR28.WR=2
					IF VAR11.VAL==0;圆形孔
						YUANKONGWEIZHI.WR=2
						VAR12.WR=4
						VAR13.WR=4
						VAR14.WR=4
					ELSE
						YUANKONGWEIZHI.WR=4
						YUANKONGWEIZHI.VAL=0
						VAR12.WR=2
						VAR13.WR=2
						VAR14.WR=2
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	END_SUB

//END

;
