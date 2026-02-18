-- Таблицы для бота анкетирования Domastroi (standalone)

CREATE TABLE IF NOT EXISTS users_designer (
    id SERIAL PRIMARY KEY,
    id_telegram BIGINT NOT NULL UNIQUE,
    tg_login VARCHAR(255),
    tg_firstname VARCHAR(255),
    tg_lastname VARCHAR(255),
    status INTEGER DEFAULT 0,
    phone VARCHAR(20),
    last_step INTEGER,
    subscribe INTEGER DEFAULT 0,
    root BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS data_questions (
    id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    id_telegram BIGINT NOT NULL,
    tg_login TEXT,
    tg_firstname TEXT,
    tg_lastname TEXT,
    phone TEXT,
    step_start TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    step_time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    step_number INTEGER DEFAULT 0,
    root BIGINT
);

CREATE TABLE IF NOT EXISTS user_answers (
    id SERIAL PRIMARY KEY,
    id_telegram BIGINT NOT NULL,
    tg_login TEXT,
    request_id INTEGER NOT NULL,
    question_step INTEGER NOT NULL,
    answer_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    answer_type TEXT,
    answer_text TEXT,
    root INTEGER
);

-- Права для пользователя БД (запускать от postgres после создания пользователя domastroi)
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO domastroi;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO domastroi;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO domastroi;
