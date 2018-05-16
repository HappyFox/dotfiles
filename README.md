# dotfiles
My dot files and a deploy script

Installation:

    git clone https://github.com/HappyFox/dotfiles.git

Create symlinks:

For vim :
    
    ln -s dotfiles/.vimrc ~/.vimrc
    ln -s dotfiles/.vim ~/.vim

For tmux :

    ln -s dotfiles/.tmux ~/.tmux

Switch to the `dotfiles/.vim` directory, and fetch submodules:

    cd ~/dotfiles
    git submodule init
    git submodule update

I have a batch of other things in here. Dir colors, vim color schemes etc.
Check it out for anything you want to copy/take.
