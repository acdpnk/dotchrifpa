# .zshrc

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
	if [[ $(hostname) == "lipstick" ]]; then
		sources='/home/chrifpa/.dotfiles/'
	elif [[ $(hostname) == "igor" ]]; then
		sources='/home/mrnda/.dotfiles/'
	elif [[ $(hostname) == "cetus.uberspace.de" ]]; then
		sources='/home/chrifpa/.dotfiles/'
	fi

# source files
	source $sources.zshrc_interface
	source $sources.zshrc_aliases
	source $sources.zshrc_$(hostname)
