#!/bin/bash

echo start samba-ad-dc

cat /etc/samba/smb.conf
cat /etc/krb5.conf

service samba-ad-dc start


sleep infinity