#!/bin/bash
#文件名：test.sh
#sh脚本输出到控制台，并且写入日志文件：

function outputEmptyLine()
{
	echo -E ""
	echo -E "" >> log.txt
}

ls | head

name="xiongzaiqiren"
echo $name

echo "BACKUP DATE:" $(date +"%Y-%m-%d %H:%M:%S")

#将命令的结果赋值给变量
#		Shell 也支持将命令的执行结果赋值给变量，常见的有以下两种方式：
#			variable=`command`
#			variable=$(command)
			
DATE=`date '+%Y%m%d-%H%M%S'`
echo $DATE

# linux bash shell 下 $LINENO 是当前行号。
echo $LINENO

#LogNameDATE=`date '+%Y%m%d'`
#LogNameDATE=`date '+%Y%m%d%H%M%S'`
LogNameDATE=$(date '+%Y%m%d-%H%M%S')

echo " " >> log$LogNameDATE.log
echo "———————————————–" >> log$LogNameDATE.log
echo "BACKUP DATE:" $(date +"%Y-%m-%d %H:%M:%S") >> log$LogNameDATE.log
echo "———————————————– " >> log$LogNameDATE.log
