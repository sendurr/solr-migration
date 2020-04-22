#!/bin/sh

#  rollbackDocs.sh
#
#
#  Created by Sendurr Selvaraj on 4/20/20.
#
echo "========= starting rollback of docs ========="
solrUrl="http//localhost:8983/solr/"
collection="cms_collection"
authentication="-ku x:xxx"
backupFile="backUpcms_collection.json"
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*"
echo "Triggering -- "$solrGetAllurl
noOfDocs=`curl $authentication $solrGetAllurl | jq '.response.numFound'`
echo "total docs found -- "$noOfDocs
solrRollbackurl=${solrUrl}${collection}"/update?commit=true&wt=json"
echo "Triggering -- "$solrRollbackurl
curl -X POST $authentication $solrRollbackurl -H "Content-Type: application/json" --data-binary @$backupFile
echo "Rollback completed, verifying if docs are updated."
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*"
echo "Triggering -- "$solrGetAllurl
noOfDocs=`curl $authentication $solrGetAllurl | jq '.response.numFound'`
echo "total docs found -- "$noOfDocs
echo "========= rollback completed ========="
