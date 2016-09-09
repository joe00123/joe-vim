" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"------------------------------------自定义配置------=============
execute pathogen#infect()
syntax on
filetype plugin indent on
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"
" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1

let g:dbext_default_profile_mySQL = 'type=MYSQL:user=admin:passwd=admin:dbname=test'
let g:dbext_default_profile_et = 'type=MYSQL:user=admin:passwd=admin:dbname=eticket10_0_0_25'
let g:dbext_default_profile_et_24 = 'type=MYSQL:user=admin:passwd=admin:dbname=eticket10_0_0_25:host=192.168.90.24'
let g:dbext_default_profile_et_22 = 'type=MYSQL:user=admin:passwd=admin:dbname=eticket10_0_0_25:host=192.168.90.22'
let g:dbext_default_profile_ykt_22 = 'type=MYSQL:user=admin:passwd=admin:dbname=ykt2_9:host=192.168.90.22'
let g:dbext_default_profile_ykt = 'type=MYSQL:user=admin:passwd=admin:dbname=ykt2_9'
let g:dbext_default_profile_ykt_24 = 'type=MYSQL:user=admin:passwd=admin:dbname=ykt2_9:host=192.168.90.24'
let g:dbext_default_profile = 'mySQL'


if has('autocmd') 
	let g:EclimCompletionMethod = 'omnifunc'
	autocmd FileType java set omnifunc=eclim#java#complete#CodeComplete
endif

function! DebugJava( )
	"execute ':ProjectBuild'
  if !eclim#project#util#IsCurrentFileInProject()
    return
  endif

  let project = eclim#project#util#GetCurrentProjectName()
  let command = '-command java_classpath -p "<project>"'
  let command = substitute(command, '<project>', project, '')
  for arg in a:000
    if arg == '\n'
      let arg = "\n"
    endif
    let command .= " \"" . arg . "\""
  endfor
  let result = eclim#Execute(command)
  if result == '0'
    return
  endif

	"if a:complie==1 
		"execute ':!ant complie1'
	"elseif a:complie==2
		"execute ':!javac -cp '.result.' -d build/classes '.expand('%')
	"endif
	"execute ':!java -cp '.result.' '.eclim#java#util#GetFullyQualifiedClassname()
	"execute ':n result |read ! java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 -cp '.result.' '.eclim#java#util#GetFullyQualifiedClassname()
	let mm = 'java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 -cp '.result
	let mm .=' '.eclim#java#util#GetFullyQualifiedClassname()
  "execute ':!echo "'.mm.'" > /tmp/a.sh'
  "execute ':!nohup '.mm.' > /tmp/result &'
  execute ':!'.mm.' >> /tmp/result &'
	execute ':n /tmp/result'
endfunction

function! RunJava( )
	"execute ':ProjectBuild'
  if !eclim#project#util#IsCurrentFileInProject()
    return
  endif

  let project = eclim#project#util#GetCurrentProjectName()
  let command = '-command java_classpath -p "<project>"'
  let command = substitute(command, '<project>', project, '')
  for arg in a:000
    if arg == '\n'
      let arg = "\n"
    endif
    let command .= " \"" . arg . "\""
  endfor
  let result = eclim#Execute(command)
  if result == '0'
    return
  endif

	"if a:complie==1 
		"execute ':!ant complie1'
	"elseif a:complie==2
		"execute ':!javac -cp '.result.' -d build/classes '.expand('%')
	"endif
	execute ':!java -cp '.result.' '.eclim#java#util#GetFullyQualifiedClassname()
	"execute ':n result |read ! java -cp '.result.' '.eclim#java#util#GetFullyQualifiedClassname()
endfunction


syntax on
set nu
set cindent
set smartindent
set showmatch
set incsearch
set shiftwidth=2
set ruler
set tabstop=2
set title
set smarttab
set fdm=indent
set nobackup
filetype on
set autoindent
syntax enable
if has('gui')
colorscheme desert
endif

"tagbar配置
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.clj,*.java,*.groovy call tagbar#autoopen()
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.clj,*.java,*.groovy,*.py :IndentGuidesToggle
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.clj,*.java,*.groovy :NERDTree 
au InsertLeave *.* write 
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_type_arduino = {
    \ 'ctagstype' : 'c++',
    \ 'kinds'     : [
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0'
    \ ],
    \ 'sro'        : '::',
		\ }
let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
        \ 'u:variables',
    \ ]
		\ }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_classpath='/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home/lib/tools.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home/lib/dt.jar./lib/*.jar:./WebRoot/WEB-INF/classes:'
"代码缩进颜色
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0
" hi IndentGuidesOdd  ctermbg=cyan
" hi IndentGuidesEven ctermbg=black
autocmd FileType python set colorcolumn=80
set t_Co=256
set cursorline

"解释clojure文件缓存
nmap ,b :e!#<CR>
"删除缓存内容
nmap ,da ggdG<CR>
nmap ,o <Esc>:TagbarOpen j<CR>/
nmap ,t <Esc>:NERDTree<CR>
nmap ,tm <Esc>:NERDTreeMirror<CR>
nmap ,tt <Esc>t:NERDTreeMirror<CR>
nmap ,vs :source ~/.vim/vimrc<CR>
nmap ,ve :e ~/.vim/vimrc<CR>
nmap ,q :wa<CR>:qa!<CR>
nmap ,tag :!ctags -R --language-force=java --fields=+iaS --extra=+q  .
vmap ,cp "+y
nmap ,pp "+p
nmap ,tl :Egrep -ir 'todo\\|fixme'
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' 
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-b> <Esc>:w<CR>:b 
inoremap <C-w> <Esc>:w<CR>i
imap ,w <Esc>:call Save()<CR>
imap ,y <Esc>"+yiw
imap ,/ <Esc><Leader>__a
imap ,diw <Esc>diwi
imap ,gh <Esc>0i
imap ,ge <Esc>$i
imap ,gf <Esc>/
nmap ,s" ysiw"a
if has('autocmd') 
	autocmd FileType clojure nmap ,e :w<CR>maggcpG`a
	autocmd FileType clojure imap <D-e> <Esc>:w<CR>maggcpG`a
	"autocmd FileType java nmap ,e :w<CR>:call RunJava()<CR>
	autocmd FileType java nmap ,e :w<CR>:Java %<CR>
	autocmd FileType java nmap ,d :w<CR>:call DebugJava()<CR>
	autocmd FileType java imap <C-o> <Esc>:JavaSearch<CR>
	autocmd FileType java nmap ,dt :JavaDebugBreakpointToggle<CR>
	autocmd FileType java nmap ,dl :JavaDebugBreakpointsList<CR>
	autocmd FileType java nmap ,ds :JavaDebugStatus<CR>
	autocmd FileType java nmap ,dd :JavaDebugBreakpointRemove<CR>
	autocmd FileType java nmap ,db :JavaDebugStart localhost 1044<CR>
	autocmd FileType java nmap ,do :JavaDebugStep over<CR>,ds
	autocmd FileType java nmap ,di :JavaDebugStep into<CR>
	autocmd FileType java nmap ,dr :JavaDebugStep return<CR>
	autocmd FileType java nmap ,de :JavaDebugStop<CR>
	autocmd FileType java nmap ,pk :Ant debug install<CR>
	autocmd FileType java,groovy nmap ,si :JavaImportOrganize<CR>
	autocmd FileType java nmap ,sf :%JavaFormat<CR>
	autocmd FileType java nmap ,sc :JavaCorrect<CR>
	autocmd FileType java nmap ,ig :JavaGetSet!<CR>
	autocmd FileType java,groovy nmap ,ii :JavaImpl<CR>
	autocmd FileType java nmap ,ic :JavaConstructor!<CR>
	autocmd FileType java,groovy nmap ,id :JavaDocComment<CR>
	autocmd FileType java nmap ,rn :JavaRename 
	autocmd FileType java,groovy nmap ,gd :JavaSearchContext 
	autocmd FileType python setlocal omnifunc=jedi#completions
	autocmd FileType python TagbarOpen<CR>
	autocmd FileType python nmap ,e :w !python<CR>
	autocmd FileType groovy nmap ,e :w<CR>:!groovy -classpath ./ % 
	autocmd FileType typescript let g:tsuquyomi_disable_quickfix = 1
	autocmd FileType typescript let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker."
endif
if has("cscope")
	" set cscopequickfix=s-,c-,d-,i-,t-,e-
	set csto=1
	" set cst
	" set csverb
	nmap ,cs :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap ,cg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap ,cc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap ,ct :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap ,ce :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap ,cf :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
	nmap ,ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
	nmap ,cd :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif
let NERDTreeIgnore=['.pyc$[[file]]','.class$[[file]]']
let g:airline#extensions#tabline#enabled = 1
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
if has('gui')
	set guifont=Nimbus\ Mono\ L\ 12
endif
let g:ycm_filetype_specific_completion_to_disable = { 'python': 1  }
set rtp+=~/.vim/bundle/jsx.vim-master

function! Save()
	let b:tmp = &ft
	execute 'w'
	execute "set ft=".b:tmp
endfunction

nmap <leader>z :MaximizerToggle<CR>

set dictionary+=./dict.txt
