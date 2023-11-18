export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
ZSH_THEME="dracula"
source $ZSH/oh-my-zsh.sh

# Automatically start tmux
tmux_count=$(ps -ax | grep '[t]mux' | wc -l)
if [ $SHLVL = 1 ]; then
  tmux -u new-session
fi

# Ctrl + o to edit commands in Vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

alias vim='nvim'
alias zshrc='vim ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'
alias c='clear'
alias szshrc='source ~/.zshrc'
alias vimrc='vim ~/.config/nvim/init.lua'
