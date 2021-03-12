;
;+++++++++++++++++++++++++++++++

;**********************MASK9:齿形参数_双圆弧:panel_9:;**********************
//M(Mask9/$85385/"panel_9_14_chs.png"/)

	DEF VAR3=(R/0,90//$85433,$85433,,$85042/WR2//"/NC/_N_NC_GD2_ACX/DARC[5]"/70,30,125/180,30,110/);接触角
	DEF VAR4=(R/0,50//$85425,$85432,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC[4]"/70,50,125/180,50,110/);钢球直径

	DEF VAR5=(R/0,50//$85434,$85434,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[6]"/0,0,0/170,103,60/);初始左滚道
	DEF VAR6=(R/0,50//$85435,$85435,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[7]"/0,0,0/170,128,60/);初始右滚道

	DEF VAR7=(R/-10,50//$85436,$85436,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[8]"/0,0,0/260,103,60/);调整左滚道
	DEF VAR8=(R/-10,50//$85437,$85437,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[9]"/0,0,0/260,128,60/);调整右滚道

	DEF VAR9=(R/0,50//$85438,$85438,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[10]"/0,0,0/350,103,60/);当前左滚道
	DEF VAR10=(R/0,50//$85439,$85439,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[11]"/0,0,0/350,128,60/);当前右滚道

	DEF VAR11=(R///$85441,$85441,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[21]"/0,0,0/170,178,60/);原始左滚道水平偏心
	DEF VAR12=(R///$85442,$85442,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[22]"/0,0,0/170,203,60/);原始右滚道水平偏心
	DEF VAR13=(R///$85443,$85443,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[23]"/0,0,0/170,228,60/);原始左滚道垂直偏心
	DEF VAR14=(R///$85444,$85444,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[24]"/0,0,0/170,252,60/);原始右滚道垂直偏心

	DEF VAR15=(R///$85449,$85449,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[17]"/0,0,0/260,178,60/);左滚道水平偏心调整
	DEF VAR16=(R///$85450,$85450,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[18]"/0,0,0/260,203,60/);右滚道水平偏心调整
	DEF VAR17=(R///$85451,$85451,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[19]"/0,0,0/260,228,60/);左滚道垂直偏心调整
	DEF VAR18=(R///$85452,$85452,,/WR2//"/NC/_N_NC_GD2_ACX/DARC[20]"/0,0,0/260,252,60/);右滚道垂直偏心调整
	
	DEF VAR31=(R///$85453,$85453,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[13]"/0,0,0/350,178,60/);当前左滚道水平偏心
	DEF VAR32=(R///$85454,$85454,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[14]"/0,0,0/350,203,60/);当前右滚道水平偏心
	DEF VAR33=(R///$85455,$85455,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[15]"/0,0,0/350,228,60/);当前左滚道垂直偏心
	DEF VAR34=(R///$85456,$85456,,/WR1//"/NC/_N_NC_GD2_ACX/DARC[16]"/0,0,0/350,252,60/);当前右滚道垂直偏心
	
	DEF VAR30=(R////WR4//"/NC/_N_NC_GD2_ACX/DARC[1]"/0,0,0/0,0,0/);齿高
	
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
	VS3=($85385,ac7,se3);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se1);"方滚轮" ifIsSingleAndRound
;
	VS7=($85379,ac7,se2);"滚压轮"
;

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","a_grind.com")
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
		LM("MASK7","a_shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","a_shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","a_shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","a_dressware.com")
		ELSE;XZ/X
			LM("MASK12","a_dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","a_dressware.com")
		ELSE;XZ/X
			LM("MASK13","a_dressware.com")
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
	
	CHANGE(VAR3)
		call("UP1")
	END_CHANGE
	
	CHANGE(VAR4)
		call("UP1")
	END_CHANGE

    CHANGE(VAR5)
	    VAR30.VAL=VAR5.VAL
	    VAR9.VAL=VAR5.VAL+VAR7.VAL
	END_CHANGE	
	
	CHANGE(VAR6)
	    VAR10.VAL=VAR6.VAL+VAR8.VAL
	END_CHANGE
	
	CHANGE(VAR7)
		VAR9.VAL=VAR5.VAL+VAR7.VAL
	END_CHANGE

    CHANGE(VAR8)
		VAR10.VAL=VAR6.VAL+VAR8.VAL
	END_CHANGE

    CHANGE(VAR11)
		call("UP3")
	END_CHANGE

    CHANGE(VAR12)
		call("UP3")
	END_CHANGE

    CHANGE(VAR13)
		call("UP3")
	END_CHANGE

    CHANGE(VAR14)
		call("UP3")
	END_CHANGE

    CHANGE(VAR15)
		call("UP3")
	END_CHANGE

    CHANGE(VAR16)
		call("UP3")
	END_CHANGE	
	
	CHANGE(VAR17)
		call("UP3")
	END_CHANGE
	
	CHANGE(VAR18)
		call("UP3")
	END_CHANGE
	
    SUB(UP1)
		IF (VAR4.VAL==1.588 OR VAR4.VAL==2.381 OR VAR4.VAL==3.175 OR VAR4.VAL==3.969 OR VAR4.VAL==4.763 OR VAR4.VAL==5.953 OR VAR4.VAL==7.144 OR VAR4.VAL==9.525 OR VAR4.VAL==12.7) AND (VAR3.VAL==45)
			IF VAR4.VAL==1.588
				VAR5.VAL=0.881
				VAR6.VAL=0.881
			ELSE
				IF VAR4.VAL==2.381
					VAR5.VAL=1.321
					VAR6.VAL=1.321
				ELSE
					IF VAR4.VAL==3.175
						VAR5.VAL=1.762
						VAR6.VAL=1.762
					ELSE
						IF VAR4.VAL==3.969
							VAR5.VAL=2.203
							VAR6.VAL=2.203
						ELSE
							IF VAR4.VAL==4.763
								VAR5.VAL=2.643
								VAR6.VAL=2.643
							ELSE
								IF VAR4.VAL==5.953
									VAR5.VAL=3.304
									VAR6.VAL=3.304
								ELSE
									IF VAR4.VAL==7.144
										VAR5.VAL=3.965
										VAR6.VAL=3.965
									ELSE
										IF VAR4.VAL==9.525
											VAR5.VAL=5.286
											VAR6.VAL=5.286
										ELSE
											IF VAR4.VAL==12.7
												VAR5.VAL=7.049
												VAR6.VAL=7.049
											ENDIF
										ENDIF
									ENDIF
								ENDIF
							ENDIF
						ENDIF
					ENDIF
				ENDIF
			ENDIF
			VAR9.VAL=VAR5.VAL+VAR7.VAL
			VAR10.VAL=VAR6.VAL+VAR8.VAL
			VAR5.WR=1
			VAR6.WR=1
			VAR11.WR=1
			VAR12.WR=1
			VAR13.WR=1
			VAR14.WR=1
			call("UP2")
			call("UP3")
		ELSE
			VAR11.WR=2
			VAR12.WR=2
			VAR13.WR=2
			VAR14.WR=2
			VAR5.WR=2
			VAR6.WR=2
			VAR9.VAL=VAR5.VAL+VAR7.VAL
			VAR10.VAL=VAR6.VAL+VAR8.VAL
			call("UP3")
		ENDIF
	END_SUB
	
    SUB(UP2)
		IF VAR5.VAL<>0
			IF VAR6.VAL<>0
				VAR11.VAL=(VAR5.VAL-VAR4.VAL/2)*SIN(VAR3.VAL*PI/180)
				VAR12.VAL=(VAR6.VAL-VAR4.VAL/2)*SIN(VAR3.VAL*PI/180)
				VAR13.VAL=(VAR5.VAL-VAR4.VAL/2)*COS(VAR3.VAL*PI/180)
				VAR14.VAL=(VAR6.VAL-VAR4.VAL/2)*COS(VAR3.VAL*PI/180)
			ENDIF
		ENDIF
	END_SUB

    SUB(UP3)
		VAR31.VAL=VAR11.VAL+VAR15.VAL
		VAR32.VAL=VAR12.VAL+VAR16.VAL
		VAR33.VAL=VAR13.VAL+VAR17.VAL
		VAR34.VAL=VAR14.VAL+VAR18.VAL
	END_SUB
	
//END
