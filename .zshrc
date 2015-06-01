# .zshrc

#  chpwd() {
#    [[ -t 1 ]] || return
#    case $TERM in
#      sun-cmd) print -Pn "\e]l%~\e\\"
#        ;;
#      *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#        ;;
#    esac
#  }


# Lines configured by zsh-newuser-install
	HISTFILE=~/.histfile
	HISTSIZE=15000
	SAVEHIST=15000
	setopt appendhistory autocd nomatch share_history
	bindkey -e

	## case-insensitive tab completion for filenames
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*' 'r:|[.,_-]=* r:|=*'

        unsetopt menu_complete   # do not autoselect the first completion entry
        unsetopt flowcontrol
        setopt auto_menu         # show completion menu on succesive tab press
        setopt complete_in_word
        setopt always_to_end
        zstyle ':completion:*' list-colors ''

        zstyle ':completion:*:*:*:*:*' menu select
        zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
        zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall


	autoload -Uz compinit && compinit
	autoload -Uz colors && colors

# add ~/.scrpt to PATH
	typeset -U path
	if [[ $(hostname) == sirius* ]]; then
        	path+=(/Users/$(whoami)/.scrpt)
       		path+=(/Users/$(whoami)/.py-scripts)
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
        source $sources/git-flow-completion/git-flow-completion.zsh
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


# keybindings
bindkey "^[[b" beginning-of-line
bindkey "^[[f" end-of-line
bindkey "^[[1;9D" backward-word
bindkey "^[[1;9C" forward-word
bindkey "^[[3~" delete-char
bindkey "^[[?" backward-kill-word
bindkey "^H" kill-region
bindkey "^[[1;2D" beginning-of-line
bindkey "^[[1;2C" end-of-line

## smart urls
autoload -U url-quote-magic
#zle -N self-insert url-quote-magic

## file rename magick
#bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER=less
export LANG=en_US.UTF-8
export LC_CTYPE=$LANG
#export LC_ALL=$LANG

# use /etc/hosts and known_hosts for hostname completion
#[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
hosts=(
    "$_global_ssh_hosts[@]"
    "$_ssh_hosts[@]"
    "$_etc_hosts[@]"
    "$_ssh_config[@]"
    "$HOST"
    localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.dotfiles/zsh/cache/

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
    dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
    hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
    mailman mailnull mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
zstyle '*' single-ignored show
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# added by travis gem
[ -f /Users/chrifpa/.travis/travis.sh ] && source /Users/chrifpa/.travis/travis.sh
