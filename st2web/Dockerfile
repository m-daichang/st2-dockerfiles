FROM nginx

ARG ST2_VERSION
ARG ST2_REPO=stable
ARG ST2_PACKAGE=https://packagecloud.io/StackStorm/${ST2_REPO}/packages/debian/wheezy/st2web_${ST2_VERSION}_amd64.deb/download

ADD ./st2.conf /etc/nginx/conf.d/st2.conf

ADD ${ST2_PACKAGE} /tmp/st2web_${ST2_VERSION}_amd64.deb
RUN dpkg -i /tmp/st2web_${ST2_VERSION}_amd64.deb && rm -r /tmp/st2web_${ST2_VERSION}_amd64.deb && apt-get clean

RUN mkdir -p /etc/ssl/st2 && \
  openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/st2/st2.key -out /etc/ssl/st2/st2.crt -days 999 -nodes -subj "/C=US/ST=California/L=Palo Alto/O=StackStorm/OU=Information Technology/CN=$(hostname)"

