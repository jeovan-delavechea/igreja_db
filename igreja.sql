create DATABASE igreja;

-- Active: 1701703060844@@127.0.0.1@3306@igreja
use igreja;

-- criando as tabelas e conectando a chave estrangeira:
create table paroquia_agostinho_porto (
    id_comunidade int AUTO_INCREMENT primary KEY,
    nome_comunidade VARCHAR(50) not null,
    matriz BOOLEAN NOT null
);

create table fieis_agostinho_porto (
    id_fiel int AUTO_INCREMENT primary KEY,
    nome_fiel VARCHAR(50) not null,
    sobrenome_fiel VARCHAR(50) not null,
    comunidade_id int,
    constraint FOREIGN key (comunidade_id) REFERENCES paroquia_agostinho_porto (id_comunidade)
);

-- inserindo e conferindo os dados:
insert into paroquia_agostinho_porto (nome_comunidade, matriz)
values 
    ('Nsa. Sra. das Graças', true),
    ('Sagrada Família', FALSE),
    ('Nsa. Sra. de Fátima', false),
    ('St. Josefina Bakhita', FALSE),
    ('Mãe da Divina Providência', FALSE),
    ('Nsa. Sra. Aparecida e S. José Operário', FALSE),
    ('Divino Espírito Santo', FALSE)
;
SELECT * from paroquia_agostinho_porto;

insert into fieis_agostinho_porto (nome_fiel, sobrenome_fiel, comunidade_id)
values 
    ('Marilene', 'F.',  3),
    ('Carlos', 'S.', 3),
    ('Eunice', 'S.', 4),
    ('Thais', 'S.', 3),
    ('Marcilio', 'S.', 6),
    ('Caroline', 'C.', 1),
    ('Larissa', 'S.', 1),
    ('Marcelo', 'M.', 7),
    ('Rosa', 'F.', 1),
    ('Marcos', 'F.', null),
    ('Gustavo', 'A.', 1),
    ('Cátia', 'S.', NULL)
;
SELECT * from fieis_agostinho_porto;

-- inner join:
SELECT nome_fiel, nome_comunidade from fieis_agostinho_porto 
INNER JOIN paroquia_agostinho_porto 
on fieis_agostinho_porto.comunidade_id = paroquia_agostinho_porto.id_comunidade;

-- left join:
SELECT nome_fiel, sobrenome_fiel, nome_comunidade from fieis_agostinho_porto 
left JOIN paroquia_agostinho_porto 
on fieis_agostinho_porto.comunidade_id = paroquia_agostinho_porto.id_comunidade;

-- right join:
SELECT nome_fiel, sobrenome_fiel, nome_comunidade from fieis_agostinho_porto 
right JOIN paroquia_agostinho_porto 
on fieis_agostinho_porto.comunidade_id = paroquia_agostinho_porto.id_comunidade;

-- outer join:
SELECT nome_fiel, sobrenome_fiel, nome_comunidade from fieis_agostinho_porto 
left JOIN paroquia_agostinho_porto 
on fieis_agostinho_porto.comunidade_id = paroquia_agostinho_porto.id_comunidade
union
SELECT nome_fiel, sobrenome_fiel, nome_comunidade from fieis_agostinho_porto 
right JOIN paroquia_agostinho_porto 
on fieis_agostinho_porto.comunidade_id = paroquia_agostinho_porto.id_comunidade;