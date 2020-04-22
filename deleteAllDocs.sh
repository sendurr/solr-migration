#!/bin/sh

#  deleteAllDocs.sh
#
#
#  Created by Sendurr Selvaraj on 4/20/20.
#
echo "========= starting deleteion of docs ========="
solrUrl="https://localhost:8983:8984/solr/"
collection="films"
authentication="-ku xx:xxx"
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*"
echo "Triggering -- "$solrGetAllurl
noOfDocs=`curl $authentication $solrGetAllurl | jq '.response.numFound'`
echo "total docs found -- "$noOfDocs
solrDeleteAllurl=${solrUrl}${collection}"/update?commit=true"
echo "Triggering -- "$solrDeleteAllUrl
curl -X POST $authentication $solrDeleteAllurl -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
echo "Delete completed, verifying if docs are deleted."
solrGetAllurl=${solrUrl}${collection}"/select?q=*:*"
echo "Triggering -- "$solrGetAllurl
noOfDocs=`curl $authentication $solrGetAllurl | jq '.response.numFound'`
echo "total docs found -- "$noOfDocs
echo "========= deletion completed ========="
