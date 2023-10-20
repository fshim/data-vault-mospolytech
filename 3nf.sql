create table discipline
(
    id                  integer not null constraint discipline_pk primary key, -- primary key таблицы
    name                varchar(255), -- наименование дисциплины
    differentiated_exam boolean, -- зачет или экзамен?
    number_of_hours     integer -- количество часов
);

create table lecturer
(
    id              integer not null constraint lecturer_pk primary key, -- primary key таблицы
    full_name       varchar(500), -- полное имя преподавателя
    academic_degree varchar(255), -- ученая степень
    date_birth      date -- дата рождения
);

create table schedule
(
    id            integer not null constraint schedule_pk primary key, -- primary key таблицы
    discipline_id integer constraint schedule_discipline_id_fk references discipline, -- foreign key на таблицу discipline
    lecturer_id   integer constraint schedule_lecturer_id_fk references lecturer, -- foreign key на таблицу lecturer
    time          timestamp -- дата и время лекции
);