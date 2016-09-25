#!/bin/bash

yum install -y epel-release
yum install -y puppet
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
echo "192.168.33.16 puppetserver.minsk.epam.com" >> /etc/hosts
echo "192.168.33.17 puppetclient.minsk.epam.com" >> /etc/hosts
service puppet restart
puppet apply -e 'include runpuppet' --modulepath=/vagrant
echo "Provisioning has been complete"