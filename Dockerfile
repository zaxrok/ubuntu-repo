FROM ubuntu:14.04

ENV REPO_DIR /var/repository/ubuntu

RUN apt-get update && \
    apt-get install reprepro nginx -y

ADD nginx/repository.conf /etc/nginx/sites-enabled/vhost-repository.conf
ADD repository/distributions $REPO_DIR/conf/distributions
ADD repository/options $REPO_DIR/conf/options

VOLUME /mnt/packages

EXPOSE 80

CMD reprepro -b $REPO_DIR includedeb trusty /mnt/packages/* && \
    sed -i "s/localhost/$SERVER_URL/g" /etc/nginx/sites-enabled/repository.conf && \
    unlink /etc/nginx/sites-enabled/default && \
    nginx -g "daemon off;"
