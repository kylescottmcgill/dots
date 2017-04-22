" Vim Compat {{{

set shell=/bin/bash
set ffs=unix,dos,mac
set t_Co=256
set showcmd

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" }}}
" General {{{

set number				" Show line numbers
set wrap
set linebreak			" Break lines at word (requires Wrap lines)
set nolist
set showbreak=+++		" Wrap-broken line prefix
set breakindent			" Break and indent based on current indent
set textwidth=140		" Line wrap (number of cols)
set colorcolumn=0
set showmatch			" Highlight matching brace
set errorbells			" Beep or flash screen on errors
set visualbell			" Use visual bell (no beeping)

set nobackup
set noswapfile
set nowritebackup
set viminfo+=n~/.cache/viminfo

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
set noshowmode

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

"set lazyredraw			" Don't redraw while executing macros

" }}}
" Plug Packages {{{

syntax on
syntax sync minlines=256

call plug#begin('~/.config/nvim/plugged')

" Look and Feel
Plug 'fxn/vim-monochrome'
Plug 'cdmedia/itg_flat_vim'
Plug 'vyshane/cleanroom-vim-color'
Plug 'owickstrom/vim-colors-paramount'
Plug 'mhartington/oceanic-next'

" UI Improvements
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'

" Programming Improvments
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'chr4/nginx.vim'

" {{{ Go

Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'garyburd/go-explorer', {'for': 'go'}
Plug 'zchee/deoplete-go', { 'do': 'make'}

" }}}

" Go Native Plugin
set runtimepath+=$GOROOT/misc/vim

call plug#end()
filetype plugin indent on	 " required

" }}}
" Colors & Statusline {{{
"

set background=light
colorscheme paramount

set cursorline
set nocursorcolumn

" highlight cursorline		ctermfg=none ctermbg=grau
highlight cursorcolumn		ctermfg=none ctermbg=gray
highlight statusline		ctermfg=white ctermbg=black
highlight signcolumn		ctermfg=none ctermbg=black
highlight colorcolumn		ctermfg=none ctermbg=black
highlight BadWhitespace		ctermbg=red guibg=red

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

	autocmd FileType go setlocal foldmethod=indent
	autocmd FileType gitcommit set tw=72 | set spell | set colorcolumn=50

	autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\	exe "normal! g`\"" |
				\ endif
	" Limit Quick Fix
	autocmd FileType qf call AdjustWindowHeight(3, 10)

    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

autocmd BufNewFile,BufRead *.py set tabstop=4 | set softtabstop=4 | set shiftwidth=4 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

" }}}
" Custom Functions {{{

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf(" vim: ft=%s ts=%d sw=%d tw=%d fdm=%s foldlevel=%d :",
				\ &filetype, &tabstop, &shiftwidth, &textwidth, &foldmethod, &fdl)
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

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" }}}
" Vim Bindings {{{

nmap <leader>z :Goyo<cr>
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
nnoremap <silent> <C-h> <c-w>l
nnoremap <silent> <C-l> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

nnoremap <silent> <C-PageUp> :bp<cr>
nnoremap <silent> <C-PageDown> :bn<cr>
nnoremap <silent> <C-Delete> :bd!<cr>

nnoremap gV `[v`]

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

map <leader>ss :setlocal spell!<cr>
map <leader>/ :noh<cr>
vnoremap <M-/> <Esc>/\%V
map <HOME> ^
map <leader>o <C-p>

" }}}
" Plugin bindings and functionality {{{
"

"
" Goyo
"

let g:goyo_width="80%"
let g:goyo_height="80%"
let g:goyo_linenr="2"

"
" Lightline
"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ }
      \ }

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

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

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

" fatih/vim-go
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 0

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#jedi#statement_length = 50
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 0

autocmd FileType python setlocal completeopt-=preview

" }}}

"vim: set ft=vim ts=4 sw=4 tw=78 fdm=marker foldlevel=0 noet :
