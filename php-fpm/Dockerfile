FROM debian:jessie

MAINTAINER Vincent Composieux <vincent.composieux@gmail.com>

RUN apt-get update && apt-get install -y php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-imagick php5-curl php5-intl

ADD symfony.ini /etc/php5/fpm/conf.d/
ADD symfony.ini /etc/php5/cli/conf.d/

ADD symfony.pool.conf /etc/php5/fpm/pool.d/

RUN usermod -u 1000 www-data

RUN apt-get install -y curl git
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony

RUN chmod a+x /usr/local/bin/symfony

ADD run.sh /root/

CMD ["/root/run.sh"]

EXPOSE 9000
