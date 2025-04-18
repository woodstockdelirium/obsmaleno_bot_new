# Базовий образ з Python
FROM python:3.11-slim

# Встановлення системних залежностей
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Встановлення залежностей
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Копіюємо код бота
COPY . /app
WORKDIR /app

# Вказуємо порт, який слухає Cloud Run
EXPOSE 8080

# Команда для запуску бота
CMD ["python", "bot.py"]
