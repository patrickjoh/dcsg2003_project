FROM 192.168.128.23:5000/ubuntu:20.04
MAINTAINER kyrre@begnum.no
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&  apt-get install -y apache2 libapache2-mod-php php-mysql git php-memcache curl php-cli php-mbstring unzip php-pgsql glusterfs-client wget2 prometheus->
RUN rm /var/www/html/index.html
RUN mkdir /var/www/html/images
ADD code/* /var/www/html/
ADD config.php /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl","-D","FOREGROUND","-k","start"]\n