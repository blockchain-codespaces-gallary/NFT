# How to build this docker image
# 1. Install Go (tested with 1.19). Because the block explorer is written in Go.
# 2. cd 3rdparty/ganache-cli-block-explorer 
# 3. Run `go build`. Then you will have the executable file 3rdparty/ganache-cli-block-explorer/ganache-cli-block-explorer
# 4. docker build .

FROM ubuntu:focal
# Do not use latest Ubuntu because mythril requires blake2b-py which requires python3 <= 3.9 which is in <= focal

# Install prerequisites
RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs git lsof python3 python3-pip
RUN npm install -g truffle ganache open-cli
RUN pip3 install mythril
## Github CLI for port forwarding
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt install gh -y

ADD 3rdparty/ganache-cli-block-explorer /ganache-cli-block-explorer

# Setup users according to VSCode document: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
ARG USERNAME=docker
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME
