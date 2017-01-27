# ubuntu-base
#
# VERSION               0.0.1

FROM      gendosu/ubuntu-base:16.10

MAINTAINER Gen Takahashi <gendosu@gmail.com>

WORKDIR /tmp

RUN apt-get update \
&&  apt-get install -y --force-yes \
    certbot \
    software-properties-common \
    apt-transport-https

RUN add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./" \
&&  curl -L https://cli-assets.heroku.com/apt/release.key | apt-key add - \
&&  apt-get update \
&&  apt-get install heroku

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
&&  python get-pip.py \
&&  rm get-pip.py \
&&  git clone --depth 1 https://github.com/gboudreau/certbot-heroku \
&&  cd certbot-heroku \
&&  pip install . \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
