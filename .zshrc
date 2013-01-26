# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chrifpa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1='[%T] [%n@%m %c]$ '
