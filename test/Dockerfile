FROM ubuntu:18.04 as base

RUN apt-get update && apt-get install -y --no-install-recommends sudo ca-certificates tzdata bash zsh git

RUN adduser user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/user
USER user

FROM base as bash
RUN sudo chsh -s /bin/bash `whoami`

FROM base as zsh
RUN sudo chsh -s /bin/zsh `whoami`

FROM bash as ansible-bash
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
       python3-setuptools \
       python3-pip \
       python3-wheel \
    && sudo rm -Rf /var/lib/apt/lists/* \
    && sudo rm -Rf /usr/share/doc && sudo rm -Rf /usr/share/man \
    && sudo apt-get clean
RUN pip3 install --upgrade pip && pip3 install ansible
ENV PATH $PATH:/home/user/.local/bin

FROM zsh as ansible-zsh
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
       python3-setuptools \
       python3-pip \
       python3-wheel \
    && sudo rm -Rf /var/lib/apt/lists/* \
    && sudo rm -Rf /usr/share/doc && sudo rm -Rf /usr/share/man \
    && sudo apt-get clean
RUN pip3 install --upgrade pip && pip3 install ansible
ENV PATH $PATH:/home/user/.local/bin
