FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt upgrade -y
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
