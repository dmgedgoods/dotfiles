 syntax enable 
 let g:python3_host_prog = "/usr/bin/python3"
 let g:indentLine_enabled = 0
 let g:indentLine_conceallevel = 0
 set backspace=indent,eol,start
 set fileformat=unix
 set encoding=UTF-8

 au BufNewFile,BufRead *.py
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set autoindent
 set smartindent
 set smarttab
 set expandtab
 set nowrap
 set nolist
 "--set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<

 set cursorline
 set number
 set relativenumber
 set scrolloff=8
 set signcolumn=yes
 set showcmd
 set noshowmode
 set conceallevel=2
 set shortmess+=c
 set formatoptions-=cro

 set noerrorbells visualbell t_vb=
 set noswapfile
 set nobackup
 set undodir=~/.vim/undodir
 set undofile
 set clipboard=unnamed

 set ignorecase
 set smartcase
 set incsearch
 set hlsearch
 nnoremap <CR> :noh<CR><CR>:<backspace>
 so ~/.vim/plugins.vim
 "--"so ~/.vim/autoclose.vim

 "-- COLOR & THEME CONFIG
 set termguicolors
 let g:gruvbox_italic=1
 colorscheme gruvbox
 set background=dark
 hi Normal guibg=NONE ctermbg=NONE
 let g:terminal_ansi_colors = [
     \ '#282828', '#cc241d', '#98971a', '#d79921', '#458588', '#b16286', '#689d6a', '#a89984',
     \ '#928374', '#fb4934', '#b8bb26', '#fabd2f', '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
 \]

 "-- Keymaps
 let mapleader = " "
 nnoremap <leader>n :NERDTreeToggle<CR>
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeFocus<CR>
 nnoremap <C-f> :NERDTreeFind<CR>

 noremap <C-J> <C-W>j
 noremap <C-K> <C-W>k
 noremap <C-H> <C-W>h
 noremap <C-L> <C-W>l

 "-- Vintex stuff
 "This is necessary for VimTeX to load properly. The "indent" is optional.
 " Note: Most plugin managers will do this automatically!
 "filetype plugin 
 "indent on

" This enables Vim's and neovim's syntax-related features. Without this,
"some
" VimTeX features will not work (see :help vimtex-requirements" for more
" info).
" Note: Most plugin managers will do this automatically!
" syntax enable

" Viewer options: One may configure the viewer either by specifying a
"built-in
" viewer method:
let g:vimtex_view_method = 'skim'

" Or with a generic interface:
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which
"is
" strongly recommended, you probably don't need to configure anything. If
"you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the
"documentation,
" see :help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = " "
augroup VimTeX
     autocmd!
     autocmd BufReadPre
        \ let b:vimtex_main = '/Users/mack/.vim/plugged/vimtex/test/example-quick-start/main.tex'
augroup END
let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
"'abdmg'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']  
