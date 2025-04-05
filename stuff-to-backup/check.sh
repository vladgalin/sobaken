#!/bin/bash

if [ -f "$1" ]; then
  echo "Файл существует!"
else
  echo "Файл НЕ найден!"
fi

