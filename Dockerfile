# docker build --build-arg RANDO=$rando -t clean-kongs .
# interactive shell to view image: docker run -it clean-kongs sh
# exit
# to clean build cache: docker builder prune
# container iD: e4cc793f4680
# to stop: docker stop e4cc793f4680
# to remove: docker rm e4cc793f4680
# to view images and their containers IDs: docker ps -a
# docker build -t us-central1-docker.pkg.dev/jadu-e23c4/clean-kong/clean-kong-app:v1 .
# docker push us-central1-docker.pkg.dev/jadu-e23c4/clean-kong/clean-kong-app:v1
# requires: gcloud auth configure-docker us-central1-docker.pkg.dev

# rando=`echo $RANDOM | base64 | head -c 20`
# url="https://cyberkongz.fra1.cdn.digitaloceanspaces.com/public/"$rando"/"$rando".glb"
# docker build --build-arg RANDO=$rando --build-arg URL=$url -t clean-kongs .

FROM nytimes/blender:latest

ADD failed_gorillas ./failed_gorillas
ADD cleaned_gorillas ./cleaned_gorillas

COPY clean_skipped.sh ./
COPY glb.py ./
COPY fail.txt ./
COPY fail_2.txt ./

RUN chmod +x clean_skipped.sh

ARG RANDO
ARG URL

#RUN ./clean_skipped.sh failed_gorillas cleaned_gorillas fail.txt $RANDO $URL
CMD ["./clean_skipped.sh", "failed_gorillas", "cleaned_gorillas", "fail.txt", ]

#COPY test_url.sh ./
#CMD ["./test_url.sh", $URL, $RANDO]