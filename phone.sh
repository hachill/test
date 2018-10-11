#!/bin/bash

menu() {
	echo -e "\033[1;31;5m**************\033[0m"
	echo "*1.査找电话"
	echo "*2.添加电话"
	echo "*3.删除电话"
	echo "*4.显示电话簿"
	echo "**输入其他任意字符退出"
	echo -e "\033[1;31;5m**************\033[0m"
	read -p "*请输入数字选择业务：" num

	case "$num" in
		1)find_phone;;
		2)add_phone;;
		3)delete_phone;;
		4)show_phone;;
		*)echo "退出成功!";;
	esac

}

touch /phone.txt &>/dev/null
chmod 755 /phone.txt &>/dev/null
is_num() {
	 grep "^[[:digit:]]*$" <<< $phone &>/dev/null
	       	if [ $? -eq 0 ];then
			echo ""
		else	
			echo -e "\033[1;32;5m**************\033[0m"
			echo "$phone 不是电话号码！"
			add_phone
		fi
	sleep 1
	menu
}

find_phone() {
	echo -e "\033[1;32;5m**************\033[0m"
	read -p "请输入查找关键字：" name_num
	cat /phone.txt | grep "$name_num" &>/dev/null
	if [ $? -eq 0 ];then
		cat /phone.txt | grep "$name_num"
	else
		echo -e "\033[1;32;5m**************\033[0m"
		echo "没有这个联系人！是否添加为新的联系人？"
		echo -e "\033[1;32;5m**************\033[0m"
		read -p "0表示是，1表示否，请输入：" answer
			if [ $answer -eq 0 ];then
				add_phone
			else
				sleep 1
				memu
			fi
	fi

}

add_phone() {
	echo -e "\033[1;32;5m**************\033[0m"
	read -p "请输入要添加的联系人和电话号码：" name_num
	echo "$name_num" >> /phone.txt && echo "电话号码保存成功！"
	sleep 1
	menu
}

delete_phone() {
	echo -e "\033[1;32;5m**************\033[0m"
	read -p "请输入要删除的联系人和电话号码：" name_num
	sed -i '/'"$name_num"'/d' /phone.txt
	if [ $? -eq 0 ];then
		echo "删除成功！"
	else
		echo "联系人和电话号码不存在！"
	fi
	sleep 1
	menu
}

show_phone() {
	echo -e "\033[1;32;5m**************\033[0m"
	cat /phone.txt
	echo -e "\033[1;32;5m**************\033[0m"
	sleep 3
	menu
	
}
menu
