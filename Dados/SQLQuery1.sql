CREATE DATABASE FinanceiroBI;


USE FinanceiroBI;

CREATE TABLE centros_custo (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100),
    responsavel VARCHAR(100)
);
CREATE TABLE contas_contabeis (
    codigo VARCHAR(10) PRIMARY KEY,
    descricao VARCHAR(100),
    tipo VARCHAR(50) 
);

CREATE TABLE receitas (
    id INT PRIMARY KEY IDENTITY(1,1),
    data DATE,
    valor DECIMAL(10,2),
    produto VARCHAR(100),
    cliente VARCHAR(100),
    centro_custo_id INT FOREIGN KEY REFERENCES centros_custo(id)
);
CREATE TABLE despesas (
    id INT PRIMARY KEY IDENTITY(1,1),
    data DATE,
    valor DECIMAL(10,2),
    categoria VARCHAR(100),
    tipo_despesa VARCHAR(50), 
    centro_custo_id INT FOREIGN KEY REFERENCES centros_custo(id)
);
INSERT INTO centros_custo (nome, responsavel) VALUES
('Administrativo', 'João'),
('Comercial', 'Carla'),
('Produção', 'Ricardo');
INSERT INTO receitas (data, valor, produto, cliente, centro_custo_id) VALUES
('2024-01-10', 18000.00, 'Serviço A', 'Cliente 1', 2),
('2024-02-15', 20000.00, 'Serviço B', 'Cliente 2', 2),
('2024-03-10', 15000.00, 'Produto X', 'Cliente 3', 3);
INSERT INTO despesas (data, valor, categoria, tipo_despesa, centro_custo_id) VALUES
('2024-01-12', 5500.00, 'Salários', 'Fixa', 1),
('2024-01-20', 1200.00, 'Luz', 'Fixa', 1),
('2024-02-05', 3500.00, 'Marketing', 'Variável', 2);
SELECT 
    FORMAT(data, 'yyyy-MM') AS mes,
    SUM(valor) AS receita_total
FROM receitas
GROUP BY FORMAT(data, 'yyyy-MM')
ORDER BY mes;
SELECT 
    categoria,
    SUM(valor) AS total_categoria
FROM despesas
GROUP BY categoria
ORDER BY total_categoria DESC;
SELECT 
    R.mes,
    R.receita_total,
    D.despesa_total,
    (R.receita_total - D.despesa_total) AS lucro
FROM (
    SELECT FORMAT(data, 'yyyy-MM') AS mes, SUM(valor) AS receita_total
    FROM receitas GROUP BY FORMAT(data, 'yyyy-MM')
) R
JOIN (
    SELECT FORMAT(data, 'yyyy-MM') AS mes, SUM(valor) AS despesa_total
    FROM despesas GROUP BY FORMAT(data, 'yyyy-MM')
) D ON R.mes = D.mes
ORDER BY R.mes;


select * from receitas as a join 

Select * from centros_custo
Select * from contas_contabeis
Select * from receitas
Select * from despesas

INSERT INTO receitas (data, valor, produto, cliente, centro_custo_id) VALUES
('2025-01-05', 22000.00, 'Serviço Premium', 'Cliente 4', 2),
('2025-02-10', 18000.00, 'Produto Y', 'Cliente 5', 3),
('2025-03-12', 24000.00, 'Serviço Especial', 'Cliente 6', 1);

INSERT INTO despesas (data, valor, categoria, tipo_despesa, centro_custo_id) VALUES
('2025-01-15', 6000.00, 'Salários', 'Fixa', 1),
('2025-02-20', 2500.00, 'Publicidade', 'Variável', 2),
('2025-03-05', 1000.00, 'Água', 'Fixa', 3);



