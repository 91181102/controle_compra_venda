---------------------------------------------------------------------------------------------
----------------------------- Tabelas do sistema compra e vendas -----------------------------
---------------------------------------------------------------------------------------------

-- CREATE (

-- CREATE DATABASE IF NOT EXISTS CONTROLE_COMPRA_VENDA;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_USUARIOS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `senha` varchar(150) NOT NULL DEFAULT '',
  `tipo` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO techs832_GEN_FINANCEIRO.CCV_USUARIOS (nome,email,senha,tipo) VALUES ('ADM','adm@adm','123',1);

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_EMPRESAS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `cnpj` varchar(14) NOT NULL DEFAULT '',
  `endereco` varchar(150) NOT NULL DEFAULT '',
  `telefone` varchar(30) NOT NULL DEFAULT '',
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_MATERIAL_TIPOS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL DEFAULT '',
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO techs832_GEN_FINANCEIRO.CCV_MATERIAL_TIPOS (nome) VALUES ('NAO DEFINIDO');

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_MATERIAIS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL DEFAULT '',
  `tipo_material_id` int(11) NOT NULL DEFAULT 1,
  `preco_compra` decimal(10,3) NOT NULL DEFAULT 0,
  `preco_venda` decimal(10,3) NOT NULL DEFAULT 0,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_materiais_tipo_material_id` (`tipo_material_id`),
  CONSTRAINT `fk_materiais_tipo_material_id` FOREIGN KEY (`tipo_material_id`) REFERENCES `CCV_MATERIAL_TIPOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_PESSOAS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `cnpj_cpf` varchar(14) NOT NULL DEFAULT '',
  `endereco` varchar(150) NOT NULL DEFAULT '',
  `obs` varchar(100) NOT NULL DEFAULT '',
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO techs832_GEN_FINANCEIRO.CCV_PESSOAS (nome) VALUES ('CLIENTE PADRAO');

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_PESSOA_CONTATOS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) NOT NULL DEFAULT '',
  `contato` varchar(100) NOT NULL DEFAULT '',
  `obs` varchar(100) NOT NULL DEFAULT '',
  `pessoa_id` int(11) NOT NULL DEFAULT 1,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pessoa_contato_pessoa_id` (`pessoa_id`),
  CONSTRAINT `fk_pessoa_contato_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `CCV_PESSOAS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_MOVIMENTOS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) NOT NULL DEFAULT '',
  `data_mov` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pessoa_id` int(11) NOT NULL DEFAULT 1,
  `empresa_id` int(11) NOT NULL DEFAULT 1,
  `flag_fechado` tinyint(4) NOT NULL DEFAULT '0',
  `situacao` varchar(1) NOT NULL DEFAULT '',
  `valor_total` decimal(10,2) NOT NULL DEFAULT 0,
  `valor_pago` decimal(10,2) NOT NULL DEFAULT 0,
  `troco` decimal(10,2) NOT NULL DEFAULT 0,
  `desconto` decimal(10,3) NOT NULL DEFAULT 0,
  `usuario_id` int(11) NOT NULL DEFAULT 1,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movimentos_pessoa_id` (`pessoa_id`),
  KEY `fk_movimentos_empresa_id` (`empresa_id`),
  KEY `fk_movimentos_usuario_id`(`usuario_id`),
  CONSTRAINT `fk_movimentos_pessoa_id` FOREIGN KEY (`pessoa_id`) REFERENCES `CCV_PESSOAS` (`id`),
  CONSTRAINT `fk_movimentos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `CCV_EMPRESAS` (`id`),
  CONSTRAINT `fk_movimentos_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `CCV_USUARIOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_MOVIMENTO_MATERIAIS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movimento_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `qtd` decimal(10,3) NOT NULL DEFAULT 0,
  `vl_unit` decimal(10,2) NOT NULL DEFAULT 0,
  `volumes` int(11) NOT NULL DEFAULT 1,
  `situacao` varchar(1) NOT NULL DEFAULT '',
  `usuario_id` int(11) NOT NULL DEFAULT 1,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movimento_materiais_movimento_id`(`movimento_id`),
  KEY `fk_movimento_materiais_material_id` (`material_id`),
  KEY `fk_movimento_materiais_usuario_id`(`usuario_id`),
  CONSTRAINT `fk_movimento_materiais_movimento_id` FOREIGN KEY (`movimento_id`) REFERENCES `CCV_MOVIMENTOS` (`id`),
  CONSTRAINT `fk_movimento_materiais_material_id` FOREIGN KEY (`material_id`) REFERENCES `CCV_MATERIAIS` (`id`),
  CONSTRAINT `fk_movimento_materiais_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `CCV_USUARIOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_PAGAMENTO_TIPOS (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nome` varchar(100) NOT NULL DEFAULT '',  
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)  
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_PAGAMENTOS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movimento_id` int(11) NOT NULL DEFAULT 1,
  `pagamento_tipo_id` int(11) NOT NULL DEFAULT 1,
  `data_pgto` datetime DEFAULT CURRENT_TIMESTAMP,
  `valor_pago` decimal(10,2) NOT NULL DEFAULT 0,
  `usuario_id` int(11) NOT NULL DEFAULT 1,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagamentos_movimento_id`(`movimento_id`),
  KEY `fk_pagamentos_usuario_id`(`usuario_id`),
  KEY `fk_pagamentos_pagamento_tipo_id`(`pagamento_tipo_id`),
  CONSTRAINT `fk_pagamentos_movimento_id` FOREIGN KEY (`movimento_id`) REFERENCES `CCV_MOVIMENTOS` (`id`),
  CONSTRAINT `fk_pagamentos_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `CCV_USUARIOS` (`id`),
  CONSTRAINT `fk_pagamentos_pagamento_tipo_id` FOREIGN KEY (`pagamento_tipo_id`) REFERENCES `CCV_PAGAMENTO_TIPOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_ESTOQUES (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT 1,
  `material_id` int(11) NOT NULL DEFAULT 1,
  `saldo` decimal(10,3) NOT NULL DEFAULT 0,
  `volumes` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estoques_empresa_id`(`empresa_id`),
  KEY `fk_estoques_material_id`(`material_id`),
  CONSTRAINT `fk_estoques_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `CCV_EMPRESAS` (`id`),
  CONSTRAINT `fk_estoques_material_id` FOREIGN KEY (`material_id`) REFERENCES `CCV_MATERIAIS`(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Tabela para guardar movimento de caixa.
CREATE TABLE IF NOT EXISTS  techs832_GEN_FINANCEIRO.CCV_CAIXA_MOVIMENTOS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caixa_id` int(11) NOT NULL DEFAULT 1,
  `usuario_id` int(11) NOT NULL DEFAULT 1,
  `quantia` decimal(10,3) NOT NULL DEFAULT 0,
  `tipo` varchar(1) NOT NULL DEFAULT 'S',
  `memorando` varchar(150) NOT NULL DEFAULT '',
  `data_mov` datetime DEFAULT CURRENT_TIMESTAMP,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),  
  KEY `fk_caixa_movimentos_usuario_id`(`usuario_id`),  
  CONSTRAINT `fk_caixa_movimentos_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `CCV_USUARIOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Insere o saldo inicial.
INSERT INTO techs832_GEN_FINANCEIRO.CCV_CAIXA_MOVIMENTOS (quantia,tipo,memorando,data_mov) VALUES (250,'E','ENTRADA','2021-06-01');

--)

-- OPERAÇOES (
SELECT * FROM techs832_GEN_FINANCEIRO.CCV_USUARIOS;
SELECT * FROM techs832_GEN_FINANCEIRO.CCV_Pessoas;
SELECT * FROM techs832_GEN_FINANCEIRO.CCV_Pessoa_Contatos;
SELECT * FROM techs832_GEN_FINANCEIRO.CCV_movimentos;
SELECT * FROM techs832_GEN_FINANCEIRO.CCV_movimento_materiais;
SELECT * FROM techs832_GEN_FINANCEIRO.CCV_pagamentos;
SELECT * FROM techs832_GEN_FINANCEIRO.CCV_estoques;
DELETE FROM techs832_GEN_FINANCEIRO.CCV_movimentos WHERE id > 0;

--)

-- Cálculo de Estoque (
SELECT COALESCE(E.id, -1) as id, 
	A.material_id, A.empresa_id, 
	SUM(A.qtd) as saldo,
	CAST(SUM(A.volumes) as int) as volumes,
	COALESCE(E.ativo, '1') as ativo,
	COALESCE(E.saldo, 0.0) as e_saldo,
	COALESCE(E.volumes, 0) as e_volumes
FROM (
SELECT I.material_id, P.empresa_id, 
	CASE WHEN 
		P.tipo='S' 
	THEN SUM(I.qtd) * -1
	ELSE SUM(I.qtd) END as qtd,		
	CASE WHEN 
		P.tipo='S' 
	THEN SUM(I.volumes) * -1
	ELSE SUM(I.volumes) END as volumes, P.tipo
FROM controle_compra_venda.movimento_materiais I
LEFT JOIN controle_compra_venda.movimentos P 
	ON P.id = I.movimento_id 
WHERE I.situacao = 'N'
	-- AND I.material_id = 1
	-- AND P.empresa_id = 1
GROUP BY I.material_id, P.empresa_id, P.tipo) AS A
LEFT JOIN CONTROLE_COMPRA_VENDA.Estoques E 
	ON E.empresa_id = A.empresa_id 
	AND E.material_id = A.material_id
GROUP BY A.material_id, A.empresa_id, 
	E.ativo, E.id, E.saldo, E.volumes;
--)

-- Movimento de Caixa (
SELECT id, caixa_id, usuario_id, quantia, tipo, memorando, data_mov 
FROM CONTROLE_COMPRA_VENDA.caixa_movimentos
WHERE ativo = '1'
ORDER BY data_mov;

(SELECT 0 as id, caixa_id, usuario_id, 'E' AS tipo, 'SALDO ANTERIOR' AS memorando, data_mov, 
	COALESCE((SELECT quantia
	FROM CONTROLE_COMPRA_VENDA.caixa_movimentos
	WHERE ativo = '1' AND tipo = 'E' AND data_mov < '2021-07-08'),0.0) -
	COALESCE(( SELECT COALESCE(quantia, 0.0) as quantia
	FROM CONTROLE_COMPRA_VENDA.caixa_movimentos
	WHERE ativo = '1' AND tipo = 'S' AND data_mov < '2021-07-08'),0) as quantia
FROM CONTROLE_COMPRA_VENDA.caixa_movimentos
WHERE ativo = '1'
ORDER BY data_mov LIMIT 1)
UNION
(SELECT id, caixa_id, usuario_id, tipo, memorando, data_mov, quantia
FROM CONTROLE_COMPRA_VENDA.caixa_movimentos
WHERE ativo = '1' AND data_mov > '2021-07-08'
ORDER BY data_mov);
--)



SELECT controle_compra_venda.MOVIMENTO_MATERIAIS.id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.movimento_id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.material_id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.qtd
	,controle_compra_venda.MOVIMENTO_MATERIAIS.vl_unit
	,controle_compra_venda.MOVIMENTO_MATERIAIS.volumes
	,controle_compra_venda.MOVIMENTO_MATERIAIS.situacao
	,controle_compra_venda.MOVIMENTO_MATERIAIS.usuario_id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.ativo
	,table1.nome AS material
	,table2.nome AS usuario
FROM controle_compra_venda.MOVIMENTO_MATERIAIS
LEFT JOIN controle_compra_venda.MATERIAIS AS table1 ON table1.id = controle_compra_venda.MOVIMENTO_MATERIAIS.material_id
LEFT JOIN controle_compra_venda.USUARIOS AS table2 ON table2.id = controle_compra_venda.MOVIMENTO_MATERIAIS.usuario_id

SELECT 
 controle_compra_venda.USUARIOS.id, controle_compra_venda.USUARIOS.nome, controle_compra_venda.USUARIOS.email, controle_compra_venda.USUARIOS.senha, controle_compra_venda.USUARIOS.tipo, controle_compra_venda.USUARIOS.ativo
FROM controle_compra_venda.USUARIOS;

SELECT controle_compra_venda.MOVIMENTO_MATERIAIS.id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.movimento_id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.material_id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.qtd
	,controle_compra_venda.MOVIMENTO_MATERIAIS.vl_unit
	,controle_compra_venda.MOVIMENTO_MATERIAIS.volumes
	,controle_compra_venda.MOVIMENTO_MATERIAIS.situacao
	,controle_compra_venda.MOVIMENTO_MATERIAIS.usuario_id
	,controle_compra_venda.MOVIMENTO_MATERIAIS.ativo
	,table1.nome AS material
	,table2.nome AS usuario
FROM controle_compra_venda.MOVIMENTO_MATERIAIS
LEFT JOIN controle_compra_venda.MATERIAIS AS table1 ON table1.id = controle_compra_venda.MOVIMENTO_MATERIAIS.material_id
LEFT JOIN controle_compra_venda.USUARIOS AS table2 ON table2.id = controle_compra_venda.MOVIMENTO_MATERIAIS.usuario_id
WHERE movimento_id = 14

SELECT controle_compra_venda.PAGAMENTOS.id
	,controle_compra_venda.PAGAMENTOS.movimento_id
	,controle_compra_venda.PAGAMENTOS.pagamento_tipo_id
	,controle_compra_venda.PAGAMENTOS.data_pgto
	,controle_compra_venda.PAGAMENTOS.valor_pago
	,controle_compra_venda.PAGAMENTOS.usuario_id
	,controle_compra_venda.PAGAMENTOS.ativo
	,table1.nome AS usuario
	,table2.nome AS pagamento_tipo
FROM controle_compra_venda.PAGAMENTOS
LEFT JOIN controle_compra_venda.USUARIOS AS table1 ON table1.id = controle_compra_venda.PAGAMENTOS.usuario_id
LEFT JOIN controle_compra_venda.PAGAMENTO_TIPOS AS table2 ON table2.id = controle_compra_venda.PAGAMENTOS.pagamento_tipo_id
LEFT JOIN controle_compra_venda.MOVIMENTOS ON controle_compra_venda.PAGAMENTOS.movimento_id = controle_compra_venda.MOVIMENTOS.id
WHERE controle_compra_venda.MOVIMENTOS.tipo = 'S'



q.Append(" (SELECT id, caixa_id, usuario_id, tipo, memorando, data_mov, ");
q.Append(" 	(SELECT quantia ");
q.Append(" 	FROM CONTROLE_COMPRA_VENDA.caixa_movimentos ");
q.Append(" 	WHERE ativo = '1' AND tipo = 'E' AND data_mov < '2021-08-08') - ");
q.Append(" 	COALESCE(( SELECT COALESCE(quantia, 0.0) as quantia ");
q.Append(" 	FROM CONTROLE_COMPRA_VENDA.caixa_movimentos ");
q.Append(" 	WHERE ativo = '1' AND tipo = 'S' AND data_mov < '2021-08-08'),0) as quantia ");
q.Append(" FROM CONTROLE_COMPRA_VENDA.caixa_movimentos ");
q.Append(" WHERE ativo = '1' ");
q.Append(" ORDER BY data_mov) ");
q.Append(" UNION ");
q.Append(" (SELECT id, caixa_id, usuario_id, tipo, memorando, data_mov, quantia ");
q.Append(" FROM CONTROLE_COMPRA_VENDA.caixa_movimentos ");
q.Append(" WHERE ativo = '1' AND data_mov > '2021-08-08' ");
q.Append(" ORDER BY data_mov); ");

