FROM alpine:3.18.2

RUN apk update && apk upgrade && apk --no-cache add mariadb mariadb-client && \
    mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY /conf/my.cnf /etc/mysql/my.cnf

COPY /tools/init.sql /usr/local/bin/init.sql

RUN chmod +x /usr/local/bin/init.sql

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/usr/local/bin/init.sql"]