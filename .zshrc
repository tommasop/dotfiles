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
export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug

export EDITOR=nvim
export ERL_AFLAGS="-kernel shell_history enabled"

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

source $ZPLUG_HOME/init.zsh

# Load theme file
zplug 'denysdovhan/spaceship-prompt', use:spaceship.zsh, from:github, as:theme

# SPACESHIP Theme
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_DIR_COLOR="081"
# in tmux i have vi mode but [I] is not nice to see
SPACESHIP_VI_MODE_SHOW=false

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf \
    use:"*darwin_amd64"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/rails", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

bindkey -e

source $HOME/.aliases

unsetopt prompt_cr
