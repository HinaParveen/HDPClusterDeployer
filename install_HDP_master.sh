#!/usr/bin/bash

logfile="install_HDP_master_`date +%d%m%Y%H%M%S`.log"
set +x
cleanup=$1

echo "=========================================================================================="
if [ $cleanup == 'with-cleanup' ] 
then
	echo "Starting Cleanup at `date`"
	{ time cat response.txt  | bash cleanup.sh ;} 2>&1
	ret=$?
	if [ $ret == 0 ] 
	then
		echo "Cleanup done successfully at `date`"
	else
		echo "Cleanup Failed at `date`"
		exit 1
	fi
fi

echo "=========================================================================================="

echo "Starting Ambari installation at `date`"
{ time ansible-playbook hdp_centos7_playbook.yml ;} 2>&1
ret=$?
if [ $ret == 0 ]
then
	echo "Ambari installation done successfully at `date`"
else
	echo "Ambari installation Failed at `date`"
	exit 2
fi

echo "=========================================================================================="

exit 0
echo "Staring cluster installation at `date`"
{ time bash cluster_installation.sh ;} 2>&1
ret=$?
if [ $ret == 0 ]
then
	echo "Cluster installation done successfully at `date`"
else
	echo "Cluster installation Failed at `date`"
	exit 3
fi

echo "=========================================================================================="
