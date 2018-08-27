#!/bin/bash

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MariaDB service startup"
    sleep 5
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "status" > /dev/null 2>&1
    RET=$?
done

echo "Checking for databases to import from environment variables INSTALL_<DB_NAME>";

if [ -n "$INSTALL_WORLD" ]; then
    tar -Jxvf world.tar.bz2
    echo "=> Importing example database 'phoenix_api'"
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS phoenix_api"
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} phoenix_api < /tmp/sql-files/world.sql
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} phoenix_api < /tmp/sql-files/phoenix_database.sql
fi

echo "=> Granting access to all databases for '${MYSQL_USER}'"
#mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '{$MYSQL_PASSWORD}'"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"

echo "=> Done!"
