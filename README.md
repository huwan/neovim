# Neovim
init.vim for neovim

## Install Neovim
Install neovim: https://github.com/neovim/neovim/wiki/Installing-Neovim

- Ubuntu

```
sudo apt install neovim
```
- macOS

```
brew install neovim
```
- Others (e.g., CentOS 7)

  Download [latest stable release](https://github.com/neovim/neovim/releases/latest), extract tarball, and move `nvim-linux64/bin/nvim` to `/usr/local/bin/`.

To start Neovim, run `nvim` (not `neovim`).


## Config (vimrc)
Put [init.vim](init.vim) in `~/.config/nvim`, or simply clone this repo:

```
git clone https://github.com/huwan/nvim.git ~/.config/nvim
```

Create backup and swap directories
```
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swapfiles
```

## Install the Vim-plug Plugin Manager

```
 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

[init.vim](init.vim) is configured to automatically install missing plugins on startup, or you can reload `init.vim` and execute `:PlugInstall` mannually after install new plugin(s).

NOTE: The following error message will be displayed at first nvim startup. Just ignore it. vim-anyfold plugin will be automatically installed and fix this issue.

```
Error detected while processing FileType Autocommands for "*":
E492: Not an editor command: AnyFoldActivate
Press ENTER or type command to continue
```

## Launch nvim
Launch `nvim`, the plugin will be ready for use.

### Set vim alternative (optional)

If you want to use Neovim for some (or all) of the editor alternatives, use the following commands:

```
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
```

Or add alias in .bashrc, .bash_aliases, or .bash_profile.

```
alias vi='nvim'
alias vim='nvim'
```

## Plugins

Several plugins are added to this configuration file, they will be loaded automatically after initialization. Add or remove plugins for your own use.

Note 1: `ctags` and `cscope` are required for `autotags` plugin and `cscope_maps` plugin. 

Ubuntu users can install them via apt:

```
sudo apt-get install exuberant-ctags cscope
```

### Frequently used keyboard shortcuts
- `F2`: Trim trailing whitespace
- `F4`: generate ctags and cscope database
- `gcc`: comment out current line
- `ctrl` + `c`: find functions calling the function in cscope
- `,` + `n`: toggle (absolute) line numbers
- `,` + `r`: toggle relative line numbers
