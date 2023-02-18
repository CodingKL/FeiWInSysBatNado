shell bash判断文件或文件夹是否存在
https://www.cnblogs.com/emanlee/p/3583769.html


#shell判断文件夹是否存在

#如果文件夹不存在，创建文件夹
if [ ! -d "/myfolder" ]; then
  mkdir /myfolder
fi

#shell判断文件,目录是否存在或者具有权限


folder="/var/www/"
file="/var/www/log"

# -x 参数判断 $folder 是否存在并且是否具有可执行权限
if [ ! -x "$folder"]; then
  mkdir "$folder"
fi

# -d 参数判断 $folder 是否存在
if [ ! -d "$folder"]; then
  mkdir "$folder"
fi

# -f 参数判断 $file 是否存在
if [ ! -f "$file" ]; then
  touch "$file"
fi

# -n 判断一个变量是否有值
if [ ! -n "$var" ]; then
  echo "$var is empty"
  exit 0
fi

# 判断两个变量是否相等
if [ "$var1" = "$var2" ]; then
  echo '$var1 eq $var2'
else
  echo '$var1 not eq $var2'
fi


Shell 判断文件或文件夹是否存在（不存在则创建）
https://blog.csdn.net/u012206617/article/details/118366597


Linux shell判断文件或者目录是否存在
https://blog.csdn.net/qq_44737312/article/details/124248351

【Linux】Shell判断文件文件夹是否存在
https://www.finclip.com/news/f/7119.html

【Linux】Shell判断文件文件夹是否存在

文件比较符

-e 判断对象是否存在-d 判断对象是否存在，并且为目录-f 判断对象是否存在，并且为常规文件-L 判断对象是否存在，并且为符号链接-h 判断对象是否存在，并且为软链接-s 判断对象是否存在，并且长度不为0-r 判断对象是否存在，并且可读-w 判断对象是否存在，并且可写-x 判断对象是否存在，并且可执行-O 判断对象是否存在，并且属于当前用户-G 判断对象是否存在，并且属于当前用户组-nt 判断file1是否比file2新 [ "/data/file1" -nt "/data/file2" ]-ot 判断file1是否比file2旧 [ "/data/file1" -ot "/data/file2"

文件夹不存在则创建

if [ ! -d "/data/" ];thenmkdir /dataelseecho "文件夹已经存在"fi

文件存在则删除

if [ ! -f "/data/filename" ];thenecho "文件不存在"elserm -f /data/filenamefi

判断文件夹是否存在

if [ -d "/data/" ];thenecho "文件夹存在"elseecho "文件夹不存在"fi

判断文件是否存在

if [ -f "/data/filename" ];thenecho "文件存在"elseecho "文件不存在"fi

#shell判断文件夹是否存在

#如果文件夹不存在，创建文件夹if [ ! -d "/myfolder" ]; thenmkdir /myfolderfi

#shell判断文件,目录是否存在或者具有权限

folder="/var/-x 参数判断 $folder 是否存在并且是否具有可执行权限if [ ! -x "$folder"]; then mkdir "$folder"fi

# -d 参数判断 $folder 是否存在if [ ! -d "$folder"]; then mkdir "$folder"fi

# -f 参数判断 $file 是否存在if [ ! -f "$file" ]; then touch "$file"fi

# -n 判断一个变量是否有值if [ ! -n "$var" ]; then echo "$var is empty" exit 0fi

# 判断两个变量是否相等if [ "$var1" = "$var2" ]; then echo '$var1 eq $var2'else echo '$var1 not eq $var2'fi

#!/bin/sh #测试各种字符串比较操作。#shell中对变量的值添加单引号，爽引号和不添加的区别：对类型来说是无关的，即不是添加了引号就变成了字符串类型，#单引号不对相关量进行替换，如不对$符号解释成变量引用，从而用对应变量的值替代，双引号则会进行替代#author:tenfyguo A="$1"B="$2" echo "输入的原始值：A=$A,B=$B" #判断字符串是否相等if [ "$A" = "$B" ];thenecho "[ = ]"fi #判断字符串是否相等，与上面的=等价if [ "$A" == "$B" ];thenecho "[ == ]"fi #注意:==的功能在[[]]和[]中的行为是不同的，如下 #如果$a以”a”开头(模式匹配)那么将为true if [[ "$A" == a* ]];thenecho "[[ ==a* ]]"fi #如果$a等于a*(字符匹配),那么结果为trueif [[ "$A" == "a*" ]];thenecho "==/"a*/""fi #File globbing(通配) 和word splitting将会发生, 此时的a*会自动匹配到对应的当前以a开头的文件#如在当前的目录中有个文件：add_crontab.sh,则下面会输出ok#if [ "add_crontab.sh" == a* ];then #echo "ok"#fiif [ "$A" == a* ];thenecho "[ ==a* ]"fi #如果$a等于a*(字符匹配),那么结果为trueif [ "$A" == "a*" ];thenecho "==/"a*/""fi #字符串不相等if [ "$A" != "$B" ];thenecho "[ != ]"fi #字符串不相等if [[ "$A" != "$B" ]];thenecho "[[ != ]]"fi #字符串不为空，长度不为0if [ -n "$A" ];thenecho "[ -n ]"fi #字符串为空.就是长度为0.if [ -z "$A" ];thenecho "[ -z ]"fi #需要转义<，否则认为是一个重定向符号if [ $A /< $B ];thenecho "[ < ]" fi if [[ $A < $B ]];thenecho "[[ < ]]" fi #需要转义>，否则认为是一个重定向符号if [ $A /> $B ];thenecho "[ > ]" fi if [[ $A > $B ]];thenecho "[[ > ]]" fi


	
