AMBARI_HOST=master.subex.com
CLUSTER_NAME=single_node_hdp_cluster
ProgressPercent=`curl -s --user admin:admin -H 'X-Requested-By:admin' -X GET http://$AMBARI_HOST:8080/api/v1/clusters/$CLUSTER_NAME/requests/$1 | grep progress_percent | awk '{print $3}' | cut -d . -f 1`
echo " Progress: $ProgressPercent"
 
while [[ `echo $ProgressPercent | grep -v 100` ]]; do
  ProgressPercent=`curl -s --user admin:admin -H 'X-Requested-By:admin' -X GET http://$AMBARI_HOST:8080/api/v1/clusters/$CLUSTER_NAME/requests/$1 | grep progress_percent | awk '{print $3}' | cut -d . -f 1`
  tput cuu1
  echo " Progress: $ProgressPercent %"
  sleep 2
done
echo "Cluster build is complete."
