# master-1：生成ssh密钥对

ssh-keygen
# 三次回车后，密钥生成完成
cat ~/.ssh/id_rsa.pub
# 得到该机器的公钥如下图


# 部署HA master

cd ~/
 
# 创建集群信息文件
echo """
CP0_IP=192.168.100.10
CP0_HOSTNAME=node1
CP1_IP=192.168.100.11
CP1_HOSTNAME=node2
CP2_IP=192.168.100.12
CP2_HOSTNAME=node3
VIP=192.168.100.111
NET_IF=eno16777736
CIDR=10.244.0.0/16
""" > ./cluster-info
 
bash -c "$(curl -fsSL https://raw.githubusercontent.com/599680041/kubernetes/master/kubeha-gen.sh)"
# 该步骤将可能持续2到10分钟，在该脚本进行安装部署前，将有一次对安装信息进行检查确认的机会
