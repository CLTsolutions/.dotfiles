# history
HISTFILE=~/.zsh_history

# prompt
PROMPT='%n in %~ -> '

# preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

export EDITOR="nvim"
export VISUAL="nvim"

# aliases
# plug "$HOME/.config/zsh/aliases.zsh"
if [ -f ~/.config/zsh/aliases.zsh ]; then
    source $HOME/.config/zsh/aliases.zsh
else
    print "404: ~/.config/zsh/aliases.zsh not found."
fi

# nvm (for node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rails
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# my stuff
fortune -n short | cowsay -f kitty | lolcat

# starship prompt
eval "$(starship init zsh)"
