FROM debian:stable-slim
VOLUME ["/var/lib/samba/", "/opt/samba"]
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -yq samba krb5-user \
    krb5-config winbind libpam-winbind libnss-winbind  \
    debconf-utils iproute2 ntp ntpdate
COPY ./root/ /
CMD ["/install.sh"]
