#!/bin/sh

#  backupSolr.sh
#  
#
#  Created by Sendurr Selvaraj on 4/20/20.
#  
solrUrl="http://localhost:8983/solr/"
collection="films"
noOfDocs="0"
outputFile="backUp"${collection}".json"
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*&rows="${noOfDocs}
echo "Triggering -- "$solrGetAllurl
noOfDocs=`curl $solrGetAllurl | jq '.response.numFound'`
echo "total docs found -- "$noOfDocs
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*&rows="${noOfDocs}
echo "Triggering with total doc count-- "$solrGetAllurl
curl $solrGetAllurl | jq '.response.docs' > $outputFile
