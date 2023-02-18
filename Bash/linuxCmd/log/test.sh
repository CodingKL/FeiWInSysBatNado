#!/bin/bash
#文件名：test.sh
#sh脚本输出到控制台，并且写入日志文件：
name="xiongzaiqiren"
echo $name

echo "BACKUP DATE:" $(date +"%Y-%m-%d %H:%M:%S")

DATE=`date '+%Y%m%d-%H%M%S'`
echo $DATE

#LogNameDATE=`date '+%Y%m%d'`
LogNameDATE=`date '+%Y%m%d%H%M%S'`

echo " " >> log$LogNameDATE.log
echo "———————————————–" >> log$LogNameDATE.log
echo "BACKUP DATE:" $(date +"%Y-%m-%d %H:%M:%S") >> log$LogNameDATE.log
echo "———————————————– " >> log$LogNameDATE.log
