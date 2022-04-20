# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autoloading functions
autoload -Uz compinit

# Enable compilation system
compinit  

# Set compilation control style
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Case-insensitive

# Key Binding {
  typeset -g -A key

  # Ctrl + Left-Right movement
  key[Control-Left]="${terminfo[kLFT5]}"
  key[Control-Right]="${terminfo[kRIT5]}"
  [[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
  [[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

  # Ctrl + backspace word deletion
  bindkey '^H' backward-kill-word
# }

# Locate powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# This will load existing customizations.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.


# Additional plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Paths
export PATH=$PATH:$HOME/.local/bin

# Alias {
  # Django 
  alias djrun="python manage.py runserver"
  alias djapp="python manage.py startapp"
  alias djmkm="python manage.py makemigrations"
  alias djmig="python manage.py migrate"
  
  # Colorize 
  alias ls="ls --color=auto"
# }

# Functions
djpro() { 
  # Create a new Django project with the given name
  # in current folder and inside of a new environment. 
  pipenv install django;
  pipenv run django-admin startproject "$1" .;
  pipenv shell
}