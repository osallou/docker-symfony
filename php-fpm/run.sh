#!/bin/bash

if [ "$ACTION" == "create" ]; then
    if [ ! -e /var/www/symfony/composer.json ]; then
        cd /root && symfony new project
        cp -r /root/project/* /var/www/symfony/
        chown -R www-data /var/www/symfony/
        rm -rf /root/project
    else
        echo "Project already created"
        exit 1
    fi
fi

if [ "$ACTION" == "clone" ]; then
    mkdir /root/project
    cd /root && git clone $GIT project
    cp -r /root/project/* /var/www/symfony/
    cp -r /root/project/.git* /var/www/symfony
    chown -R www-data /var/www/symfony/
    rm -rf /root/project
fi

php5-fpm -F

