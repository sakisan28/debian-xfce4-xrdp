FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

# 必要パッケージのインストール
RUN apt-get update && apt-get install -y \
    xfce4 \
    xrdp \
    sudo \
    dbus-x11

# ユーザー作成
RUN useradd -m -s /bin/bash sakisan && \
    echo "sakisan:ki3618sa" | chpasswd && \
    usermod -aG sudo sakisan

EXPOSE 3389

# dbus と xrdp を起動
CMD service dbus start && xrdp-sesman && xrdp && tail -f /dev/null
