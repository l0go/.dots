export EDITOR=nvim
export ZSH="$HOME/.zsh"
export VISUAL=nvim

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
setopt auto_cd

#
# PROMPT
#
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

#
# ALIASES
#
alias vim='nvim'
alias ls='ls --color=auto -G --group-directories-first'
alias cdprojects='cd ~/Documents/projects/'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

ex() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

#
# Path
#
source ~/.profile
path+=~/home/logo/.local/bin/

#
# PLUGINS & THEMES
#
plugins=(zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions)

for plugin in $plugins; do \
  source $ZSH/plugins/$plugin/$plugin.plugin.zsh;
done

autoload -Uz compinit && compinit
