#!/usr/bin/env bash

while IFS= read -r line
do
    sourceFile=`cut -d ':' -f1 <<< $line`
    backupFile=`cut -d ':' -f2 <<< $line`
    if [ ! -z $sourceFile ] && [ ! -z $backupFile ]
    then
        cp $sourceFile $backupFile
        echo "Copying   source: $sourceFile dest: $backupFile"
    fi
done < "configSources"

git add .
git commit -m "updated config files from source"
