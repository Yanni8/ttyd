#!/bin/bash


ignoredFiles=("README.md", "LICENSE", "script.sh", "deploy.sh")

for FILE in *
do 
	if [[ -d $FILE ]] || [[ ${ignoredFiles[*]} =~ $FILE ]]
	then
		continue
	fi
	echo $FILE
	docker build -t docker.pkg.github.com/yanni8/ttyd/$FILE:latest -f $FILE . 	
	docker push docker.pkg.github.com/yanni8/ttyd/$FILE:latest

done

