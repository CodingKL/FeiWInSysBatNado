#!/bin/bash

# dos2unix testSedCmd.sh 
# ./testSedCmd.sh 20221202
#

if [ -n "$1" ]
then
	VALUATION_DATE="$1" 
else
	echo "Please input a valuation date!"
	exit
fi

:<<!
shell for循环语法
for 变量 in 列表
do
    command1
    command2
    ...
    commandN
done
!

# Linux echo详解：	输出命令
#	选项：
#			-e：	支持反斜线控制的字符转换（具体参见表 1）
#			-n：	取消输出后行末的换行符号（内容输出后不换行）
#
for FILE in `ls -l`; 
do
	#echo -n "mv ${FILE}" >> rename.sh
	#echo "${FILE}"
	#echo "${FILE}" | sed -e 's/${VALUATION_DATE}/yyyymmdd/g' >> rename.sh;
	echo "${FILE}" | sed -e "s/${VALUATION_DATE}/yyyymmdd/g" >> rename.sh;
	#echo "${FILE}" >> rename.sh
done

#sh rename.sh && rm rename.sh

