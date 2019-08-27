FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client=1:7.9p1-10 && \
    rm -rf /var/cache/apt

RUN groupadd -g 1000 ubuntu && \
    useradd -u 1000 -d /home/ubuntu -m -s /usr/sbin/nologin -g ubuntu ubuntu

RUN mkdir -m=0700 /home/ubuntu/.ssh && \
    chown -R ubuntu:ubuntu /home/ubuntu/.ssh

USER ubuntu
WORKDIR /home/ubuntu
ENTRYPOINT ["ssh"]
