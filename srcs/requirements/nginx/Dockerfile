FROM    debian:buster

RUN     apt-get update && \
        apt-get install -y nginx openssl 

RUN     unlink /etc/nginx/sites-enabled/default
COPY    localhost.conf /etc/nginx/conf.d/

RUN     openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt 

CMD     ["nginx", "-g", "daemon off;"]
