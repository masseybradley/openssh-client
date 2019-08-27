FROM ubuntu:12.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client=1:5.9p1-5ubuntu1.10 && \
    rm -rf /var/lib/apt/cache

RUN groupadd -g 1000 ubuntu && \
    useradd -u 1000 -d /home/ubuntu -m -s /usr/sbin/nologin -g ubuntu ubuntu

RUN mkdir /home/ubuntu/.ssh && \
    chmod 700 /home/ubuntu/.ssh && \
    chown -R ubuntu:ubuntu /home/ubuntu/.ssh

USER ubuntu
WORKDIR /home/ubuntu
ENTRYPOINT ["ssh"]
