#!/bin/sh

#  backupSolr.sh
#  
#
#  Created by Sendurr Selvaraj on 4/20/20.
#
echo "========= starting backup ========="
solrUrl="http://localhost:8983/solr/"
collection="films"
noOfDocs="0"
outputFile="backUp"${collection}".json"
jsonDirectory="."
checkOutputFile=`find  $jsonDirectory -type f -name $outputFile`
if [ -z $checkOutputFile ]
then
    echo "Verified - backup file already deleted"
else
    rm -f $checkOutputFile
    echo "backup file present -- deleting"
fi
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*&rows="${noOfDocs}
echo "Triggering -- "$solrGetAllurl
noOfDocs=`curl $solrGetAllurl | jq '.response.numFound'`
echo "total docs found -- "$noOfDocs
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*&rows="${noOfDocs}
echo "Triggering with total doc count-- "$solrGetAllurl
# get all docs from collection. Remove version before storing to file
curl $solrGetAllurl | jq '.response.docs' | jq 'map(del(._version_))' > $outputFile
echo "backup written to "$outputFile
echo "========= backup completed ========="
