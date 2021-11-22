#!/bin/bash
# arg 1 is skipped file

#download pending file from storage
curl -X GET \
  -H "Authorization: Bearer $CLOUD_KEY" \
  -o "pending.txt" \
  "https://storage.googleapis.com/jadu-qa/Collections/CyberKong/pending.txt"
cat ./pending.txt | while read id
do
  url=$(eval echo "$1" | sed "s/['\"]//g")
  echo "Downloading ${url}"
  if wget -q $url -P "failed"; then
    echo "Downloaded"
    blender --background --python ./glb.py -- "$id"
  else
    echo "Failed"
    echo "${id}" >> ./failed.txt
  fi

  # upload $4 to firebase
done