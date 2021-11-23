#!/bin/bash
# arg 1 is skipped file

#download pending file from storage
gsutil cp gs://jadu-qa/Collections/CyberKong/pending.txt pending.txt

cat ./pending.txt | while read id
do
  url=$(eval echo "$1" | sed "s/['\"]//g")
  echo "Downloading ${url}"
  if wget -q $url -P "failed"; then
    echo "Downloaded"
    blender --background --python ./glb.py -- "$id"
    gsutil cp ./cleaned/$id.glb gs://jadu-qa/Collections/CyberKong/"$id".glb
  else
    echo "Failed: ${id}"
    echo "${id}" >> ./failed.txt
  fi
done

# upload pending back to storage
gsutil cp ./failed.txt gs://jadu-qa/Collections/CyberKong/pending.txt