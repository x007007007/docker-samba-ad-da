#!/bin/bash
mount
if [[ -n ${SAMBA_INIT} ]]; then
  ./install.sh
else
  ./runserver.sh
fi