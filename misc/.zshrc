# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/linus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Enable colors
autoload -U colors && colors

# Prompt setup
setopt prompt_subst

autoload -U colors && colors  # Load color definitions
PS1="%B[%n%f@%M %F{4}%~%F{8}]%f%b$ "

alias ls="ls --color=auto"
