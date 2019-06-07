#!/bin/bash
# Setup mesos with 3 masters on CentOS.

# Download tools
sudo rpm -Uvh http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
sudo yum -y install mesos marathon
sudo yum -y install mesosphere-zookeeper
