#!/bin/bash

brctl addbr br0 && echo "网桥创建成功" && ip a del 3.3.3.13/24 dev enp0s25 && echo "网卡地址清空" && brctl addif br0 enp0s25 && echo "网卡加入网桥成功" && ip a add 3.3.3.13/24 dev br0 && echo "网桥ip添加成功" && ip l set br0 up && echo "启用网桥成功" && ip r add default via 3.3.3.2  && echo "路由设置成功"

