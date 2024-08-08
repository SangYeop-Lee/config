FROM archlinux:latest

ARG USERNAME=sangyeop-lee
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN usermod -d /home/${USERNAME} -aG wheel ${USERNAME}

# Switch to the specified user
USER ${USERNAME}
WORKDIR /home/${USERNAME}

