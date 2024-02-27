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
export PATH="/home/linuxbrew/.linuxbrew/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# docker env variables
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
export DOCKER_HOST_IP=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
export MY_IP=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
export CR_PAT=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

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export RUBY_CONFIGURE_OPTS="--disable-install-doc"

export JIRA_API_TOKEN=ATATT3xFfGF0WeWWkTMUjlpZvS5c-uvrNQaGdAj2YfJ1dS7XUub_DfFweEwgiQFfpJbl44o3FZb9_ap4gpkVOX9nO-2vkVD1KA-K0ga6Sg6T35OnW7iinOV6SAuukWklCtZJKL0Y4q4R7E1SMFdMSh1Zxb4gw7dyzN2B7cXb2gk_qvyhjKTOs-U=045CD1A6


# export TERM=xterm
export EDITOR=nvim
export ERL_AFLAGS="-kernel shell_history enabled"

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt appear in ~40ms. You can start typing right away!
znap prompt spaceship-prompt/spaceship-prompt

znap source Aloxaf/fzf-tab
znap source marlonrichert/zsh-autocomplete
# Use `znap source` to load only those parts of Oh-y-Zsh or Prezto that you really need:
znap source ohmyzsh/ohmyzsh plugins/git
znap source ohmyzsh/ohmyzsh plugins/asdf
# znap source ohmyzsh/ohmyzsh plugins/rails
znap source sorin-ionescu/prezto modules/environment
znap source ellie/atuin

ZSH_AUTOSUGGEST_STRATEGY=( history completion )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

source $HOME/.asdf/asdf.sh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_COMPLETION_TRIGGER=''
#bindkey '^T' fzf-completion
#bindkey '^I' $fzf_default_completion

bindkey -e

source $HOME/.aliases

unsetopt prompt_cr
