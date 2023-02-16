# vim_config
# 将vim配置成接近sourceinsight的C\C++代码阅读工具

1、ubuntu系统，确保安装vim  global(gnu global) 和universal-ctags

<code>sudo apt-get install vim global universal-ctags</code>

2、安装plug.vim

<code>mkdir .vim
cd .vim
mkdir autoload
</code>

将<url>https://github.com/junegunn/vim-plug</url>工程中的plug.vim下载后复制到autoload中

3、安装vimrc

<code>cd </code> 

回到用户目录，将本工程中的vimrc复制为用户目录下的<code>.vimrc</code></cr>
如果是mac下安装，需要将.vimrc中的/bin/bash改为/bin/zsh</cr>

4、运行vim，在vim的命令模式中输入PlugUpdate。此时vim会自动安装各种插件。直到完成后提示“……按字母D……”</cr>

5、退出vim，将sourceinsight.vim复制到/.vim/plugged/vim-colorschemes/colors下</cr>

# 简单用法
1、终端中打开所阅读代码的根目录，如果没有.git或者.svn，就touch一个

2、在代码根目录下运行vim，然后输入,n快捷键，右边既是文件列表，随便选择一个.c或者.h，改变一下(然后还原)，保存。这个动作是为了出发tags的自动生成过程

3、常用的快捷键：

Ctrl+]    查找函数定义      (source insight里的ctrl+鼠标双击)

Ctrl+o    跳回            (source insight里的alt+,)

Ctrl+c s  查找函数的调用处  (source insight里的ctrl+\)  

\t        全局查找符号      (source insight里的F7)

F8        打开/关闭tagbar   本文件中的函数列表等

其他快捷键可参考.vimrc中的注释

