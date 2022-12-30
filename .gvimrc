"-------------------------------------------------------------------------------
" GUI INSTANTIATION 
"-------------------------------------------------------------------------------

set fu			   		" Set full screen mode
let base16colorspace=256   		" Access colors present in 256 colorspace
colorscheme base16-irblack 		" Set the colortheme
set colorcolumn=80	   		" Set the ruler
set guicursor+=a:blinkon0		" Disable blinking cursor
"-------------------------------------------------------------------------------
"                AIRLINE
"-------------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
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
" SLIME
"-------------------------------------------------------------------------------

let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1

