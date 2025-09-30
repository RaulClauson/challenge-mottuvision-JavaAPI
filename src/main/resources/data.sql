-- Inserir usuário fixo
INSERT INTO usuario (id, usuario, senha) VALUES (usuario_seq.NEXTVAL, 'admin', 'senha123');

-- Inserir zonas
INSERT INTO zona (id, nome, letra) VALUES (zona_seq.NEXTVAL, 'Zona Norte', 'N');
INSERT INTO zona (id, nome, letra) VALUES (zona_seq.NEXTVAL, 'Zona Sul', 'S');
INSERT INTO zona (id, nome, letra) VALUES (zona_seq.NEXTVAL, 'Zona Leste', 'L');
INSERT INTO zona (id, nome, letra) VALUES (zona_seq.NEXTVAL, 'Zona Oeste', 'O');

-- Inserir pátios
INSERT INTO patio (id, nome) VALUES (patio_seq.NEXTVAL, 'Pátio 1');
INSERT INTO patio (id, nome) VALUES (patio_seq.NEXTVAL, 'Pátio 2');
INSERT INTO patio (id, nome) VALUES (patio_seq.NEXTVAL, 'Pátio 3');

-- Inserir grupos de status
INSERT INTO status_grupo (id, nome) VALUES (status_grupo_seq.NEXTVAL, 'Manutenção');
INSERT INTO status_grupo (id, nome) VALUES (status_grupo_seq.NEXTVAL, 'Aguardando');
INSERT INTO status_grupo (id, nome) VALUES (status_grupo_seq.NEXTVAL, 'Indisponível');
INSERT INTO status_grupo (id, nome) VALUES (status_grupo_seq.NEXTVAL, 'Pronta');

-- Inserir status específicos
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Específicos', (SELECT id FROM status_grupo WHERE nome = 'Manutenção'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Segurança', (SELECT id FROM status_grupo WHERE nome = 'Manutenção'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Corretiva', (SELECT id FROM status_grupo WHERE nome = 'Manutenção'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Preventiva', (SELECT id FROM status_grupo WHERE nome = 'Manutenção'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Peças', (SELECT id FROM status_grupo WHERE nome = 'Aguardando'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Limpeza', (SELECT id FROM status_grupo WHERE nome = 'Aguardando'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Inspeção', (SELECT id FROM status_grupo WHERE nome = 'Aguardando'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Aprovação', (SELECT id FROM status_grupo WHERE nome = 'Aguardando'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Documentação', (SELECT id FROM status_grupo WHERE nome = 'Indisponível'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Bloqueada', (SELECT id FROM status_grupo WHERE nome = 'Indisponível'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Furtada', (SELECT id FROM status_grupo WHERE nome = 'Indisponível'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Irreparável', (SELECT id FROM status_grupo WHERE nome = 'Indisponível'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Pronta', (SELECT id FROM status_grupo WHERE nome = 'Pronta'));
INSERT INTO status (id, nome, status_grupo_id) VALUES (status_seq.NEXTVAL, 'Reservada', (SELECT id FROM status_grupo WHERE nome = 'Pronta'));

-- Inserir modelos
INSERT INTO modelo (id, nome) VALUES (modelo_seq.NEXTVAL, 'SPORT-ESD');
INSERT INTO modelo (id, nome) VALUES (modelo_seq.NEXTVAL, 'SPORT');
INSERT INTO modelo (id, nome) VALUES (modelo_seq.NEXTVAL, 'MOTTU-E');
INSERT INTO modelo (id, nome) VALUES (modelo_seq.NEXTVAL, 'POP');

-- Inserir identificadores e motos
-- Moto 1
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'BRA2E19');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-06-15 09:30:00', TIMESTAMP '2025-10-05 17:00:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Pronta'));

-- Moto 2
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'ABC1D23');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-07-22 14:15:00', TIMESTAMP '2025-10-02 16:30:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Específicos'));

-- Moto 3
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'CHASSI', '9BWZZZ377VT004251');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-05-03 11:45:00', TIMESTAMP '2025-10-08 14:00:00', 
        (SELECT id FROM modelo WHERE nome = 'MOTTU-E'), 
        (SELECT id FROM zona WHERE nome = 'Zona Leste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Corretiva'));

-- Moto 4
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'DEF4G56');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-08-10 16:20:00', NULL, 
        (SELECT id FROM modelo WHERE nome = 'POP'), 
        (SELECT id FROM zona WHERE nome = 'Zona Oeste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Peças'));

-- Moto 5
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'QRCODE', '550e8400-e29b-41d4-a716-446655440001');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-04-18 08:00:00', TIMESTAMP '2025-10-01 10:00:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Limpeza'));

-- Moto 6
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'GHI-7890');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-09-12 13:40:00', TIMESTAMP '2025-10-06 12:00:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Inspeção'));

-- Moto 7
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'CHASSI', '9BWHE21JX24060831');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-06-28 10:15:00', TIMESTAMP '2025-10-10 09:00:00', 
        (SELECT id FROM modelo WHERE nome = 'MOTTU-E'), 
        (SELECT id FROM zona WHERE nome = 'Zona Leste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Documentação'));

-- Moto 8
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'JKL0M12');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-03-25 15:50:00', NULL, 
        (SELECT id FROM modelo WHERE nome = 'POP'), 
        (SELECT id FROM zona WHERE nome = 'Zona Oeste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Bloqueada'));

-- Moto 9
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'MNO3P45');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-09-20 12:30:00', TIMESTAMP '2025-10-03 15:30:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Reservada'));

-- Moto 10
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'QRCODE', '6ba7b810-9dad-11d1-80b4-00c04fd430c8');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-07-05 09:15:00', TIMESTAMP '2025-10-07 11:00:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Segurança'));

-- Moto 11
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'PQR6S78');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-08-17 14:25:00', TIMESTAMP '2025-10-04 13:15:00', 
        (SELECT id FROM modelo WHERE nome = 'MOTTU-E'), 
        (SELECT id FROM zona WHERE nome = 'Zona Leste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Preventiva'));

-- Moto 12
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'CHASSI', '9C2JB1EB0LR123456');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-05-12 11:10:00', NULL, 
        (SELECT id FROM modelo WHERE nome = 'POP'), 
        (SELECT id FROM zona WHERE nome = 'Zona Oeste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Aprovação'));

-- Moto 13
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'STU-9012');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-09-25 10:00:00', TIMESTAMP '2025-10-09 16:45:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Pronta'));

-- Moto 14
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'QRCODE', '6ba7b811-9dad-11d1-80b4-00c04fd430c8');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-06-02 16:45:00', TIMESTAMP '2025-10-11 08:30:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Específicos'));

-- Moto 15
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'WXY2Z34');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-07-30 08:20:00', TIMESTAMP '2025-10-05 14:20:00', 
        (SELECT id FROM modelo WHERE nome = 'MOTTU-E'), 
        (SELECT id FROM zona WHERE nome = 'Zona Leste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Corretiva'));

-- Moto 16
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'CHASSI', '9C6KE1110NR789012');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-04-07 13:35:00', NULL, 
        (SELECT id FROM modelo WHERE nome = 'POP'), 
        (SELECT id FROM zona WHERE nome = 'Zona Oeste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Peças'));

-- Moto 17
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'BCD-5678');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-09-18 15:10:00', TIMESTAMP '2025-10-12 10:15:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Limpeza'));

-- Moto 18
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'QRCODE', '6ba7b812-9dad-11d1-80b4-00c04fd430c8');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-08-25 11:55:00', TIMESTAMP '2025-10-06 13:00:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Inspeção'));

-- Moto 19
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'FGH8I90');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-05-20 09:40:00', TIMESTAMP '2025-10-13 15:45:00', 
        (SELECT id FROM modelo WHERE nome = 'MOTTU-E'), 
        (SELECT id FROM zona WHERE nome = 'Zona Leste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Documentação'));

-- Moto 20
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'CHASSI', '9C2JB1FB0MR345678');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-02-14 14:30:00', NULL, 
        (SELECT id FROM modelo WHERE nome = 'POP'), 
        (SELECT id FROM zona WHERE nome = 'Zona Oeste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Irreparável'));

-- Moto 21
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'JKL-1234');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-09-22 17:20:00', TIMESTAMP '2025-10-07 09:30:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Reservada'));

-- Moto 22
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'QRCODE', '6ba7b813-9dad-11d1-80b4-00c04fd430c8');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-06-11 12:45:00', TIMESTAMP '2025-10-14 11:15:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Segurança'));

-- Moto 23
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'NOP4Q56');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-07-14 16:00:00', TIMESTAMP '2025-10-08 16:00:00', 
        (SELECT id FROM modelo WHERE nome = 'MOTTU-E'), 
        (SELECT id FROM zona WHERE nome = 'Zona Leste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Preventiva'));

-- Moto 24
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'CHASSI', '9C6KE1210PR901234');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-04-29 10:25:00', NULL, 
        (SELECT id FROM modelo WHERE nome = 'POP'), 
        (SELECT id FROM zona WHERE nome = 'Zona Oeste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Aprovação'));

-- Moto 25
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'RST-7890');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-09-26 14:50:00', TIMESTAMP '2025-10-15 12:30:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Pronta'));

-- Moto 26
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'QRCODE', '6ba7b814-9dad-11d1-80b4-00c04fd430c8');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-08-03 08:15:00', TIMESTAMP '2025-10-09 14:45:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Específicos'));

-- Moto 27
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'VWX0Y12');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-06-08 11:30:00', TIMESTAMP '2025-10-10 10:20:00', 
        (SELECT id FROM modelo WHERE nome = 'MOTTU-E'), 
        (SELECT id FROM zona WHERE nome = 'Zona Leste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Corretiva'));

-- Moto 28
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'CHASSI', '9C2JB1GB0QR567890');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-01-22 13:20:00', NULL, 
        (SELECT id FROM modelo WHERE nome = 'POP'), 
        (SELECT id FROM zona WHERE nome = 'Zona Oeste'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 3'), 
        (SELECT id FROM status WHERE nome = 'Furtada'));

-- Moto 29
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'PLACA', 'ZAB-3456');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-09-15 09:05:00', TIMESTAMP '2025-10-16 13:50:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT-ESD'), 
        (SELECT id FROM zona WHERE nome = 'Zona Norte'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 1'), 
        (SELECT id FROM status WHERE nome = 'Limpeza'));

-- Moto 30
INSERT INTO identificador (id, tipo, valor) VALUES (identificador_seq.NEXTVAL, 'QRCODE', '6ba7b815-9dad-11d1-80b4-00c04fd430c8');
INSERT INTO moto (id, identificador_id, data_entrada, previsao_entrega, modelo_id, zona_id, patio_id, status_id) 
VALUES (moto_seq.NEXTVAL, identificador_seq.CURRVAL, TIMESTAMP '2025-08-08 17:30:00', TIMESTAMP '2025-10-11 15:30:00', 
        (SELECT id FROM modelo WHERE nome = 'SPORT'), 
        (SELECT id FROM zona WHERE nome = 'Zona Sul'), 
        (SELECT id FROM patio WHERE nome = 'Pátio 2'), 
        (SELECT id FROM status WHERE nome = 'Inspeção'));

-- Inserir fotos para algumas motos (tabela moto_foto)
INSERT INTO moto_foto (moto_id, url) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'BRA2E19')), 'https://exemplo.com/moto1_foto1.jpg');
INSERT INTO moto_foto (moto_id, url) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'BRA2E19')), 'https://exemplo.com/moto1_foto2.jpg');
INSERT INTO moto_foto (moto_id, url) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'ABC1D23')), 'https://exemplo.com/moto2_foto1.jpg');
INSERT INTO moto_foto (moto_id, url) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'DEF4G56')), 'https://exemplo.com/moto4_foto1.jpg');
INSERT INTO moto_foto (moto_id, url) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'DEF4G56')), 'https://exemplo.com/moto4_foto2.jpg');
INSERT INTO moto_foto (moto_id, url) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'DEF4G56')), 'https://exemplo.com/moto4_foto3.jpg');

-- Inserir observações para algumas motos (tabela moto_observacao)
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'BRA2E19')), 'Moto chegou em excelente estado');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'ABC1D23')), 'Necessária manutenção no freio dianteiro');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = '9BWZZZ377VT004251')), 'Verificar sistema elétrico');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'DEF4G56')), 'Aguardando chegada de peças para reparo');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'DEF4G56')), 'Cliente solicitou revisão completa');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'GHI-7890')), 'Pronta para inspeção final');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = 'JKL0M12')), 'Moto com documentação pendente');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = '9C6KE1110NR789012')), 'Aguardando aprovação do orçamento');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = '9C2JB1FB0MR345678')), 'Avaria grave no motor - irreparável');
INSERT INTO moto_observacao (moto_id, texto) VALUES ((SELECT id FROM moto WHERE identificador_id = (SELECT id FROM identificador WHERE valor = '9C2JB1GB0QR567890')), 'Caso registrado na polícia');