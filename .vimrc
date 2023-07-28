"-------------------------------------------------------------------------------
" GENERAL ENVIRONMENT SETTINGS 
"------------------------------------------------------------------------------- 
set number	   "Display the current line absolute number
set relativenumber "Set relative line numbers
set scrolloff=8  "Set the number of line the cursor stops before botom
set showcmd	   "Show the commands that being typed
set noshowmode     "No nee to show the mode in the command line
set noerrorbells visualbell t_vb=  "stop the annoying bell when error
set noswapfile	   "No swapfile generation
set nobackup	   "No backup
set undodir=~/.vim/undodir "Undo directory
set undofile	   "Create undofile instead of swap and backup
set mouse-=a	   "Disable the mouse in gui
set ttymouse-=a	   "Disable mouse in terminal
let base16colorspace=256   		" Access colors present in 256 colorspace
set termguicolors
set guifont=RobotoMonoNerdFontCompleteM-Regular:h12 "Font
set fillchars+=vert:\│
set cursorline "Enable cursor line
set colorcolumn=80

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg = None cterm=underline

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=237 cterm=None 

"-------------------------------------------------------------------------------
" PYTHON HIGHLIGHTS
"-------------------------------------------------------------------------------
autocmd ColorScheme * hi Comment cterm=italic guifg=#d5c4a1 ctermbg=NONE
autocmd ColorScheme * hi pythonOperator cterm=bold guifg=#8f3f71 ctermbg=NONE
autocmd ColorScheme * hi pythonBuiltin cterm=bold guifg=#007E0D ctermbg=NONE
autocmd ColorScheme * hi pythonConditional cterm=bold guifg=#3580CE ctermbg=None
autocmd ColorScheme * hi pythonNumber guifg=#007E0D
autocmd ColorScheme * hi pythonBoolean cterm=bold guifg=#076678
autocmd ColorScheme * hi pythonRepeat cterm=bold guifg=#088400
autocmd ColorScheme * hi pythonStatement cterm=bold guifg=#3580CE
autocmd ColorScheme * hi pythonDecorator guifg=#FABD2F
"
"-------------------------------------------------------------------------------
" SEARCH PARAMETERS
"------------------------------------------------------------------------------- 
set ignorecase     "Ignore case when search
set smartcase	   "But if a case is in typed, respect it
set incsearch	   "Highlight the pattern live 
set hlsearch	   "Highlight the search result
nnoremap <CR> :noh<CR><CR>:<backspace>
"-------------------------------------------------------------------------------
" PLUGINS
"-------------------------------------------------------------------------------
call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'Yggdroot/indentLine'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'wakatime/vim-wakatime'
Plug 'enricobacis/vim-airline-clock'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/tagbar'
Plug 'github/copilot.vim' 
" Plug 'junegunn/fzf.vim'
call plug#end()

"-------------------------------------------------------------------------------
" ALE OPTIONS
"-------------------------------------------------------------------------------

let g:ale_linters = {
			\ 'python' : ['pylama'],
			\}
let g:ale_fixers = {
			\ 'python' : ['black','add_blank_lines_for_python_control_statements','isort','remove_trailing_lines','trim_whitespace'],
			\}
let g:ale_completion_enabled = 0
let g:ale_echo_cursor = 1
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_virtualtext_cursor = 0
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
highlight ALEErrorSign ctermfg=red ctermbg=None
highlight ALEWarningSign ctermfg=yellow ctermbg=None
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1

"-------------------------------------------------------------------------------
" AIRLINE
"-------------------------------------------------------------------------------

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#formatter = 'unique_tail'
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline_symbols.crypt = 'c'
let g:airline_symbols.paste = 'p'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = ' U'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = 'C:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty=' '
"-------------------------------------------------------------------------------
"COC-VIM
"-------------------------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"-------------------------------------------------------------------------------
"DOCSTRING
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" NETRW
"-------------------------------------------------------------------------------

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Lexplore
  autocmd VimEnter * highlight VertSplit guifg=lightgrey guibg=black
  autocmd VimEnter * wincmd l
  autocmd colorscheme * highlight clear SignColumn
  "Overide colorscheme highlighting
  autocmd colorscheme * highlight ALEErrorSign term=reverse ctermfg=0 ctermbg=1 guifg=#ff0000 
  autocmd colorscheme * highlight ALEWarningSign term=reverse ctermfg=0 ctermbg=1 guifg=#fcd12a
  autocmd VimEnter * highlight VertSplit guifg=#3b3b3b guibg=black
  autocmd VimEnter * highlight clear LineNr " Set line number color to transparent
augroup ENDautocmd VimEnter * Vex
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 18
let g:netrw_banner=0

"-------------------------------------------------------------------------------
" INDENTLINE
"-------------------------------------------------------------------------------

let g:indentLine_color_term = 241
let g:indentLine_char_list = ['│']


"-------------------------------------------------------------------------------
" OTHER KEY BINDDINGS
"-------------------------------------------------------------------------------
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l> 
noremap<Up> <Nop>
noremap<Down> <Nop>
noremap<Left> <Nop>
noremap<Right> <Nop>
"-------------------------------------------------------------------------------
"FOLDING
"-------------------------------------------------------------------------------
autocmd FileType python setlocal foldmethod=indent
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:python_highlight_all = 1

"-------------------------------------------------------------------------------
"COLORS
"-------------------------------------------------------------------------------
"if exists('$BASE16_THEME')
"      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
"    let base16colorspace=256
"    colorscheme base16-$BASE16_THEME
"endif
colorscheme gruvbox
