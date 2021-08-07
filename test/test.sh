docker build --target bash -t dotfile-test:bash .
docker run -v $PWD:/test --rm dotfile-test:bash /test/script_to_paste.sh

docker build --target zsh -t dotfile-test:zsh .
docker run -v $PWD:/test --rm dotfile-test:zsh /test/script_to_paste.sh
