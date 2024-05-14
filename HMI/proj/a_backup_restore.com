;***********************MASK0:备份恢复界面**********************
//M(Mask0/$85029//);

	DEF MODE_CHOICE=(I/*0=$87100,1=$87101,2=$87102//$87113,$87113,,/WR2,ac4//"/NC/_N_NC_GD2_ACX/CHOICE"/330,10,202/440,10,60//"UserGuide/section_60.html","S60D01");数据备份与恢复(0加工/1备份/2恢复)

	DEF BACKUP_AREA=(I/*0=$87115,2=$87117,3=$87118//$87103,$87103,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/BACKUP_POS"/330,40,110/440,40,80//"UserGuide/section_60.html","S60D02");备份存储位置
	DEF BACKUP_DIR=(S///$87104,$87104,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/BACKUP_DIR"/330,60,80/440,60,110//"UserGuide/section_60.html","S60D03");备份文件夹名称
	DEF BACKUP_NAME=(S///$87105,$87105,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/BACKUP_NAME"/330,80,80/440,80,110//"UserGuide/section_60.html","S60D04");备份程序名

	DEF BACKUP_TYPE=(I/*0=$87119,1=$87120//$87106,$87106,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/BACKUP_TYPE"/330,110,110/440,110,110//"UserGuide/section_60.html","S60D05");备份模式
	DEF LIST_DIR=(S///$87107,$87107,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/LIST_DIR"/330,130,80/440,130,110//"UserGuide/section_60.html","S60D06");列表文件夹名称
	DEF LIST_NAME=(S///$87108,$87108,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/LIST_NAME"/330,150,80/440,150,110//"UserGuide/section_60.html","S60D07");列表程序名
	DEF LIST_LINE_COUNT=(I/0,790//$87109,$87109,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/FILE_LINE_COUNT"/330,170,80/440,170,60//"UserGuide/section_60.html","S60D08");列表文件行数

	DEF RESTORE_AREA=(I/*0=$87115,1=$87116,2=$87117,3=$87118//$87110,$87110,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/RESTORE_POS"/330,40,110/440,40,80//"UserGuide/section_60.html","S60D09");存储位置
	DEF RESTORE_DIR=(S///$87111,$87111,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/RESTORE_DIR"/330,60,80/440,60,110//"UserGuide/section_60.html","S60D10");恢复文件夹名称
	DEF RESTORE_NAME=(S///$87112,$87112,,/WR4,ac4//"/NC/_N_NC_GD2_ACX/RESTORE_NAME"/330,80,80/440,80,110//"UserGuide/section_60.html","S60D11");恢复程序名

	DEF MSG=(S////WR4,ac4//"/NC/_N_NC_GD2_ACX/BR_MSG"/0,0,0/330,200,200/3,);

	HS8=(["\\S_010.png",$85073],ac7,se1,pa0);返回

	PRESS(HS8)
		MODE_CHOICE.VAL=0;退出时自动切换到加工
		EXIT
	END_PRESS

	CHANGE(BACKUP_TYPE)
		CALL("UP1")
	END_CHANGE

	CHANGE(MODE_CHOICE)
		CALL("UP1")
	END_CHANGE

	SUB(UP1)
		IF MODE_CHOICE.VAL==0
			BACKUP_TYPE.WR=4
			BACKUP_AREA.WR=4
			BACKUP_DIR.WR=4
			BACKUP_NAME.WR=4
			LIST_DIR.WR=4
			LIST_NAME.WR=4
			LIST_LINE_COUNT.WR=4
			RESTORE_AREA.WR=4
			RESTORE_DIR.WR=4
			RESTORE_NAME.WR=4
            MSG.WR=4
        ELSE
            MSG.WR=1
            IF MODE_CHOICE.VAL==1;备份
                BACKUP_TYPE.WR=2
				IF BACKUP_TYPE.VAL==0
					LIST_DIR.WR=4
					LIST_NAME.WR=4
					LIST_LINE_COUNT.WR=4
				ELSE
					LIST_DIR.WR=2
					LIST_NAME.WR=2
					LIST_LINE_COUNT.WR=2
				ENDIF
                BACKUP_AREA.WR=2
                BACKUP_DIR.WR=2
                BACKUP_NAME.WR=2
                
                RESTORE_AREA.WR=4
                RESTORE_DIR.WR=4
                RESTORE_NAME.WR=4
            ELSE
                BACKUP_TYPE.WR=4
                BACKUP_AREA.WR=4
                BACKUP_DIR.WR=4
                BACKUP_NAME.WR=4
				LIST_DIR.WR=4
                LIST_NAME.WR=4
                LIST_LINE_COUNT.WR=4
                RESTORE_AREA.WR=2
                RESTORE_DIR.WR=2
                RESTORE_NAME.WR=2
            ENDIF
		ENDIF
	END_SUB

//END
