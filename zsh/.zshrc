# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

fastfetch
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jispwoso"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nv="nvim"
alias nvconf="cd ~/.dotfiles/nvim"
alias s="sudo"
alias server="cd /srv/http"
alias zshconf="nvim ~/.dotfiles/zsh/.zshrc"
alias dwmconf="nvim ~/.dotfiles/dwm/config.h"
alias dwmrcmp="cd ~/.dotfiles/dwm && make && sudo make install"
alias picomconf="nvim ~/.dotfiles/picom/picom.conf"
alias alconf="nvim ~/.config/alacritty/alacritty.toml"
alias config="cd ~/.config"
alias pbconf="cd ~/.config/polybar"
alias fm="ranger"
alias bt="bash ~/.bluetooth"
alias bc="bctl connect BE:CC:9C:9B:37:26"
alias bd="bctl disconnect BE:CC:9C:9B:37:26"
alias pacs="sudo pacman -S"
alias pacr="sudo pacman -R"
alias yays="yay -S"
alias yayr="yay -R"
alias bctl="bluetoothctl"
alias toxin="cd /srv/http/toxin"
alias slider="cd /srv/http/slider-plugin"
alias test="cd /srv/http/test"
alias df="cd ~/.dotfiles"
alias treasure="cd /srv/http/treasure"
alias ttyc="tty-clock -c -C 4"
alias clear-cache="sudo rm -rf /var/cache/*"
alias downloads="cd ~/Загрузки"
alias startdwm="sudo nvim /usr/local/bin/startdwm.sh"
alias restartdwm="/usr/local/bin/startdwm.sh"
alias import-gpg="gpg --keyserver keys.gnupg.net --recv-keys"
alias tx="cd ~/job/timvex"
alias zont="cd ~/job/server"
alias widget="cd ~/job/server/zont/app/zont-notification-widget/"
alias build-zont="rm -rf platforms plugins && ./bin/app-prepare zont debug android --verbose && npx cordova build --debug --verbose"
alias rebuild-zont="./bin/app-prepare zont debug android --verbose"
alias dcdv="docker-compose down --volumes"
alias dcub="docker-compose up --build"
alias dcw="docker-compose watch"
alias venv="virtualenv venv & source venv/bin/activate"
alias gfp="git add . && git commit --amend --no-edit && git push -f"
alias d="docker"
alias dc="docker-compose"
plugins=( 
  )
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6083b3,bg=transparent"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export ANDROID_HOME=/opt/android-sdk/
export ANDROID_SDK_ROOT=/opt/android-sdk/
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$PATH:/sbin

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/barghest/job/app/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/barghest/job/app/node_modules/tabtab/.completions/electron-forge.zsh
