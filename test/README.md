# Local testing

## with act
Useful to verify the github actions setup, but does not cover all cases

    act

## with `build_and_run.sh`
more granular control than with act (which only uses root)

    build_and_run.sh

    # or better with
    rerun -p "{build_and_run.sh|Dockerfile|shell_install.sh|ansible_install.sh}" build_and_run.sh
