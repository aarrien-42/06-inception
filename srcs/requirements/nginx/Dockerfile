FROM alpine:3.18.2

EXPOSE 443

# All the setup and installation logic
RUN apk update && apk upgrade && apk --no-cache add nginx openssl

# Copy configurations
COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY /tools/openssl.crt /etc/nginx/openssl.crt
COPY /tools/openssl.key /etc/nginx/openssl.key

#RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 -sha256 \
#    -keyout /etc/nginx/openssl.key \
#    -out /etc/nginx/openssl.crt \
#    -subj "/C=SP/ST=Madrid/L=Madrid/O=42/OU=IT/CN=aarrien.42.fr/"

RUN nginx -t

# The command that'll run when the container starts
CMD ["nginx", "-g", "daemon off;"]