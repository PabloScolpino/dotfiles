docker build --target gitpod-bash -t dotfile-test:gitpod-bash .
docker run -it -v $PWD/..:/home/gitpod/.dotfiles -v $PWD:/test --rm dotfile-test:gitpod-bash bash
