FROM ubuntu:18.04 as base

ARG BASE_PACKAGES="sudo ca-certificates tzdata bash zsh"
ARG ANSIBLE_DEPENDENCIES="python3-setuptools python3-pip python3-wheel"

RUN apt-get update -qq \
    && apt-get install -yq --no-install-recommends $BASE_PACKAGES $ANSIBLE_DEPENDENCIES \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc \
    && rm -Rf /usr/share/man \
    && apt-get clean

RUN adduser user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/user
USER user

# Install ansible 2.10+
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN pip3 install --upgrade pip && pip3 install ansible
# ansible binaries are in ~/.local/bin
ENV PATH $PATH:/home/user/.local/bin

FROM base as bash
RUN sudo chsh -s /bin/bash `whoami`

FROM base as zsh
RUN sudo chsh -s /bin/zsh `whoami`
