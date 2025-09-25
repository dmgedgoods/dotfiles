#!/bin/sh

nmcli -t -f ACTIVE,SIGNAL dev wifi | awk -F: '$1 == "yes" {print $2 "%"}'
