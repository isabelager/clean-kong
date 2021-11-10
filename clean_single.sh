#first arg is target source directory, second is target destination directory, third arg is kong num
mkdir $1
mkdir $2
cd $1
i=$3
url=https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/$i/$i.glb
echo "Downloading ${url}"./c
if wget -q $url; then
  echo "Downloaded"
  blender --background --python ../glb.py -- $1 $2 $i
else
  echo "Failed"
  echo "${url}" >> ../fail.txt
fi
cd ..
