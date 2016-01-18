" Vim Compat {{{

"set shell=/bin/bash
set ffs=unix,dos,mac
set t_Co=256
set showcmd

if &term =~ '256color'
	set t_ut=
endif

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" }}}
" General {{{

set nonumber				" Show line numbers
set wrap
set linebreak			" Break lines at word (requires Wrap lines)
set nolist
set showbreak=+++		" Wrap-broken line prefix
set breakindent		" Break and indent based on current indent
set textwidth=140		" Line wrap (number of cols)
set colorcolumn=0
set showmatch			" Highlight matching brace
set errorbells			" Beep or flash screen on errors
set visualbell			" Use visual bell (no beeping)

set nobackup
set noswapfile
set nowb
set viminfo+=n~/.vim/viminfo

set hlsearch			" Highlight all search results
set smartcase			" Enable smart-case search
set ignorecase			" Always case-insensitive
set incsearch			" Searches for strings incrementally
set magic				" Magic shit, regex

set autoindent			" Auto-indent new lines
set cindent				" Use 'C' style program indenting
set expandtab			" Use spaces instead of tabs
set tabstop=4
set shiftwidth=4		" Number of auto-indent spaces
set smartindent			" Enable smart-indent
set smarttab			" Enable smart-tabs
set softtabstop=4		" Number of spaces per Tab

set nofoldenable			" Enable Folds
set foldmethod=marker	" Depending on Syntax, fold
set foldlevel=0
set foldlevelstart=20	" Only fold after 20 levels on open
set foldnestmax=10		" Nest Folds

set title
set titleold="Terminal"
set titlestring=%F
set clipboard=unnamed
set cmdheight=2
set mouse=a

set bomb
set binary

" }}}
" Advanced {{{

set autoread			" Auto Reads a file upon change
set ruler				" Show row and column ruler information
set hidden				" Show hidden files in NerdTree and :e
set autowriteall		" Auto-write all file changes
set gcr=a:blinkon0
set modeline
set modelines=10
set updatetime=1000
set timeoutlen=1000
set ttimeoutlen=0
set synmaxcol=500

set undolevels=1000		" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set wildchar=<Tab>
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.ico,*.gif,*.ttf,*.eot,*.sql,*.woff,*.svg
let mapleader=","

set scrolljump=10
set scrolloff=10
set sidescrolloff=12
set showcmd				" display incomplete commands
set cmdheight=1
set hid					" Abandoned buffers become hidden
set formatoptions=c,q,r,t

if has("gui_running")
	"set guioptions-=m		" menu bar - for the feels
	set guioptions-=T		" toolbar
	set guioptions-=r		" scrollbar
	set guioptions-=L		" Left Scroll bar
	set guioptions-=e		" disable tabs
	set guioptions-=m		" remove menu
	set guifont=tewi		" Source Code Pro Font
	set linespace=6
	set guiheadroom=0
	set noerrorbells
	set novisualbell
end

set lazyredraw			" Don't redraw while executing macros

" set omnifunc=syntaxcomplete#Complete

set tags=.git/tags;,./tags;

let g:acp_enableAtStartup = 0 " Disable AutoComplPop

let no_buffers_menu=1

" }}}
" Plug Packages {{{

syntax on
syntax sync minlines=256

call plug#begin('~/.config/nvim/plugged')

" Look and Feel
Plug 'reedes/vim-colors-pencil'
Plug 'cdmedia/itg_flat_vim'

" UI Improvements
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'itchyny/vim-gitbranch'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

" Programming Improvments
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --gocode-completer' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" {{{ Go

Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go'

" }}}
" {{{ Docker

Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}

" }}}

" Go Native Plugin
set runtimepath+=$GOROOT/misc/vim

call plug#end()
filetype plugin indent on	 " required

" }}}
" Colors & Statusline {{{

set background=dark
colorscheme itg_flat
let g:airline_theme = 'pencil'

set cursorline
set nocursorcolumn

highlight cursorline				ctermfg=none ctermbg=black
highlight cursorcolumn				ctermfg=none ctermbg=black
highlight statusline				ctermfg=white ctermbg=black
highlight signcolumn				ctermfg=grey ctermbg=none guibg=#282A31
highlight colorcolumn				ctermfg=none ctermbg=black
highlight BadWhitespace				ctermbg=red guibg=red

set laststatus=2

" }}}
" Autogroups {{{

augroup vimrc
	autocmd!
	autocmd BufReadPre * setlocal foldmethod=marker
	autocmd BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=marker | endif
	autocmd BufReadPre * setlocal foldlevel=0
augroup END

augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn

	autocmd FileType mail setlocal spell
	autocmd FileType go setlocal foldmethod=indent

	autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\	exe "normal! g`\"" |
				\ endif
	" Limit Quick Fix
	autocmd FileType qf call AdjustWindowHeight(3, 10)
augroup END

" }}}
" Custom Functions {{{

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf("vim: set ft=%s ts=%d sw=%d tw=%d fdm=%s foldlevel=%d %set :",
				\ &filetype, &tabstop, &shiftwidth, &textwidth, &foldmethod, &fdl, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<cr>

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
	" save last search & cursor position
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

" Limit Quickfix Window Height
function! AdjustWindowHeight(minheight, maxheight)
	exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" }}}
" Vim Bindings {{{

nmap <leader>p :bp<cr>
nmap <leader>n :bn<cr>
nmap <leader>d :bd!<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>

nnoremap <leader>w :w!<cr>
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>

nnoremap <silent> <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

nnoremap <silent> <C-PageUp> :bp<cr>
nnoremap <silent> <C-PageDown> :bn<cr>
nnoremap <silent> <C-Delete> :bd!<cr>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

map <leader>ss :setlocal spell!<cr>
map <leader>/ :noh<cr>
vnoremap <M-/> <Esc>/\%V
map <HOME> ^
map <leader>o <C-p>

" }}}
" Plugin bindings and functionality {{{

"
" Vim-airline
"

" let g:airline_extensions = ['branch', 'syntastic', 'tabline', 'whitespace', 'hunks']

let g:airline_left_sep=''
let g:airline_right_sep=''

" Enable the list of buffers
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 0
let g:bufferline_echo = 0

let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#fnamecollapse = 0

" NerdTree
map <C-n> :NERDTreeToggle<cr>i

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_style_error_symbol = '✘'
let g:syntastic_style_warning_symbol = "▲"
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1

" Tagbar
let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'	  : ['p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions'],
			\ 'sro' : '.',
			\ 'kind2scope' : {'t' : 'ctype', 'n' : 'ntype'},
			\ 'scope2kind' : {'ctype' : 't', 'ntype' : 'n'},
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

let g:tagbar_autofocus = 1

nmap <F8> :TagbarToggle<cr>

" vim-gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_max_signs = 250 " default value: 500
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '--'

" Ctrl-p && Ag
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
			\ "dir": '\v[\/]\.(git|hg|svn)$',
			\ "file": '\v\.(exe|so|dll|jpeg|jpg|png|gif)'
			\ }

if executable('ag')
	map <leader>f :Ag<Space>
	" Use Ag over Grep
	set grepprg="ag -i --nogroup --nocolor"

	" Use Ag over Ack
	let g:ackprg='ag -i --nogroup --nocolor --column'

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command='ag -i %s -l --nocolor -g ""'
endif

" YCM
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_specific_completion_to_disable = {
			\ 'gitcommit': 1
			\}

" fatih/vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1



" }}}

"vim: set ft=vim ts=4 sw=4 tw=78 fdm=marker foldlevel=0 noet :
