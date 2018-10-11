#!/bin/bash

read -p "请输入镜像所在的绝q对路径（包括镜像名字）：" myiso
find $myiso &>/dev/null
if $? -eq 0;then
	echo "路径正确"
else
	echo "路径不存在"
	break
fi

mkdir /yum
mkdir /etc/yum.repo.d/oldfile
mv /etc/yum.repo.d/*.repo /etc/yum.repo.d/oldfile
touch my.repo
chmod 755 my.repo
echo "[centos] name=myrepo baseurl=file:///yum gpgcheck=0 enabled=1" > /etc/yum.repo.d/my.repo
mount $myiso -t iso9660 /yum
yum repolist


