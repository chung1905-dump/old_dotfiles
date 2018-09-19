setopt PROMPT_SUBST;

source ~/.zsh-config/git-prompt.sh
source ~/.zsh-config/zsh_git_timer.sh
source ~/.zsh-config/aliases
source ~/.zsh-config/bindkey
source ~/.zsh-config/zsh-autosuggestions/zsh-autosuggestions.zsh

SAVEHIST=500
HISTFILE=~/.zsh-config/zsh_history

# NC='\033[0m' # No Color
# BLACK='\033[0;30m'
# RED='\033[0;31m'
# GREEN='\033[0;32m'
# ORANGE='\033[0;33m'
# BLUE='\033[0;34m'
# PURPLE='\033[0;35m'
# CYAN='\033[0;36m'
# LIGHT_GRAY='\033[0;37m'
# DARK_GRAY='\033[1;30m'
# LIGHT_RED='\033[1;31m'
# LIGHT_GREEN='\033[1;32m'
# YELLO='\033[1;33m'
# LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
# WHITE='\033[1;37m'

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

RPROMPT='$(git_time_since_commit)'

alias ls='ls --color=auto'

# %d, %~ for full dir, %c for short
precmd() { 
	__git_ps1 "%c" " "
}

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

unsetopt MULTIBYTE
