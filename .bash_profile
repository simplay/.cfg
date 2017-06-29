[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ $XDG_CURRENT_DESKTOP="i3" ]; then
  XDG_CURRENT_DESKTOP="Unity"
fi
