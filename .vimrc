"-------------------------------------------------------------------------------
" GENERAL ENVIRONMENT SETTINGS 
"------------------------------------------------------------------------------- 
set number	   "Display the current line absolute number
set relativenumber "Set relative line numbers
set cursorline 	   "Set the cursorline
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
set guifont=RobotoMonoNerdFontCompleteM-Regular:h12 "Font
set fillchars+=vert:\│
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
Plug 'wakatime/vim-wakatime'
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
highlight clear SignColumn
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1
"-------------------------------------------------------------------------------
" AIRLINE
"-------------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline_symbols.crypt = 'c'
let g:airline_symbols.paste = 'p'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = ' U'
" powerline symbols
let g:airline_left_sep =''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
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
" TOGGLE iPython
"-------------------------------------------------------------------------------
nnoremap <S-CR> :call TermToggle()<CR>
vnoremap <S-CR> <ESC>:call TermToggle()<CR>
inoremap <S-CR> <ESC>:call TermToggle()<CR>
tnoremap <S-CR> <C-W>:q!<CR>

function! TermToggle()
    if term_list() == []
        vert botright terminal ipython 
	vertical resize 25	
    else
        for term in term_list()
	    call term_sendkeys(term, "exit") " I want with tmux in term
        endfor
    endif
endfunction

"-------------------------------------------------------------------------------
" OTHER KEY BINDDINGS
"-------------------------------------------------------------------------------
nnoremap <S-left> <C-w>h
nnoremap <S-down> <C-w>j
nnoremap <S-up> <C-w>k
nnoremap <S-right> <C-w>l 
"-------------------------------------------------------------------------------
" SLIME
"-------------------------------------------------------------------------------
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1

if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif
