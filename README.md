# solr-migration

Shell script to help migration of solr data between evnironments.
1. Create master input data.
2. Backup index in existing solr cluster.
3. Delete all indexes in existing cluster.
4. Upload documents to cluster from input data file.
