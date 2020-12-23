# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kiennt/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    ansible
    fzf
    history
    pep8
    docker
    python
    systemd
    z
    thefuck
    zsh-completions
    zsh-autosuggestions
    git-open
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export VISUAL="/usr/bin/nvim"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="$VISUAL"
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Virtualenvwrapper envs
export WORKON_HOME=${HOME}/Workspace/venv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUAL_ENV_DISABLE_PROMPT=

# Aliases
source ~/.aliases

# Kubernetes
#if [ $commands[kubectl] ]; then
#  source ~/.kubectl_aliases
#  source <(kubectl completion zsh)
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/z.sh ] && source ~/.config/z.sh

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export JAVA_HOME=$(update-alternatives --query java | grep Value: | awk -F'Value: ' '{print $2}' | awk -F'/bin/java' '{print $1}')
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$JAVA_HOME/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/.cargo/bin

# Zsh-suggestions
bindkey '^F' autosuggest-accept
bindkey '^E' autosuggest-execute

export BAT_THEME='TwoDark'

# spaceship
if [ $ZSH_THEME = "spaceship" ]; then
    source ~/.spaceship_cfg
fi

# pure
# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

# typewritten
fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten
TYPEWRITTEN_RELATIVE_PATH="adaptive"
TYPEWRITTEN_CURSOR="block"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# added by travis gem
[ ! -s /home/kiennt/.travis/travis.sh ] || source /home/kiennt/.travis/travis.sh

# Pyenv
#export PATH="/home/kiennt/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Dotboss configs
export DOT_REPO=https://github.com/ntk148v/dotfiles.git DOT_PARENT_DIR=/home/kiennt DOT_REPO_REMOTE=origin DOT_REPO_BRANCH=master DOT_REPO_DIR=/home/kiennt/dotfiles.git