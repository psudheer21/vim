Custom vim / MacVim configuration

This is in the public domain, so feel free to use / change / redistribute it
You can check the complete repository at http://github.com/motanelu/macvim-configuration

Author: Tudor Barbu <hello@tudorbarbu.ninja>
Blog: http://tudorbarbu.ninja
License: LGPL

Intro
=====

This is a configuration aimed at maximising productivity when developing with
PHP. I know that there are a lot of "ultimate" vim configurations out there, 
but I believe vim's true strength to be its ability to be customised according 
to one's own needs. Try to use this configuration as a starting in building your 
own "ultimate" configuration.

For suggestions on how to improve it or cool modules, please hit me up at 
hello@tudorbarbu.ninja.


Instalation
===========
Instalation is easy:
1. Back up your current vim configuration! This is important!
2. Clone the repository to to your ~/.vim folder
3. Symlink ~/.vimrc to ~/.vim/vimrc and ~/.gvimrc to ~/.vim/gvimrc
4. Git clone Vundle https://github.com/gmarik/Vundle.vim in ~/.vim/bundle/Vundle.vim
5. Start vim and run PluginInstall
6. You're done...almost! 

Some plugins require special attention, so far these are:

YouCompleteMe
-------------
This plugin requires a compiled component. Follow the instructions at https://github.com/Valloric/YouCompleteMe

phpcomplete
-----------
I'm using composer as an executable in /usr/local/bin. If you want to do the same, issue the following commands
in the console: 

cd ~
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer 

Otherwise, edit the value for phpcomplete_index_composer_command in .vimrc
