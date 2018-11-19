AMBARIHOST=master.subex.com
CLUSTERNAME=single_node_hdp_cluster
BLUEPRINT=cluster_configuration.json

echo "==============================================================================================================="
echo "Deleting Blueprint"
curl -s -H "X-Requested-By:ambari" -i -X DELETE -u admin:admin http://$AMBARIHOST:8080/api/v1/blueprints/$CLUSTERNAME
echo "==============================================================================================================="
echo "Register Blueprint"
curl -s -H "X-Requested-By: ambari" -X POST -u admin:admin http://$AMBARIHOST:8080/api/v1/blueprints/$CLUSTERNAME -d @$BLUEPRINT
echo "==============================================================================================================="
echo "Create Cluster"

curl -s -H "X-Requested-By: ambari" -X POST -u admin:admin http://$AMBARIHOST:8080/api/v1/clusters/$CLUSTERNAME -d @hostmapping.json
ret=$?
if [ $ret == 0 ]
then
	echo "Create cluster request submitted at `date`"
else
	echo "Create cluster request failed"
	exit $ret
fi
echo "==============================================================================================================="

for id in `curl -s --user admin:admin -H 'X-Requested-By:ambari' -X GET http://$AMBARIHOST:8080/api/v1/clusters/$CLUSTERNAME/requests/ | grep id | cut -d":" -f2`
do
	echo "Tracking Request : $id " 
	ProgressPercent=`curl -s --user admin:admin -H 'X-Requested-By:ambari' -X GET http://$AMBARIHOST:8080/api/v1/clusters/$CLUSTERNAME/requests/$id | grep progress_percent | awk '{print $3}' | cut -d . -f 1`
	echo " Progress: $ProgressPercent"
	 
	while [[ `echo $ProgressPercent | grep -v 100` ]]; do
	  ProgressPercent=`curl -s --user admin:admin -H 'X-Requested-By:mycompany' -X GET http://$AMBARIHOST:8080/api/v1/clusters/$CLUSTERNAME/requests/$id | grep progress_percent | awk '{print $3}' | cut -d . -f 1`
	  tput cuu1
	  echo " Progress: $ProgressPercent %"
	  sleep 10
	done
done
echo "Cluster build is completed at `date`"
echo "==============================================================================================================="
