
## Intro

This is a configuration aimed at maximising productivity with C++.

## Installation
Instalation is easy, just paste the following commands in the console:
```
cd ~
mv .vimrc .vimrc.bak
mv .vim .vim.bak
git clone https://github.com/thunderboltsid/vim-configuration.git vim
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
Enjoy! 
