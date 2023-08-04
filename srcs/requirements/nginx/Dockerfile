FROM alpine:3.18.2

RUN apk update && apk add nginx openssl

COPY /conf/nginx.conf /etc/nginx/nginx.conf
#COPY /tools/openssl.crt /etc/nginx/openssl.crt
#COPY /tools/openssl.key /etc/nginx/openssl.key

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
    -keyout /etc/nginx/openssl.key \
    -out /etc/nginx/openssl.crt -sha256 -subj "/CN=aarrien.42.fr"

RUN nginx -t

CMD ["nginx", "-g", "daemon off;"]