# .zshrc

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


# determine path for sources by host
	if [[ $HOSTNAME == "lipstick" ]]; then
		sources='/home/chrifpa/.dotfiles/'
	elif [[ $HOSTNAME == "igor" ]]; then
		sources='/home/mrnda/.dotfiles/'
	elif [[ $HOSTNAME == "cetus.uberspace.de" ]]; then
		sources='/home/chrifpa/.dotfiles/'
	fi

# source files
	source $sources.zshrc_interface
	source $sources.zshrc_aliases