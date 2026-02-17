# Domastroi Bot — Бот для анкетирования ТЗ на дизайн-проект

Standalone-версия бота для прохождения анкеты по техническому заданию на разработку дизайн-проекта жилого помещения.

## Требования

- Python 3.8+
- PostgreSQL

## Установка на VPS

```bash
# Клонировать
git clone https://github.com/SiteCraftorCPP/Domastroi_bot_admin3.git
cd Domastroi_bot_admin3

# Виртуальное окружение
python -m venv venv
source venv/bin/activate  # Linux/Mac
# или: venv\Scripts\activate  # Windows

# Зависимости
pip install -r requirements.txt

# База данных
psql -U postgres -f init_db.sql

# Конфиг
cp .env.example .env
# Отредактировать .env: BOT_API_TOKEN, ADMIN_ID, DB_*
```

## Переменные окружения

| Переменная | Описание |
|------------|----------|
| BOT_API_TOKEN | Токен бота от @BotFather |
| ADMIN_ID | Telegram ID владельца (куда приходят заявки) |
| DB_USER, DB_PASSWORD, DB_NAME, DB_HOST, DB_PORT | Подключение к PostgreSQL |

## Запуск

```bash
python main.py
```

## Функции

- Анкетирование с выбором вариантов и свободным вводом
- Сохранение прогресса — можно прерваться и продолжить позже
- Генерация отчёта в Word после завершения
- Отправка заявки администратору в Telegram
- Команда /manual — ручное формирование документа (только для ADMIN_ID)
