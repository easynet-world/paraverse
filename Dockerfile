ARG BASE_VERSION
ARG BASE_IMAGE

FROM paraverse-base-$BASE_IMAGE:$BASE_VERSION
ENV container docker

ARG CURRENT
ARG ID

USER root
RUN mkdir /Users
RUN useradd -m -d /Users/$ID $ID
RUN usermod -aG wheel $ID; exit 0
RUN usermod -aG sudo $ID; exit 0
RUN echo "$ID:qwer" | chpasswd

USER $ID
WORKDIR /Users/$ID

COPY --chown=$ID .ssh /Users/$ID/.ssh
COPY --chown=$ID .gradle/gradle.properties /Users/$ID/.gradle/gradle.properties
COPY --chown=$ID .aws /Users/$ID/.aws
COPY --chown=$ID .local /Users/$ID/.local
COPY --chown=$ID .bashrc /Users/$ID/.bashrc
COPY --chown=$ID .bash_profile /Users/$ID/.bash_profile

# highlight hostname
RUN echo 'export HOST_NAME=$(cat /tmp/hostname)' >> ~/.bashrc
RUN echo 'PS1="\D{%H:%M:%S}:\e[0;31m\${HOST_NAME}\e[m:\u:\w/>"' >> ~/.bashrc

CMD ["/usr/bin/bash"]
