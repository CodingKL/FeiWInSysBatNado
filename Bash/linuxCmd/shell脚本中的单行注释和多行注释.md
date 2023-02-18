shell脚本中的单行注释和多行注释
https://blog.csdn.net/helloxiaozhe/article/details/114627867

1. 单行注释
众所周知 # , 比如想要注释 echo "Hello World"
# echo "Hello World"

2. 多行注释：

方法一：

<<!

#被注释的内容   

!

shell 中可以用 “:<< ” 后面跟上任意字符或数据， 方法注释多行


:<<123
echo "1"
echo "1"
echo "1"
echo "1"
echo "1"
123

echo 2

:<<123 和 123 之间为注释内容，脚本只能输出一个”2“

:<<EOF 和 EOF 之间为注释内容，脚本只能输出一个”2“

延伸用法
	“:” 代表就是什么都不做，即空命令
如：
if [ -d $TEST ]; then
    :
else
    echo 'the directory do not exit !'
fi

	<< 可以用作菜单
#!/bin/bash

cat <<Menu
1. List
2. Help
3. Exit
Menu

------------------------------------------------------------------------------------
shell 多行注释
由于Shell不支持直接多行注释，总结了以下Shell注释多行的变通方法
https://blog.51cto.com/u_5650011/5385179

一、通过Here Documents和:实现
　　1、最简单方法
　:<<BLOCK
　　....注释内容
    BLOCK
　　把输入重定义到前面的命令，但是:是空命令，所以就相当于注释了。
　　如果注释中有反引号的命令就会报错。反引号部分没被注释掉，例如ab=`ls -l abc`就不会被注释掉。
　　2、解决注释中有反引号的问题
　　A、方法一
　　:<<BLOCK'
　　....注释内容
    'BLOCK
　　B、方法二
　　:<<'BLOCK
　　....注释内容
　　BLOCK'
　　C、方法三
　　:<<'
    ....注释内容
    '
　　以上三种方法都是通过在:<
　　
　　BLOCK为Here Documents中的定义符号可以随意起名，只要前后匹配就行了
　　3、简单说说:指令和Here Documents
　　:就是什么也不作(do nothing)即空命令。它的最基本作用就是在if,then条件中。在if语句中各部分必须接执行命令，但有时你不在乎条件是为真(或假)只在乎相反情况。
　　例如如果检测存在某路径什么也不做，不存在就echo报错。可写为
　　if [ -d $DIRECTORY ];
　　then : #do nothing
　　eles
　　echo "the directory do not exit  "
　　fi
　　下面的例子
　　command<<word
　　any input
　　file content
　　word
　　是Here Documents的用法，意思是将以上的定义符(word，也可以理解成本地文档名)传给某脚本或命令，word的内容为两个word间输入任意内容(word为Here Documents中的定义符号可以随意起名，只要前后匹配就行了），这样就可以在脚本中用command来执行输入而不必再重建一文件。
　　常用在菜单屏幕中，例如：
　　cat <<Menu
　　1. List files
　　2.HELP
　　3.exit
　　Menu
 
　　:<<word
　　....注释内容
　　word
　　就类似于建一本地文件,然后对它执行空命令，也就是什么也不做，就相当于注释了。
　　更详细的Here Document说明可参考http://www.tsnc.edu.cn/default/tsnc_wgrj/doc/abs-3.9.1_cn/html/here-docs.html
　　二、通过循环实现
　　1、while和:实现
　　while : 
　　do 
　　break
　　注释内容
　　done
　　2、until和:实现
　　until :
　　注释内容
　　done
　　注意注释内容中是否含”done”，包含会造成意外结束循环
　　三、其它方法
　　1、方法一
　　: :||:<<\COMMENTS
    ....注释内容
      COMMENTS
　　
　　高手说上面这种方法最好，因为Here Documents部分不会执行到，只会分析到，应该不会对第二个:作实际的IO重定向。
　　2、方法二
　　: << 'BLOCK'　　可以将里面的变量扩展关闭掉。
　　例如：
　　:~> A=B
　　:~> cat <<END
　　> this is \$A: $A
　　> END
　　this is $A: B
　　:~> cat <<'END'
　　> this is \$A: $A
　　> END
　　this is \$A: $A
　　3、方法三
　　:||{
　　....注释内容
　　}
　　这种方法不用到Here Documents，不过这种方法要注意注释内容中的}
　　4、方法四
　　:<<\EOF
    ....注释内容
    EOF
　　上面方法可关掉Here Documents中的扩展功能，在Here-Document中忽略ending marker前的任何字符
　　实际上使用<<\EOF <<‘EOF’，甚至<<<\EOF在语法上面更加的简洁。不过这种方法同样要注意注释内容中的EOF


