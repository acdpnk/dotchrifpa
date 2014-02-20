# .bashrc

# determine path for sources by host
	if [ $HOSTNAME == "lipstick" ]; then
		sources='/home/chrifpa/.dotfiles/'
	elif [ $HOSTNAME == "igor" ]; then
		sources='/home/mrnda/.dotfiles/'
	elif [ $HOSTNAME == "cetus.uberspace.de" ]; then
		sources='/home/chrifpa/.dotfiles/'
        elif [ $HOSTNAME == "sirius" ]; then
                sources='/Users/chrifpa/.dotfiles/'
	fi

# source global definitions
	if [ -f /etc/bashrc ]; then
		. /etc/bashrc
	fi

# sources
	source $sources.bashrc_$HOSTNAME
	source $sources.bashrc_aliases
	source $sources.bashrc_interface
	source $sources.bashrc_calls
