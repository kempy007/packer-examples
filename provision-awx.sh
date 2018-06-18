# clean install
# fixup eth vi /etc/sysconfig/network-scripts/ifcfg-enp0s8 remove ipv6 enable on boot etc
sudo su
subscription-manager register --username=itsauser --password=itsapassword
subscription-manager subscribe --pool=somelongid

yum install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
yum install nano net-tools ansible git yum-utils wget nmap -y

yum install ca-certificates -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# get error with ssl cert on above had to; yum install ca-certificates
# package below changes name in the git version
yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.42-1.gitad8f0f7.el7.noarch.rpm -y
yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/pigz-2.3.3-1.el7.centos.x86_64.rpm -y
yum install docker-ce -y
systemctl enable docker
systemctl start docker
yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-docker-pycreds-1.10.6-3.el7.noarch.rpm -y
yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-websocket-client-0.32.0-116.el7.noarch.rpm -y
yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-docker-py-1.10.6-3.el7.noarch.rpm -y

git clone https://github.com/ansible/awx.git
cd awx/installer/
ansible-playbook -i inventory install.yml 

# need to add elements to docker container to allow nmap scans
# docker ps
# docker exec -i -t 85bae66f89b5 /bin/bash #ansible/awx_task
## run in awx task container
# wget https://bootstrap.pypa.io/get-pip.py # not needed
# python get-pip.py # not needed
pip install python-nmap
pip install websocket
yum install nmap -y
# use python nmap example script make sure it works
