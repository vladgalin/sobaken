#!/bin/bash

echo "Привет, $USER!"
echo "Текущий путь: $(pwd)"
echo -e "\nСодержимое каталога:"
ls -lh

echo -e "\nМесто на диске по /:"
df -h /

echo -e "\nКоличество запущенных процессов: $(ps -ef | wc -l)"

