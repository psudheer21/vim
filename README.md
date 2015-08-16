# Custom vim / mvim configuration

This is in the public domain, so feel free to use / change / redistribute it
You can check the complete repository at http://github.com/motanelu/macvim-configuration

Author: Tudor Barbu <hello@tudorbarbu.ninja>
Blog: http://tudorbarbu.ninja
License: LGPL

## Intro

This is a configuration aimed at maximising productivity when developing with
PHP. I know that there are a lot of "ultimate" vim configurations out there, 
but I believe vim's true strength to be its ability to be customised according 
to one's own needs. Try to use this configuration as a starting in building your 
own "ultimate" configuration.

For suggestions on how to improve it or cool modules, please hit me up at 
hello@tudorbarbu.ninja.

## Instalation
Instalation is easy, just paste the following commands in the console:
```
cd ~
mv .vimrc .vimrc.bak
mv .vim .vim.bak
git clone https://github.com/motanelu/macvim-configuration.git vim
git clone  https://github.com/gmarik/Vundle.vim vim/bundle/Vundle.vim
ln -s ./vim .vim
ln -s ./vim/vimrc .vimrc
```
Now start `vim` and issue the `:PluginInstall` command. This will install all the plugin via [Vundle](https://github.com/gmarik/Vundle.vim). 
Some plugins require special attention:

### YouCompleteMe
To build [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), you need to do the following:
```
cd ~/vim/bundle/YouCompleteMe
./install.sh
```

### Vimproc
To build [Vimproc](https://github.com/Shougo/vimproc.vim), you need to do the following:
```
cd ~/vim/bundle/vimproc
make
```

### vim-instant-markdown
To install [vim-instant-markdown](https://github.com/suan/vim-instant-markdown/), you need to do the following:
You first need to have node.js with npm installed.

- `[sudo] npm -g install instant-markdown-d`
- If you're on Linux, the `xdg-utils` package needs to be installed (it is installed by default on Ubuntu).

Enjoy! 
