expect<<-END
spawn ssh 3.3.3.13 -p 9076 
expect "*Password:"
send "1\n"
expect "*Password:"
send "1\n"
expect eof
exit
END
