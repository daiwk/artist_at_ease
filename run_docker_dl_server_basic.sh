version=$1
version=1.0.2
## run server
####docker run -i -p 50002:22 -p 8001:9000 -h daiwk-tensorflow-server --name docker-tensorflow-server -v /home/work/:/notebooks daocloud.io/daiwk/daiwk-tensorflow-latest:$version /usr/sbin/sshd -D 

img_path=daocloud.io/daiwk/dl-server-basic:$version

## 22:   sshd
## 9000: gt_server
## 6006: tensorboard
docker run -i \
           -p 50002:22 \
           -p 8001:9000 \
           -p 8006:6006 \
           -h docker-dl-tools-server \
           --name docker-dl-tools-server \
           -v /home/work/:/notebooks $img_path \
           /usr/sbin/sshd -D 


##### ************** Usage ******************** ##########

##ssh xxxx -p 50003
### start server example:
##cd dl/daiwk_tensorflow_data/tensorflow-serving/serving/
##bazel-bin/tensorflow_serving/example/inception_inference --port=9000 inception-export > inception_log 2>&1 &
