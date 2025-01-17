# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
    PS1=${PS1%?}\n'$ ' # Append a new line at the end of prompt. Andew 10/29/2022
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
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

alias gh='cd /projects/ntsw-sw-ae/ayang'
alias v='TERM=xterm vim'
alias vv='TERM=screen nvim'

alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

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

export PATH=/home/ay895922/.autojump/bin:/projects/ntsw-sw-ae/ayang/nodejs/node-v14.17.6-linux-x64/bin:/projects/csg_sonic3/rc893046/racks:/projects/csg_sonic3/rc893046/racks/pyrack_db:/home/ay895922/local/bin:/usr/bin:/tools/bin:/usr/dt/bin:/usr/local/bin:/usr/bin:/bin/usr/sbin:/sbin:/tools/sparcworks/6.0/SUNWspro/bin:/usr/openwin/bin:/usr/ucb:/usr/ucb/bin:/projects/ntsw-sw/bin:/projects/ntsw-tools/bin:/bin:/usr/sbin:/usr/bin/X11:/projects/ntsw-tools/bin/:/projects/ntsw-sw/bin:/projects/ntsw-tools/bin/

# Fix python3 version. Set default version to 3.8.0 which is required by
# compiling hsdk.
export PATH=/home/ay895922/local/bin:$PATH

#export CSCOPEVER=OS # deprecated in Rocky8.1
export CSCOPE_EDITOR=vim

export GITVER="2.27.0"

export RACK_DB_PATH=/projects/csg_sonic3/rc893046/racks/pyrack_db

# clangd v15
# export PATH=/tools/oss/packages/x86_64-rhel7/llvm/15.0.7/bin/:$PATH
# clangd v16
export PATH=/tools/oss/packages/x86_64-rhel7/llvm/16.0.6/bin:$PATH

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

# Turn off the bell of the command
bind 'set bell-style none'


export EDITOR=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# quick jump to dir, the speed is much quicker than autojump
export PATH=/home/ay895922/.local/bin:$PATH
eval "$(zoxide init bash)"
export FZF_CTRL_T_COMMAND="zoxide query --list"

#export PATH=/tools/oss/packages/x86_64-centos7/tmux/3.3a/bin:$PATH
export PATH=/tools/oss/packages/x86_64-rocky8/tmux/3.3a/bin:$PATH
#export PATH=/projects/ntsw-sw-ae/ayang/src/cscope-15.9/src:$PATH
