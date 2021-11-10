#first arg is target source directory, second is target destination directory
mkdir $1
mkdir $2
cd $1
for i in {10563..11000}
do
  url=https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/$i/$i.glb
  echo "Downloading ${url}"
  if wget -q $url; then
    echo "Downloaded"
    blender --background --python ../glb.py -- $1 $2 $i
  else
    echo "Failed"
    echo "${url}" >> ../fail.txt
  fi
done
cd ..
