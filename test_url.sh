#rando=`echo $RANDOM | base64 | head -c 20`
#line=200
#url="https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/"$rando"/"$rando".glb"
#echo $url
#url2=`echo "$url" | sed -r 's/'$rando'+/'$line'/g'`
#echo $url2

line=200
echo "url: ${2}"
url=`echo "$2" | sed -r 's/'$1'+/'$line'/g'`
echo $url
