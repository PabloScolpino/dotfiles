export RUBY_CONFIGURE_OPTS=--disable-install-doc

eval "$(rbenv init -)"

if [ "$platform" = 'Darwin' ]; then
  . $(brew --prefix asdf)/libexec/asdf.sh
else
  if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
    . "$HOME/.asdf/asdf.sh"
  fi

  if [[ -n $(which rvm) ]];then
    rm -f $HOME/.rvmrc

    ruby_in_gems=$HOME/.rvm/gems/ruby-3.1.3/bin/ruby
    if [[ ! -f $ruby_in_gems ]]; then
      ln -s $ruby_in_gems $HOME/.rvm/rubies/ruby-3.1.3/bin/ruby
    fi
  fi
fi
