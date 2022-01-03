# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.209.6/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye or stretch on local arm64/Apple Silicon): bullseye, buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    xz-utils \
    postfix \
    python3-pip \
    s-nail 

RUN wget https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz \
    && tar -xJf node-v16*.tar.xz -C /usr/local --strip-components=1 --no-same-owner \
    && rm node-v16*.tar.xz
    
# local only どんなメールが送られるかだけのチェックならこれでOK。
# pipenv install --system
# パッケージの設定し直し、またはもう一度設定。
# dpkg-reconfigure postfix
# https://wiki.debian.org/Postfix
