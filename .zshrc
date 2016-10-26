autoload -U promptinit
promptinit
prompt adam2 magenta green blue orange


export P4PORT=perforce.f5net.com:1666
export P4USER=baston
export P4CONFIG=.p4config
export P4MERGE=p4merge
#export PYTHONPATH=$PYTHONPATH:/home/baston/code/automation/branches/head/ite_contrib/support/lib/python:/home/baston/code/automation/ite2/fw_support/lib/python

export GOPATH=$HOME/mygo
export PATH=$PATH:$HOME/mygo/bin

source ~/.profile

setopt CORRECT              # command CORRECTION
setopt EXTENDED_HISTORY     # puts timestamps in the history
# setopt HASH_CMDS          # turns on hashing
#
setopt MENUCOMPLETE
setopt ALL_EXPORT

#alias ls='ls --color'
alias ls='ls -G'
alias pyPath='export PYTHONPATH=/home/baston/code/automation/branches/head/ite_contrib/support/lib/python'
alias pyPath2='export PYTHONPATH=/home/baston/code/automation2/branches/head/ite_contrib/support/lib/python'
alias seadev=seadev06.pdsea.f5net.com

alias rbc='/build/cm/bin/rb rr create --changeset'
alias rblogin='/build/cm/bin/rb login --ssl --server reviewboard-testcases.olympus.f5net.com'
alias rbs='/build/cm/bin/rb rr submit'
alias rbu='/build/cm/bin/rb rr edit --update-diff'

#alias python='python2.7'
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/baston/.zshrc'

bindkey "\e[3~" delete-char

autoload -Uz compinit
compinit
# End of lines added by compinstall
if [[ "$TERM" != emacs ]]; then
    [[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char
    [[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" beginning-of-line
    [[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" end-of-line
    [[ -z "$terminfo[kich1]" ]] || bindkey -M emacs "$terminfo[kich1]" overwrite-mode
    [[ -z "$terminfo[kdch1]" ]] || bindkey -M vicmd "$terminfo[kdch1]" vi-delete-char
    [[ -z "$terminfo[khome]" ]] || bindkey -M vicmd "$terminfo[khome]" vi-beginning-of-line
    [[ -z "$terminfo[kend]" ]] || bindkey -M vicmd "$terminfo[kend]" vi-end-of-line
    [[ -z "$terminfo[kich1]" ]] || bindkey -M vicmd "$terminfo[kich1]" overwrite-mode

    [[ -z "$terminfo[cuu1]" ]] || bindkey -M viins "$terminfo[cuu1]" vi-up-line-or-history
    [[ -z "$terminfo[cuf1]" ]] || bindkey -M viins "$terminfo[cuf1]" vi-forward-char
    [[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" vi-up-line-or-history
    [[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" vi-down-line-or-history
    [[ -z "$terminfo[kcuf1]" ]] || bindkey -M viins "$terminfo[kcuf1]" vi-forward-char
    [[ -z "$terminfo[kcub1]" ]] || bindkey -M viins "$terminfo[kcub1]" vi-backward-char

# ncurses fogyatekos
[[ "$terminfo[kcuu1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" vi-up-line-or-history
[[ "$terminfo[kcud1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" vi-down-line-or-history
[[ "$terminfo[kcuf1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcuf1]/O/[}" vi-forward-char
[[ "$terminfo[kcub1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcub1]/O/[}" vi-backward-char
[[ "$terminfo[khome]" == "^[O"* ]] && bindkey -M viins "${terminfo[khome]/O/[}" beginning-of-line
[[ "$terminfo[kend]" == "^[O"* ]] && bindkey -M viins "${terminfo[kend]/O/[}" end-of-line
[[ "$terminfo[khome]" == "^[O"* ]] && bindkey -M emacs "${terminfo[khome]/O/[}" beginning-of-line
[[ "$terminfo[kend]" == "^[O"* ]] && bindkey -M emacs "${terminfo[kend]/O/[}" end-of-line
fi
function sp { echo $1 | aspell -a; }


alias rbc='/build/cm/bin/rb create --changeset'
alias rblogin='/build/cm/bin/rb login --ssl --server reviewboard-testcases.olympus.f5net.com'
alias rbs='/build/cm/bin/rb submit'
alias rbu='/build/cm/bin/rb edit --update-diff'

#xmodmap .xmodmap
