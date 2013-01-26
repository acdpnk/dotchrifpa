# .bashrc

# Source global definitions

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#environmental stuff

set -o vi
PS1='[$(date +%H:%M)] [\u@\h \W]\$ '

# host specific stuff

if [ $HOSTNAME == "lipstick" ]; then
	alias igor4='cat /home/chrifpa/Dropbox/PlainText/.igor.ip.txt'
	alias sshigor4='ssh -p 1286 mrnda@`igor4`'
	alias sshfsigor4='sshfs mrnda@`igor4`:/ /home/chrifpa/igorfs -p 1286'
	alias sftpigor4='sftp -P 1286 mrnda@`igor4`'

	alias sshigor='ssh mrnda@2001:6f8:900:f3d::2'
	alias sftpigor='sftp -6 mrnda@[2001:6f8:900:f3d::2]'
	alias sshfsigor='sshfs mrnda@[2001:6f8:900:f3d::2]:/ /home/chrifpa/igorfs'
	
	alias cr='google-chrome &'
	alias fil='nautilus &'
	alias emp='empathy &'
	alias qti='qtiplot &'
	alias sub='sublime &'
fi

if [ $HoSTNAME == "igor" ]; then
	alias dropbox='python /opt/./dropbox.py'	
fi

# common aliases

alias la='ls -a'

alias sshuber="ssh chrifpa@chrifpa.cetus.uberspace.de"
alias sftpuber="sftp chrifpa@chrifpa.cetus.uberspace.de"

alias getip='curl icanhazip.com'

alias cr='google-chrome &'
alias fil='nautilus &'
alias emp='empathy &'
alias qti='qtiplot &'
alias sub='sublime &'

alias drpstart='dropbox start'
alias drpstop='dropbox stop'
alias drpstat='dropbox status'
alias drpmon='PRVSTAT=" "; while true; do STAT="`dropbox status`"; if [ "$PRVSTAT" !=  "$STAT" ]; then echo `date +%H:%M:%S` --  $STAT; fi; PRVSTAT="$STAT"; sleep 1s; done'
alias drpstm='dropbox start; drpmon'

alias dte='date +%y%m%d%H%M%S'
alias py='python'

alias bat='echo `date +%H:%M:%S` `acpi`'
