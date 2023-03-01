
用 Linux sed 命令替换智能引号
		https://cloud.tencent.com/developer/article/1883081?from=15425&areaSource=102001.3&traceId=pfkW6N42CJvIk1mKBXziO


每个字母或字符，不管它是否印在你的键盘上，都有一个编码。

字符编码可以用不同的方式表达，但对计算机来说，Unicode 序列 u2018 和 u2019 产生 ‘ 和 ’，而代码 u201c 和 u201d 产生 “ 和 ” 字符。

知道这些“秘密”代码意味着你可以使用 sed 这样的命令以编程方式替换它们。

任何版本的 sed 都可以，所以你可以使用 GNU sed 或 BSD sed，甚至是 Busybox sed。

下面是我使用的简单的 shell 脚本：
#!/bin/sh
#GNU All-Permissive License
SDQUO=$(echo -ne '\u2018\u2019')
RDQUO=$(echo -ne '\u201C\u201D')

$SED -i -e "s/[$SDQUO]/\'/g" -e "s/[$RDQUO]/\"/g" "${1}"

将此脚本保存为 fixquotes.sh，然后创建一个包含智能引号的单独测试文件：
‘Single quote’“Double quote”

运行该脚本，然后使用 cat 命令查看结果：
$ sh ./fixquotes.sh test.txt

$ cat test.txt
'Single quote'"Double quote"


安装 sed
     如果你使用的是 Linux、BSD 或 macOS，那么你已经安装了 GNU 或 BSD 的 sed。
     这是原始 sed 命令的两个独特的重新实现，
     对于本文中的脚本来说，它们在功能上是一样的(不过并不是所有的脚本都是这样)。



