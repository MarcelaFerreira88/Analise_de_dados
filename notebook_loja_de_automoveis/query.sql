-- Postgres notebook source

-- Seleção de uma coluna de uma tabela 
-- Liste os e-mails dos clientes da tabela sales.customers

-- COMMAND ----------

select email 
from sales.customers

-- Seleção de mais de uma coluna de uma tabela 
-- Liste os e-mails e nomes dos clientes da tabela sales.customers

-- COMMAND ----------

select email, first_name, last_name
from sales.customers

-- Seleção todas as colunas de uma tabela 
--Liste todas as informações dos clientes da tabela sales.customers

-- COMMAND ----------

select *
from sales.customers

-- Seleção de uma coluna sem DISTINCT
-- Liste as marcas de carro que constam na tabela products

-- COMMAND ----------
select brand
from sales.products

-- Seleção de uma coluna com DISTINCT
-- Liste as marcas de carro distintas que constam na tabela products

-- COMMAND ----------
select distinct brand 
from sales.products

-- Seleção de mais de uma coluna com DISTINCT
-- Liste as marcas e anos de modelo distintos que constam na tabela products

-- COMMAND ----------
select distinct brand, model_year
from sales.products


-- Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina

-- COMMAND ----------
select email, state
from sales.customers
where state = 'SC'

-- Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul

-- COMMAND ----------
select email, state
from sales.customers
where state = 'SC' or state = 'MS'


-- Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos

-- COMMAND ----------
select email, state, birth_date
from sales.customers
where state = 'SC' or state = 'MS' and birth_date < '19911228'



