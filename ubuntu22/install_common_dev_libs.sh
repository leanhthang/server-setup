#!/bin/bash

echo "=== Install dependencies for compiling Ruby ==="

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev -y

echo "=== Install Node JS ==="
read -p "=> Do you want to install NodeJS? Yes(y): " option
if [ "$option" == "y" ]; then
  read -p "=> Version for install (default is 18.x): " node_version
  node_version=${node_version:-18.x}  # Set default if user presses Enter without input
  curl -sL "https://deb.nodesource.com/setup_$node_version" | sudo -E bash -
  sudo apt-get install -y nodejs
fi

echo "=== Install Nginx ==="
read -p "=> Do you want to install Nginx? Yes(y): " option
if [ "$option" == "y" ]; then
  sudo apt-get install -y nginx
  sudo systemctl start nginx
  sudo systemctl enable nginx
fi

echo "=== Install wkhtmltopdf ==="
read -p "=> Do you want to install wkhtmltopdf? Yes(y): " option
if [ "$option" == "y" ]; then
  sudo apt install wkhtmltopdf -y
  # Itel: https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_arm64.deb
  # AMD: https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb

  dpkg -x wkhtmltox_0.12.6.1-2.jammy_arm64.deb .
fi

echo "=== Install Redis ==="
read -p "=> Do you want to install Redis? Yes(y): " option
if [ "$option" == "y" ]; then
  sudo apt-get install redis-server -y
  sudo systemctl start redis-server
  sudo systemctl enable redis-server
fi

echo "=== Install Let's Encrypt SSL ==="
read -p "=> Do you want to install Let's Encrypt SSL? Yes(y): " option
if [ "$option" == "y" ]; then
  sudo apt update && sudo apt upgrade
  sudo apt install certbot -y
fi

echo "=== Install wkhtmltopdf ==="
read -p "=> Do you want to install wkhtmltopdf? Yes(y): " option
if [ "$option" == "y" ]; then
  sudo wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
  sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb
fi

echo "==================== END ===================="
