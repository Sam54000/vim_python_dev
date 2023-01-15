"-------------------------------------------------------------------------------
" GENERAL ENVIRONMENT SETTINGS 
"------------------------------------------------------------------------------- 
set number	   "Display the current line absolute number
set relativenumber "Set relative line numbers
set scrolloff=8    "Set the number of line the cursor stops before botom
set showcmd	   "Show the commands that being typed
set noshowmode     "No nee to show the mode in the command line
set noerrorbells t_vb=  "stop the annoying bell when error
set noswapfile	   "No swapfile generation
set nobackup	   "No backup
set undodir ="$HOMEDRIVE/$HOMEPATH/vimfiles/undodir" "Undo directory
set undofile	   "Create undofile instead of swap and backup
set mouse-=a	   "Disable the mouse in gui
set ttymouse-=a	   "Disable mouse in terminal
autocmd GUIEnter * simalt ~x

set cursorline "Enable cursor line

" Change Color when entering Insert Mode #005f00
autocmd InsertEnter * highlight  CursorLine guibg=#1f401f ctermbg=22 ctermfg=None
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine guibg=#262626 ctermbg=235 ctermfg=None

let g:enable_bold_font = 1
let g:enable_italic_font = 1
let base16colorspace=256   		" Access colors present in 256 colorspace
set background=dark
colorscheme new_york_windows
set colorcolumn=80	   		" Set the ruler
set guicursor+=a:blinkon0		" Disable blinking cursor
highlight LineNr guifg=#303030
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if (has("termguicolors"))
  set termguicolors
endif
"-------------------------------------------------------------------------------
" SEARCH PARAMETERS
"------------------------------------------------------------------------------- 
set ignorecase     "Ignore case when search
set smartcase	   "But if a case is in typed, respect it
set incsearch	   "Highlight the pattern live 
set hlsearch	   "Highlight the search result
nnoremap <CR> :noh<CR><CR>:<backspace>

autocmd CursorHold * silent call CocActionAsync('highlight')
"-------------------------------------------------------------------------------
" PLUGINS
"-------------------------------------------------------------------------------

call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'Yggdroot/indentLine'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-python/python-syntax'
Plug 'wakatime/vim-wakatime'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ajmwagar/vim-deus'
Plug 'tmhedberg/SimpylFold'
" Plug 'junegunn/fzf.vim'
call plug#end()

let g:pydocstring_doq_path = "$PYTHONPATH/Scripts/doq.exe"

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
highlight clear SignColumn
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
"-------------------------------------------------------------------------------
" AIRLINE
"-------------------------------------------------------------------------------
let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
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
" NETRW
"-------------------------------------------------------------------------------

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Lexplore
  autocmd VimEnter * wincmd l
  autocmd colorscheme * highlight clear SignColumn
  "Overide colorscheme highlighting
  autocmd colorscheme * highlight ALEErrorSign term=reverse ctermfg=0 ctermbg=1 guifg=#ff0000 
  autocmd colorscheme * highlight ALEWarningSign term=reverse ctermfg=0 ctermbg=1 guifg=#fcd12a
augroup ENDautocmd VimEnter * Vex
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 18
let g:netrw_banner=0

"-------------------------------------------------------------------------------
" COC
"-------------------------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "<C-CR>\<c-r>=coc#on_enter()\<C-CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor
nnoremap <Tab> :silent call CocActionAsync('highlight')
nnoremap <A-r> <Plug>(coc-rename)
"-------------------------------------------------------------------------------
" INDENTLINE
"-------------------------------------------------------------------------------

let g:indentLine_color_term = 241
let g:indentLine_char_list = ['│']

"-------------------------------------------------------------------------------
" SLIME do not use their ipython workaround!!!!!
"-------------------------------------------------------------------------------
let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "ipython"
let g:slime_cell_delimiter = "#%%"

noremap <S-CR> :call IpythonTerminal()<CR>

xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c>s     <Plug>SlimeSendCell
function! IpythonTerminal()
  if term_list() == []
    vert botright terminal ipython
    vertical resize 65
    wincmd h
  endif
endfunction
nmap <Space> :call term_sendkeys('!ipython',"\<lt>cr>")<CR>
"
"-------------------------------------------------------------------------------
" OTHER KEY BINDDINGS
"-------------------------------------------------------------------------------
" Moving between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Moving between buffers
nmap <S-h> :bp!<CR>
nmap <S-l> :bn!<CR>

"-------------------------------------------------------------------------------
" PYDOCSTRING
"-------------------------------------------------------------------------------
let g:pydocstring_formatter = 'numpy'

"------------------------------------------------------------------------------- 
" SIMPLYFOLD
"-------------------------------------------------------------------------------
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

let g:python_highlight_all = 1
