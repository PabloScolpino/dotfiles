export RUBY_CONFIGURE_OPTS=--disable-install-doc

eval "$(rbenv init -)"

if [ "$platform" = 'Darwin' ]; then
  . $(brew --prefix asdf)/libexec/asdf.sh
else
  . "$HOME/.asdf/asdf.sh"
fi
