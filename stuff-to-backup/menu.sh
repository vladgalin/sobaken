#!/bin/bash

while true; do
  echo "1) Время и дата"
  echo "2) Инфо о пользователе"
  echo "3) Свобдное место"
  echo "4) Проверить службу"
  echo "5) Выход"
  read choice
  case $choice in
    1) clear; echo "Текущее время $( date)" ; read -p "Нажмите Enter для продолжения..." _
 ;;
    2) clear; echo "Домашняя директория: ~" ; echo "Пользователь: $(whoami)" ; read -p "Нажмите Enter для продолжения..." _ ;;
    3) clear; df -h ; read -p "Нажмите Enter для продолжения..." _ ;;
    4) clear; read -p "Введите имя службы: " svc
systemctl status "$svc" ; read -p "Нажмите Enter для продолжения..." _ ;;
    5) clear; break ; read -p "Нажмите Enter для продолжения..." _ ;;
    *) echo "Введите цифру от 1 до 5!" ;;
  esac
done

