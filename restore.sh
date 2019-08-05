#!/usr/bin/env bash

while IFS= read -r line
do
    backupFile=`cut -d ':' -f2 <<< $line`
    sourceFile=`cut -d ':' -f1 <<< $line`
    if [ ! -z $sourceFile ] && [ ! -z $backupFile ]
    then
        cp $sourceFile.bkp $backupFile
        echo "Updating   source: $backupFile.bkp dest: $sourceFile"
    fi
done < "configSources"


echo "Restore sucessful."
