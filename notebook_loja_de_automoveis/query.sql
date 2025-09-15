-- Postgres notebook source

-- Seleção de uma coluna de uma tabela 
-- Liste os e-mails dos clientes da tabela sales.customers

select email 
from sales.customers

-- Seleção de mais de uma coluna de uma tabela 
-- Liste os e-mails e nomes dos clientes da tabela sales.customers

select email, first_name, last_name
from sales.customers

-- Seleção todas as colunas de uma tabela 
--Liste todas as informações dos clientes da tabela sales.customers

select *
from sales.customers

-- Seleção de uma coluna sem DISTINCT
-- Liste as marcas de carro que constam na tabela products

select brand
from sales.products

-- Seleção de uma coluna com DISTINCT
-- Liste as marcas de carro distintas que constam na tabela products

select distinct brand 
from sales.products

-- Seleção de mais de uma coluna com DISTINCT
-- Liste as marcas e anos de modelo distintos que constam na tabela products

select distinct brand, model_year
from sales.products


-- Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina

select email, state
from sales.customers
where state = 'SC'

-- Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul

select email, state
from sales.customers
where state = 'SC' or state = 'MS'


-- Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos

select email, state, birth_date
from sales.customers
where state = 'SC' or state = 'MS' and birth_date < '19911228'

-- Ordenação de valores numéricos
-- Liste produtos da tabela products na ordem crescente com base no preço

select *
from sales.products
order by price desc


--  Ordenação de texto
-- Liste os estados distintos da tabela customers na ordem crescente

select distinct state
from sales.customers
order by state


-- Seleção das N primeiras linhas usando LIMIT
-- Liste as 10 primeiras linhas da tabela funnel utilizando o LIMIT
select *
from sales.funnel
limit 10


-- Seleção das N primeiras linhas usando LIMIT e ORDER BY
-- Liste os 10 produtos mais caros da tabela products com o comando LIMIT
select *
from sales.products
order by price desc
limit 10


-- Criação de coluna calculada
-- Crie uma coluna contendo a idade do cliente da tabela sales.customers
select
	email,
	birth_date,
	(current_date - birth_date) / 365 as idade_do_cliente
from sales.customers

select
	email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers


-- Utilização da coluna calculada nas queries
-- Liste os 10 clientes mais novos da tabela customers

select
	email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers
order by "idade do cliente"


-- Criação de coluna calculada com strings 
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
select
	first_name || ' ' || last_name as nome_completo
from sales.customers


-- Uso de operadores como flag
-- Crie uma coluna que retorne TRUE sempre que um cliente for um profissional clt 
select
    customer_id,
	first_name,
    professional_status,
	(professional_status = 'clt') as cliente_clt
from sales.customers

--  Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products
select *
from sales.products
where price between 100000 and 200000


--   Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 
select *
from sales.products
where price not between 100000 and 200000


--  Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
select *
from sales.products
where brand in ('HONDA', 'TOYOTA', 'RENAULT')


--  Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA
select distinct first_name
from sales.customers
where first_name like 'ANA%'


-- Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'
select distinct first_name
from sales.customers
where first_name ilike 'ana%'

	
--  Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
select *
from temp_tables.regions
where population is null

	
-- Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia
select count(*)
from sales.funnel


-- Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 

select count (paid_date)
from sales.funnel


-- Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21
select count(distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'


-- Calcule o preço mínimo, máximo e médio dos productos da tabela products
select max(price), min(price), avg(price)
from sales.products
	

-- Informe qual é o veículo mais caro da tabela products
select max(price) from sales.products

select *
from sales.products
where price = (select max(price) from sales.products)


-- Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado
select state, count(*)
from sales.customers
group by state

select state, count(*) as contagem
from sales.customers
group by state
order by contagem desc

	
--  Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 
select state, professional_status count(*) as contagem
from sales.customers
group by state, professional_status 
order by state, contagem desc


--  Seleção de valores distintos
-- Selecione os estados distintos na tabela customers utilizando o group by
select distinct state
from sales.customers

select state
from sales.customers
group by state


-- seleção com filtro no HAVING 
-- Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes
select 
    state, 
    count(*)
from sales.customers
group by state
having count(*)>100

    state, 
    count(*)
from sales.customers
group by state
having count(*)>100 
and state <>'MG'

  









