FROM ubuntu:18.10

RUN apt-get update && \
    apt-get install -y software-properties-common debconf-utils iptables curl net-tools iputils-ping htop && \
    add-apt-repository --yes ppa:wireguard/wireguard && \
    apt-get update && \
    echo resolvconf resolvconf/linkify-resolvconf boolean false | debconf-set-selections && \
    apt-get install -y iproute2 wireguard-dkms wireguard-tools curl resolvconf

COPY wgnet0.conf /etc/wireguard/.
COPY startup.sh /.

EXPOSE 8080

ENTRYPOINT ["/startup.sh"]
