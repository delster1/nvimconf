# d3's nvimconf

This is my neovim configuration. It is a work in progress and is constantly being updated.  


## If you're here from ACM
Setting up nvim is pretty simple, i'm gonna try to give an overview of how to do it with my configs 
### Steps To Install
#### 1 - Install neovim

It's probably best to follow the instructions on the [neovim website](https://github.com/neovim/neovim/blob/master/INSTALL.md)

`sudo pacman -S neovim` if you're on arch (i use arch btw)

if you're on windows, download WSL. Installing nvim on windows is interesting...

#### 2 - Clone this repo
use `git clone https://github.com/delster1/nvimconf.git` to clone this repo
- this should make a folder called "nvimconf" in your current directory

#### 3 - Move the folder to the right place
Lots of packages and things you install for your terminal hide themselves in what are called "dotfiles". These are files that are hidden by default.
- they always start with a period (.)
- there can also be hidden folders (like .config)
- these files are usually in your home directory (~/)
- certain plugins expect configuration files to be in certain places
**we need to move everything in the nvimconf folder to the right place**
- nvim expects its configuration files to be in `~/.config/nvim/`
- so we need to move the nvimconf folder to `~/.config/`
` mv nvimconf ~/.config/`

