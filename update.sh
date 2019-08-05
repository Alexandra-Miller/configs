#!/usr/bin/env bash

while IFS= read -r line
do
    sourceFile=`cut -d ':' -f1 <<< $line`
    backupFile=`cut -d ':' -f2 <<< $line`
    if [ ! -z $sourceFile ] && [ ! -z $backupFile ]
    then
        cp $sourceFile $backupFile.bkp
        echo "Copying   source: $sourceFile dest: $backupFile.bkp"
    fi
done < "configSources"

git add *.bkp
git commit -m "updated config files from source"
