##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
#setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
#setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

# Path
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/Cellar/texlive/20190406/"

# docker env variables
export BITBUCKET_USERNAME=binarysystem_deploy
export BITBUCKET_PASSWORD=Uxoo4unu
export GEMS_USERNAME=developer
export GEMS_PASSWORD=B1nAr12020
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
export MY_IP=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'



# export TERM=xterm
export EDITOR=nvim
export ERL_AFLAGS="-kernel shell_history enabled"

source ~/.zsh-plugins/zsh-snap/znap.zsh

# `znap prompt` makes your prompt appear in ~40ms. You can start typing right away!
znap prompt denysdovhan/spaceship-prompt

# Use `znap source` to load only those parts of Oh-My-Zsh or Prezto that you really need:
znap source ohmyzsh/ohmyzsh plugins/git
znap source ohmyzsh/ohmyzsh plugins/asdf
znap source ohmyzsh/ohmyzsh plugins/rails
znap source sorin-ionescu/prezto modules/{environment,history}
znap source Aloxaf/fzf-tab
znap source zsh-syntax-highlighting

source $HOME/.asdf/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

bindkey -e

source $HOME/.aliases

unsetopt prompt_cr
# eval "$(starship init zsh)"
