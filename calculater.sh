#!/bin/bash

isnum() {
	case "$x$y" in
		[1-9][0-9]*)
			;;
		*)
			echo "**********************"
			echo
			echo "  错误：请输入数字！"
			echo
			echo "**********************";;
	esac

}

#isoperation() {
#	opera="+ - * /"
#	if [[ "$operation" != "+" && "$operation" != "-" \
#	&& "$operation" != "*" && "$operation" != "/" ]]
#	  then
#		echo "********************************"
#		echo "脚本错误：请输入正确的操作符号！"
#		echo "********************************"
#	fi
#}
read -p "输入x：" x
read -p "输入操作符：" operation
read -p "输入y：" y

isnum
#isoperation

operation() {
	a="$x $operation $y = "
	if [[ "$operation" = "+" ]]
	  then
		answer=$[ $x+$y ]
		echo -n "$a"
		echo "$answer"
	elif [[ "$operation" = "-" ]]
	  then
		((answer=$x-$y))
		echo -n "$a"
		echo "$answer"
	elif [[ "$operation" == "*" ]]
	  then
		let answer=$x*$y
		echo -n "$a"
		echo $answer
	elif [[ "$operation" == "/" ]]
	  then
		answer=$[ $x/$y ]
		echo -n "$a"
		echo "$answer"
	else
		echo "************错误警告***********"
		echo
		echo "      运算符号 $operation 不存在      "
		echo
		echo "*******************************"
	fi
}
operation
