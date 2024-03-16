# Local testing

## with act
Useful to verify the github actions setup, but does not cover all cases

    act

## with `build_and_run.sh`
more granular control than with act (which only uses root)

    ./test.sh

    # or better with
    rerun -p "{test.sh|Dockerfile|shell_install.sh|ansible_linux_install.sh|ansible_gitpod_install.sh}" ./test.sh

## Manual

    make test
