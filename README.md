# sginit-container

This docker container can be used to initialize [SearchGuard](https://github.com/floragunncom/search-guard) for an ElasticSearch cluster.

## Use
Launch the container with the following properties:
### Environment Variables
* KEYSTORE_PATH: The full path to the java keystore containing credentials required to access the cluster (Default: /keys/keystore.jks)
* KEYSTORE_PASSWORD: The password for the keystore (required)
* TRUSTSTORE_PATH: The full path to the java keystore containing trusted CAs (Default: /keys/truststore.jks)
* TRUSTSTORE_PASSWORD: The password for the truststore (required)
* SG_CONFIG_PATH: The full path to the directory containing the [search guard configuration](http://floragunncom.github.io/search-guard-docs/configuration.html) that should be used to configure the cluster (Default: /sgconfig)
* WAIT_TIME_SECS: The time to wait (s) before attempting to connect to the cluster. This allows for cluster boot if launching this container at the same time (Default: 420)
* SGADMIN_EXTRA_ARGS: Any additional Search Guard command line arguments. See [configuration options](http://floragunncom.github.io/search-guard-docs/sgadmin.html) (Default: '-nhnv -icl')
* ENABLE_AUTO_SGINDEX_REPLICATE: Call sgadmin a second time with -era to enable auto replication of the sgindex to new nodes (Default: true)
* ES_HOSTNAME: The elasticsearch hostname (Default: elasticsearch-discovery)
* ES_PORT: The elasticsearch port (Default: 9300)
### Volumes Required
* Keystores (default lookup path is in /keys)
* Search Guard config (default lookup path is in /sgconfig)
