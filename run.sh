#!/bin/sh

echo "Waiting $WAIT_TIME_SECS seconds before trying to initialize search guard."
sleep $WAIT_TIME_SECS
echo "Initializing search guard.."
cd $SG_CONFIG_PATH
/sgadmin/tools/sgadmin.sh -ks $KEYSTORE_PATH -ts $TRUSTSTORE_PATH -kspass $KEYSTORE_PASSWORD -tspass $TRUSTSTORE_PASSWORD -h $ES_HOSTNAME -p $ES_PORT $SGADMIN_EXTRA_ARGS
