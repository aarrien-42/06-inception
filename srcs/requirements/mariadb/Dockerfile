FROM alpine:3.18.2

RUN apk update && apk --no-cache add mariadb mariadb-client && \
    mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY /conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

CMD ["mysqld"]
