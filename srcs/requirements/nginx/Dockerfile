FROM alpine:3.18.2

RUN apk update && apk upgrade && apk --no-cache add nginx openssl

COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY /tools/openssl.crt /etc/nginx/openssl.crt
COPY /tools/openssl.key /etc/nginx/openssl.key

#RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 -sha256 \
#    -keyout /etc/nginx/openssl.key \
#    -out /etc/nginx/openssl.crt \
#    -subj "/C=SP/ST=Madrid/L=Madrid/O=42/OU=IT/CN=aarrien.42.fr/"

# muestra errores
RUN nginx -t

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]