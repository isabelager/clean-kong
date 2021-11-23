# docker build -t clean-kongs .
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

FROM nytimes/blender:latest

ADD failed ./failed
ADD cleaned ./cleaned

COPY clean_skipped.sh ./
COPY glb.py ./

RUN chmod +x clean_skipped.sh

RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install apt-transport-https ca-certificates gnupg -y
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install google-cloud-sdk -y

CMD ["./clean_skipped.sh"]