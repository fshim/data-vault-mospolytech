create table hub_discipline
(
    discipline_hash_key varchar(255) not null
        constraint academic_discipline_hub_pk
            primary key, -- primary key таблицы
    load_date           timestamp, -- дата загрузки записи
    record_source       varchar(255), -- источник
    discipline_name     varchar(255) -- имя дисциплины (бизнес ключ)
);

create table hub_lecturer
(
    lecturer_hash_key varchar(255) not null
        constraint lecturer_hub_pk
            primary key, -- primary key таблицы
    load_date         timestamp, -- дата загрузки записи
    record_source     varchar(255), -- источник
    lecturer_inn      varchar(255) -- ИНН преподавателя (не меняется)
);

-- auto-generated definition
create table link_lecture_discipline
(
    lecture_discipline_hash_key varchar(255) not null
        constraint link_lecture_discipline_pk
            primary key, -- primary key таблицы
    discipline_hash_key         varchar(255)
        constraint link_lecture_discipline_hub_discipline_discipline_hash_key_fk
            references hub_discipline, -- foreign key на таблицу hub_discipline
    lecture_hash_key            varchar(255)
        constraint link_lecture_discipline_hub_lecturer_lecturer_hash_key_fk
            references hub_lecturer, -- foreign key на таблицу hub_lecturer
    load_date                   timestamp, -- дата загрузки записи
    record_source               varchar(255) -- источник
);

create table sat_discipline
(
    discipline_hash_key varchar(255)
        constraint sat_discipline_hub_discipline_discipline_hash_key_fk
            references hub_discipline, -- foreign key на таблицу hub_discipline
    load_date           timestamp, -- дата загрузки записи
    record_source       varchar(255), -- источник
    created_at          timestamp, -- дата создания
    schedule            jsonb, -- расписание в json
    differentiated_exam boolean, -- зачет или экзамен?
    number_of_hours     integer -- количество часов
);

create table sat_lecturer
(
    lecturer_hash_key varchar(255)
        constraint sat_lecturer_hub_lecturer_lecturer_hash_key_fk
            references hub_lecturer, -- foreign key на таблицу hub_lecturer
    full_name         varchar(512), -- полное имя преподавателя
    academic_degree   varchar(255), -- ученая степень
    date_birth        date, -- дата рождения
    load_date         timestamp, -- дата загрузки записи
    created_at        timestamp, -- дата создания
    record_source     varchar(255) -- источник
);