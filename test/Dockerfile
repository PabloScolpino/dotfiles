ARG PACKAGES_BASE="sudo ca-certificates tzdata openssh-client"
ARG PACKAGES_ANSIBLE_DEPENDENCIES="python3-setuptools python3-pip python3-wheel"

################################################################################
# Plain Ubuntu base
FROM ubuntu:18.04 as base
ARG PACKAGES_BASE
ARG PACKAGES_ANSIBLE_DEPENDENCIES

RUN apt-get update -qq \
  && apt-get install -yy --no-install-recommends $PACKAGES_BASE $PACKAGES_ANSIBLE_DEPENDENCIES \
  && rm -Rf /var/lib/apt/lists/* \
  && rm -Rf /usr/share/doc \
  && rm -Rf /usr/share/man \
  && apt-get clean

RUN addgitpod user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/user
USER user

# Install ansible 2.10+
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN pip3 install --upgrade pip && pip3 install ansible
# ansible binaries are in ~/.local/bin
ENV PATH $PATH:/home/user/.local/bin

WORKDIR /home/user

################################################################################
# Plain Ubuntu bash
FROM base as bash
RUN sudo apt-get update -qq \
  && sudo apt-get install -yy --no-install-recommends bash \
  && sudo apt-get clean \
  && sudo chsh -s /bin/bash `whoami`

################################################################################
# Plain Ubuntu bash
FROM base as zsh
RUN sudo apt-get update -qq \
  && sudo apt-get install -yy --no-install-recommends zsh \
  && sudo apt-get clean \
  && sudo chsh -s /bin/zsh `whoami`

################################################################################
# Gitpod base
FROM gitpod/workspace-full:latest as base-gitpod
ARG PACKAGES_BASE
ARG PACKAGES_ANSIBLE_DEPENDENCIES

RUN DEBIAN_FRONTEND=noninteractive sudo apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq -yy --no-install-recommends $PACKAGES_BASE $PACKAGES_ANSIBLE_DEPENDENCIES \
  && sudo rm -Rf /var/lib/apt/lists/* \
  && sudo apt-get clean

# Install ansible 2.10+
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN pip3 install --upgrade pip && pip3 install ansible
# ansible binaries are in ~/.local/bin
ENV PATH $PATH:/home/gitpod/.local/bin

WORKDIR /home/gitpod

################################################################################
# Gitpod bash
FROM base-gitpod as gitpod-bash
RUN sudo apt-get update -qq \
  && sudo apt-get install -yy --no-install-recommends bash \
  && sudo apt-get clean \
  && sudo chsh -s /bin/bash `whoami`
