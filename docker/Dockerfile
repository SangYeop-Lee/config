FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# TODO : what are these comments doing?
# RUN --mount=type=cache,id=apt-example,target=/var/cache/apt \
#     apt-get update && apt-get install -y --no-install-recommends \
#        unzip \
#        wget \
#        vim \
#        ctags \
#        less \
#        tree \
#        software-properties-common && \
#    rm -rf /var/lib/apt/lists/*

# TODO : what is the difference between apt and apt-get?
RUN apt update && apt upgrade
RUN apt install -y \
    build-essential \
    wget \
    curl \
    zsh \
    locales \
    vim

# change shell to zsh
RUN chsh -s /usr/bin/zsh

# TODO : learn what locale implies in linux
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

CMD ["/usr/bin/zsh"]
