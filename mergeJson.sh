#!/bin/sh

#  mergeJson.sh
#  
#
#  Created by Sendurr Selvaraj on 4/17/20.
#
outputFile="mergedfile.json"
checkOutputFile=`find  . -type f -name $outputFile`
if [ -z $checkOutputFile ]
then
    echo "output file already deleted"
else
    rm -f $checkOutputFile
    echo "output file present"
fi
array=(`find  ./ -type f -name '*.json'`)
for json in ${array[*]}
do echo $json
done
