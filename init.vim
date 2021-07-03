"
syntax on
set ignorecase
set noshowmatch
"set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap
set smartcase
set noswapfile
set backup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set nobackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
autocmd BufWritePost *.tex silent! execute "!pdflatex main.tex >/dev/null 2>&1" | redraw!
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-buftabline'
Plug 'sirver/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_quickfix_mode=0

call plug#end()
let g:UltiSnipsExpandTrigger ='<tab>'
let g:tex_flavor='latex'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:coc_disable_startup_warning = 1
" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:trans_bin = "~/.vim"
colorscheme gruvbox
set background=dark
if executable('rg')
    let g:rg_derive_root='true'
endif

au BufRead,BufNewFile *.edp setfiletype cpp
nnoremap S :%s//g<Left><Left>

let mapleader =" "

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
	set relativenumber

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	map <leader>z ZZ
	map <leader>w :w<CR>
	map <leader>s :Snippets<CR>
	map <leader>q ZQ
    nnoremap <C-f> :Files<CR>
    nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
    let g:netrw_browse_split = 2
    let g:vrfr_rg = 'true'
    let g:netrw_banner = 0
    let g:netrw_winsize = 25

" Open the selected text in a split (i.e. should be a file).
	map <leader>o "oyaW:sp <C-R>o<CR>
	xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
	vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
	vnoremap <leader>t :TransSelectDirection<CR>2<CR><CR>
    map <leader>f :Goyo<CR>:set rnu<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding .pdf
	map <leader>p :!opout <c-r>%<CR><CR>

" Compile document
	map <leader>c :!compiler <c-r>%<CR>

"For saving view folds:
	"au BufWinLeave * mkview
	"au BufWinEnter * silent loadview

" Interpret .md files, etc. as .markdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Make calcurse notes markdown compatible:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" groff files automatically detected
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff

" .tex files automatically detected
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Readmes autowrap text:
	autocmd BufRead,BufNewFile *.md set tw=79

" Get line, word and character counts with F3:
	map <F3> :!wc %<CR>

" Spell-check set to F6:
	map <F6> :setlocal spell! spelllang=en_us,it<CR>

" Use urlview to choose and open a url:
	:noremap <leader>u :w<Home>silent <End> !urlscan<CR>
	:noremap ,, :w<Home>silent <End> !urlscan<CR>

" Copy selected text to system clipboard (requires gvim installed):
	vnoremap <C-c> "*Y :let @+=@*<CR>
	map <C-p> "+P


	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=100

" Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu


" Automatically deletes all tralling whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.key_directories,~/.key_files !bash ~/.scripts/tools/shortcuts

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

set noerrorbells visualbell t_vb=
set wildmode=longest:full,full
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)




nnoremap <Leader>b :ls<Cr>:b<Space>
nnoremap <Space>b :ls<CR>:b<Space>
nnoremap <Leader>1 :e intro.tex<CR>
nnoremap <Leader>2 :e related.tex<CR>
nnoremap <Leader>3 :e problem.tex<CR>
nnoremap <Leader>4 :e chap4.tex<CR>
nnoremap <Leader>` :e main.tex<CR>
nnoremap <Leader>r :e references.bib<CR>
setlocal spell
set spelllang=it,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <silent> j gj
nmap <silent> k gk
    let g:trans_directions_list = [
        \['en', 'it'],
        \['it', 'en'],
        \['', ''],
    \]
vnoremap ff :s:\\ :\\:g \| s: {:{:g \| s: _ :_:g<CR>



    vnoremap <buffer> k gk
    vnoremap <buffer> j gj
