#!/bin/bash

# Check non-defaulted required variables have been set
if [ -z ${KEYSTORE_PASSWORD+x} ]; then
  echo "Please set the KEYSTORE_PASSWORD environment variable"
  exit 1
fi
if [ -z ${TRUSTSTORE_PASSWORD+x} ]; then
  echo "Please set the TRUSTSTORE_PASSWORD environment variable"
  exit 1
fi

echo "Waiting $WAIT_TIME_SECS seconds before trying to initialize search guard."
sleep $WAIT_TIME_SECS

echo "Initializing search guard.."
cd $SG_CONFIG_PATH
/sgadmin/tools/sgadmin.sh -ks $KEYSTORE_PATH -ts $TRUSTSTORE_PATH -kspass $KEYSTORE_PASSWORD -tspass $TRUSTSTORE_PASSWORD -h $ES_HOSTNAME -p $ES_PORT $SGADMIN_EXTRA_ARGS

if [ $? -eq 0 ] && [[ $ENABLE_AUTO_SGINDEX_REPLICATE == "true" ]]; then
  echo "Enabling sgindex auto replication"
  /sgadmin/tools/sgadmin.sh -ks $KEYSTORE_PATH -ts $TRUSTSTORE_PATH -kspass $KEYSTORE_PASSWORD -tspass $TRUSTSTORE_PASSWORD -h $ES_HOSTNAME -p $ES_PORT $SGADMIN_EXTRA_ARGS -era
fi
