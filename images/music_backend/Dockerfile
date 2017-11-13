# NAME:     music_backend/music_backend
FROM homeland/base:0.2.3
MAINTAINER Chi Sun "https://github.com/notrace1119"

ENV RAILS_ENV 'production'
RUN curl https://get.acme.sh | sh

ENV HOMELAND_VERSION '3.0.10'

RUN useradd ruby -s /bin/bash -m -U &&\
    mkdir -p /var/www &&\
    cd /var/www &&\
    git clone https://sunchi123:19861119@git.coding.net/lvdongdong/music_backend.git? --depth 1 &&\
    git checkout 7ad229d0c5593708f30e505c09365882f9a0a5f4
RUN cd /var/www/music_backend && bundle install --deployment &&\
    find /var/www/music_backend/vendor/bundle -name tmp -type d -exec rm -rf {} + &&\
    chown -R ruby:ruby /var/www

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /var/www/music_backend
