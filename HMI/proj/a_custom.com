;***********************start:欢迎画面**********************
//S(Start)

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型

	HS7=(["\\S_001.png",$85064],ac7,se1,pa0)
	VS1=(["\\S_002.png",$85065],ac7,se1,pa0) 
	VS2=(["\\S_014.png",$85029],ac7,se1,pa0)
	VS8=(["\\sk_more_menu.png"," "],ac3,se1,pa2);扩展菜单 - 用户口令级别
	
	PRESS(HS7)
		LM("MASK51","a_grind.com");磨削界面加载 ifIsExternal
;
;
	END_PRESS

	PRESS(VS1)
		LM("Mask0","a_info.com")
	END_PRESS

	PRESS(VS2)
		LM("Mask0","a_backup_restore.com")
	END_PRESS

	PRESS(VS8)
		LS("MENU_1","a_custom.com",1);第三位参数设置是否保留原有按键，0 删除原有所有按键 / 1 保留原有按键加入新的按键
	END_PRESS
//END

//S(MENU_1)
	VS1=(["\\S_012.png",$85015],ac3,se1,pa0);机床配置
	VS8=(["\\sk_back_menu.png"," "],ac3,se1,pa2);

	PRESS(VS1)
		LM("Mask0","a_setting.com")
	END_PRESS

	PRESS(VS8)
		EXIT
	END_PRESS
//END
