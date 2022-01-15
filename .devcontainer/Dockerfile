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

# install nodejsv-16
RUN wget https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz \
    && tar -xJf node-v16*.tar.xz -C /usr/local --strip-components=1 --no-same-owner \
    && rm node-v16*.tar.xz
    
# golangv17
RUN wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz \
    && tar -zxvf go1.17*tar.gz -C /usr/local --strip-components=1 --no-same-owner \
    && rm go1.17*tar.gz

# install golang debugger
RUN go install github.com/go-delve/delve/cmd/dlv@v1.3.2

RUN apt install -y sqlite3 \
    libsqlite3-dev

# cpp support
# boost is cpp major library
RUN apt install -y build-essential \
    cmake \
    gdb \
    libboost-dev \
    mlocate

# install google test for cpp.
RUN apt install -y googletest googletest-tools

# boost library install you use.
RUN apt install -y \
    libboost-program-options-dev

# expected c++ library for developer.
# tcl-dev need と
RUN apt install -y tcl-expect-dev \
    tcl-dev

# use openssl. https request and response
RUN apt install -y libssl-dev

# local only どんなメールが送られるかだけのチェックならこれでOK。
# pipenv install --system
# パッケージの設定し直し、またはもう一度設定。
# dpkg-reconfigure postfix
# https://wiki.debian.org/Postfix

# install drogon
RUN apt install -y git \
    gcc \
    g++ \
    cmake

RUN apt install -y libjsoncpp-dev \
    uuid-dev

RUN apt install  -y openssl \
    libssl-dev

RUN apt install -y zlib1g-dev

RUN git clone https://github.com/an-tao/drogon -b v1.7.4

RUN cd drogon \
    && git submodule update --init \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \
    && cd ../../ \
    && rm -rf drogon/


