FROM python:3.10-slim

# ユーザ'vscode'を作成する
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt install -y locales \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt update && apt install -y --no-install-recommends \
    curl \
    git \
    git-lfs \
    xvfb \
    x11vnc \
    icewm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY :0

# 以下 pip

ENV PATH $PATH:/home/$USERNAME/.local/bin
RUN pip install -U pip setuptools
RUN pip install pipreqs
