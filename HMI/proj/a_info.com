;**********************MASK0:出厂信息:panel_0:;**********************
//M(Mask0/$85024/"panel_0_1_chs.png"/)

	DEF VAR1=(B///$85060,$85060,,/WR1,ac7,al0,fs2,li0,cb0///120,150,300/0,0,0/);机床型号
	DEF VAR2=(B///$85061,$85061,,/WR1,ac7,al0,fs2,li0,cb0///120,200,300/0,0,0/);出厂编号
	DEF VAR3=(I///$85061,$85061,,/WR3,ac7,al0,fs2,li0,cb0//"/NC/_N_NC_GD2_ACX/INI[131]"/0,0,0/250,200,40/);出厂编号输入

	DEF COUNT=(I//0//WR4,ac4///0,0,0/0,0,0/);切换输入编号计数

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	VS3=("",ac3,se1,pa0);设置编号

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS3)
		COUNT.VAL=COUNT.VAL+1
		IF COUNT.VAL>=8
			VAR3.WR=2
		ENDIF
	END_PRESS

//END
