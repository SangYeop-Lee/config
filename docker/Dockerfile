FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
# ENV LANG en_US.utf8

RUN apt update && apt install -y git 
WORKDIR "/root"
RUN git clone https://github.com/SangYeop-Lee/config

CMD ["/bin/bash"]
