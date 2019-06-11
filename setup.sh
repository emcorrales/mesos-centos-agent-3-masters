#!/bin/bash -ex
docker build --tag=wakoko --file=masters.Dockerfile .
docker network create --subnet=10.193.154.0/24 mesos-training
docker run -d --net mesos-training --ip 10.193.154.120 --name m1 wakoko
docker run -d --net mesos-training --ip 10.193.154.122 --name m2 wakoko
docker run -d --net mesos-training --ip 10.193.154.140 --name m3 wakoko

docker exec m1 echo 1 > /var/lib/zookeeper/myid
docker exec m1 echo '10.193.154.120' > /etc/mesos-master/hostname

docker exec m2 echo 3 > /var/lib/zookeeper/myid
docker exec m2 echo '10.193.154.122' > /etc/mesos-master/hostname

docker exec m3 echo 7 > /var/lib/zookeeper/myid
docker exec m3 echo '10.193.154.140' > /etc/mesos-master/hostname
