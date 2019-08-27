FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 22

VOLUME ["/etc/ssh"]
VOLUME ["/var/run/sshd"]
VOLUME ["/home/ubuntu/sftp/input"]
VOLUME ["/home/ubuntu/.ssh"]

RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/cache/apt

COPY sshd_config /etc/ssh/sshd_config

RUN dpkg-reconfigure openssh-server

RUN groupadd -g 1000 ubuntu && \
    useradd -u 1000 -g ubuntu -d /home/ubuntu -m -s /usr/sbin/nologin ubuntu

RUN chown root:root /home/ubuntu && \
    mkdir -p /home/ubuntu/.ssh /home/ubuntu/sftp/input && \
    chmod 700 /home/ubuntu/.ssh && \
    chmod 755 /home/ubuntu /home/ubuntu/sftp && \
    chown ubuntu:ubuntu /home/ubuntu/.ssh /home/ubuntu/sftp/input

ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
