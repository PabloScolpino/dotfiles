docker build --target bash -t dotfile-test:bash .
docker run -v $PWD:/test --rm dotfile-test:bash /test/shell_install.sh
docker run -v $PWD/..:/home/user/temporary_dotfile_folder -v $PWD:/test --rm dotfile-test:bash /test/ansible_linux_install.sh

docker build --target zsh -t dotfile-test:zsh .
docker run -v $PWD:/test --rm dotfile-test:zsh /test/shell_install.sh
docker run -v $PWD/..:/home/user/temporary_dotfile_folder -v $PWD:/test --rm dotfile-test:zsh /test/ansible_linux_install.sh

docker build --target gitpod-bash -t dotfile-test:gitpod-bash .
docker run -v $PWD/..:/home/gitpod/.dotfiles -v $PWD:/test --rm dotfile-test:gitpod-bash /test/ansible_gitpod_install.sh
