FROM alpine:3.7
LABEL maintainer "Seto Kuslaksono <kuslaksono@gmail.com>"

# Initial Setup
ENV TIMEZONE Asia/Jakarta
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/`echo $TIMEZONE` /etc/localtime && \
    apk del tzdata

# Install packages
RUN apk --no-cache add \
        php7 \
        php7-bcmath \
        php7-common \
        php7-ctype \
        php7-curl \
        php7-dev \
        php7-dom \
        php7-fpm \
        php7-gd \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqli \
        php7-opcache \
        php7-openssl \
        php7-pear \
        php7-pdo_mysql \
        php7-phar \
        php7-redis \
        php7-simplexml \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-zip \
        php7-zlib \
        curl nginx openssl supervisor

 # Setup mongodb 
ADD ./setup-mongodb.sh /setup-mongodb.sh
RUN sh /setup-mongodb.sh && rm -fr /setup-mongodb.sh