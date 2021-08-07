FROM ubuntu:18.04 as base

RUN apt-get update && apt-get install -y --no-install-recommends sudo ca-certificates tzdata bash zsh

RUN adduser user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/user
USER user

FROM base as bash
RUN sudo chsh -s /bin/bash `whoami`

FROM base as zsh
RUN sudo chsh -s /bin/zsh `whoami`
