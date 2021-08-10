//M(Mask0/$85029//);

	DEF MODE_CHOICE=(I/*0=$85956,1=$85957,2=$85958//$85955,$85955,,/WR2//"/NC/_N_NC_GD2_ACX/LADAO[158]"/330,10,202/440,10,60//);数据备份与恢复(0加工/1备份/2恢复)

	DEF BACKUP_AREA=(I/*0=$85322,2=$85324,3=$85326//$85959,$85959,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[159]"/330,40,110/440,40,60//);存储位置
	DEF BACKUP_DIR=(S///$85960,$85960,,/WR4//"/NC/_N_NC_GD2_ACX/BACKUP_DIR"/330,60,80/440,60,110/);文件夹名称
	DEF BACKUP_NAME=(S///$85961,$85961,,/WR4//"/NC/_N_NC_GD2_ACX/BACKUP_NAME"/330,80,80/440,80,110/);程序名

	DEF RESTORE_AREA=(I/*0=$85322,1=$85323,2=$85324,3=$85326//$85962,$85962,,/WR4//"/NC/_N_NC_GD2_ACX/LADAO[160]"/330,40,110/440,40,60//);存储位置
	DEF RESTORE_DIR=(S///$85963,$85963,,/WR4//"/NC/_N_NC_GD2_ACX/RESTORE_DIR"/330,60,80/440,60,110/);文件夹名称
	DEF RESTORE_NAME=(S///$85961,$85961,,/WR4//"/NC/_N_NC_GD2_ACX/RESTORE_NAME"/330,80,80/440,80,110/);程序名

	DEF MSG=(S////WR4//"/NC/_N_NC_GD2_ACX/BR_MSG"/0,0,0/330,120,200/3,);

	DEF TYPE=(I//0//WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF GRINDING_TYPE=(I//1//WR4//"/NC/_N_NC_GD2_ACX/RING[1]"/0,0,0/0,0,0//);螺纹/环形槽加工
	DEF VAR45=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	HS1=(["\\S_003.png",$85066],ac7,se1,pa0);磨削参数
	HS2=(["\\S_004.png",$85067],ac7,se1,pa0);工艺参数
	HS3=(["\\S_005.png",$85068],ac7,se1,pa0);修整参数
	HS4=(["\\S_006.png",$85069],ac7,se1,pa0);自动对刀  ifIsAuto
	HS5=(["\\S_003.png",$85076],ac7,se1,pa0);加工数据
	HS6=(["\\S_006.png",$85085],ac7,se1,pa0);对刀数据
	HS7=(["\\S_005.png",$85029],ac7,se3,pa0);备份恢复

	;

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

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

	CHANGE(MODE_CHOICE)
		IF MODE_CHOICE.VAL==0
			BACKUP_AREA.WR=4
			BACKUP_DIR.WR=4
			BACKUP_NAME.WR=4
			RESTORE_AREA.WR=4
			RESTORE_DIR.WR=4
			RESTORE_NAME.WR=4
            MSG.WR=4
        ELSE
            MSG.WR=1
            IF MODE_CHOICE.VAL==1;备份
                BACKUP_AREA.WR=2
                BACKUP_DIR.WR=2
                BACKUP_NAME.WR=2
                RESTORE_AREA.WR=4
                RESTORE_DIR.WR=4
                RESTORE_NAME.WR=4
            ELSE
                BACKUP_AREA.WR=4
                BACKUP_DIR.WR=4
                BACKUP_NAME.WR=4
                RESTORE_AREA.WR=2
                RESTORE_DIR.WR=2
                RESTORE_NAME.WR=2
            ENDIF
		ENDIF
	END_CHANGE

//END
