# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
# export PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="aussiegeek"

plugins=(
  git
  zsh-autosuggestions
  colorize
)

# autojump is a faster way to navigate your filesystem. It works by maintaining a database of the directories you use the most from the command line.
# Directories must be visited first before they can be jumped to.
# [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
[[ -s /home/parz/.autojump/etc/profile.d/autojump.sh ]] && source /home/parz/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

 #found in .config/zsh
 source $ZSH/plugins/colored-man-pages/colored-man-pages.plugin.zsh

 #git send 
 source $ZSH/plugins/send/send.plugin.zsh

# zsh syntax highlighting
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^ ' autosuggest-accept

alias zshrc="nvim ~/.zshrc"
alias szshrc="source ~/.zshrc"

alias nvimrc="nvim ~/.config/nvim/"

alias open="xdg-open"

alias sql="sudo -S service mysql start && sudo mysql -u root -p"

alias rzi="rm -rf **/*Zone.Identifier"

jcar ()
{
  FILENAME=$(basename $1 .java)
  javac -d Classes $1 && java -cp Classes $FILENAME
}

# Nvim Switcher
alias nvi="NVIM_APPNAME=kickstart nvim"
alias nvic="NVIM_APPNAME=kickstartCS nvim"

function nvims() {
  items=("default" "kickstart" "kickstartCS")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config="~/config/nvim"
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

# Asembly runners
alias ml="/mnt/c/masm32/bin/ml.exe"
alias link="/mnt/c/masm32/bin/link.exe"


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

source ~/.oh-my-zsh/oh-my-zsh.sh
export COLORTERM=truecolor
export TERM=xterm-256color
# export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
# export PATH="$HOME/bin:$PATH"
# C# omnisharp
export PATH=$HOME/.dotnet:$PATH

source $HOME/.cargo/env
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.wine/drive_c/masm32/bin
export PATH=$PATH:/mnt/c/masm32/bin
# export PATH="/home/linuxbrew/.linuxbrew/bin/google-java-format:$PATH"
# export PATH="/home/linuxbrew/.linuxbrew/bin/semgrep:$PATH"
# export PYTHONPATH=$(python -c "import sys; print(':'.join(sys.path))")
export DOTNET_ROOT=/home/linuxbrew/.linuxbrew/Cellar/dotnet/7.0.100/libexec/
export DOTNET_ROOT=/home/parz/.dotnet/

