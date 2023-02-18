linux shell if语句使用方法
	https://blog.51cto.com/iteyer/3242142https://blog.51cto.com/iteyer/3242142

------------------------------------------------------------------------------------------------------------------------------
最精简的 if 命令的语法是：
	if TEST-COMMANDS; then CONSEQUENT-COMMANDS; fi

TEST-COMMAND 执行后且它的返回状态是0，那么 CONSEQUENT-COMMANDS 就执行。
返回状态是最后一个命令的退出状态，或者当没有条件是真的话为0。

TEST-COMMAND 经常包括数字和字符串的比较测试，但是也可以是任何在成功时返回状态0或者失败时返回一些其他状态的一些命令。

一元表达式经常用于检查文件的状态。

如果对某个要素primaries，FILE 参数是 /dev/fd/N 这样的形式，那么就检查文件描述符 “N”。

stdin, stdout 和 stderr 和他们各自的文件描述符也可以用于测试。

7.1.1.1. 和if使用的表达式
下表包含了一个组成 TEST-COMMAND 命令或者命令列表，称作 “要素primaries” 的概览。
这些primaries放置在方括号中来表示一个条件表达式的测试。

表 7.1. 主表达式
Primary	意义
[ -a FILE ]	如果 FILE 存在则为真。
[ -b FILE ]	如果 FILE 存在且是一个块特殊文件则为真。
[ -c FILE ]	如果 FILE 存在且是一个字特殊文件则为真。
[ -d FILE ]	如果 FILE 存在且是一个目录则为真。
[ -e FILE ]	如果 FILE 存在则为真。
[ -f FILE ]	如果 FILE 存在且是一个普通文件则为真。
[ -g FILE ]	如果 FILE 存在且已经设置了SGID则为真。
[ -h FILE ]	如果 FILE 存在且是一个符号连接则为真。
[ -k FILE ]	如果 FILE 存在且已经设置了粘制位则为真。
[ -p FILE ]	如果 FILE 存在且是一个名字管道(F如果O)则为真。
[ -r FILE ]	如果 FILE 存在且是可读的则为真。
[ -s FILE ]	如果 FILE 存在且大小不为0则为真。
[ -t FD ]	如果文件描述符 FD 打开且指向一个终端则为真。
[ -u FILE ]	如果 FILE 存在且设置了SUID (set user ID)则为真。
[ -w FILE ]	如果 FILE 如果 FILE 存在且是可写的则为真。
[ -x FILE ]	如果 FILE 存在且是可执行的则为真。
[ -O FILE ]	如果 FILE 存在且属有效用户ID则为真。
[ -G FILE ]	如果 FILE 存在且属有效用户组则为真。
[ -L FILE ]	如果 FILE 存在且是一个符号连接则为真。
[ -N FILE ]	如果 FILE 存在 and has been mod如果ied since it was last read则为真。
[ -S FILE ]	如果 FILE 存在且是一个套接字则为真。
[ FILE1 -nt FILE2 ]	如果 FILE1 has been changed more recently than FILE2, or 如果 FILE1FILE2 does not则为真。 exists and
[ FILE1 -ot FILE2 ]	如果 FILE1 比 FILE2 要老, 或者 FILE2 存在且 FILE1 不存在则为真。
[ FILE1 -ef FILE2 ]	如果 FILE1 和 FILE2 指向相同的设备和节点号则为真。
[ -o OPTIONNAME ]	如果 shell选项 “OPTIONNAME” 开启则为真。
[ -z STRING ]	“STRING” 的长度为零则为真。
[ -n STRING ] or [ STRING ]	“STRING” 的长度为非零 non-zero则为真。
[ STRING1 == STRING2 ]	如果2个字符串相同。 “=” may be used instead of “==” for strict POSIX compliance则为真。
[ STRING1 != STRING2 ]	如果字符串不相等则为真。
[ STRING1 < STRING2 ]	如果 “STRING1” sorts before “STRING2” lexicographically in the current locale则为真。
[ STRING1 > STRING2 ]	如果 “STRING1” sorts after “STRING2” lexicographically in the current locale则为真。
[ ARG1 OP ARG2 ]	“OP” is one of -eq, -ne, -lt, -le, -gt or -ge. These arithmetic binary operators return true if “ARG1” is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to “ARG2”, respectively. “ARG1” and “ARG2” are integers.

-----------------------------------
linux shell if语句使用方法
https://blog.51cto.com/iteyer/3242142

表 7.2. 组合表达式
操作	效果
[ ! EXPR ]	如果 EXPR 是false则为真。
[ ( EXPR ) ]	返回 EXPR的值。这样可以用来忽略正常的操作符优先级。
[ EXPR1 -a EXPR2 ]	如果 EXPR1 and EXPR2 全真则为真。
[ EXPR1 -o EXPR2 ]	如果 EXPR1 或者 EXPR2 为真则为真。
[ (或作 test) 内建命令对条件表达式使用一系列基于参数数量的规则来求值。更多关于这个主题的信息可以在Bash文档中查找。

就像if 使用fi 来结束一样，在条件列完之后必须用">"来结束。

-----------------------------------
linux shell if语句使用方法
https://blog.51cto.com/iteyer/3242142


7.1.1.2. 后接then语句的命令
    CONSEQUENT-COMMANDS 列出了跟在then语句后面可以是任何有效的UNIX命令，
        任何可执行的程序，
        任何可执行的shell脚本或者任何shell语句，
        除了 fi. 。

    重要地记住 then 和 fi 在shell里面被认为是分开的语句。

    因此，在命令行上使用的时候，他们用分号隔开。

    在脚本中，if语句的不同部分通常是良好分隔的。以下是一些简单的例子：
    7.1.1.3. 检查文件
    第一个例子检查一个文件是否存在：

anny ~> cat msgcheck.sh
#!/bin/bash

echo "This scripts checks the existence of the messages file."
echo "Checking..."
if [ -f /var/log/messages ]
then
echo "/var/log/messages exists."
fi
echo
echo "...done."

anny ~> ./msgcheck.sh
This scripts checks the existence of the messages file.
Checking...
/var/log/messages exists.

...done.
-----------------------------------
linux shell if语句使用方法
https://blog.51cto.com/iteyer/3242142

7.1.1.4. 检查shell选项
加入到你的Bash配置文件中去：

# These lines will print a message if the noclobber option is set:

if [ -o noclobber ]
  then
 echo "Your files are protected against accidental overwriting using redirection."
fi

环境
以上的例子将在命令行输入后开始工作：

anny ~> if [ -o noclobber ] ; then echo ; echo "your files are protected
against overwriting." ; echo ; fi

your files are protected against overwriting.

anny ~>

然而，如果你使用依赖环境的测试，当你在脚本中输入相同的命令你可能得到不用的结果，因为脚本会打开一个新的，没有设置预期的变量和选项的shell。

7.1.2. if的简单应用
7.1.2.1. 测试退出状态

? 变量包含了之前执行命令的退出状态（最近完成的前台进程）。
以下的例子显示了一个简单的测试：

anny ~> if [ $? -eq 0 ]
More input> then echo 'That was a good job!'
More input> fi
That was a good job!

anny ~>

以下的例子证明了 TEST-COMMANDS 可以是任何有返回和退出状态的UNIX命令，之后 if 再次返回零的退出状态：
anny ~> if ! grep $USER /etc/passwd
More input> then echo "your user account is not managed locally"; fi
your user account is not managed locally

anny > echo $?
0

anny >

以下能得到同样的结果：
anny > grep $USER /etc/passwd

anny > if [ $? -ne 0 ] ; then echo "not a local account" ; fi
not a local account

anny >

7.1.2.2. 数字的比较
以下的例子是用了数值的比较：

anny > num=`wc -l work.txt`

anny > echo $num
201

anny > if [ "$num" -gt "150" ]
More input> then echo ; echo "you've worked hard enough for today."
More input> echo ; fi

you've worked hard enough for today.


anny >
-----------------------------------
linux shell if语句使用方法
https://blog.51cto.com/iteyer/3242142



这个脚本在每个星期天由cron来执行。如果星期的数是偶数，他就提醒你把垃圾箱清理：
#!/bin/bash

# Calculate the week number using the date command:

WEEKOFFSET=$[ $(date +"%V") % 2 ]

# Test if we have a remainder.  If not, this is an even week so send a message.
# Else, do nothing.

if [ $WEEKOFFSET -eq "0" ]; then
  echo "Sunday evening, put out the garbage cans." | mail -s "Garbage cans out" your@your_domain.org
-----------------------------------
linux shell if语句使用方法
https://blog.51cto.com/iteyer/3242142

7.1.2.3. 字符串比较
一个通过比较字符串来测试用户ID的例子：
if [ "$(whoami)" != 'root' ]; then
        echo "You have no permission to run $0 as non-root user."
        exit 1;
fi


使用Bash，你可以缩短这样的结构。下面是以上测试的精简结构：
[ "$(whoami)" != 'root' ] && ( echo you are using a non-privileged account; exit 1 )


类似于如果测试为真就执行的 “&&” 表达式， “||” 指定了测试为假就执行。
类似于 “&&” 表达式指明了在两个测试条件为真时所采取的动作，“||” 指明测试为假时所采取的行动。

正则表达式也可以在比较中使用：
anny > gender="female"

anny > if [[ "$gender" == f* ]]
More input> then echo "Pleasure to meet you, Madame."; fi
Pleasure to meet you, Madame.

anny >

真正的程序员
多数程序员更喜欢使用和方括号相同作用的内建的 test 命令，像这样：
    test "$(whoami)" != 'root' && (echo you are using a non-privileged account; exit 1)

 参见信息页面得到更多关于Bash “(( EXPRESSION ))” 和 “[[ EXPRESSION ]]” 结构的模块匹配信息。















