set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}






"ADDED PLUGINS



"NERDTree

  Plugin 'preservim/nerdtree'

"AIRLINE
  
 Plugin 'vim-airline/vim-airline' 
 Plugin 'vim-airline/vim-airline-themes'
 
"GOLANG

 Plugin 'fatih/vim-go'

"JAVAAUTOCOMPLETE2
 
 Plugin 'artur-shaik/vim-javacomplete2'  
  
  
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


" Put your non-Plugin stuff after this line


":colorscheme torte
":set bg=dark
:syntax on
:set shell=/bin/bash
:set paste
:set number
:tab all
"Fullscreen
":set lines=999 columns=999
""Airline theme"
 "let g:airline_theme='solarized'
 "let g:airline_solarized_bg='dark'
  let g:airline_theme='papercolor'

"let g:go_bin_path = $HOME."/go/bin"  export PATH=$PATH:/usr/local/go/bin 
:set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_list_type = "quickfix"

"SKELETON FILE
:autocmd BufNewFile *.java 0r ~/.vim/templates/skeleton.java

"MAPPING F5 TO COMPILE AND RUN
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == '  c'
        exec "!g++ % -o %<  "
        exec "!time ./%<"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc 

"JAVAAUTOCOMPLETE2 CONFIG
autocmd FileType java setlocal omnifunc=javacomplete#Complete

