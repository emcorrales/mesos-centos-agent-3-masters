FROM centos:7

RUN rpm -Uvh http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
RUN yum -y install mesos
echo 'docker,mesos' > /etc/mesos-slave/containerizers
echo '5mins' > /etc/mesos-slave/executor_registration_timeout
echo 'zk://10.193.154.120:2181,10.193.154.122:2181,10.193.154.140:2181/mesos' > /etc/mesos/zk
RUN service mesos-slave restart
