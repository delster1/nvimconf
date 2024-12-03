# d3's nvimconf

This is my neovim configuration. It is a work in progress and is constantly being updated.  


## If you're here from ACM
Setting up nvim is pretty simple, i'm gonna try to give an overview of how to do it with my configs 
### Steps To Install
#### 1 - Install neovim

It's probably best to follow the instructions on the [neovim website](https://github.com/neovim/neovim/blob/master/INSTALL.md)

- `sudo pacman -S neovim` if you're on arch (i use arch btw)

- if you're on windows, download WSL. Installing nvim on windows is interesting...

#### 2 - Clone this repo
use `git clone https://github.com/delster1/nvimconf.git` to clone this repo
- this should make a folder called "nvimconf" in your current directory

#### 3 - Move the folder to the right place
Lots of packages and things you install for your terminal hide themselves in what are called "dotfiles". These are files that are hidden by default.
- they always start with a period (.)
- there can also be hidden folders (like .config)
- these files are usually in your home directory (~/)
- certain plugins expect configuration files to be in certain places
- **we need to move everything in the nvimconf folder to the right place**
- nvim expects its configuration files to be in `~/.config/nvim/`

first, we make the folder `~/.config/nvim/`
- `mkdir -p ~/.config/nvim/`

then, we move the contents of `nvimconf` to `~/.config/nvim/`
- ` mv nvimconf ~/.config/`

3.5 - cleanup

- you can delete the nvimconf folder now w/ rm -rf nvimconf
    - be careful! rm -rf is a scary command
#### 4 - Address the errors.
When you open nvim for the first time (type `nvim` in terminal), you'll (hopefully) see a bunch of packages being installed
- This is because I'm using a package manager for nvim called [Lazy](https://github.com/folke/lazy.nvim)
- This SHOULD install all the packages that I use in my config

you'll probably also see a bunch of errors. This is because some of the plugins/dependencies that I use/need are not installed yet on your system
- Try installing the dependencies that are listed in the errors, they're often for languages or tools that you might need anyways (like python or nodejs or a c compiler)
- If you're really struggling, try watching the [nvim setup tutorial that i used](https://www.youtube.com/watch?v=zHTeCSVAFNY)
- Finally, if you're REALLY struggling, feel free to DM me on discord, I can help you out. 

