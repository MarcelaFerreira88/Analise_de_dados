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
