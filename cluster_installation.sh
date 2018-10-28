curl -H "X-Requested-By:ambari" -i -X DELETE -u admin:admin http://master.subex.com:8080/api/v1/blueprints/single-node-hdp-cluster
curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://master.subex.com:8080/api/v1/blueprints/single-node-hdp-cluster -d @cluster_configuration.json
curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://master.subex.com:8080/api/v1/clusters/single-node-hdp-cluster -d @hostmapping.json
