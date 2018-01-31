FROM nginx
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list
RUN apt-get update && apt-get install -y certbot -t jessie-backports
RUN mkdir -p /var/www/html && chmod a+rw /var/www/html
ADD default.conf /etc/nginx/conf.d/default.conf

