#!/bin/bash

sudo firewall-cmd --permanent --new-zone dockerc
sudo firewall-cmd --permanent --zone dockerc --add-source 172.17.0.0/16
sudo firewall-cmd --permanent --zone dockerc --add-port 8443/tcp
sudo firewall-cmd --permanent --zone dockerc --add-port 53/udp
sudo firewall-cmd --permanent --zone dockerc --add-port 8053/udp
sudo firewall-cmd --reload
