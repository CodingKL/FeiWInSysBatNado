
Shell脚本记录日志到文件
		https://www.cnblogs.com/peterYong/p/13616770.html

shell脚本基本技能是设置变量，输出信息。

1、记录日志
	sh脚本输出到控制台，并且写入日志文件：

#!/bin/bash
#文件名：test.sh
name="xiongzaiqiren"
echo $name

echo "BACKUP DATE:" $(date +"%Y-%m-%d %H:%M:%S")

DATE=`date '+%Y%m%d-%H%M%S'`
echo $DATE

LogNameDATE=`date '+%Y%m%d'`

echo " " >> log$LogNameDATE.log
echo "———————————————–" >> log$LogNameDATE.log
echo "BACKUP DATE:" $(date +"%Y-%m-%d %H:%M:%S") >> log$LogNameDATE.log
echo "———————————————– " >> log$LogNameDATE.log

注：` 是LInux中编辑时，键盘上数字1左边的键。                                                                                                          


执行脚本，会在当前目录下生成  log20190826.log文件，打开它发现成功写入日志信息：

2、时间格式输出
	当前日期格式输出：
	#将当前时间和包含换行符的文本内容输出到文件
	echo -e $(date) "\nHello World !" >> test.txt
	echo -e $(date) "\nHello World !" >> test1.txt
	echo -e $(date) "\nHello World !" >> test2.txt
	echo -e $(date) "\nHello World" >> test3.txt
	echo -e $(date) "\nHello World !" >> test4.txt
	echo -e $(date) "\nHello World!" >> test5.txt
	echo -e "OK! \n" # -e 开启转义

	echo -e "\nHello World!"

	#将当前时间（格式化）和包含换行符的文本内容输出到文件
	echo -e `date '+%Y-%m-%d %H:%M:%S %A'` "\nHello World !" >> test.txt

	#同上，简化版。
	echo -e `date '+%F %T %A'` "\nHello World !" >> test.txt

	#输出到以日期格式文件名
	echo -e $(date) "\nHello World !" >> test`date +'%Y-%m-%d'`.txt

查看 myLog/test.txt 内容如下：

