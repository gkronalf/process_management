#!/bin/bash

title="%-10s %-20s %-30s %15s\n"

printf "$title" PID USER NAME COMM

for proc in `ls  /proc/ | egrep "^[0-9]" | sort -n`
    do
    test="/proc/$proc"
   if [[ -d "$test" ]]
    then
    User=`awk '/Uid/{print $2}' /proc/$proc/status`

    comm=`cat /proc/$proc/comm`

    if [[ User -eq 0 ]]
    then
    UserName='root'
    else
    UserName=`grep $User /etc/passwd | awk -F ":" '{print $1}'`
    fi

    open_files=`readlink /proc/$proc/map_files/*; readlink /proc/$proc/cwd`
    if ! [[ -z "$open_files" ]]
    then
    for name in $open_files
    do
    printf "$title" $proc $UserName $name $comm
    done
    fi
   fi
done