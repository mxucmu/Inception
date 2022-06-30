#!/bin/bash

cd /var/www/html

    sleep 5;
	if ! mysqladmin -h $DB_HOST -u $MARIADB_USER \
		--password=$MARIADB_PASSWORD --wait=30 ping > /dev/null; then
		printf "MySQL is not available.\n"
		exit 1
	fi
	
    wp core config --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD \
		--dbhost=$DB_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize
