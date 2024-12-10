#!/bin/bash

function list_users {
    echo "List of users"
    awk -F':' '{ print $1, $6 }' /etc/passwd | sort
}

#   awk: утилита для обработки текстовых данных.
#   -F':': установка символа : в качестве разделителя полей.
#   '{ print $1, $6 }': команда awk, которая выводит первое ($1 - имя пользователя) и шестое ($6 - домашний каталог пользователя) поля для каждой строки.

function list_processes {
    echo "List of processes"
    ps -eo pid,comm --sort=pid
}

#    ps: команда для отображения информации о текущих процессах.
#   -e: параметр сообщает команде ps, что нужно отобразить все запущенные в системе процессы.
#   -o: указание формата вывода (поля).
#    pid: идентификатор процесса (Process ID).
#    comm: имя команды или процесса.
#    --sort=pid: сортировка вывода по идентификатору процесса (PID) в порядке возрастания.

# функция вывода справки о командах
function show_help {
    echo "Uasge: $0 [options]"
    echo "Options:"
    echo "  -u, --users            List users and their home directories"
    echo "  -p, --processes        List running processes"
    echo "  -h, --help             Show this help message"
    echo "  -l PATH, --log PATH    Redirect output to a file at PATH"
    echo "  -e PATH, --errors PATH Redirect error output to a file at PATH"
}

log_path=""
error_path=""

# getopts - анализ опций и аргументов переданных команд.
# $OPTIND - индекс опции; $OPTARG - доп. аргумент опции.
