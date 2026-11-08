echo 'コンテナの起動（ホストの3389ポートをコンテナの3389に転送）'
docker rm -f debian-rdp
docker run -d -p 3389:3389 --name debian-rdp --ipc=host debian-xfce-xrdp
