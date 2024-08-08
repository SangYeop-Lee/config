FROM archlinux:latest

RUN pacman -Syu --noconfirm && pacman -S --noconfirm sudo

ARG USERNAME=sangyeop-lee
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Note: Use a more secure method in production
RUN echo "$USERNAME:password" | chpasswd

# Add the new user to the sudo group
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to the specified user
USER ${USERNAME}
WORKDIR /home/${USERNAME}

CMD ["/bin/bash"]

