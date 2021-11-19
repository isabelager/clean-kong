#!/bin/bash
# arg 1 is skipped file

#download pending file from storage
curl -X GET \
  -H "Authorization: Bearer ya29.a0ARrdaM8rM3tmXVqnDXlsbqbPHyZY8Q8sGxg-ENhW00liigoi27Ic_fasGBxa34c5q_o8jdRYHX4NOyuqc-TU-jbmIwXC2BLQNmSAmuYqpbWr2abHJU6bILGiT807Po4DPLnoGS4U5BIGC_EScVwM7-1mY3fr" \
  -o "pending.txt" \
  "https://storage.googleapis.com/jadu-qa/Collections/CyberKong/pending.txt"
cat ./pending.txt | while read id
do
  eval "$1"
  echo "Arg is: $1"
  url=https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/$id/$id.glb
  echo "Downloading ${url}"
#  if wget -q $url -P "cleaned"; then
#    echo "Downloaded"
#    blender --background --python ./glb.py -- $url
#  else
#    echo "Failed"
#    echo "${url}" >> ./$1
#  fi

  # upload $4 to firebase
done