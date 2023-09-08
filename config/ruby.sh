export RUBY_CONFIGURE_OPTS=--disable-install-doc

eval "$(rbenv init -)"

if [ "$platform" = 'Darwin' ]; then
  . $(brew --prefix asdf)/libexec/asdf.sh
else
  if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
    . "$HOME/.asdf/asdf.sh"
  fi

  if [[ -n $(which rvm) ]];then
    # rm -f $HOME/.rvmrc
    gems_path=$(rvm info homes | grep 'gem:' | cut -d ':' -f 2 | sed 's/\s//g' | sed 's/"//g')
    rubies_path=$(rvm info homes | grep 'ruby:' | cut -d ':' -f 2 | sed 's/\s//g' | sed 's/"//g')
    ruby_in_gems=${gems_path}/bin/ruby
    ruby_in_rubies=${rubies_path}/bin/ruby
    echo $ruby_in_gems
    echo $ruby_in_rubies
    if [[ ! -f $ruby_in_gems ]]; then
      ln -s $ruby_in_rubies $ruby_in_gems
    fi
  fi
fi
