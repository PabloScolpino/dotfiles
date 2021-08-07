# Local testing

## with act
Useful to verify the github actions setup, but does not cover all cases

    act

## with `test.sh`
more granular control than with act (which only uses root)

    test.sh

    # or better with
    rerun -a test.sh test.sh
