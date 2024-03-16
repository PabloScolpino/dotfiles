# Using ansible

    # Install ansible
    platform=$(uname)
    if [ "$platform" == 'Linux' ]; then
      sudo apt install ansible
    elif [ "$platform" == 'Darwin' ]; then
      # Install brew
      # [https://brew.sh](https://brew.sh)
      # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew install ansible
    fi

    # Clone this repo
    git clone https://github.com/PabloScolpino/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles/setup
    make install

# Using shellscript

    platform=$(uname)
    if [ "$platform" == 'Linux' ]; then
      sudo apt-get update
      sudo apt-get install -y --no-install-recommends curl
    elif [ "$platform" == 'Darwin' ]; then
      # Install brew
      # [https://brew.sh](https://brew.sh)
      # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew update
      brew install curl
    fi

    curl https://raw.githubusercontent.com/PabloScolpino/dotfiles/master/setup/terminal_setup.sh | bash
