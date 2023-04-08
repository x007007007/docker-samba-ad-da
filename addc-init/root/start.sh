#!/bin/bash

if [[ -n `mount |grep /opt/samba` ]]; then

  ./install.sh
else
  ./runserver.sh
fi