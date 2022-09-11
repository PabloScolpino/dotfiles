# Testing / Tweaking

## Install additiional packages

To test/verify new packages before updating the repository run:

    cd setup
    ansible-playbook test_packages_present.yml -i inventory
