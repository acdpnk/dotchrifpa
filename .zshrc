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
	HISTSIZE=1000
	SAVEHIST=1000
	setopt appendhistory autocd nomatch correct_all share_history 
	bindkey -v

	## case-insensitive tab completion for filenames
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
	zstyle :compinstall filename '/home/chrifpa/.zshrc'

	autoload -Uz compinit
	compinit
# End of lines added by compinstall


# determine path for sources by host
	sources=/home/$(whoami)/.dotfiles/

#	if [[ $(hostname) == "lipstick" ]]; then
#		sources='/home/mrnda/.dotfiles/'
#	elif [[ $(hostname) == "igor" ]]; then
#		sources='/home/mrnda/.dotfiles/'
#	elif [[ $(hostname) == "cetus.uberspace.de" ]]; then
#		sources='/home/chrifpa/.dotfiles/'
#	fi

# source files (hostspecific last ist important!)
	source $sources.zshrc_interface
	source $sources.zshrc_aliases
	source $sources.zshrc_$(hostname)
