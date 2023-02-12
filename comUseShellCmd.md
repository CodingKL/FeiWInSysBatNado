# Bash 脚本教程
# 本教程介绍 Linux 命令行 Bash 的基本用法和脚本编程。
https://wangdoc.com/bash/intro

# 下面的命令可以查看当前设备的默认 Shell。
echo $shell

# 当前正在使用的 Shell 不一定是默认 Shell，一般来说，ps命令结果的倒数第二行是当前 Shell。
ps
# 上面示例中，ps命令结果的倒数第二行显示，运行的命令（cmd）是bash，表明当前正在使用的 Shell 是 Bash。

# 下面的命令可以查看当前的 Linux 系统安装的所有 Shell。
cat /etc/shells
# 上面三个命令中，$是命令行环境的提示符，用户只需要输入提示符后面的内容。
# Linux 允许每个用户使用不同的 Shell，用户的默认 Shell 一般都是 Bash，或者与 Bash 兼容。

# 如果你的 Shell 不是 Bash，可以输入bash命令启动 Bash。
bash

# 退出 Bash 环境，可以使用exit命令，也可以同时按下Ctrl + d。
exit

# Bash 的基本用法就是在命令行输入各种命令，非常直观。
# 作为练习，可以试着输入pwd命令。
# 按下回车键，就会显示当前所在的目录。
pwd

# 用户可以通过bash命令的--version参数或者环境变量$BASH_VERSION，查看本机的 Bash 版本。
bash --version
echo $BASH_VERSION

# echo命令的作用是在屏幕输出一行文本，可以将该命令的参数原样输出。
echo hello world
# 上面例子中，echo的参数是hello world，可以原样输出。
# 如果想要输出的是多行文本，即包括换行符。这时就需要把多行文本放在引号里面。
$ echo "<HTML>
    <HEAD>
          <TITLE>Page Title</TITLE>
    </HEAD>
    <BODY>
          Page body.
    </BODY>
</HTML>"
# 上面例子中，echo可以原样输出多行文本。




