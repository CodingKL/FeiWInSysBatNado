如何在shell命令执行时回显这些命令
		https://cloud.tencent.com/developer/ask/sof/151529

在shell脚本中，如何回显调用的所有shell命令并展开任何变量名？
set -x或set -o xtrace展开变量并在行前打印一个小+号。

set -v或set -o verbose在打印前不会展开变量。

使用set +x和set +v关闭上述设置。

在脚本的第一行，您可以将#!/bin/sh -x (或-v)放入脚本，以便稍后在脚本中使用与set -x (或-v)相同的效果。

上述方法也适用于/bin/sh。

在set attributes和debugging上查看bash-hacker的维基。


$ cat shl
#!/bin/bash                                                                     

DIR=/tmp/so
ls $DIR

$ bash -x shl 
+ DIR=/tmp/so
+ ls /tmp/so
$

------------------------------------------------------------------------------------------------------------------
set -x会给你你想要的。

下面是一个用于演示的示例shell脚本：
#!/bin/bash
set -x #echo on

ls $PWD

这将展开所有变量，并在输出命令之前打印完整的命令。
输出：
+ ls /home/user/
file1.txt file2.txt

我使用一个函数回显并运行命令：
#!/bin/bash
# Function to display commands
exe() { echo "\$ $@" ; "$@" ; }

exe echo hello world

哪种输出
$ echo hello world
hello world

对于更复杂的命令、管道等，可以使用eval：
#!/bin/bash
# Function to display commands
exe() { echo "\$ ${@/eval/}" ; "$@" ; }

exe eval "echo 'Hello, World!' | cut -d ' ' -f1"

哪种输出
$  echo 'Hello, World!' | cut -d ' ' -f1
Hello

您还可以通过将脚本中的选择行包装在set -x和set +x中来切换这一点，例如，
#!/bin/bash
...
if [[ ! -e $OUT_FILE ]];
then
   echo "grabbing $URL"
   set -x
   curl --fail --noproxy $SERV -s -S $URL -o $OUT_FILE
   set +x
fi

用于回显选择行的shuckc's answer有几个缺点:最终也会回显以下set +x命令，并且无法使用$?测试退出代码，因为它会被set +x覆盖。

另一种选择是在子subshell中运行该命令：

echo "getting URL..."
( set -x ; curl -s --fail $URL -o $OUTFILE )

if [ $? -eq 0 ] ; then
    echo "curl failed"
    exit 1
fi

这将为您提供类似如下的输出：
getting URL...
+ curl -s --fail http://example.com/missing -o /tmp/example
curl failed

------------------------------------------------------------------------------------------------------------------



