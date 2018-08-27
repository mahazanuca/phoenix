FROM centos:7
MAINTAINER Carlos Poveda <krpovmu@gmail.com>

# MariaDB Env
ENV MARIADB_VERSION=10.3

# Install repo and packages
ADD config/mariadb.repo /etc/yum.repo.d/mariadb.repo
RUN yum -y install MariaDB-server MariaDB-client
RUN yum clean all

# Add config files
ADD config/server.cnf /etc/my.cnf.d/server.cnf

# Add scripts to fix installation
COPY config/docker-entrypoint /usr/local/bin/docker-entrypoint
COPY config/fix-permissions /usr/local/bin/fix-permissions

RUN rm -rf /var/lib/mysql && \
    mkdir -p /var/lib/mysql /var/run/mysqld && \
    fix-permissions /var/lib/mysql && \
    fix-permissions /var/run/mysqld && \
    fix-permissions /var/log/ && \
    fix-permissions /etc/my.cnf.d/

### we cannot start mysql as root, we add the user mysql to the group root and change the user of the Docker Image to this user
RUN usermod -G 0 --append mysql
USER mysql

# Add config sql Phoenix database 
ADD sql-files/ /tmp/sql-files/
ADD config/load-databases.sh /tmp/load-databases.sh
RUN chmod 755 /tmp/load-databases.sh

# Mysql App Env
ENV MYSQL_ROOT_PASSWORD=123456 \
    MYSQL_DATABASE=phoenix_api \
    MYSQL_USER=mysql \
    MYSQL_PASSWORD=123456

VOLUME /var/lib/mysql

# Endpoint
ENTRYPOINT ["docker-entrypoint"]

# Default command
CMD ["mysqld"]

# Expose ports
EXPOSE 3306
