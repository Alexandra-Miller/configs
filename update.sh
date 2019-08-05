#!/usr/bin/env bash

while IFS= read -r line
do
    sourceFile=`cut -d ':' -f1 <<< $line`
    backupFile=`cut -d ':' -f2 <<< $line`
    [ ! -z $sourceFile ] && [ ! -z $backupFile ] && cp $sourceFile $backupFile
done < "configSources"
