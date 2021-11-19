#!/bin/bash

# arg 1 is source dir, 2 is target, arg 3 is skipped file, 4 is RANDO, 5 is url
#mkdir $1
#mkdir $2
#cd $1

cat ./$3 | while read line
do
  echo $5
  url=`echo "$5" | sed -r 's/'$4'+/'$line'/g'`

  echo "Downloading ${url}"
  if wget -q $url -P $1; then
    echo "Downloaded"
    blender --background --python ./glb.py -- ./$1 ./$2 $line
  else
    echo "Failed"
    echo "${line}" >> ./$3
  fi

  # upload $4 to firebase
done