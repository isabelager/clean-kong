# arg 1 is source dir, 2 is target, arg 3 is skipped file, 4 is fail output file
#mkdir $1
#mkdir $2
#cd $1
cat ./$3 | while read line
do
  url=https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/$line/$line.glb
  echo "Downloading ${url}"
  if wget -q $url -P $1; then
    echo "Downloaded"
    blender --background --python ./glb.py -- ./$1 ./$2 $line
  else
    echo "Failed"
    echo "${line}" >> ./$4
  fi

  # upload $4 to firebase
done