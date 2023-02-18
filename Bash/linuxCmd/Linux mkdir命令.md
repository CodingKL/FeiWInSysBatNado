Linux mkdir命令：创建目录（文件夹）
		http://c.biancheng.net/view/723.html


mkdir 命令，是 make directories 的缩写，用于创建新目录，此命令所有用户都可以使用。

mkdir 命令的基本格式为：
[root@localhost ~]# mkdir [-mp] 目录名

-m 选项用于手动配置所创建目录的权限，而不再使用默认权限。
-p 选项递归创建所有目录，以创建 /home/test/demo 为例，在默认情况下，你需要一层一层的创建各个目录，而使用 -p 选项，则系统会自动帮你创建 /home、/home/test 以及 /home/test/demo。

【例 1】建立目录。
[root@localhost ~]#mkdir cangls
[root@localhost ~]#ls
anaconda-ks.cfg cangls install.log install.log.syslog

我们建立一个名为 cangls 的目录，通过 ls 命令可以查看到这个目录已经建立。注意，我们在建立目录的时候使用的是相对路径，所以这个目录被建立到当前目录下。

【例 2】使用 -p 选项递归建立目录。
[root@localhost ~]# mkdir lm/movie/jp/cangls
mkdir:无法创建目录"lm/movie/jp/cangls":没有那个文件或目录
[root@localhost ~]# mkdir -p lm/movie/jp/cangls
[root@localhost ~]# ls
anaconda-ks.cfg cangls install.log install.log.syslog lm
[root@localhost ~]# ls lm/
movie
#这里只查看一级子目录，其实后续的jp目录、cangls目录都已经建立


【例 3】使用 -m 选项自定义目录权限。
[root@localhost ~]# mkdir -m 711 test2
[root@localhost ~]# ls -l
drwxr-xr-x  3 root  root 4096 Jul 18 12:50 test
drwxr-xr-x  3 root  root 4096 Jul 18 12:53 test1
drwx--x--x  2 root  root 4096 Jul 18 12:54 test2

仔细看上面的权限部分，也就是 ls 命令输出的第一列数据（绿色部分），test 和 test1 目录由于不是使用 -m 选项设定访问权限，因此这两个目录采用的是默认权限（这里的默认权限值是 755，后续章节再详细介绍默认权限）。

而在创建 test2 时，使用了 -m 选项，通过设定 711 权限值来给予新的目录 drwx--x--x 的权限，有关权限值的具体含义也放到后续章节介绍。
----------------------------------------------------------------------------------------------------------------------------------
mkdir
		https://blog.csdn.net/nnj99/article/details/95798030

		创建目录
				mkdir (make directories)	用于创建新目录，此命令所有用户都可以使用。

		mkdir命令格式：

1.创建一个空目录
		#mkdir test1

2.-m
选项用于手动配置所创建目录的权限，而不再使用默认权限。

例：创建权限为777的目录

mkdir -m 777 test

3.-p 递归创建多个目录
		mkdir -p +创建的目录/创建的目录
   
   意思：后面的创建的目录在之前创建的目录下

----------------------------------------------------------------------------------------------------------------------------------
Linux mkdir 命令
		https://www.runoob.com/linux/linux-comm-mkdir.html


Linux mkdir（英文全拼：make directory）命令用于创建目录。

语法
		mkdir [-p] dirName

参数说明：
		-p 确保目录名称存在，不存在的就建一个。

实例
		在工作目录下，建立一个名为 runoob 的子目录 :
				mkdir runoob

在工作目录下的 runoob2 目录中，建立一个名为 test 的子目录。

若 runoob2 目录原本不存在，则建立一个。（注：本例若不加 -p 参数，且原本 runoob2 目录不存在，则产生错误。）

mkdir -p runoob2/test

---------------------------------------------------------------------------------------------------------------------------------
Linux shell mkdir 命令
		https://www.twle.cn/l/yufei/man/man-basic-mkdir.html

Linux shell mkdir 命令用于建立名称为 dirName 之子目录。
mkdir 命令语法
mkdir [-p] dirName

参数
-p
		确保目录名称存在，不存在的就建一个。

范例
		在工作目录下，建立一个名为 abc 的子目录 :




---------------------------------------------------------------------------------------------------------------------------------Linux shell脚本命令中mkdir 与 mkdir -p 的区别
			https://blog.csdn.net/sinat_26811377/article/details/107312736

1、mkdir

2、mkdir -p ：递归创建目录，即使上级目录不存在，会按目录层级自动创建目录

		mkdir -p xx/yy 的好处就是一次可以创建多级文件夹。

		若 xx 文件夹不存在，则先创建 xx 文件夹，然后在 xx 文件夹下创建 yy 文件夹。



