--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._prisma_migrations VALUES ('a3854c8b-5e86-4f51-b476-0584cfced154', 'fcb4dd5b06095481b8a40943bf33c4ae3fdcf58e429d20afc02c07e289c78c99', '2025-07-17 19:27:57.217914+00', '20250717190745_create_schema_database_init', NULL, NULL, '2025-07-17 19:27:57.186177+00', 1);
INSERT INTO public._prisma_migrations VALUES ('5b9476b3-bf1a-495c-a692-2339bf38383b', '3c713c580e57a40c73b4b2d7363883a5cfb213666159c7e9a9869986f5667e20', '2025-07-17 19:31:45.09938+00', '20250717193145_add_subfunction_relations', NULL, NULL, '2025-07-17 19:31:45.092339+00', 1);
INSERT INTO public._prisma_migrations VALUES ('daa94cc7-aff5-43d1-a5af-83ef338d0e94', '792d5004d303a9eaeb015bc200791802fc3518201ede49097a29a02f058bbd16', '2025-07-17 23:30:33.748869+00', '20250717233033_finalize_schema', NULL, NULL, '2025-07-17 23:30:33.736644+00', 1);
INSERT INTO public._prisma_migrations VALUES ('742f016d-97a1-4a56-9fa6-f583b2c2aa90', '2c19a3a6cd5fbebceb6f3753b853db69108089fdf1c81609fc00d3020210b5c2', '2025-07-18 00:18:09.436917+00', '20250718001809_final_schema', NULL, NULL, '2025-07-18 00:18:09.423056+00', 1);
INSERT INTO public._prisma_migrations VALUES ('e6141161-081a-4896-a34c-bb395faa3b37', '024ecbdace26ccef82287884fd5edd57f7fd8563da6b42a50ab2fd61e3a72233', '2025-07-18 22:19:27.705209+00', '20250718221927_add_rich_question_support', NULL, NULL, '2025-07-18 22:19:27.681196+00', 1);


--
-- Data for Name: bloom_taxonomies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bloom_taxonomies VALUES (1, 'Lembrar', '• Identificar • Associar • Citar • Complementar • Localizar • Combinar • Descrever • Numerar • Reproduzir • Registrar • Listar • Corresponder • Equivaler • Indicar • Representar • Nomear ');
INSERT INTO public.bloom_taxonomies VALUES (2, 'Entender', '• Ilustrar • Redefinir • Revisar • Traduzir • Destacar • Transpor • Desenhar • Ilustrar • Destacar • Detalhar • Demonstrar • Evidenciar • Agrupar • Associar • Categorizar • Escolher • Ordenar • Separar • Generalizar • Sintetizar • Enumerar • Redefinir • Representar • Antecipar • Deduzir • Concluir • Estimar • Prever • Ligar • Corresponder • Vincular • Conectar • Contrastar • Expor • Esclarecer • Elucidar • Explanar • Justificar • Argumentar • Fundamentar');
INSERT INTO public.bloom_taxonomies VALUES (3, 'Aplicar', '• Proceder • Fazer • Usar • Empregar • Solucionar • Resolver • Prover • Padronizar');
INSERT INTO public.bloom_taxonomies VALUES (4, 'Analisar', '• Distinguir • Decompor • Selecionar • Discernir • Discriminar • Focalizar • Estruturar • Integrar • Esboçar • Esquematizar • Conceituar • Reestruturar • Tencionar • Revelar • Diligenciar • Averiguar • Integrar');
INSERT INTO public.bloom_taxonomies VALUES (5, 'Avaliar', '• Testar • Detectar • Monitorar • Coordenar • Julgar • Posicionar • Defender • Deliberar • Examinar • Apreciar');
INSERT INTO public.bloom_taxonomies VALUES (6, 'Criar', '• Conjecturar • Hipotetizar • Pressupor • Supor • Delinear • Programar • Projetar • Traçar • Construir • Idealizar • Inventar • Moldar • Arquitetar');


--
-- Data for Name: capabilities_saep; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.capabilities_saep VALUES (2, 'C1 - Utilizar aplicações e sistema operacional no desenvolvimento de documentação de sistemas web.', 3, 'BASICA');
INSERT INTO public.capabilities_saep VALUES (3, 'C2 - Compreender fundamentos de eletroeletrônica aplicada no desenvolvimento de sistemas', 2, 'BASICA');
INSERT INTO public.capabilities_saep VALUES (4, 'C3 - Aplicar lógica de programação na resolução de problemas computacionais.', 3, 'BASICA');
INSERT INTO public.capabilities_saep VALUES (5, 'C4 - Utilizar técnicas de modelagem e linguagem na manipulação de banco de dados.', 3, 'TECNICA');
INSERT INTO public.capabilities_saep VALUES (6, 'C5 - Selecionar recursos e linguagem de programação para integração IoT', 4, 'TECNICA');
INSERT INTO public.capabilities_saep VALUES (7, 'C6 - Estruturar aplicativos e sistemas por meio de técnicas de modelagem.', 4, 'TECNICA');
INSERT INTO public.capabilities_saep VALUES (8, 'C7 - Desenvolver aplicações e sistemas por meio de linguagem de programação.', 6, 'TECNICA');
INSERT INTO public.capabilities_saep VALUES (9, 'C8 - Selecionar procedimentos de teste que assegurem a aderência aos requisitos.', 4, 'TECNICA');


--
-- Data for Name: functions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.functions VALUES (1, 'Programar sistemas computacionais, atendendo normas e padrão de qualidade, usabilidade, robustez, integridade e segurança.');
INSERT INTO public.functions VALUES (2, 'Desenvolver sistemas computacionais, atendendo normas e padrão de qualidade, usabilidade, robustez, integridade e segurança.');


--
-- Data for Name: sub_functions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sub_functions VALUES (1, 'Realizar interação com banco de dados', 1);
INSERT INTO public.sub_functions VALUES (2, 'Codificar programas', 1);
INSERT INTO public.sub_functions VALUES (3, 'Desenvolver sistemas com tecnologia IOT', 1);
INSERT INTO public.sub_functions VALUES (4, 'Testar sistemas', 2);
INSERT INTO public.sub_functions VALUES (5, 'Implantar sistemas', 2);
INSERT INTO public.sub_functions VALUES (6, 'Manter sistemas', 2);
INSERT INTO public.sub_functions VALUES (7, 'Codificar sistemas', 2);
INSERT INTO public.sub_functions VALUES (8, 'Modelar sistemas', 2);


--
-- Data for Name: performance_standards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.performance_standards VALUES (1, 'Considerando características e funcionalidades do banco de dados', 1);
INSERT INTO public.performance_standards VALUES (2, 'Seguindo procedimento de modelagem de dados', 1);
INSERT INTO public.performance_standards VALUES (3, 'Seguindo procedimentos de normalização e padronização de dados', 1);
INSERT INTO public.performance_standards VALUES (4, 'Seguindo procedimentos de preparação de ambiente (SGBD)', 1);
INSERT INTO public.performance_standards VALUES (5, 'Utilizando linguagem de definição e manipulação de dados de acordo com as especificações técnicas', 1);
INSERT INTO public.performance_standards VALUES (6, 'Seguindo procedimentos de preparação de ambiente (IDE), em conformidade com as especificações técnicas', 2);
INSERT INTO public.performance_standards VALUES (7, 'Utilizando linguagens de programação (lógica de programação)', 2);
INSERT INTO public.performance_standards VALUES (8, 'Adotando técnicas e métodos de programação (boas práticas, depuração, documentação de código)', 2);
INSERT INTO public.performance_standards VALUES (9, 'Aplicando testes unitários de acordo com as especificações técnicas', 2);
INSERT INTO public.performance_standards VALUES (10, 'Utilizando linguagens de programação', 2);
INSERT INTO public.performance_standards VALUES (11, 'Considerando especificações técnicas da tecnologia IOT para integração de dispositivos de comunicação de dados', 3);
INSERT INTO public.performance_standards VALUES (12, 'Considerando especificações técnicas da tecnologia IOT para sensoriamento e parametrização de robôs', 3);
INSERT INTO public.performance_standards VALUES (13, 'Considerando especificações técnicas da tecnologia IOT para coleta de dados em plantas industriais', 3);
INSERT INTO public.performance_standards VALUES (14, 'Considerando plano de execução de teste (roteiro, modelo/tipo e funcionalidade, ferramenta)', 4);
INSERT INTO public.performance_standards VALUES (15, 'Aplicando métodos, normas e procedimentos de teste para correção e implementação', 4);
INSERT INTO public.performance_standards VALUES (16, 'Documentando testes em conformidade com as especificações técnicas', 4);
INSERT INTO public.performance_standards VALUES (17, 'Considerando plano de implantação do sistema (cronograma de instalação e operação)', 5);
INSERT INTO public.performance_standards VALUES (18, 'Seguindo procedimentos de implantação (compatibilidade, instalação, migração de dados)', 5);
INSERT INTO public.performance_standards VALUES (19, 'Estabelecendo configuração e parametrização do sistema de acordo com as especificações do sistema', 5);
INSERT INTO public.performance_standards VALUES (20, 'Validando implantação do sistema de acordo com as especificações do sistema (ambiente de produção)', 5);
INSERT INTO public.performance_standards VALUES (21, 'Seguindo procedimentos de treinamento ao cliente/usuário', 5);
INSERT INTO public.performance_standards VALUES (22, 'Documentando procedimento técnico de implantação', 5);
INSERT INTO public.performance_standards VALUES (23, 'Seguindo procedimentos de prestação de suporte técnico de acordo com as especificações técnicas (documentação e classificação de falhas)', 6);
INSERT INTO public.performance_standards VALUES (24, 'Considerando as demandas de manutenção (tipo, procedimento, registro)', 6);
INSERT INTO public.performance_standards VALUES (25, 'Adotando métodos e processos de manutenção e atualização do sistema de acordo com as falhas documentadas', 6);
INSERT INTO public.performance_standards VALUES (26, 'Considerando análise de requisitos conforme regra de negócio', 7);
INSERT INTO public.performance_standards VALUES (27, 'Considerando arquitetura de sistemas em conformidade com requisitos de qualidade, integridade, usabilidade e segurança da informação', 7);
INSERT INTO public.performance_standards VALUES (28, 'Seguindo metodologia de desenvolvimento', 7);
INSERT INTO public.performance_standards VALUES (29, 'Adotando técnicas e métodos de desenvolvimento (boas práticas, padrões de desenvolvimento, depuração, documentação de sistemas, versionamento, repositório, rastreabilidade)', 7);
INSERT INTO public.performance_standards VALUES (30, 'Utilizando linguagens de programação', 7);
INSERT INTO public.performance_standards VALUES (31, 'Considerando requisitos funcionais e não funcionais na modelagem de sistemas', 8);
INSERT INTO public.performance_standards VALUES (32, 'Considerando especificações técnicas da linguagem de modelagem unificada na modelagem de sistemas', 8);
INSERT INTO public.performance_standards VALUES (33, 'Considerando necessidades de conectividade e interoperabilidade na modelagem de sistemas', 8);


--
-- Data for Name: question_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: alternatives; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courses VALUES (1, 'Técnico em Desenvolvimento de Sistemas');


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.modules VALUES (1, 'BÁSICO');
INSERT INTO public.modules VALUES (2, 'INTRODUTÓRIO');
INSERT INTO public.modules VALUES (3, 'ESPECÍFICO I');
INSERT INTO public.modules VALUES (4, 'ESPECÍFICO II');


--
-- Data for Name: ucs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ucs VALUES (1, 'Introdução a Qualidade e Produtividade', 1, 1);
INSERT INTO public.ucs VALUES (2, 'Saúde e Segurança no Trabalho', 1, 1);
INSERT INTO public.ucs VALUES (3, 'Introdução a Indústria 4.0', 1, 1);
INSERT INTO public.ucs VALUES (4, 'Introdução ao Desenvolvimento de Projetos', 1, 1);
INSERT INTO public.ucs VALUES (5, 'Introdução à Tecnologia da Informação e Comunicação', 1, 1);
INSERT INTO public.ucs VALUES (6, 'Sustentabilidade nos processos industriais', 1, 1);
INSERT INTO public.ucs VALUES (7, 'Fundamentos de Eletroeletrônica Aplicada', 1, 2);
INSERT INTO public.ucs VALUES (8, 'Lógica de Programação', 1, 2);
INSERT INTO public.ucs VALUES (9, 'Banco de Dados', 1, 3);
INSERT INTO public.ucs VALUES (10, 'Programação de Aplicativos', 1, 3);
INSERT INTO public.ucs VALUES (11, 'Internet das Coisas', 1, 3);
INSERT INTO public.ucs VALUES (12, 'Desenvolvimento de Sistemas', 1, 4);
INSERT INTO public.ucs VALUES (13, 'Manutenção de Sistemas', 1, 4);
INSERT INTO public.ucs VALUES (14, 'Modelagem de Sistemas', 1, 4);
INSERT INTO public.ucs VALUES (15, 'Implantação de Sistemas', 1, 4);
INSERT INTO public.ucs VALUES (16, 'Teste de Sistemas', 1, 4);


--
-- Data for Name: capabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.capabilities VALUES (1, 'Aplicar lógica de programação para resolução dos problemas', 3, 8, 4, 'BASICA');


--
-- Data for Name: capabilities_sub_functions_performance_standard; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: knowledge; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.knowledge VALUES (1, 'Expressões lógicas e aritméticas', 'Em programação, expressões são construções formadas por valores (constantes ou variáveis) e operadores que, quando avaliadas, produzem um resultado — um valor numérico, lógico ou mesmo um conjunto. Expressões Aritméticas, Expressões Lógicas.');
INSERT INTO public.knowledge VALUES (2, ' Pseudocódigo', 'Em programação, pseudocódigo é uma forma de descrever algoritmos usando uma sintaxe livre, intermediária entre a linguagem natural e a linguagem de programação. Seu objetivo principal é permitir que você:  Planeje a lógica antes de escrever código de fato, focando no “o quê” e não no “como” técnico.  Comunique ideias de forma clara, independente de linguagens específicas ou ferramentas.  Facilite a revisão e o entendimento por colegas ou iniciantes, pois usa termos próximos ao português (ou ao idioma de ensino).');


--
-- Data for Name: capability_knowledge; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.capability_knowledge VALUES (1, 1);
INSERT INTO public.capability_knowledge VALUES (1, 2);


--
-- Data for Name: capability_saep_functions_sub_functions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.capability_saep_functions_sub_functions VALUES (2, 2, 5);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (2, 2, 6);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (3, 1, 3);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (4, 1, 2);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (4, 2, 7);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (5, 1, 1);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (5, 2, 5);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (6, 1, 2);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (6, 1, 3);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (7, 2, 5);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (7, 2, 8);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (8, 2, 5);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (8, 2, 7);
INSERT INTO public.capability_saep_functions_sub_functions VALUES (9, 2, 4);


--
-- Data for Name: capability_saep_uc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.capability_saep_uc VALUES (2, 5);
INSERT INTO public.capability_saep_uc VALUES (3, 7);
INSERT INTO public.capability_saep_uc VALUES (4, 8);
INSERT INTO public.capability_saep_uc VALUES (5, 9);
INSERT INTO public.capability_saep_uc VALUES (6, 11);
INSERT INTO public.capability_saep_uc VALUES (7, 14);
INSERT INTO public.capability_saep_uc VALUES (8, 12);
INSERT INTO public.capability_saep_uc VALUES (8, 10);
INSERT INTO public.capability_saep_uc VALUES (9, 16);


--
-- Data for Name: question_knowledge; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: alternatives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alternatives_id_seq', 1, false);


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, false);


--
-- Name: bloom_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bloom_taxonomies_id_seq', 6, true);


--
-- Name: capabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capabilities_id_seq', 1, true);


--
-- Name: capabilities_saep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capabilities_saep_id_seq', 9, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, true);


--
-- Name: functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.functions_id_seq', 2, true);


--
-- Name: knowledge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knowledge_id_seq', 2, true);


--
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modules_id_seq', 4, true);


--
-- Name: performance_standards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.performance_standards_id_seq', 33, true);


--
-- Name: question_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_items_id_seq', 1, false);


--
-- Name: sub_functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_functions_id_seq', 8, true);


--
-- Name: ucs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ucs_id_seq', 16, true);


--
-- PostgreSQL database dump complete
--

