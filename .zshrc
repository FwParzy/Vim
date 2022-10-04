# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="aussiegeek"

plugins=(
  git
  zsh-autosuggestions
  colorize
)

# autojump is a faster way to navigate your filesystem. It works by maintaining a database of the directories you use the most from the command line.
# Directories must be visited first before they can be jumped to.
 [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

 #found in .config/zsh
 source ~/.config/zsh/zsh-colored-man-pages/colored-man-pages.plugin.zsh
 
 #git send 
source ~/.config/zsh/send.zsh/send.plugin.zsh

# zsh syntax highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

bindkey '^ ' autosuggest-accept

alias zshrc="nvim ~/.zshrc"
alias szshrc="source ~/.zshrc"

alias nvimrc="nvim ~/.config/nvim/"

alias vimrc="vim ~/.vimrc"

alias gpod="git pull origin develop"

alias dev-tmux="zsh ~/dev-tmux.sh"

alias uat="sft ssh --via dev-jumpbox UAT"
alias devprod="sft ssh --via dev-jumpbox devprod"

function smile() {
    smile_quotes=(
      "¯\_(ツ)_/¯"
      "(｀∀´)Ψ"
      "(ó﹏ò｡)"
      "( ͡° ͜ʖ ͡°)"
      "(•ω•)"
      "(°°)"
      "(;;)"
      "(~#~)"
      "(͠≖ ͜ʖ͠≖)"
      "( ಠ ͜ʖರೃ)"
      "(• ε •)"
      "◉_◉"
    )
    smile_string="${smile_quotes[RANDOM%${#smile_quotes[@]}]}"
    echo $smile_string
    unset smile_quotes
}

source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
