# Personal VIM configuration for python development
Personal VIM configuration for python development in order to make it deployable if I have to use another computer.
This is **VERY** far from being perfect, the configuration is still under improvement. Anyone who start to tweak around vim configuration can take some of the ideas here but shouldn't rely at 100% on it. Ideas of improvement are more than welcome, thank you in advance!
## Requirements:
- Python linter [pylama](https://klen.github.io/pylama/) `pip install pylama`
- Python fixers [black](https://github.com/psf/black) `pip install black`
- [Powerline plugin for terminal](https://github.com/powerline/fonts) (optional)
- [Nerd Font](https://www.nerdfonts.com/#features)
- [Base16 colors for gvim or vim](https://github.com/chriskempson/base16-vim) or for [shell](https://github.com/chriskempson/base16-shell)
- [Msgpack](https://github.com/msgpack/msgpack-python) for code completion 
- [Python LSP server](https://github.com/python-lsp/python-lsp-server) `pip install python-lsp-server`
- [iPython](https://ipython.org/) needs to be installed too `pip install ipython`
- [nodejs](https://nodejs.org/en/download/)
- [jedi-python-language-server](https://github.com/pappasam/jedi-language-server)
- doq: `pip install doq`

## Installation
### On macOS
* Install vim: [`brew install vim`](https://formulae.brew.sh/formula/vim) for vim and/or download [macvim](https://github.com/macvim-dev/macvim)
* Clone the repo
  - `mkdir ~/codes`
  - `cd ~/codes
  - `git clone https://github.com/Sam54000/vim`
* Create symbolic links:
  - Links to vin config files  
 ```
 cd && ln -s ~/codes/vim/.vimrc
 cd && ln -s ~/codes/vim/.gvimrc
 ```
  - Add personal colorscheme which appears to be optimal for working during the night (inspired from hybrid_reverse from [vim-hybrid-material](https://github.com/kristijanhusak/vim-hybrid-material)) 
 ```
 cd && ln -s $HOME/codes/vim/colorscheme/new_york_mac.vim $VIMRUNTIME/colors/new_york_mac.vim
 ``` 
  color theme for mac come with a higher contrast due to retina screens.

 ### On MS Windows 
 * Install vim: [download gvim](https://ftp.nluug.nl/pub/vim/pc/gvim90.exe)
* Clone the repo
  - `mkdir $HOME/codes`
  - `cd $HOME/codes`
  - `git clone https://github.com/Sam54000/vim`
* Create symbolic links:
Run cmd in administrator mode
```
 mklink "C:Program Files (x84)/Vim/_vimrc" $HOME/codes/vim/_vimrc
 mklink "C:Program Files (x84)/Vim/_gvimrc" $HOME/codes/vim/_gvimrc
 ```
  - Add personal colorscheme which appears to be optimal for working during the night (inspired from hybrid_reverse from [vim-hybrid-material](https://github.com/kristijanhusak/vim-hybrid-material)) 
 ```
 mklink "$VIMRUNTIME/colors/new_york_windows.vim" $HOME/codes/vim/colorscheme/new_york_windows.vim
 ```

## Automatic install with vim-plug
install [vim-plug](https://github.com/junegunn/vim-plug).

No need to install the other aforementionned plugins, the .vimrc in this repository takes care of the rest.

Run `:CocInstall coc-jedi`

## Manual Plugins Installation
If you want to install manually (it was what I used to do before realizing that I have to do this repetitive task on each new computers)

- For statusbar [airline](https://github.com/vim-airline/vim-airline) and [aireline-themes](https://github.com/vim-airline/vim-airline-themes#vim-airline-themes--)
- For coding style, errors linting, fixing [ale](https://github.com/dense-analysis/ale#usage)
- To facilitate code completion for python: [coc-nvim](https://github.com/neoclide/coc.nvim) and [coc-jedi](https://github.com/pappasam/coc-jedi) and don't forget to run `:CocInstall coc-jedi` in vim.
- To facilitate commenting several lines: [commentary](https://github.com/tpope/vim-commentary)
- For git integration: [fugitive](https://github.com/tpope/vim-fugitive)
- To see indentation: [indentline](https://github.com/Yggdroot/indentLine)
- To test python code with iPython in a terminal: [vim-slime](https://github.com/jpalardy/vim-slime)
- For icons and specific glyphs integration: [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- For python highlighting: [python-syntax](https://github.com/vim-python/python-syntax/)
- For python automatic docstring: [vim-pydocstring](https://github.com/heavenshell/vim-pydocstring)
- For python folding: [SimplyFold](https://github.com/tmhedberg/SimpylFold)

## TODO
Modify dotfiles for mac to deal with slime-plugin and ipython
