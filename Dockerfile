FROM debian

MAINTAINER hiro <hiro@torproject.org>

RUN \
    apt-get update && \
    apt-get install -y tor nginx &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* &&\
    rm -rf /usr/share/doc/ && rm -rf /usr/share/man &&\
    rm -rf /usr/share/locale

COPY tor/torrc /etc/tor/torrc
COPY default.conf.template /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html

COPY entrypoint.sh /entrypoint.sh

EXPOSE 80

# Start up
ENTRYPOINT ["/entrypoint.sh"]
