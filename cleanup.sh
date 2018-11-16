#!/bin/bash

set +x

ambari-server stop
ambari-server reset
ambari-agent stop
service mysqld stop
service postgresql stop
jps |grep -v Jps| cut -d" " -f1 | xargs kill

python /usr/lib/ambari-agent/lib/ambari_agent/HostCleanup.py

yum remove ambari\* hadoop hdfs bigtop-jsvc bigtop-tomcat hbase\* hadoop\* hdp-select ranger\* zookeeper\* postgresql-libs postgresql postgresql-server
yum remove mysql mysql-server mysql-libs mysql-connector-java

rm -rf /opt/hadoop
rm -rf /opt/app/hadoop
rm -rf /opt/app/ambari-metrics-collector
rm -rf /opt/kafka-logs

rm -rf /usr/hdp
rm -rf /usr/hadoop
rm -rf /usr/kafka-logs

rm -rf /usr/lib/ambari*
rm -rf /usr/lib/hadoop
rm -rf /usr/lib/nagios
rm -rf /usr/lib/ams-hbase

rm -rf /var/nagios
rm -rf /var/kafka-logs

rm -rf /var/lib/ambari*
rm -rf /var/lib/flume
rm -rf /var/lib/ganglia*
rm -rf /var/lib/hadoop*
rm -rf /var/lib/hdfs
rm -rf /var/lib/hive
rm -rf /var/lib/atlas
rm -rf /var/lib/mysql
rm -rf /var/lib/pgsql


rm -rf /var/run/hadoop /var/run/hbase /var/run/zookeeper /var/run/flume /var/run/webhcat /var/run/hadoop-yarn /var/run/hadoop-mapreduce
rm -rf /var/run/accumulo
rm -rf /var/run/ambari*
rm -rf /var/run/atlas
rm -rf /var/run/nagios
rm -rf /var/run/spark

rm -rf /var/log/hbase /var/log/hive /var/log/zookeeper /var/log/flume /var/log/hadoop-yarn /var/log/hadoop-mapreduce
rm -rf /var/log/accumulo
rm -rf /var/log/ambari*
rm -rf /var/log/atlas
rm -rf /var/log/nagios
rm -rf /var/log/spark
rm -rf /var/log/hadoop

rm -rf /tmp/ambari-qa

rm -rf /etc/ambari*
rm -rf /etc/ams-hbase
rm -rf /etc/flume
rm -rf /etc/ganglia
rm -rf /etc/hadoop*
rm -rf /etc/hbase
rm -rf /etc/hive*
rm -rf /etc/nagios
rm -rf /etc/phoenix
rm -rf /etc/pig
rm -rf /etc/tez
rm -rf /etc/zookeeper
rm -rf /etc/accumulo
rm -rf /etc/atlas
rm -rf /etc/spark
rm -rf /etc/mahout

rm -rf /home/accumulo /home/ams /home/atlas /home/mahout /home/nagios /home/spark /home/ambari-qa /home/flume /home/hbase /home/hcat /home/hdfs /home/hive /home/kafka /home/livy /home/mapred /home/sqoop /home/tez /home/yarn /home/zeppelin /home/zookeeper /home/activity_analyzer /home/infra-solr

rm -rf /etc/yum.repos.d/ambari.repo /etc/yum.repos.d/HDP*

yum clean all
rm -rf /var/cache/yum
