FROM debian:stable-slim
VOLUME ["/var/lib/samba/", "/opt/samba"]
RUN apt-get update \
    && apt-get install -y samba krb5-user \
    krb5-config winbind libpam-winbind libnss-winbind  \
    debconf-utils iproute2 ntp ntpdate
COPY ./root/ /
CMD ["sleep", "infinity"]
