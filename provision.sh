#!/bin/bash
ETH_VAR=$(ip addr | grep -i broadcast | awk '{ print $2 }' | rev | cut -c 2- | rev)
echo DHCP_HOSTNAME=$SYSNAME.org.local >> /etc/sysconfig/network-scripts/ifcfg-$ETH_VAR
hostname $SYSNAME.org.local
service network restart
subscription-manager register --username $SUBUSER  --password $SUBPW --auto-attach
subscription-manager repos --enable=rhel-7-server-extras-rpms
yum install ansible -y
git config --global http.sslVerify false
git clone -b $BRANCH $SCMURL
cd ansible-pull-basebuild && ansible-playbook -i hosts.inventory -c local local.yml
git config --global http.sslVerify true
