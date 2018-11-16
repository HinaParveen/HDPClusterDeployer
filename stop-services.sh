export $PASSWORD = admin
export $CLUSTER_NAME = single-node-hdp-cluster
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start HDFS via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/HDFS
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start YARN via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/YARN
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start MAPREDUCE2 via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/MAPREDUCE2
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start HIVE via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/HIVE
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start TEZ via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/TEZ
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start HCATALOG via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/HCATALOG
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start WEBHCAT via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/WEBHCAT
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start ZOOKEEPER via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/ZOOKEEPER
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start NAGIOS via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/NAGIOS
 
curl -u admin:$PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start GANGLIA via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/GANGLIA
