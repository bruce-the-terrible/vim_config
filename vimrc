" VIM and Python – A Match Made in Heaven
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
" https://github.com/yangyangwithgnu/use_vim_as_ide
" https://github.com/jarolrod/vim-python-ide

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Add all your plugins here
"-------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'          " NerdTree git functionality
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'                    " Class/module browser
"Plug 'vim-scripts/taglist.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'          " Tabs/Buffers/Fuzzy/Workspaces/Bookmarks
Plug 'vim-airline/vim-airline'              " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'       " Themes for airline
Plug 'thaerkh/vim-indentguides'             " Visual representation of indents
Plug 'tmhedberg/SimpylFold'
Plug 'dense-analysis/ale'                   " Asynchronous Lint Engine
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
"-------------------=== Other ===-------------------------------
Plug 'flazz/vim-colorschemes'               " Colorschemes
Plug 'tpope/vim-surround'                   " Parentheses, brackets, quotes, XML tags, and more
Plug 'vimwiki/vimwiki'                      " Personal Wiki
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'               " Dev Icons
Plug 'mhinz/vim-startify'                   " Vim Start Page
Plug 'tpope/vim-fugitive'                   " Git integration
Plug 'dhruvasagar/vim-table-mode'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'                    " Text filtering and alignment
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-plug'                    " Vim plugin manager
Plug 'jceb/vim-orgmode'
Plug 'mbbill/undotree'
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/VimIM'
"-------------------=== Snippets support ===--------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"-------------------=== Languages support ===-------------------
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'              " Syntax Checking/Highlighting
Plug 'bfrg/vim-cpp-modern'		    " syntax for c/c++
"-------------------=== Python  ===-----------------------------
Plug 'davidhalter/jedi-vim'                 " Python autocompletion
Plug 'vim-scripts/indentpython.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvie/vim-flake8'                      " PEP 8 checking
" All of your Plugins must be added before the following line
call plug#end()

"=====================================================
" General settings
"=====================================================
set shell=/bin/bash
set number                                  " show line numbers
set ttyfast                                 " terminal acceleration
set ruler
set nocompatible
set encoding=utf-8
" 显示中文的编码设置
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,cp936,
set fileencoding=utf-8

" 界面配色设定
"if has("termguicolors")
    " fix bug fpr vim
    "set t_8f=^[[38;2;%lu;%lu;%lum
    "set t_8b=^[[48;2;%lu;%lu;%lum
    " enable truecolor
"    set termguicolors
"else
    set t_Co=256                                " 256 colors
"endif
syntax enable                               " enable syntax highlighting
filetype on
filetype indent on
filetype plugin on

" 光标所在行高亮设置
set cursorline
"highlight CursorLine term=reverse ctermbg=blue ctermfg=NONE guibg=darkcyan guifg=NONE
"set cursorcolumn
"Mode Settings
" INSERT mode
let &t_SI = "\<Esc>[5 q" . "\<Esc>]12;cyan\x7"
" REPLACE mode
let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;red\x7"
" NORMAL mode
let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

set showmatch                               " shows matching part of bracket pairs (), [], {}
"set noswapfile                              " no swap files
"set nobackup                                " no backup files
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/
set undodir=~/.vim/.undo/
set undofile
set showcmd
set relativenumber
set scrolloff=10                            " let 10 lines before/after cursor during scroll
nnoremap <F4> :set relativenumber!<CR>
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" 代码缩进设定
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=80
set ignorecase
set smartcase
set autochdir                               " change dir to current open file

"编辑状态下光标移动快捷键
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-s> <Home>
inoremap <C-x> <End>


" built-in cool features
set wildmenu                                " visual autocomplete for command menu
set path+=**                                " search through all the sub-dirs

" use System Clipboard
set clipboard=unnamed
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" change leader
"let mapleader = ","
"let mapleader = "\<Space>"

" split setup
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
autocmd FileType c setlocal foldmethod=syntax
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')
" see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



"=====================================================
"" testing Settings
"=====================================================
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
noremap <silent> <leader> :silent noh<Bar>echo<CR>
"=====================================================
"" Tabs / Buffers settings
"=====================================================
"tab sball
set showtabline=0
set switchbuf=useopen
set laststatus=2
nmap <F6> :bprev<CR>
nmap <F7> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

" Required by CtrlSpace
set hidden

"=====================================================
"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" GUI Settings
"=====================================================
if (has('gui_macvim'))
    set guifont=MesloLGS\ NF:h15
else
    "set guifont=Monospace\ 11
    "set guifont=mononoki\ Nerd\ Font\ 11
    set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 11
    "set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 11
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has('gui_running')
  set background=dark
  "colo desert256v2
  "colorscheme badwolf
  "colorscheme wombat256mod
  colorscheme sourceinsight
  "colorscheme eclipse   " bright mode
  "colorscheme lizard256
else
  colorscheme desert
endif

" by default, hide gui menus
set guioptions=i

" start gvim in max size
"augroup maximizewindow
"    autocmd!
"    autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
"augroup END

function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

"=====================================================
"" save&restore session Settings
"=====================================================
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存快捷键
map <leader>ss :mksession! ~/.vim/.my.vim<cr> :wviminfo! ~/.vim/.my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source ~/.vim/.my.vim<cr> :rviminfo ~/.vim/.my.viminfo<cr>

"=====================================================
"" Python Settings
"=====================================================
" PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set textwidth=79  |
    \ set expandtab     |
    \ set autoindent    |
    \ set fileformat=unix

" indent for other languages
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2     |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

let g:loaded_python_provider = 1
let python_highlight_all=1

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

imap <F5> <Esc>:w<CR>:!clear;python %<CR>

"=====================================================
"" misc plugin Settings
"=====================================================

" Rainbow setup 彩色括号
let g:rainbow_active = 1

" vim-indentguides
let g:indentguides_ignorelist = ['text']
let g:indentguides_toggleListMode = 0       " disable list mode

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"=====================================================
"" UltiSnips Settings
"=====================================================
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"=====================================================
" NERDTree Settings  目录树
"=====================================================
nmap ,n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.pyo$', '__pycache__$', '\.o$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
"let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=1

"=====================================================
"" NERDComment Settings
"=====================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"=====================================================
"" Ale Settings (Linting)
"=====================================================
" Use Ale.
" Show Ale in Airline
let g:airline#extensions#ale#enabled = 1

" Ale Gutter
"let g:ale_sign_column_always = 1

"=====================================================
"" fzf Settings 模糊搜索
"=====================================================
" fzf, ref: https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
" 默认leader\,即:输入\t就会打开tags，进行全局查找，相当于source inght的F7
nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>T :BTags<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>/ :Ag<Space>
"nmap <Leader>/ :Rg<Space>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>M :Maps<CR>
nmap <Leader>s :Filetypes<CR>

"=====================================================
" TagBar settings
"=====================================================
nmap <F8> :TagbarToggle<CR>
let tagbar_left=1
let g:tagbar_compact=1
let g:tagbar_autofocus=1
let g:tagbar_width=40

"=====================================================
" c/c++ modern
"=====================================================
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" following coomands cause weird color in vimdiff
"autocmd BufEnter *.py,*.c,*.h,*.cpp :call tagbar#autoopen(0)
"autocmd BufWinLeave *.py,*.c,*.h,*.cpp :TagbarClose

"=====================================================
"" AirLine settings
"=====================================================
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'                " set airline theme

"=====================================================
"" DevIcon Settings
"=====================================================
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1
" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1
" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1
" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0

"=====================================================
" UndoTree settings
"=====================================================
let g:undotree_WindowLayout = 2
nnoremap <F5> :UndotreeToggle<CR>




"=====================================================
" gtags & gtags-cscope
"=====================================================
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/etc/gtags/gtags.conf'

""设置标签tags
set tags=./.tags;,.tags
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazSl']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Get ctags version
let g:ctags_version = system('ctags --version')[0:8]

" 如果使用 universal ctags 需要增加下面一行
if g:ctags_version == "Universal"
  let g:gutentags_ctags_extra_args += ['--extras=+q', '--output-format=e-ctags']
endif

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 1
"Change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
"Enable advanced commands: GutentagsToggleTrace, etc.
let g:gutentags_define_advanced_commands = 1
let g:gutentags_trace = 0

" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1


"=====================================================
"  TlisTogle & ctags
"=====================================================
"nnoremap <F8> :Tlist<CR>

"=====================================================
" ctags
"=====================================================
"let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
"let Tlist_WinWidth=40                   "设置taglist宽度
"let Tlist_Show_One_File           = 1   " 只显示当前文件的tags
""let Tlist_Auto_Open              = 1   " 打开vim自动打开Tlist
"let Tlist_GainFocus_On_ToggleOpen = 1   " 打开Tlist窗口时,光标跳到list窗口
"let Tlist_Exit_OnlyWindow         = 1   " 如果Tlist窗口是最后一个窗口则退出Vim
"let Tlist_Use_Left_Window         = 1   " 在左侧窗口中显示
"let Tlist_File_Fold_Auto_Close    = 1   " 自动折叠
"let Tlist_Auto_Update             = 1   " 自动更新
"let Tlist_Close_On_Select         = 1   " 选择tags后自动关闭窗口
"set tags=tags;


""cscope
if has("cscope")
    if executable('gtags-cscope') && executable('gtags')
        "禁用原GscopeFind按键映射
        let g:gutentags_plus_nomap = 1
        "Find this C symbol 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
        nmap <C-c>s :GscopeFind s <C-R>=expand("<cword>")<CR><CR>
        "Find this difinition 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
        nmap <C-c>g :GscopeFind g <C-R>=expand("<cword>")<CR><CR>
        "Find functions called by this function 查找本函数调用的函数
        nmap <C-c>d :GscopeFind d <C-R>=expand("<cword>")<CR><CR>
        "Find functions calling this function 查找调用本函数的函数
        nmap <C-c>c :GscopeFind c <C-R>=expand("<cword>")<CR><CR>
        "Find this text string 查找指定的字符串
        nmap <C-c>t :GscopeFind t <C-R>=expand("<cword>")<CR><CR>
        "Find this egrep pattern 查找egrep模式，相当于egrep功能，但查找速度快多了
        nmap <C-c>e :GscopeFind e <C-R>=expand("<cword>")<CR><CR>
        "Find this file 查找并打开文件，类似vim的能
        nmap <C-c>f :GscopeFind f <C-R>=expand("<cfile>")<CR><CR>
        "Find files #including this file 查找包含本文件的文件
        nmap <C-c>i :GscopeFind i ^<C-R>=expand("<cfile>")<CR>$<CR>
    else
        set csto=1
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        endif
        set csverb

        nmap <C-c>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-c>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

        nmap <C-F12> :cs add cscope.out<CR>
        "F12用ctags生成tags
        nmap <F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q -f .tags<CR>
        "--language-force=C++
        nmap <S-F12> :!cscope -Rbkq<CR>
        " cscope参数
        "-R: 在生成索引文件时，搜索子目录树中的代码
        "-b: 只生成索引文件，不进入cscope的界面
        "-d: 只调出cscope gui界面，不跟新cscope.out
        "-k: 在生成索引文件时，不搜索/usr/include目录
        "-q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
        "-i: 如果保存文件列表的文件名不是cscope.files时，需要加此选项告诉cscope到哪儿去找源文件列表。可以使用"-"，表示由标准输入获得文件列表。
        "-I dir: 在-I选项指出的目录中查找头文件
        "-u: 扫描所有文件，重新生成交叉索引文件
        "-C: 在搜索时忽略大小写
        "-P path: 在以相对路径表示的文件前加上的path，这样，你不用切换到你数据库文件所在的目录也可以使用
    endif
endif


"=====================================================
" scope configuration
"=====================================================
"if has("cscope")
"	set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
"	" check cscope for definition of a symbol before checking ctags:
"	" set to 1 if you want the reverse search order.
"	" 默认优先搜索cscope数据库
"    set csto=1
"    " use cstag 
"    " set cst
"	" add any cscope database in current directory
"    " . -C   ignare case
"    if filereadable("cscope.out")
"    	cs add cscope.out . -C
"        " else add the database pointed to by environment variable
"    elseif $CSCOPE_DB !=""
"    	cs add $CSCOPE_DB . -C
"    endif
"
"	" show msg when any other cscope db added
"    set cscopeverbose
"	"nmap <C-c>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>    " 查找函数被调用位置后，在新的垂直窗口中打开
"	nmap <C-c>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>    " 查找函数被调用位置后，在新的垂直窗口中打开
"	nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>          " 查找定义
"	nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>          " 查找调用当前函数的函数:
"	nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>          " 查找当前函数调用的所有函数
"	nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>          " 查找这个egrep的pattern
"	nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>          " 查找这个文件
"	nmap <C-c>i :cs find i <C-R>=expand("<cfile>")<CR><CR>          " 查找包含#include处文件(文件名)的所有文件
"	nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>          " 查找这个文本字符串
"endif
