FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

# 必要パッケージのインストール
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    xrdp \
    sudo \
    dbus-x11 \
    wget curl

# 日本語環境の構築
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
RUN apt-get update && apt-get install -y \
    locales \
    task-japanese \
    task-japanese-desktop \
    fonts-noto-cjk \
    fcitx5 fcitx5-mozc fcitx5-configtool && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8

ENV GTK_IM_MODULE=fcitx
ENV QT_IM_MODULE=fcitx
ENV XMODIFIERS=fcitx

# ユーザー作成
RUN useradd -m -s /bin/bash user && \
    echo "user:password" | chpasswd && \
    usermod -aG sudo user

EXPOSE 3389

# dbus と xrdp を起動
CMD service dbus start && xrdp-sesman && xrdp && tail -f /dev/null
