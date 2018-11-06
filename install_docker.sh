# 所有主机：安装配置docker

# 安装docker
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager \
 --add-repo \
 https://download.docker.com/linux/centos/docker-ce.repo
 
yum makecache fast
yum install -y docker-ce
 
# 编辑systemctl的Docker启动文件
sed -i "13i ExecStartPost=/usr/sbin/iptables -P FORWARD ACCEPT" /usr/lib/systemd/system/docker.service
 
# 启动docker
systemctl daemon-reload
systemctl enable docker
systemctl start docker

# 安装私有仓库
# 所有主机：http私有源配置

# 为Docker配置一下私有源
mkdir -p /etc/docker
echo -e '{\n"insecure-registries":["k8s.gcr.io", "gcr.io", "quay.io"]\n}' > /etc/docker/daemon.json
systemctl restart docker
 
# 此处应当修改为harbor所在机器的IP
HARBOR_HOST="10.130.38.80"
# 设置Hosts
yes | cp /etc/hosts /etc/hosts_bak
cat /etc/hosts_bak|grep -vE '(gcr.io|harbor.io|quay.io)' > /etc/hosts
echo """
$HARBOR_HOST gcr.io harbor.io k8s.gcr.io quay.io """ >> /etc/hosts
