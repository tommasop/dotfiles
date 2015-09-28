HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000

# Allow extended glob patterns (like '**/' is actually '(*/)#')
setopt extended_glob

# Allow comments to be put in the command-line
#
#   $ echo 'Hello World'    # This comment will be valid now
#
# http://stackoverflow.com/questions/11670935/comments-in-command-line-zsh
setopt interactivecomments

# Add to path
PATH=~/.cabal/bin:$PATH
PATH=~/.bin:$PATH
PATH=/usr/local/bin:$PATH
PATH="$HOME/Library/Haskell/bin:$PATH"
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin


# Add to completions
fpath=(~/.zsh/plugins/completions/src $fpath)

# Initialize colors
# Necessary for
#     $ echo "$fg[blue] hello world"
# Like is uesd in zsh-colors
autoload -U colors
colors

# Other modules we want to source
. ~/.zsh/zsh_aliases

##############################
# Key bidings
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Due to tmux being weird
# http://clock.co.uk/blog/zsh-ctrl-left-arrow-outputting-5d
bindkey "5C" forward-word
bindkey "5D" backward-word

# Initialize antigen-hs
. ~/.zsh/antigen-hs/init.zsh

. ~/.zsh/plugin-configs.zsh


function define_vim_wrappers()
{
  vim_commands=(
  eview evim gview gvim gvimdiff gvimtutor rgview
  rgvim rview rvim vim vimdiff vimtutor xxd mvim
  )

  for cmd in ${vim_commands[@]}; do
    cmd_path=`/usr/bin/env which -a "${cmd}" 2>/dev/null | grep '^/'`
    if [ -x "${cmd_path}" ]; then
      eval "function ${cmd} () { (unset GEM_HOME; unset GEM_PATH; $cmd_path \$@) }"
    fi
  done
}

define_vim_wrappers

export GOPATH=$HOME/gocode
export GOBIN=$HOME/gocode/bin

export EDITOR="vim"
bindkey -v 

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
# bash style beginning end of line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/share/gem_home/gem_home.sh
unsetopt prompt_cr
