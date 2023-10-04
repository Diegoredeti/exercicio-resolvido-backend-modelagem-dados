CREATE DATABASE ecommerce;

CREATE TABLE produtos (
	id SERIAL PRIMARY KEY,
    nome varchar(100),
    descricao text,
    preco integer,
    quantidade_em_estoque integer,
    categoria_id integer REFERENCES categorias(id)
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome varchar(50) unique
    
);

CREATE TABLE itens_do_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id integer,
    quantidade integer,
    produto_id integer
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    valor integer,
    cliente_cpf char(11) REFERENCES clientes(cpf),
    vendedor_cpf char(11) REFERENCES vendedores(cpf)
);

CREATE TABLE clientes (
    cpf char(11) unique,
    nome varchar(150)
);

CREATE table vendedores (
    cpf char(11) unique,
    nome varchar(150)
);

INSERT INTO categorias (nome)
VALUES
('frutas'), 
('verduras'), 
('massas'), 
('bebidas'), 
('utilidades');

INSERT INTO produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id)
VALUES
('Mamão',	'Rico em vitamina A, potássio e vitamina C',	'300',	'123',	'id_categoria_frutas'),
('Maça',	'Fonte de potássio e fibras.',	'90'	'34'	'id_categoria_frutas'),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
('Abacate', 'NÃO CONTÉM GLÚTEN.', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 2),
('Acelga', 'NÃO CONTÉM GLÚTEN.', 235, 13, 2),
('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19, 3),
('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.', 700, 12, 4),
('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5),
('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1),
('Uva', 'NÃO CONTÉM GLÚTEN.', 420, 90, 1);

INSERT INTO clientes (cpf, nome)
VALUES
('80371350042', 'José Augusto Silva'),
('67642869061', 'Antonio Oliveira'),
('63193310034', 'Ana Rodrigues'),
('75670505018', 'Maria da Conceição');

INSERT INTO vendedores (cpf, nome)
VALUES
('82539841031', 'Rodrigo Sampaio'),
('23262546003', 'Beatriz Souza Santos'),
('28007155023', 'Carlos Eduardo');

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES (0, '80371350042', '82539841031') RETURNING id;

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(1, 1, 1), 
(1, 1, 11), 
(1, 6, 12), 
(1, 1, 16), 
(1, 5, 3); 

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 1; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 11; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 6 WHERE id = 12; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 16; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 5 WHERE id = 3; 

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES (0, '63193310034', '23262546003') RETURNING id;

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(2, 10, 17), 
(2, 3, 18), 
(2, 5, 1), 
(2, 10, 5), 
(2, 2, 6); 

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 10 WHERE id = 17; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 3 WHERE id = 18; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 6 WHERE id = 1; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 10 WHERE id = 5; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 2 WHERE id = 6; 

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES (0, '75670505018', '23262546003') RETURNING id;

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(3, 1, 15), 
(3, 6, 17), 
(3, 5, 18); 

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 15; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 6 WHERE id = 17; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 5 WHERE id = 18; 

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES (0, '75670505018', '82539841031') RETURNING id;

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(4, 1, 19), 
(4, 6, 1), 
(4, 1, 7), 
(4, 3, 1),
(4, 20, 5),
(4, 2, 6); 

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 19; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 6 WHERE id = 1;
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 7; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 3 WHERE id = 1; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 20 WHERE id = 5; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 2 WHERE id = 6; 

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES (0, '67642869061', '82539841031') RETURNING id;

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(5, 8, 19),
(5, 1, 9),
(5, 3, 18),
(5, 8, 6),
(5, 2, 12);

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 8 WHERE id = 19; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 9;
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 3 WHERE id = 18; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 8 WHERE id = 6; 
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 2 WHERE id = 12; 