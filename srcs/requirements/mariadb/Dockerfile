FROM alpine:3.18.2

EXPOSE 3306

# All the setup and installation logic
RUN apk update && apk upgrade && apk --no-cache add mariadb mariadb-client mariadb-common && \
    mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy configurations
COPY /conf/my.cnf /etc/mysql/my.cnf
COPY /tools/init.sql /usr/local/bin/init.sql
RUN chmod +x /usr/local/bin/init.sql

# MariaDB setup
RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

# The command that'll run when the container starts
CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/usr/local/bin/init.sql"]
