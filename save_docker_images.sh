#!/bin/bash
while IFS= read -r line; do 
	echo $line | awk '{ print $1 "_" $2 ".tar" }' | tr "/" "_" | xargs docker save $(echo $line | awk '{ print $1 ":" $2 }') -o
done < <(docker images | tail -n +2)
