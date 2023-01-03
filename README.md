# VIM configuration for python development
## Requirements:
- Python linter [pylama](https://klen.github.io/pylama/) `pip install pylama`
- Python fixers [black](https://github.com/psf/black) `pip install black`
- [Powerline plugin for terminal](https://github.com/powerline/fonts) (optional)
- [Nerd Font](https://www.nerdfonts.com/#features)
- [Base16 colors for gvim or vim](https://github.com/chriskempson/base16-vim) or for [shell](https://github.com/chriskempson/base16-shell)
- [Msgpack](https://github.com/msgpack/msgpack-python) for code completion 
- [Python LSP server](https://github.com/python-lsp/python-lsp-server) `pip install python-lsp-server`
- iPython needs to be installed too `pip install ipython`
- [nodejs](https://nodejs.org/en/download/)
- [jedi-python-language-server](https://github.com/pappasam/jedi-language-server)
## Manual Plugins Installation
To install manually.
- For statusbar [airline](https://github.com/vim-airline/vim-airline) and [aireline-themes](https://github.com/vim-airline/vim-airline-themes#vim-airline-themes--)
- For coding style, errors linting, fixing [ale](https://github.com/dense-analysis/ale#usage)
- To facilitate code completion for python: [coc-nvim](https://github.com/neoclide/coc.nvim) and [coc-jedi](https://github.com/pappasam/coc-jedi)
- To facilitate commenting several lines: [commentary](https://github.com/tpope/vim-commentary)
- For git integration: [fugitive](https://github.com/tpope/vim-fugitive)
- To see indentation: [indentline](https://github.com/Yggdroot/indentLine)
- To test python code with iPython in a terminal: [vim-slime](https://github.com/jpalardy/vim-slime)
- For icons and specific glyphs integration: [vim-devicons](https://github.com/ryanoasis/vim-devicons)

## Automatic install with vim-plug
install [vim-plug](https://github.com/junegunn/vim-plug)
No need to install the other aforementionned plugins, the .vimrc in this repository takes care of the rest
Run `:CocInstall coc-jedi`
