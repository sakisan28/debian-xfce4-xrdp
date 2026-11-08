# Docker で Xfce4 を xrdp で使う (debian)

3389/tcp が開くので、RDPクライアントでつなげる。 user/password

一回だけ `./build.sh` でビルド

初回の実行は `./run.sh`

使い捨てで、消す場合は `docker rm -f debian-rdp`

データーを残したい場合は `./stop.sh`, `./start.sh` を使ってください

本当に永続化する場合は docker commit だけど、Dockerfile を書き換えるほうがベターだよね。
