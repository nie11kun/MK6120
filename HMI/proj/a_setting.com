;***********************机床配置界面**********************
//M(Mask0/$85038//);

	DEF PASSWD_CHECK=(V//0/$87300,$87300,,/WR2,ac4,DT5///10,10,110/150,10,150//);口令验证
	DEF PASSWD_SOURCE=(I//353121//WR4,ac4///0,0,0/450,350,100/"#78c0c7"/);口令解密源码

	DEF MSG=(S////WR1,ac4///0,0,0/330,10,200/"#FF0000",);

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS3=("",ac3,se1,pa0);显示密钥

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS3)
		IF PASSWD_SOURCE.WR==4
			PASSWD_SOURCE.WR=1
		ELSE
			PASSWD_SOURCE.WR=4
		ENDIF
	END_PRESS

	CHANGE(PASSWD_CHECK)
		IF PASSWD_CHECK.VAL<>0
			IF PASSWD_CHECK.VAL==CALC_FLOOR(SQRT(PASSWD_SOURCE.VAL)*1000)
				LM("Mask1","a_setting.com")
			ELSE
				MSG.VAL="口令错误"
			ENDIF
		ENDIF
	END_CHANGE
//END

//M(Mask1/$85015//);

	;基础配置
	DEF MSG_1=(V///$87304,$87304,,/WR1,ac4///10,,200/0,,0/,,"#FF0000");
	
	DEF VAR_1=(I/*0=$87306,1=$87307//$87305,$87305,,/WR2,ac4//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[310]"/10,,200/250,,120//);几何轴排列选择(0XYZ/1YZX)
	DEF VAR_2=(I/*0=$87309,1=$87310//$87308,$87308,,/WR2,ac4//"/NC/_N_NC_GD2_ACX/LADAO[257]"/10,,200/250,,120//);是否有圆拉刀(0无1有)
	DEF VAR_3=(I/*0=$87312,1=$87313//$87311,$87311,,/WR2,ac4//"/NC/_N_NC_GD2_ACX/LADAO[335]"/10,,200/250,,120//);输入输出信号检测模式(0:$A_DBB/1:$A_IN)
	DEF VAR_4=(I/*0=$87309,1=$87310//$87314,$87314,,/WR2,ac4//"/NC/_N_NC_GD2_ACX/LADAO[499]"/10,,200/250,,120//);自动对刀-是否有第二基准测头(0无1有)
	DEF VAR_5=(I/*0=$87309,1=$87310//$87315,$87315,,/WR2,ac4//"/NC/_N_NC_GD2_ACX/LADAO[501]"/10,,200/250,,120//);是否有左后修整器(0无1有)
	DEF VAR_6=(I/*0=$87309,1=$87310//$87316,$87316,,/WR2,ac4//"/NC/_N_NC_GD2_ACX/LADAO[502]"/10,,200/250,,120//);测头气缸控制(0无1有)

	DEF LINE_1=(V///$87303,$87303,,/WR1,ac4///10,,300/0,,0/,,"#2b00ff");
	;***********************************************

	DEF RESET_COMFIRM=(I//0//WR4,ac4///0,0,0/0,0,0/);参数重置判断参数

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS3=($85016,ac3,se1,pa0);重置配置

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS3)
		LM("Mask2","a_setting.com",1,RESET_COMFIRM)
		IF RESET_COMFIRM.VAL==1;如果为1则重置参数
			call("UP1")
			DLGL("数据重置完成")
		ELSE
			DLGL("数据重置取消")
		ENDIF
	END_PRESS

	SUB(UP1)
		VAR_1.VAL=0;
		VAR_2.VAL=0;
		VAR_3.VAL=0;
		VAR_4.VAL=0;
		VAR_5.VAL=0;
		VAR_6.VAL=0;
	END_SUB
//END

//M(Mask2/$85015//)

	DEF MSG=(I///$87301,$87301,,/WR1,ac4///180,170,220/0,0,0/,,"#000000");
	DEF TITLE=(I///$87302,$87302,,/WR1,ac4///250,120,220/0,0,0/,,"#ffffff");

	VS7=(["\\sk_cancel.png",$85034],ac7,se1,pa3);
	VS8=(["\\sk_ok.png",$85035],ac7,se1,pa3);

	LOAD
		;RECT(0,0,560,370,"#627898","#627898",1);
		RECT(100,118,360,22,"#2d5aaf","#2d5aaf",1);
		RECT(100,140,360,90,"#2d5aaf","#dbe2e6",1);
	END_LOAD

	PRESS(VS7)
		EXIT(0);退出当前对话框，返回上一个对话框，并且将值给之前对话框变量
	END_PRESS

	PRESS(VS8)
		EXIT(1);退出当前对话框，返回上一个对话框，并且将值给之前对话框变量
	END_PRESS
//END
