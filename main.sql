/*  1) Uploading a database and using SQL queries to answer questions related to customer results on a Online Poker Platform*/

/* Creating table to receive CSV file 'clientes' (customers). I utilized "Table Data Import Wizard", but as a demonstration here, I copied some code lines from the DDL and simulated a LOAD DATA INFILE so you can understand the tables easier:*/

CREATE TABLE clientes (
  id INT,
  sexo VARCHAR(1) DEFAULT NULL,
  data_nascimento DATE DEFAULT NULL,
  data_cadastro DATETIME,
  cidade VARCHAR(50),
  sigla VARCHAR(2)
);

LOAD DATA INFILE "C:\\Users\\cabfb\\OneDrive\\Área de Trabalho\\Jr_Data_Engineer_Evaluation\\1_SQL\\clientes.csv"
INTO TABLE h2.clientes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*o csv da 'clientes' possui 744 valores em branco na coluna 'sexo' e 7 valores em branco na coluna 'data_nascimento'.

/* Creating table to receive CSV file 'resultado' (result). I also utilized "Table Data Import Wizard", but again, as a demonstration here, I copied some code lines from the DDL and simulated a LOAD DATA INFILE so you can understand the tables easier:*/

CREATE TABLE `resultado` (
  `data_acesso` text,
  `clientes_id` int DEFAULT NULL,
  `buyin` double DEFAULT NULL,
  `rake` double DEFAULT NULL,
  `winning` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

LOAD DATA INFILE "C:\\Users\\cabfb\\OneDrive\\Área de Trabalho\\Jr_Data_Engineer_Evaluation\\1_SQL\\resultado.csv"
INTO TABLE h2.resultado
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*o csv da 'resultado' possui 191 valores em branco nas colunas 'buyin' e 'winning'.

/*  a) Quanto de rake foi gerado por cada Geração* de jogadores?*/

/*Selecionando cada geração e somando os rakes:*/
SELECT
    CASE
        WHEN YEAR(data_nascimento) BETWEEN 0000 AND 1924 THEN 'Outros'
        WHEN YEAR(data_nascimento) BETWEEN 1925 AND 1940 THEN 'Veteranos'
        WHEN YEAR(data_nascimento) BETWEEN 1941 AND 1959 THEN 'Baby Boomers'
        WHEN YEAR(data_nascimento) BETWEEN 1960 AND 1979 THEN 'Geração X'
        WHEN YEAR(data_nascimento) BETWEEN 1980 AND 1995 THEN 'Geração Y'
        WHEN YEAR(data_nascimento) BETWEEN 1996 AND 2010 THEN 'Geração Z'
        ELSE 'Geração Alpha'
    END AS geracao,
    SUM(rake) AS totalRake
/*Selecionando de qual tabela eu quero, e conectando "resultado" e "clientes" através do id, e mostranod geração por geração:*/
FROM
    resultado
    INNER JOIN clientes ON resultado.clientes_id = clientes.id_cliente
GROUP BY
    geracao;


/*  b) Qual foi o rake gerado por mês? */

SELECT
    YEAR(data_acesso) AS ano,
    MONTH(data_acesso) AS mes,
    SUM(rake) AS totalRake
FROM
    resultado
GROUP BY
    Ano, Mes;


/*  c) Qual sexo tem uma maior proporção de ganhadores**? */

SELECT
    sexo,
    COUNT(*) AS totaljogadores,
	SUM(CASE WHEN winning > 0 THEN 1 ELSE 0 END) AS totalganhadores,
    (SUM(CASE WHEN winning > 0 THEN 1 ELSE 0 END) / COUNT(*)) AS proporcaoganhadores
FROM
    clientes
    INNER JOIN resultado ON clientes.id_cliente = resultado.clientes_id
GROUP BY
    Sexo
ORDER BY
    ProporcaoGanhadores DESC
LIMIT 3;