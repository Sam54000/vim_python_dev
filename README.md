# Personal VIM configuration for python development
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
- 
## Installation
### On macOS
* Install vim: [`brew install vim`](https://formulae.brew.sh/formula/vim) for vim and/or download [macvim](https://github.com/macvim-dev/macvim)
* Clone the repo
  - `mkdir ~/codes`
  - `cd ~/codes
  - `git clone https://github.com/Sam54000/vim`
* Create symbolic links: 
  - `ln -s ~/codes/vim/.vimrc ~/.vimrc` (or use `sudo` if permission denied)
  - `ln -s ~/codes/vim/.gvimrc ~/.gvimrc`
 ### On MS Windows 
 * Install vim: [download gvim](https://ftp.nluug.nl/pub/vim/pc/gvim90.exe)
* Clone the repo
  - `mkdir $HOME/codes`
  - `cd $HOME/codes`
  - `git clone https://github.com/Sam54000/vim`
* Create symbolic links:
Run cmd in administrator mode
  - `mklink "C:Program Files (x84)/Vim/_vimrc" $HOME/codes/vim/_vimrc`
  - `mklink "C:Program Files (x84)/Vim/_gvimrc" $HOME/codes/vim/_gvimrc`
  - And a personal colorscheme optimal for working during the night (inspired from hybrid_reverse from [vim-hybrid-material](https://github.com/kristijanhusak/vim-hybrid-material)) `mklink "C:Program Files (x84)/Vim/vim90/colors/new_york_windows.vim" $HOME/codes/vim/colorschemes/new_york_windows.vim`

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
install [vim-plug](https://github.com/junegunn/vim-plug).

No need to install the other aforementionned plugins, the .vimrc in this repository takes care of the rest.

Run `:CocInstall coc-jedi`


## TODO
Modify dotfiles for mac to deal with slime-plugin and ipython
