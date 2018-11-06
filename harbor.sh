# harbor：启动私有镜像库

docker load -i /path/to/k8s-repo-1.12.1   # 自己准备的k8s镜像包
docker run --restart=always -d -p 80:5000 --name repo harbor.io:1180/system/k8s-repo:v1.12.1
