#!/usr/bin/env bash

while IFS= read -r line
do
    sourceFile=`cut -d ':' -f1 <<< $line`
    backupFile=`cut -d ':' -f2 <<< $line`
    if [ ! -z $sourceFile ] && [ ! -z $backupFile ]
    then
        cp $sourceFile backups/$backupFile.bkp
        echo "Copying   source: $sourceFile dest: backups/$backupFile.bkp"
    fi
done < "configSources"

git add *.bkp
git commit -m "updated config files from source"
