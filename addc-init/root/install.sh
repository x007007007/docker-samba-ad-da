#!/bin/bash
# reconfig krb5-config

if [[ "$(ls -A /opt/samba)" ]]; then
  echo "already config samba database"
  exit 1
fi

echo REALM: ${REALM?-REALM required}
echo KRB5_SERVER: ${KRB5_SERVER?-KRB5_SERVER required}

echo krb5-config     krb5-config/default_realm       string ${REALM} |debconf-set-selections
echo krb5-config     krb5-config/kerberos_servers    string ${KRB5_SERVER} |debconf-set-selections
echo krb5-config     krb5-config/admin_server        string ${KRB5_SERVER} |debconf-set-selections
echo libpam-runtime  libpam-runtime/profiles multiselect     unix, winbind, mkhomedir, capability |debconf-set-selections
debconf-get-selections | grep krb5-config
dpkg-reconfigure -fnoninteractive krb5-config
mv /etc/samba/smb.conf /etc/samba/smb.conf.initial
samba-tool domain provision \
  --use-rfc2307 \
  --server-role=dc \
  --dns-backend=SAMBA_INTERNAL \
  --realm=HOME.X007007007.INFO \
  --domain=HOME \
  --adminpass=Passw0rd
mv /etc/krb5.conf /etc/krb5.conf.initial
cp /var/lib/samba/private/krb5.conf /etc/
mkdir -p /opt/samba/etc/samba
mkdir -p /opt/samba/var/lib/
cp /etc/krb5.conf /opt/samba/etc/
cp /etc/samba/smb.conf /opt/samba/etc/samba/
cp -r /var/lib/samba /opt/samba/var/lib/