#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

set spoolfile = /var/mail/ed

export VISUAL=vim
export EDITOR=vim 


cconv() {
	  wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" |  sed '/res/!d;s/<[^>]*>//g';
  }




### history

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTSIZE=100000                   # large history
export HISTFILESIZE=100000  

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"



########################################################################################################################################
# bashrc introduction
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# history_settings
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000000
HISTFILESIZE=1000000000

#merge session histories
shopt -s histappend

# more stuff
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# coloured prompt
# uncomment for a coloured prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# alias_system_settings
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aliases
alias sagi='sudo apt-get install'
alias acs='apt-cache search'
alias acshow='apt-cache show'
alias acshowpkg='apt-cache showpkg'
alias acp='apt-cache policy'
alias acstats='apt-cache stats'
alias amiagoodperson='echo "yes"'
alias ls='clear && ls'
#alias la='ls -A'
#alias mc='. /usr/lebexec/mc/mc-wrapper.sh'
alias deskk='cd ~/Desktop'
alias docx='cd ~/Documents'
alias dox='cd ~/Documents'
alias weathrr='bash /home/ed/scripts/weather.sh'
alias vi='vim'
alias bbc='elinks http://www.bbc.com/news'
alias pingg='ping www.google.ie'
alias catt='cat $ | less'
alias lsl='ls | less'
alias vimdocs='cd ~/Documents/vidocs'
alias vidocs='cd ~/Documents/vidocs'
alias static='cat /dev/urandom | aplay'
alias wifiscript='bash ~/scripts/wifiscript.sh'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias cdexthd='cd /media/ed/Seagate\ Expansion\ Drive1/'
alias exthd='cd /media/ed/Seagate\ Expansion\ Drive1/'
alias exthd2='cd /media/ed/Seagate\ Expansion\ Drive2/'
alias topfive='du --max-depth=0 | sort -rh | head -5'
alias vimrc='vim ~/.vim/.vimrc'
alias bashrc='vim ~/.bashrc'
#alias diary='vim /home/ed/Documents/vidocs/diary/`date +%Y_%m_%d`.txt'
#alias diary='vim /home/ed/Documents/vidocs/diary/`date +%d_%m_%Y`.txt'
alias dox='cd /home/ed/Documents/'
alias music='cd /home/ed/Music/'
alias bbcn='newsbeuter -u /home/ed/.newsbeuter/bbc'
alias dls='cd /home/ed/Downloads'
alias articles='cd /home/ed/Documents/articles'
alias dark='bash /home/ed/scripts/dark.sh'
alias trash='cd ~/.local/share/Trash'
alias sourcebash='cd && source .bashrc'
alias random1-10='echo $((1 + RANDOM % 10))'
alias syncc='bash /home/ed/scripts/syncc.sh'
#radio stations
alias kexp='mplayer http://live-aacplus-64.kexp.org/kexp64.aac'
alias lyricfm='mplayer http://av.rasset.ie/av/live/radio/lyric.m3u'
alias radio1='mplayer http://av.rasset.ie/av/live/radio/radio1.m3u'
alias rnag='mplayer http://av.rasset.ie/av/live/radio/rnag.m3u'
alias bbc4='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p'
alias goo='elinks google.ie'
alias ls='ls --color=auto -a -h --group-directories-first'
alias diary='vim /home/ed/vidocs/diary/`date +%d_%m_%Y`.txt'
alias notes='vim /home/ed/vidocs/notes/`date +%d_%m_%Y`.txt'
alias anki10='bash timeout 10m anki'
alias redshiftt='redshift -o /home/ed/addresses/lat_long'
alias i3config='vim /home/ed/.config/i3/config'
alias bed='bash /home/ed/scripts/bed.sh'
alias extmon='xrandr --output HDMI1 --mode 1280x1024 --above eDP1'
alias remop='bash /home/ed/scripts/find.install.sh'



# lifehacker 
# Here i'm going to follow a tutioral i found at:
# http://lifehacker.com/274317/turbocharge-your-terminal
# Below i am pointing bashrc to a seperate configuration file. 

#if [ -f ~/.bashrc ]; then

#source ~/.bashtweaks

#fi
##############################################################################
# colorful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' # end the info box
export LESS_TERMCAP_so=$'\E[01;42;30m' # begin the info box
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
#tmux
#The bit below works. For the moment I don't want it.  
#
##Tmux - found this online.
#if which tmux 2>&1 >/dev/null; then
#    # if no session is started, start a new session
#        test -z ${TMUX} && tmux -f /etc/tmux.conf
#
#	    # when quitting tmux, try to attach
#	        while test -z ${TMUX}; do
#			        tmux attach || break
#				    done
#			    fi
#
#jack
#9o() { jack_control stop && jack_control eps realtime true &&\
#	 jack_control ds alsa && jack_control dps device hw:USB,0 && jack_control dps capture hw:USB,0 &#&\
#	  jack_control dps playback hw:USB,0 && jack_control dps nperiods 2 && jack_control dps period 2#56 &&\
#	   jack_control dps rate 96000 && jack_control start &&\
#	    nohup /usr/bin/python3 /usr/share/cadence/src/cadence_aloop_daemon.py --channels=2 & }



export GOPATH="$HOME/golang"
export PATH=$PATH:/home/ed/scripts
