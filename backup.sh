#!/bin/bash

START=$(date +%s)
TARGET_DIR="stuff-to-backup"
BACKUP_DIR="backups"
DATE=$(date +"%Y-%m-%d_%H-%M")
ARCHIVE_NAME="backup_${DATE}.tar.gz"
LOG_FILE="backup.log"

mkdir -p "$BACKUP_DIR"

# Создание архива
if tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$TARGET_DIR"; then
   echo "[$(date)] ✅ Архив создан: $ARCHIVE_NAME" >> "$LOG_FILE"
# Telegram уведомление
BOT_TOKEN="7657486693:AAEcIQZBR2_y46bKBNDzjiMhlquhL7nEVFo"
CHAT_ID="427123971"
MESSAGE="✅ Бэкап создан: $ARCHIVE_NAME в $BACKUP_DIR"

curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     -d text="$MESSAGE" > /dev/null

else
  echo "[$(date)] ❌ Ошибка при создании архива" >> "$LOG_FILE"
  exit 1
fi

# Запись в лог
echo "[$(date)] Архив создан: $ARCHIVE_NAME" >> "$LOG_FILE"

# Удаление старых архивов (старше 2 дней)
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +2 -exec rm {} \; >> "$LOG_FILE"

echo -e "\e[32m✅ Бэкап готов:\e[0m $BACKUP_DIR/$ARCHIVE_NAME"
END=$(date +%s)
echo "⏱ Выполнено за $((END - START)) секунд" >> "$LOG_FILE"
