#!/usr/bin/env bash

while IFS= read -r line
do
    backupFile=`cut -d ':' -f1 <<< $line`
    sourceFile=`cut -d ':' -f2 <<< $line`
    if [ ! -z $sourceFile ] && [ ! -z $backupFile ]
    then
        cp $sourceFile $backupFile
        echo "Updating   source: $backupFile dest: $sourceFile"
    fi
done < "configSources"


echo "Restore sucessful."
