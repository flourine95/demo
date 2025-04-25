#!/bin/bash

# Config server
SERVER_USER="root"
SERVER_HOST="192.168.217.129"
SERVER_PATH="/home/app"

# 1. Nén source code (trừ thư mục .git, build,...)
echo "==> Đóng gói source code"
tar --exclude='./.git' --exclude='./build' --exclude='./.gradle' -czf deploy.tar.gz .

# 2. Gửi lên server
echo "==> Gửi source lên server ${SERVER_USER}@${SERVER_HOST}"
scp deploy.tar.gz ${SERVER_USER}@${SERVER_HOST}:/tmp/

# 3. SSH vào server, giải nén và chạy Docker Compose
echo "==> SSH vào server và deploy"
ssh ${SERVER_USER}@${SERVER_HOST} << EOF
    set -e
    echo "==> Giải nén source code"
    rm -rf ${SERVER_PATH}
    mkdir -p ${SERVER_PATH}
    tar -xzf /tmp/deploy.tar.gz -C ${SERVER_PATH}
    rm /tmp/deploy.tar.gz
    echo "==> Triển khai bằng Docker Compose"
    cd ${SERVER_PATH}
    docker compose down || true
    docker compose up --build -d
    echo "==> Đã deploy xong!"
EOF

# 4. Xóa file tạm local
rm deploy.tar.gz
echo "==> Xong!"
