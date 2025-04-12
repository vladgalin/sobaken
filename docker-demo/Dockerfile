# СТАДИЯ 1: билдовая (build)
FROM python:3.10-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# СТАДИЯ 2: финальный образ
FROM python:3.10-slim

WORKDIR /app

# Копируем только установленные зависимости (без pip, без кэша)
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Добавляем код
COPY . .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["python", "app.py"]
