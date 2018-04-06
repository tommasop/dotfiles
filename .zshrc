export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug

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
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_DIR_COLOR="081"

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

source $HOME/.aliases
