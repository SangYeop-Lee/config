FROM nvcr.io/nvidia/deepstream:7.1-gc-triton-devel

ENV DEBIAN_FRONTEND noninteractive

# Install required packages for locales and timezone setup
RUN apt-get update && apt-get install -y locales tzdata

# Set the locale environment variables
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Set the timezone to Asia/Seoul
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo "Asia/Seoul" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt update && apt install -y git sudo

# this will be overriden by the launch script
ARG USERNAME=sangyeop-lee
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN usermod -aG sudo ${USERNAME}

# Switch to the specified user
USER ${USERNAME}
WORKDIR /home/${USERNAME}

CMD ["/bin/bash"]
