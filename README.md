# dotfiles
My dot files and a deploy script

Installation:

    git clone git://github.com/baston/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
    cd .vim/bundle/jedi/
    git submodule init
    git submodule update
