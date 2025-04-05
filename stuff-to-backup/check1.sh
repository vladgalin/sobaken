#!/bin/bash

check_target() {
  if [ -f "$1" ]; then
    echo " Файл '$1' найден, размер: $(stat -c%s "$1") байт"
  elif [ -d "$1" ]; then
    echo " Каталог '$1' найден, содержит:"
    ls -lh "$1"
  else
    echo " Объект '$1' не найден"
  fi
}

# Проверка
if [ -z "$1" ]; then
  echo "  Укажи путь как аргумент!"
  echo "   Пример: ./check.sh /etc/passwd"
  exit 1
fi

# Вызов 
check_target "$1"

