<<<<<<< HEAD
#!/bin/bash
# arg 1 is skipped file

#download pending file from storage
#gsutil cp gs://jadu-e23c4.appspot.com/Collections/CyberKong/pending.txt pending.txt
curl -X GET \
  -H "Authorization: Bearer ya29.a0ARrdaM8rM3tmXVqnDXlsbqbPHyZY8Q8sGxg-ENhW00liigoi27Ic_fasGBxa34c5q_o8jdRYHX4NOyuqc-TU-jbmIwXC2BLQNmSAmuYqpbWr2abHJU6bILGiT807Po4DPLnoGS4U5BIGC_EScVwM7-1mY3fr" \
  -o "pending.txt" \
  "https://storage.googleapis.com/jadu-qa/Collections/CyberKong/pending.txt"
cat ./pending.txt | while read id
=======
# arg 1 is source dir, 2 is target, arg 3 is skipped file, 4 is fail output file
#mkdir $1
#mkdir $2
#cd $1
cat ./$3 | while read line
>>>>>>> 9fe5ae1f26dd3416cb2df7fb08f520193cddfbb4
do
  eval "$1"
  echo "Arg is: $1"
  url=https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/$id/$id.glb
  echo "Downloading ${url}"
<<<<<<< HEAD
#  if wget -q $url -P "cleaned"; then
#    echo "Downloaded"
#    blender --background --python ./glb.py -- $url
#  else
#    echo "Failed"
#    echo "${url}" >> ./$1
#  fi
=======
  if wget -q $url -P $1; then
    echo "Downloaded"
    blender --background --python ./glb.py -- ./$1 ./$2 $line
  else
    echo "Failed"
    echo "${line}" >> ./$4
  fi

  # upload $4 to firebase
>>>>>>> 9fe5ae1f26dd3416cb2df7fb08f520193cddfbb4
done