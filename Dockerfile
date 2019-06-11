#!/bin/bash
FROM ubuntu:18.04

RUN rpm -Uvh http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
RUN yum -y install mesos marathon
RUN yum -y install mesosphere-zookeeper

COPY zoo.cfg /etc/zookeeper/conf/zoo.cfg

RUN systemctl start zookeeper

COPY zk /etc/mesos/zk

echo 2 > /etc/mesos-master/quorum

systemctl stop mesos-slave.service

service mesos-master restart

service marathon restart
