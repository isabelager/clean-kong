# docker build -t clean-kongs .
# interactive shell to view image: docker run -it clean-kongs sh
# exit
# to clean build cache: docker builder prune
# container iD: e4cc793f4680
# to stop: docker stop e4cc793f4680
# to remove: docker rm e4cc793f4680
# to view images and their containers IDs: docker ps -a

FROM nytimes/blender:latest

COPY failed_gorillas cleaned_gorillas ./
COPY clean_skipped.sh ./
COPY glb.py ./
COPY fail_test2.txt ./

RUN chmod +x clean_skipped.sh

RUN ./clean_skipped.sh failed_gorillas cleaned_gorillas fail_test2.txt