# objc4-723-debug

怎么建成这个项目的我都是从这里学的：

[objc - 编译Runtime源码objc4-680](https://blog.csdn.net/WOTors/article/details/52489464)

[objc - 编译Runtime源码objc4-706](https://blog.csdn.net/wotors/article/details/54426316)

这个项目是用来debug苹果开源项目objc4的项目。

创建过程：

## Step 1 下载开源项目

先从[苹果开源网站](https://opensource.apple.com/)上，查看[OS X下的开源项目](https://opensource.apple.com/release/macos-10136.html)，搜索**objc4**，打开行的页面：

<https://opensource.apple.com/source/objc4/objc4-723/>

去掉具体版本路径(最后一个Path)，可得到所有版本目录:

<https://opensource.apple.com/source/objc4/>

去掉具体项目路径(最后一个Path)，可得到所有项目目录:

<https://opensource.apple.com/source/>

> (跟点击OS X版本链接的一样，但内容更多，比如launchd项目必须在这里才能找到)

上面所有链接把`source`改成`tarballs`，可得到打包的版本，比如`objc4`：

<https://opensource.apple.com/tarballs/objc4/>

(可看出，版本号的数值越大，版本越新。)


## Step 2 编译objc4开源项目

在[Tarballs目录](http://opensource.apple.com/tarballs)中下载下面这些项目：

**objc4**，**Libc**，**dyld**，**libauto**，**libclosure**，**libdispatch**，**libpthread**，**xnu**

但是，对于**Libc**，从版本**8XX**到版本**9XX**以后，对比发现，里面**pthreads**目录不见了，也即**Libc**下**pthreads**相关实现不见了，应该被移到别的项目去了或者苹果私有化了它，总之是找不到了。因为解决下面的编译错误时，是需要用到**Libc**的**pthreads**相关实现（我也是笨笨的逐个下旧版本发现的），所以我们下载的版本**1081.1.3**比较高是少了**pthread**相关的头文件的，删掉**Libc-1081.1.3.tar.gz**，下载**Libc-825.40.1.tar.gz**来替换它。

然后，把除了**objc4-723**外的7个都放到一个新建的文件夹（这里命名作**AppleSources**）下，方便搜索objc4-723里缺少的头文件，然后解压所有，我创建的文件目录结构是：

```
runtime completion/
		|_objc4-723/
		|_AppleSources/
		    |_ dyld-551.4/
		    |_ launchd-842.92.1/
		    |_ libauto-187/
		    |_ Libc-825.40.1/
		    |_ Libc-1244.50.9/
		    |_ libclosure-67/
		    |_ libdispatch-913.60.2/
		    |_ libpthread-301.50.1/
		    |_ xnu-4570.71.2/
```

构造**objc4-723**项目

在**objc4-723/**下建立一个文件夹**include**，选择工程配置文件**objc->TARGETS->objc->Build Settings->Search Paths->Header Search Paths**，加入（Debug & Release都修改，下同）：

```
$(SRCROOT)/include
```

打开项目工程文件objc.xcodeproj，⌘+B(Build)编译一下看看，第一个错误出现了：`mach-o/dyld_priv.h file not found。`

后面基本上就是`xxx/yyy.h`文件找不到，大部分都可以通过这个命令来解决：

```
//当前在runtime completion文件夹下
$ find . -name "yyy.h" 
$ mkdir ./objc4-723/include/xxx/
¥ find . -name "yyy.h" | xargs -I{} cp {} ./objc4-723/include/xxx/
```

如果是代码中有未定义错误 `Use of undeclared identifier 'zzzz'` :

```
$ grep -rne "zzz" .
//或
$ grep -re "zzz" . 
```

> 别忘了最后的那个`.`，具体这两个命令的区别我还没弄起 - -！
> 该项目现有个**oc runtime调试objc-debug项目创建过程中的命令行**是我创建这个项目过程中的命令行保存文件







