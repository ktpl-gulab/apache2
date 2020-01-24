from ubuntu:16.04

MAINTAINER KTPL <admin@krishtechnolabs.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y sudo \
    && apt-get install -y vim \
    && apt-get install -y rsyslog \
    && apt-get install -y software-properties-common \
    && apt-get install -y python-software-properties \
    && apt-get install -y build-essential \
    && apt-get install -y tcl8.5 \
    && apt-get install -y cron \
    && apt-get install -y curl \
    && apt-get install -y rsync \
    && apt-get install -y git \
    && apt-get install -y psmisc \
    && apt-get install -y apt-transport-https \
    && apt-get install -y supervisor \
    && apt-get install -y lsb \
    && echo "postfix postfix/mailname string root" | debconf-set-selections \
    && echo "postfix postfix/main_mailer_type string No configuration" | debconf-set-selections \
    && apt-get install -y postfix mailutils libsasl2-2 libsasl2-modules \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && apt-get install -y language-pack-en-base \
    && apt-get update \
    && locale-gen en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && LC_ALL=en_US.UTF-8 \
    && apt-get update \
    && add-apt-repository ppa:ondrej/apache2 \
    && apt-get install -y apache2 \
    && a2enmod rewrite \
    && cd /etc/apache2/conf-available \
    && printf "<Directory "/phpmyadmin">\nAllowOverride all\nRequire all granted\n</Directory>\nAlias /phpmyadmin /phpmyadmin" > phpmyadmin.conf \
    && a2enconf phpmyadmin.conf \
    && apt-get install -y debconf-utils \
    && apt-get -y install mysql-client-5.7 \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-mysql \
    && apt-get install -y php5.6-cgi php5.6-cli php5.6-curl php5.6-imap php5.6-gd php5.6-pgsql php5.6-sqlite3 php5.6-mbstring php5.6-json \
    && apt-get install -y php5.6-bz2 php5.6-mcrypt php5.6-xmlrpc php5.6-gmp php5.6-xsl php5.6-soap php5.6-xml php5.6-zip php5.6-dba \
    && apt-get update \
    && apt-get install -y libapache2-mod-php7.0 php7.0 php7.0-mysql \
    && apt-get install -y php7.0-common php7.0-gd php7.0-mcrypt php7.0-curl php7.0-intl php7.0-xsl php7.0-soap \
    && apt-get install -y php7.0-mbstring php7.0-zip php7.0-bcmath php7.0-iconv php7.0-imagick \
    && apt-get update \
    && apt-get install -y libapache2-mod-php7.1 php7.1 php7.1-mysql \
    && apt-get install -y php7.1-common php7.1-gd php7.1-mcrypt php7.1-curl php7.1-intl php7.1-xsl php7.1-soap \
    && apt-get install -y php7.1-mbstring php7.1-zip php7.1-bcmath php7.1-iconv php7.1-imagick \
    && apt-get update \
    && apt-get install -y libapache2-mod-php7.2 php7.2 php7.2-mysql \
    && apt-get install -y php7.2-common php7.2-gd php7.2-curl php7.2-intl php7.2-xsl php7.2-soap \
    && apt-get install -y php7.2-mbstring php7.2-zip php7.2-tidy php7.2-bcmath php7.2-iconv php7.2-imagick \
    && a2dismod php5.6 \
    && a2enmod php7.2 \
#    && service apache2 restart
    ENTRYPOINT service apache2 start && /bin/bash 
#    && apt-get -y install gcc make autoconf libc-dev pkg-config \
#    && pecl channel-update pecl.php.net \
#    && apt-get -y install libmcrypt-dev \
#    && apt-get update \
#    && apt-get -y install php-dev libmcrypt-dev php-pear php-xml \
#    && pecl channel-update pecl.php.net \
#    && pecl install mcrypt-1.0.1 \
#    && apt-get update \
#    && apt-get install -y php7.3 php7.3-cli php7.3-common \
#    && apt-get install -y php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm \
#    && apt-get install -y libapache2-mod-php7.3 php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-intl 
#    && service apache2 restart
# ENTRYPOINT service apache2 start && /bin/bash
