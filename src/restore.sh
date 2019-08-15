#!/usr/bin/env bash

while IFS= read -r line
do
    destFile=`cut -d ':' -f2 <<< $line`
    sourceFile=`cut -d ':' -f1 <<< $line`
    if [ ! -z $sourceFile ] && [ ! -z $destFile ]
    then
        cp backups/$sourceFile.bkp $destFile
        echo "Updating   source: backups/$backupFile.bkp dest: $destFile"
    fi
done < "configSources"


echo "Restore sucessful."
