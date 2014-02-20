# .zshrc

  chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
      sun-cmd) print -Pn "\e]l%~\e\\"
        ;;
      *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
        ;;
    esac
  }


# Lines configured by zsh-newuser-install
	HISTFILE=~/.histfile
	HISTSIZE=15000
	SAVEHIST=15000
	setopt appendhistory autocd nomatch share_history
	bindkey -e

	## case-insensitive tab completion for filenames
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*' 'r:|[.,_-]=* r:|=*'

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
	zstyle :compinstall filename '/home/chrifpa/.zshrc'

	autoload -Uz compinit && compinit
	autoload -Uz colors && colors

# add ~/.scrpt to PATH
	typeset -U path
	if [[ $(hostname) == sirius* ]]; then
        	path+=(/Users/$(whoami)/.scrpt)
       		path+=(/Users/$(whoami)/.py-scripts)
		path+=(/usr/local/sbin)
	else		
		path+=(/home/$(whoami)/.scrpt)
		path+=(/home/$(whoami)/.py-scripts)
	fi

# make vim the standard editor
	export EDITOR=/usr/bin/vim
	export VISUAL=/usr/bin/vim
# determine path for sources by host
	sources=/home/$(whoami)/.dotfiles

	if [[ $(hostname) == sirius* ]]; then
		sources='/Users/chrifpa/.dotfiles'
	fi

#	if [[ $(hostname) == "lipstick" ]]; then
#		sources='/home/mrnda/.dotfiles/'
#	elif [[ $(hostname) == "igor" ]]; then
#		sources='/home/mrnda/.dotfiles/'
#	elif [[ $(hostname) == "cetus.uberspace.de" ]]; then
#		sources='/home/chrifpa/.dotfiles/'
#	fi

# source files (hostspecific last ist important!)
	source $sources/.zshrc_interface
	source $sources/.zshrc_aliases
	source $sources/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
	source $sources/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
	source $sources/.zshrc_$(hostname)

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
for keycode in '[' '0'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# define highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
