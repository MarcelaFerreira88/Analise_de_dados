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
  









