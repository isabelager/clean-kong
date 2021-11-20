#!/bin/bash
# arg 1 is skipped file

#download pending file from storage
curl -X GET \
  -H "Authorization: Bearer ya29.a0ARrdaM87fru4sUMR1KVLQc0kGow_bXBTgBpUKBeZ8g90tcmI-SqQctorWwK5UYbG1mnUpbooSV5ijdIUVOyz07NQhuYV8Y1pgSZDPxKTib2qmYsZuoWx1d31wvVi9XuoeMGvFgSdWzeYw-oHjzIGfdEP7slkRQ" \
  -o "pending.txt" \
  "https://storage.googleapis.com/jadu-qa/Collections/CyberKong/pending.txt"
cat ./pending.txt | while read id
do
  url=$(eval echo "$1" | sed "s/['\"]//g")
  echo "Arg is: ${exp}"
#  url=https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/$id/$id.glb
  echo "Downloading ${url}"
  if wget -q $url -P "failed"; then
    echo "Downloaded"
    blender --background --python ./glb.py -- "$id"
  else
    echo "Failed"
    echo "${url}" >> ./$1
  fi

  # upload $4 to firebase
done