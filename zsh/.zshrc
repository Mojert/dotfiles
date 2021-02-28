# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent .. directory
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %l: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %l%s'
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/mojert/.zshrc'

# Rust support
fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Make the DEL key work in Vi mode
bindkey "\e[3~" delete-char

# Options
setopt correct
setopt correctall

# PROMPT='%(?..%F{red}%?%f )%F{blue}[%f%F{yellow}%n%f %F{green}%3~%f%F{blue}]%f%# '
source $XDG_CONFIG_HOME/zsh/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=true
precmd () { __git_ps1 "%(?..%F{red}%?%f )%F{blue}[%f%F{yellow}%n%f %F{green}%3~%f%F{blue}]%f" "%# " }

# Aliasses
alias ls='ls --color'
alias ll='ls -l --human-readable'
alias la='ls -a'
alias lla='ls -la --human-readable'
alias grep='grep --color=always'
alias nb='newsboat'
alias v='vim'

alias ga='git add'
alias gco='git commit'
alias gch='git checkout'
alias gb='git branch'
alias gl='git log --graph --all'
alias gs='git status'
alias gps='git push'
alias gpl='git pull'
alias gf='git fetch'

# SSH agent
if ! pgrep -u "$USER" -x ssh-agent > /dev/null; then
	eval $(ssh-agent -s) > /dev/null
	ssh-add -q < /dev/null
fi

source $XDG_CONFIG_HOME/zsh/pipcompletion.sh

PATH="${PATH}:${HOME}/.local/bin"

