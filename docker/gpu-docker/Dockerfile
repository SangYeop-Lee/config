FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-devel

ENV DEBIAN_FRONTEND noninteractive

# RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
# ENV LANG en_US.utf8

RUN apt update && apt install -y git 
WORKDIR "/root"
RUN git clone https://github.com/SangYeop-Lee/config.git

CMD ["/bin/bash"]
