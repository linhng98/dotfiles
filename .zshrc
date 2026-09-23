export GPG_TTY=$(tty)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Lines configured by zsh-newuser-install

# End of lines configured by zsh-newuser-install

fpath=("$HOME/.nix-profile/share/zsh/site-functions" $fpath)
autoload -Uz compinit
autoload -U +X bashcompinit && bashcompinit
compinit

# terraform auto complete
complete -o nospace -C $HOME/.nix-profile/bin/terraform terraform
# terragrunt auto complete
complete -o nospace -C $HOME/.nix-profile/bin/terragrunt terragrunt
# docker
source <(docker completion zsh)

# End of lines added by compinstall

alias ll='ls -la'
alias lt='tree -C'
alias gd='git diff'
alias ga='git add'
alias gcm='git commit'
alias gl='git log'
alias gco='git checkout'
alias gs='git status'
alias gp='git push'
alias vi='nvim'
alias vim='nvim'
alias tf='terraform'
alias gcd='gcloud'
alias kb='kubectl'
alias ssh="export TERM=xterm && ssh"
alias kssh="kitty +kitten ssh"
alias nixbuild="sudo nix flake update home-config --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#nixos"

setopt no_share_history

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
zle -N fh fh
bindkey '^R' fh

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

# Packages installed only for lynk by Home Manager.
source "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"

# Existing Powerlevel10k configuration.
[[ -r "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# Syntax highlighting should be sourced last.
source "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# gpg agent
gpgconf --launch gpg-agent

gitconfig_linhng98() {
  git config user.name "Linh Nguyen"
  git config user.email "linhnguyen.workspace@gmail.com"
}
