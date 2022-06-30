#!/bin/bash

sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0\nport=3306|g" /etc/mysql/mariadb.conf.d/50-server.cnf
	
service mariadb start

eval "echo \"$(cat /tmp/appointment_database_setup.sql)\"" | mysql -u root
mysql -u $MARIADB_USER -p$MARIADB_PASSWORD $MARIADB_DATABASE< /tmp/appointment_database.sql

pkill mariadb

mysqld_safe
