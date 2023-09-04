FROM alpine:3.18.2

RUN apk --no-cache add mariadb mariadb-client && \
    mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY /conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--console"]
