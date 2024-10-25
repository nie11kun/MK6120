<!--
  nc 程序 msg 信息文本，可以实现根据系统语言自动切换程序中 msg 信息显示语言，可用编号范围：1 ~ 999999
  将此语言文件放入 oem - sinumerik - hmi - lng 目录，修改后需要重启 HMI 生效
  程序调用方法：MSG("$1")
  导入系统后，可在 "调试 - HMI - 报警文本 - 制造商零件程序消息文本" 中查看条目，可以修改每条消息是否弹出显示
  不可修改 name 标签 text 内容，增加条目只需要增加新的 message 标签即可
  此方式缺点是不可以串联插入全局变量
-->

<!DOCTYPE TS>
<TS>
  <context>
    <name>partprogmsg01</name>
    <message>
      <source>11</source>
      <translation>恢复完成</translation>
    </message>
  </context>
</TS>
