#!/bin/bash
echo "👋 Привет из entrypoint.sh!"
echo "Сохраняем лог..." >> /logs/entrypoint.log
exec python app.py
