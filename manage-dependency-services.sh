#!/bin/bash

start_services() {
    echo "Starting services..."
    sudo systemctl start postgresql
    sudo systemctl start nginx
    sudo systemctl start php-fpm
    sudo systemctl start redis
    sudo systemctl start elasticsearch
}

stop_services() {
    echo "Stopping services..."
    sudo systemctl stop postgresql
    sudo systemctl stop nginx
    sudo systemctl stop php-fpm
    sudo systemctl stop redis
    sudo systemctl stop elasticsearch

}

if [ "$1" == "start" ]; then
    start_services
elif [ "$1" == "stop" ]; then
    stop_services
else
    echo "Usage: $0 {start|stop}"
    exit 1
fi

