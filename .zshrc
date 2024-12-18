
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt nomatch
unsetopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/oac/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases for convenience
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias lsc="ls -F --color=never"
alias lsf="ls -F --color"
alias :q="cd .."
alias :e="vim"
alias open="xdg-open"
alias pnglatex="pnglatex -p amsmath:amsfonts:amsthm:amssymb:gensymb -d 1000"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function set_win_title(){
    me="$(whoami)"
    hn="$(hostname --short)"
    cwd="$(pwd | sed "s:$HOME:~:")"
    echo -ne "\033]0; $me@$hn:$cwd \007"
}
precmd_functions+=(set_win_title)

eval "$(starship init zsh)"
