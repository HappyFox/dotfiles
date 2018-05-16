# dotfiles
My dot files and a deploy script

Installation:

    git clone https://github.com/HappyFox/dotfiles.git

For the rest of this I will assume that you cloned to /f5iteShare/

Create symlinks:

For vim :
    
    cd ~
    ln -s /f5iteShare/dotfiles/.vimrc
    ln -s /f5iteShare/dotfiles/.vim

For tmux :

    cd ~ 
    ln -s /f5iteShare/dotfiles/.tmux 

Switch to the `dotfiles/.vim` directory, and fetch submodules:

    cd /f5iteShare/dotfiles
    git submodule init
    git submodule update
    cd cd .vim/bundle/jedi/
    git submodule init
    git submodule update

I have a batch of other things in here. Dir colors, vim color schemes etc.
Check it out for anything you want to copy/take.
