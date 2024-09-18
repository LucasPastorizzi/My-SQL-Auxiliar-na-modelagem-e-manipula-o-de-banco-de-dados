USE hospital_db_lucas_vinicius;

 -- Todos os dados e o valor médio das consultas do ano de 2020 realizadas semconvênio

(
    SELECT 
        'Todos os dados' AS tipo,
        id,
        data_hora,
        valor
    FROM consultas
    WHERE convenio_id IS NULL AND YEAR(data_hora) = 2020
)
UNION ALL
(
    SELECT 
        'Valor médio' AS tipo,
        NULL AS id,
        NULL AS data_hora,
        AVG(valor) AS valor
    FROM consultas
    WHERE convenio_id IS NULL AND YEAR(data_hora) = 2020
);

-- Todos os dados e o valor médio das consultas do ano de 2020 realizadas porconvênio


(
    SELECT 
        'Todos os dados' AS tipo,
        id,
        data_hora,
        valor
    FROM consultas
    WHERE convenio_id IS NOT NULL AND YEAR(data_hora) = 2020
)
UNION ALL
(
    SELECT 
        'Valor médio' AS tipo,
        NULL AS id,
        NULL AS data_hora,
        AVG(valor) AS valor
    FROM consultas
    WHERE convenio_id IS NOT NULL AND YEAR(data_hora) = 2020
);

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta

SELECT * 
FROM  internacoes 
WHERE data_alta > data_prev_alta;

-- Receituário completo da primeira consulta registrada com receituário associado

SELECT r.* 
FROM receitas r
JOIN consultas c ON r.consulta_id = c.id
ORDER BY c.data_hora ASC
LIMIT 1;

-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)


SELECT * 
FROM hospital_db_lucas_vinicius.consultas 
WHERE convenio_id IS NULL
ORDER BY valor DESC 
LIMIT 1;


SELECT * 
FROM consultas 
WHERE convenio_id IS NULL
ORDER BY valor ASC 
LIMIT 1;

-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta


SELECT 
    i.id AS id_internacao,
    i.data_entrada,
    i.data_alta,
    DATEDIFF(i.data_alta, i.data_entrada) AS numero_dias,
    q.numero AS numero_quarto,
    tq.descricao AS tipo_quarto,
    tq.valor_diario,
    DATEDIFF(i.data_alta, i.data_entrada) * tq.valor_diario AS total_internacao
FROM 
    internacoes i
JOIN 
    quartos q ON i.quarto_id = q.id
JOIN 
    tipos_quartos tq ON q.tipo_quarto_id = tq.id
WHERE 
    i.data_alta IS NOT NULL;
    
    
   --  Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”

SELECT 
    i.data_entrada AS data_internacao,
    i.desc_procedimento AS procedimento,
    i.quarto_id AS numero_quarto
FROM 
    internacoes i
JOIN 
    tipos_quartos tq ON i.quarto_id = tq.id
WHERE 
    tq.descricao LIKE '%mento%'
ORDER BY 
    i.data_entrada;
    
   -- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta


SELECT 
    p.nome AS nome_paciente,
    c.data_hora AS data_consulta,
    e.nome AS especialidade
FROM 
    consultas c
JOIN 
    pacientes p ON c.paciente_id = p.id
JOIN 
    especialidades_medicos em ON c.medico_id = em.medico_id
JOIN 
    especialidades e ON em.especialidade_id = e.id
WHERE 
    DATEDIFF(c.data_hora, p.data_nasci) < 6570  -- 18 anos em dias (18*365)
    AND e.nome <> 'pediatria'
ORDER BY 
    c.data_hora;

-- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.


SELECT 
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    i.data_entrada AS data_internacao,
    i.desc_procedimento AS procedimentos
FROM internacoes i
JOIN pacientes p ON i.paciente_id = p.id
JOIN medicos m ON i.medico_id = m.id
JOIN quartos q ON i.quarto_id = q.id
JOIN tipos_quartos tq ON q.tipo_quarto_id = tq.id
JOIN especialidades_medicos em ON m.id = em.medico_id
JOIN especialidades e ON em.especialidade_id = e.id
WHERE 
    e.nome = 'gastroenterologia'
    AND tq.descricao = 'enfermaria';



-- Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou


SELECT 
    m.nome AS nome_medico,
    m.crm AS numero_crm,
    COUNT(c.id) AS quantidade_consultas
FROM 
    medicos m
LEFT JOIN 
    consultas c ON m.id = c.medico_id
GROUP BY 
    m.id, m.nome, m.crm
ORDER BY 
    quantidade_consultas DESC;

    
    
    
 -- internacoes   Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação e os números de internações referentes a esses profissionais.

    
    SELECT 
    e.nome AS nome_enfermeiro,
    e.cre AS numero_cre,
    COUNT(i.id) AS numero_internacoes
FROM 
    internacoes i
JOIN 
    enfermeiros e ON i.enfermeiros_id = e.id
GROUP BY 
    e.id, e.nome, e.cre
HAVING 
    COUNT(i.id) > 1
ORDER BY 
    numero_internacoes DESC;

    
    
    
    
    
    
    
    
    
    
    
    
    -- Consulta 1: Nomes e CRE dos enfermeiros que participaram de mais de uma internação, com a quantidade de internações
SELECT 
    e.nome AS nome_enfermeiro,
    e.cre AS numero_cre,
    COUNT(ei.internacao_id) AS quantidade_internacoes
FROM 
    enfermeiros e
JOIN 
    enfermeiros_internacoes ei ON e.id = ei.enfermeiro_id
GROUP BY 
    e.nome, e.cre
HAVING 
    COUNT(ei.internacao_id) > 1;

-- Consulta 2: Nomes dos pacientes e o total gasto com internações para cada paciente
SELECT 
    p.nome AS nome_paciente,
    SUM(tq.valor_diario * DATEDIFF(IFNULL(i.data_alta, CURDATE()), i.data_entrada)) AS total_gasto
FROM 
    pacientes p
JOIN 
    internacoes i ON p.id = i.paciente_id
JOIN 
    tipos_quartos tq ON i.quarto_id = tq.id
GROUP BY 
    p.nome;

-- Inserção de dados para testes
-- Adicionar um enfermeiro
INSERT INTO enfermeiros (nome, cpf, cre) 
VALUES ('João da Silva', '12345678901', 'CRE1234');

-- Adicionar uma internação
INSERT INTO internacoes (data_entrada, data_prev_alta, data_alta, desc_procedimento, medico_id, paciente_id, quarto_id)
VALUES ('2024-08-01', '2024-08-15', NULL, 'Tratamento de exemplo', 1, 1, 1);

-- Relacionar enfermeiro com a internação
INSERT INTO enfermeiros_internacoes (internacao_id, enfermeiro_id) 
VALUES (1, 1);

-- Atualizar o nome de um enfermeiro
UPDATE enfermeiros
SET nome = 'João da Silva Santos'
WHERE cre = 'CRE1234';

-- Deletar uma internação
DELETE FROM internacoes
WHERE id = 1;enfermeiros



















