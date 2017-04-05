-- MySQL dump 10.16  Distrib 10.1.9-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: bdprovatudo
-- ------------------------------------------------------
-- Server version	10.1.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bdprovatudo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bdprovatudo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bdprovatudo`;

--
-- Temporary table structure for view `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!50001 DROP VIEW IF EXISTS `acl`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `acl` (
  `id_perfil` tinyint NOT NULL,
  `nm_resource` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `nm_action` varchar(200) DEFAULT NULL COMMENT '{"label":"Ação"}',
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'index'),(6,'cadastro'),(7,'gravar'),(8,'excluir'),(9,'upload'),(14,'dados-pessoais'),(15,'atualizar-dados'),(17,'gravar-atualizacao'),(27,'enviar-id'),(30,'ativar-id'),(35,'negar-id'),(36,'alterar-senha'),(37,'salvar-redefinicao-senha'),(51,'index-pagination'),(52,'cadastroperiodoletivodetalhe'),(53,'detalhe-pagination'),(54,'adicionarperiodoletivodetalhe'),(55,'excluirvialistagemperiodoletivo'),(57,'listar-permissoes-acoes'),(58,'relacionar-materia'),(59,'excluir-relacao-materia-semestre'),(60,'cadastro-alternativas'),(61,'gravar-alternativas'),(62,'gerar-pdf-quantitativo-questoes-por-assunto'),(63,'gerar-relatorio-pdf'),(64,'cadastro-questao'),(65,'adicionar-questao-aleatoria'),(66,'gravar-questao-aleatoria'),(67,'imprimir-prova-pdf'),(68,'cadastro-via-prova'),(69,'imprimir-gabarito-pdf'),(70,'desativar'),(71,'adicionar-questao-manual'),(72,'adicionar-varias-questoes-aleatorias'),(73,'detalhes-filtros-pagination'),(74,'gravar-varias-questoes-aleatorias'),(75,'gravar-adicionar-varias-questoes-aleatorias'),(76,'gravar-questao-manual'),(77,'remover-questao-prova-ajax'),(78,'carregar-combo-materias-ajax'),(79,'relatorio-usuarios'),(80,'gravar-via-prova'),(81,'cadastro-alternativas-via-prova'),(82,'gravar-alternativas-via-prova'),(83,'carregar-combo-assunto-materia-ajax'),(84,'gerar-pdf-materia-semestre'),(85,'detalhar-questoes-pagination'),(86,'adicionar-questao-prova-manual'),(87,'adicionar-questao-prova-aleatoria');
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternativa_questao`
--

DROP TABLE IF EXISTS `alternativa_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternativa_questao` (
  `id_alternativa_questao` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_usuario_alteracao` int(11) DEFAULT NULL,
  `id_questao` bigint(20) DEFAULT NULL,
  `tx_alternativa_questao` text,
  `cs_correta` char(1) DEFAULT NULL,
  `tx_justificativa` text,
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tx_caminho_imagem_alternativa` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_alternativa_questao`),
  KEY `FK_Reference_58` (`id_usuario_cadastro`),
  KEY `FK_Reference_59` (`id_usuario_alteracao`),
  KEY `FK_Reference_60` (`id_questao`),
  CONSTRAINT `FK_Reference_58` FOREIGN KEY (`id_usuario_cadastro`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_Reference_59` FOREIGN KEY (`id_usuario_alteracao`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_Reference_60` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativa_questao`
--

LOCK TABLES `alternativa_questao` WRITE;
/*!40000 ALTER TABLE `alternativa_questao` DISABLE KEYS */;
INSERT INTO `alternativa_questao` VALUES (1,1,1,24,'Garantia dos direitos à comunicação, à apresentação de alegações finais, à produção de provas e à interposição de recursos, nos processos de que possam resultar sanções e nas situações de litígio.','E','...','2016-12-01 02:48:18','2016-12-01 02:48:18',NULL),(2,1,1,24,'Divulgação oficial dos atos administrativos, ressalvadas as hipóteses de sigilo previstas na Constituição.','E','...','2016-12-01 02:48:18','2016-12-01 02:48:18',NULL),(3,1,1,24,'Adequação entre meios e fins, permitida a imposição de obrigações, restrições e sanções em medida superior àquelas necessárias ao atendimento do interesse público.','C','Certinho...','2016-12-01 02:48:18','2016-12-01 02:48:18',NULL),(4,1,1,24,'Atendimento a fins de interesse geral, vedada a renúncia total ou parcial de poderes ou competências, salvo autorização em lei.','E','...','2016-12-01 02:48:18','2016-12-01 02:48:18',NULL),(5,1,1,24,'Atendimento a fins de desinteresse geral, vedada a renúncia total ou parcial de poderes ou competências, salvo autorização em lei.','E','...','2016-12-01 02:48:18','2016-12-01 02:48:18',NULL),(6,1,1,25,'Frustrar a licitude de concurso público.','C','... Cabra bom de chute!','2016-12-01 03:01:35','2016-12-01 03:01:35',NULL),(7,1,1,25,'Frustrar a licitude de processo licitatório ou de processo seletivo para celebração de parcerias com entidades sem fins lucrativos, ou dispensá-los indevidamente.','E','.,,','2016-12-01 03:01:35','2016-12-01 03:01:35',NULL),(8,1,1,25,'Conceder benefício administrativo ou fiscal sem a observância das formalidades legais ou regulamentares aplicáveis à espécie.','E','....','2016-12-01 03:01:35','2016-12-01 03:01:35',NULL),(9,1,1,25,'Permitir, facilitar ou concorrer para que terceiro se enriqueça ilicitamente.','E','....','2016-12-01 03:01:35','2016-12-01 03:01:35',NULL),(10,1,1,25,'Frustrar a ilicitude de concurso público.','E','...','2016-12-01 03:01:35','2016-12-01 03:01:35',NULL);
/*!40000 ALTER TABLE `alternativa_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assunto_materia`
--

DROP TABLE IF EXISTS `assunto_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assunto_materia` (
  `id_assunto_materia` int(11) NOT NULL AUTO_INCREMENT,
  `id_materia` smallint(6) DEFAULT NULL,
  `nm_assunto_materia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_assunto_materia`),
  KEY `FK_Reference_45` (`id_materia`),
  CONSTRAINT `FK_Reference_45` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunto_materia`
--

LOCK TABLES `assunto_materia` WRITE;
/*!40000 ALTER TABLE `assunto_materia` DISABLE KEYS */;
INSERT INTO `assunto_materia` VALUES (1,1,'Noções Gerais de Direito Administrativo'),(2,1,'Organização Administrativa'),(3,1,'Regime Constitucional de Agente Público'),(4,2,'Noções de Direito Processual'),(5,2,'Principios Informativos do Direito Processual'),(6,2,'Principios Informativos do Procedimento'),(7,3,'Assnunto 1 do Penal'),(8,5,'Assunto Penal II'),(9,6,'Direito de Ir e Vir');
/*!40000 ALTER TABLE `assunto_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!50001 DROP VIEW IF EXISTS `auth`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `auth` (
  `id_usuario` tinyint NOT NULL,
  `id_perfil` tinyint NOT NULL,
  `em_email` tinyint NOT NULL,
  `pw_senha` tinyint NOT NULL,
  `nm_usuario` tinyint NOT NULL,
  `id_contrato` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `classificacao_semestre`
--

DROP TABLE IF EXISTS `classificacao_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificacao_semestre` (
  `id_classificacao_semestre` smallint(6) NOT NULL AUTO_INCREMENT,
  `nm_classificacao_semestre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_classificacao_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_semestre`
--

LOCK TABLES `classificacao_semestre` WRITE;
/*!40000 ALTER TABLE `classificacao_semestre` DISABLE KEYS */;
INSERT INTO `classificacao_semestre` VALUES (1,'1º Semestre'),(2,'2º Semestre'),(3,'3º Semestre'),(4,'4º Semestre'),(5,'5º Semestre'),(6,'6º Semestre'),(7,'7º Semestre'),(8,'8º Semestre'),(9,'9º Semestre'),(10,'10º Semestre'),(11,'Pós-Graduação'),(12,'Mestrado'),(13,'Doutorado'),(14,'PHD');
/*!40000 ALTER TABLE `classificacao_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `idconfigs` int(11) NOT NULL AUTO_INCREMENT,
  `nm_config` varchar(200) DEFAULT NULL COMMENT '{"label":"Nome da Configuração"}',
  `nm_valor` varchar(200) DEFAULT NULL COMMENT '{"label":"Valor"}',
  PRIMARY KEY (`idconfigs`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'valor_por','99.00'),(2,'valor_de','119.00'),(3,'agencia','0643'),(4,'op','013'),(5,'conta_corrente','782.632-8'),(6,'favorecido','Alysson Vicuña de Oliveira'),(7,'situacao_pagamento_pendente','1'),(8,'situacao_pagamento_atraso','3'),(9,'situacao_pagamento_pago','2'),(10,'situacao_ativo','1'),(11,'situacao_inativo','2'),(12,'tipo_pagamento_mensalidade','1'),(13,'tipo_usuario_administrador','1'),(14,'tipo_usuario_aluno','2'),(15,'situacao_usuario_ativo','1'),(16,'situacao_usuario_inativo','2'),(17,'situacao_usuario_congelado','3'),(19,'perfil_administrador','1'),(20,'perfil_aluno','3'),(21,'qtd_niveis','3'),(22,'qtd_por_nivel','5'),(23,'tipo_telefone_residencial','1'),(24,'tipo_telefone_comercial','2'),(25,'tipo_telefone_celular','3'),(26,'telefone_admin','6191123250'),(27,'email_admin','alyssontkd@gmail.com'),(28,'nome_admin','Alysson Vicuña de Oliveira'),(29,'telefone_cel_admin','61991123250'),(30,'tipo_pagamento_bonus','2'),(32,'tipo_pagamento_saque','3'),(33,'limite_minimo_saque','300'),(34,'situacao_usuario_atrasado','4'),(35,'situacao_empresa_contrato_ativo','1'),(36,'situacao_empresa_contrato_inativo','2'),(37,'situacao_empresa_contrato_congelado','3'),(38,'situacao_empresa_contrato_regusado','4'),(39,'situacao_solicitacao_empresa_recusado','3'),(40,'situacao_solicitacao_empresa_aprovado','2'),(41,'situacao_solicitacao_empresa_pendente','1'),(42,'codigo_video_apresentacao','UsSSUglRMAw'),(43,'link_conferencia','login.hotconference.net.br/conference'),(44,'cnpj','08.988.564/0001-30'),(45,'razao_social','MC DE SA LIMA EPP'),(46,'endereco','SIA TR 05 LT 05 35 SL 211 ED. IMPORT CENTER GUARA DISTRITO FEDERAL'),(47,'exibir_no_combo','S'),(48,'nao_exibir_no_combo','N'),(49,'masculino','1'),(50,'feminino','2'),(51,'perfil_professor','2');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controller`
--

DROP TABLE IF EXISTS `controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controller` (
  `id_controller` int(11) NOT NULL AUTO_INCREMENT,
  `nm_controller` varchar(400) DEFAULT NULL COMMENT '{"label":"Controller"}',
  `nm_modulo` varchar(50) DEFAULT NULL,
  `cs_exibir_combo` char(1) DEFAULT 'S',
  PRIMARY KEY (`id_controller`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller`
--

LOCK TABLES `controller` WRITE;
/*!40000 ALTER TABLE `controller` DISABLE KEYS */;
INSERT INTO `controller` VALUES (3,'usuario-usuario','Usuario','S'),(4,'application-index','Aplicação','N'),(9,'PhpBoletoZf2\\Controller\\Itau','Boleto do Itau','N'),(11,'principal-principal','Principal','S'),(12,'perfil-perfil','Perfil','S'),(23,'periodo_letivo-periodoletivo','Periodo Letivo','S'),(24,'detalhe_periodo_letivo','Detalhe Periodo Letivo','S'),(25,'controller-controller','Controller','S'),(26,'action-action','Actions','S'),(27,'teste-teste','Modulo teste','S'),(28,'prova-prova','Prova','S'),(29,'nivel_dificuldade-niveldificuldade','Nível de Dificuldade','S'),(30,'unidade_tempo-unidadetempo','Unidade de Tempo','S'),(31,'temporizacao-temporizacao','Temporização','S'),(32,'permissao-permissao','Gerenciador de Permissão','S'),(33,'tipo-questao_tipoquestao','Tipo de Questao','S'),(34,'assunto-materia_assuntomateria','Assunto Materia','S'),(35,'infra-infra','Infraestrutura','S'),(36,'fonte-fonte','Fonte da Questão','S'),(37,'classificacao-classificacao','Classificação de Semestre','S'),(38,'materia-materia','Matéria da Questão','N'),(39,'assunto_materia-assuntomateria','Assunto de Cada Matéria','S'),(40,'tipo_questao-tipoquestao','Tipo de Questão','S'),(41,'materia_semestre-materiasemestre','Matérias por Semestre','S'),(42,'questao-questao','Questao','S'),(43,'relatorio-relatorio','Relatorios','S'),(44,'questoes_prova-questoesprova','Questoes Prova','S'),(45,'filtro_prova-filtroprova','Filtros da prova','S');
/*!40000 ALTER TABLE `controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `em_email` varchar(200) DEFAULT NULL COMMENT '{"label":"E-mail"}',
  `id_situacao` int(11) NOT NULL,
  PRIMARY KEY (`id_email`),
  KEY `FK_Reference_32` (`id_situacao`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`id_situacao`) REFERENCES `situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'administrador@gmail.com',1),(2,'alyssontkd@gmail.com',1),(3,'teste001@gmail.com',1),(4,'teste002@gmail.com',1);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esqueci_senha`
--

DROP TABLE IF EXISTS `esqueci_senha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esqueci_senha` (
  `id_esqueci_senha` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `tx_identificacao` varchar(60) DEFAULT NULL,
  `id_situacao` int(11) DEFAULT NULL,
  `dt_solicitacao` datetime DEFAULT NULL,
  `dt_alteracao` datetime NOT NULL,
  PRIMARY KEY (`id_esqueci_senha`),
  KEY `fk_esqueci_senha_situacoes1` (`id_situacao`),
  KEY `fk_esqueci_senha_usuarios1` (`id_usuario`),
  CONSTRAINT `fk_esqueci_senha_situacoes1` FOREIGN KEY (`id_situacao`) REFERENCES `situacao` (`id_situacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_esqueci_senha_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esqueci_senha`
--

LOCK TABLES `esqueci_senha` WRITE;
/*!40000 ALTER TABLE `esqueci_senha` DISABLE KEYS */;
INSERT INTO `esqueci_senha` VALUES (1,3,'9cbf6bab3c6b428fafd6ebd7965df386',1,'2015-07-25 09:35:13','0000-00-00 00:00:00'),(2,4,'1e4bf63079dd38bff6fd2bcc65bcca4f',1,'2015-07-25 09:57:15','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `esqueci_senha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtro_prova`
--

DROP TABLE IF EXISTS `filtro_prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtro_prova` (
  `id_filtro_prova` int(11) NOT NULL AUTO_INCREMENT,
  `id_prova` bigint(20) DEFAULT NULL,
  `id_tipo_questao` smallint(6) DEFAULT NULL,
  `id_fonte_questao` smallint(6) DEFAULT NULL,
  `id_assunto_materia` int(11) DEFAULT NULL,
  `id_nivel_dificuldade` tinyint(4) DEFAULT NULL,
  `id_classificacao_semestre` smallint(6) DEFAULT NULL,
  `nr_questoes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_filtro_prova`),
  KEY `FK_Reference_119` (`id_prova`),
  KEY `FK_Reference_120` (`id_tipo_questao`),
  KEY `FK_Reference_121` (`id_fonte_questao`),
  KEY `FK_Reference_122` (`id_assunto_materia`),
  KEY `FK_Reference_123` (`id_nivel_dificuldade`),
  KEY `FK_Reference_124` (`id_classificacao_semestre`),
  CONSTRAINT `FK_Reference_119` FOREIGN KEY (`id_prova`) REFERENCES `prova` (`id_prova`),
  CONSTRAINT `FK_Reference_120` FOREIGN KEY (`id_tipo_questao`) REFERENCES `tipo_questao` (`id_tipo_questao`),
  CONSTRAINT `FK_Reference_121` FOREIGN KEY (`id_fonte_questao`) REFERENCES `fonte_questao` (`id_fonte_questao`),
  CONSTRAINT `FK_Reference_122` FOREIGN KEY (`id_assunto_materia`) REFERENCES `assunto_materia` (`id_assunto_materia`),
  CONSTRAINT `FK_Reference_123` FOREIGN KEY (`id_nivel_dificuldade`) REFERENCES `nivel_dificuldade` (`id_nivel_dificuldade`),
  CONSTRAINT `FK_Reference_124` FOREIGN KEY (`id_classificacao_semestre`) REFERENCES `classificacao_semestre` (`id_classificacao_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtro_prova`
--

LOCK TABLES `filtro_prova` WRITE;
/*!40000 ALTER TABLE `filtro_prova` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtro_prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fonte_questao`
--

DROP TABLE IF EXISTS `fonte_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fonte_questao` (
  `id_fonte_questao` smallint(6) NOT NULL AUTO_INCREMENT,
  `nm_fonte_questao` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_fonte_questao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fonte_questao`
--

LOCK TABLES `fonte_questao` WRITE;
/*!40000 ALTER TABLE `fonte_questao` DISABLE KEYS */;
INSERT INTO `fonte_questao` VALUES (1,'Projeção'),(2,'Universia'),(3,'CESPE'),(4,'Wikipedia');
/*!40000 ALTER TABLE `fonte_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_alternativas_questao`
--

DROP TABLE IF EXISTS `historico_alternativas_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_alternativas_questao` (
  `id_historico_alternativa_questao` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_historico_questao_prova` bigint(20) DEFAULT NULL,
  `id_alternativa_questao` bigint(20) DEFAULT NULL,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_usuario_alteracao` int(11) DEFAULT NULL,
  `id_questao` bigint(20) DEFAULT NULL,
  `tx_alternativa_questao` text,
  `tx_caminho_imagem_alternativa` varchar(1000) DEFAULT NULL,
  `cs_correta` char(1) DEFAULT NULL,
  `tx_justificativa` text,
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historico_alternativa_questao`),
  KEY `FK_Reference_63` (`id_historico_questao_prova`),
  CONSTRAINT `FK_Reference_63` FOREIGN KEY (`id_historico_questao_prova`) REFERENCES `historico_questoes_prova` (`id_historico_questao_prova`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_alternativas_questao`
--

LOCK TABLES `historico_alternativas_questao` WRITE;
/*!40000 ALTER TABLE `historico_alternativas_questao` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_alternativas_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_prova`
--

DROP TABLE IF EXISTS `historico_prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_prova` (
  `id_prova_historico` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_prova` bigint(20) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nm_prova` varchar(100) DEFAULT NULL,
  `ds_prova` text,
  `dt_aplicacao_prova` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dt_geracao_prova` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_prova_historico`),
  KEY `FK_Reference_61` (`id_usuario`),
  CONSTRAINT `FK_Reference_61` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_prova`
--

LOCK TABLES `historico_prova` WRITE;
/*!40000 ALTER TABLE `historico_prova` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_questoes_prova`
--

DROP TABLE IF EXISTS `historico_questoes_prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_questoes_prova` (
  `id_historico_questao_prova` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_prova_historico` bigint(20) DEFAULT NULL,
  `id_questao_prova` bigint(20) DEFAULT NULL,
  `id_questao` bigint(20) DEFAULT NULL,
  `id_prova` bigint(20) DEFAULT NULL,
  `tx_enunciado` text,
  `tx_caminho_imagem_questao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_historico_questao_prova`),
  KEY `FK_Reference_62` (`id_prova_historico`),
  CONSTRAINT `FK_Reference_62` FOREIGN KEY (`id_prova_historico`) REFERENCES `historico_prova` (`id_prova_historico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_questoes_prova`
--

LOCK TABLES `historico_questoes_prova` WRITE;
/*!40000 ALTER TABLE `historico_questoes_prova` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_questoes_prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id_Login` int(11) NOT NULL AUTO_INCREMENT,
  `pw_senha` varchar(40) DEFAULT NULL COMMENT '{"label":"Senha"}',
  `nr_tentativas` int(11) DEFAULT NULL COMMENT '{"label":"Tentativas"}',
  `dt_visita` datetime DEFAULT NULL COMMENT '{"label":"Data da última visita"}',
  `dt_registro` datetime DEFAULT NULL COMMENT '{"label":"Data de Registro"}',
  `id_usuario` int(11) NOT NULL,
  `id_email` int(11) NOT NULL,
  `id_situacao` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id_Login`),
  KEY `ix_Login_emails` (`id_email`),
  KEY `FK_Reference_26` (`id_perfil`),
  KEY `FK_Reference_39` (`id_usuario`),
  KEY `fk_Login_situacao` (`id_situacao`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_Login_emails` FOREIGN KEY (`id_email`) REFERENCES `email` (`id_email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Login_situacao` FOREIGN KEY (`id_situacao`) REFERENCES `situacao` (`id_situacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'e10adc3949ba59abbe56e057f20f883e',1,'2014-08-27 21:53:33','2014-08-27 21:53:37',1,1,1,1),(2,'d04cbb637213179e1f8269f75d5d7cfc',NULL,NULL,'2015-01-30 15:01:11',2,2,1,2),(3,'d04cbb637213179e1f8269f75d5d7cfc',NULL,NULL,'2015-02-20 17:02:55',3,3,1,2),(4,'d04cbb637213179e1f8269f75d5d7cfc',NULL,NULL,'2015-02-20 17:02:57',4,4,1,2);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `id_materia` smallint(6) NOT NULL AUTO_INCREMENT,
  `nm_materia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Direito Administrativo'),(2,'Direito Processual'),(3,'Direito Penal'),(4,'Direito Processual Penal'),(5,'Direito Penal II'),(6,'Direito Processual II');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_semestre`
--

DROP TABLE IF EXISTS `materia_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia_semestre` (
  `id_materia_semestre` int(11) NOT NULL AUTO_INCREMENT,
  `id_classificacao_semestre` smallint(6) DEFAULT NULL,
  `id_materia` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_materia_semestre`),
  KEY `FK_Reference_117` (`id_classificacao_semestre`),
  KEY `FK_Reference_118` (`id_materia`),
  CONSTRAINT `FK_Reference_117` FOREIGN KEY (`id_classificacao_semestre`) REFERENCES `classificacao_semestre` (`id_classificacao_semestre`),
  CONSTRAINT `FK_Reference_118` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_semestre`
--

LOCK TABLES `materia_semestre` WRITE;
/*!40000 ALTER TABLE `materia_semestre` DISABLE KEYS */;
INSERT INTO `materia_semestre` VALUES (6,1,1),(10,1,2),(12,1,3),(16,1,4),(18,2,5),(19,2,6);
/*!40000 ALTER TABLE `materia_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_dificuldade`
--

DROP TABLE IF EXISTS `nivel_dificuldade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_dificuldade` (
  `id_nivel_dificuldade` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nm_nivel_dificuldade` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_nivel_dificuldade`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_dificuldade`
--

LOCK TABLES `nivel_dificuldade` WRITE;
/*!40000 ALTER TABLE `nivel_dificuldade` DISABLE KEYS */;
INSERT INTO `nivel_dificuldade` VALUES (1,'Não informado'),(2,'Fácil'),(3,'Muito fácil'),(4,'Intermediário'),(5,'Difícil'),(6,'Muito dificil'),(7,'Nível Ninja');
/*!40000 ALTER TABLE `nivel_dificuldade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT COMMENT '{"label":"Id Perfil"}',
  `nm_perfil` varchar(100) NOT NULL COMMENT '{''label'':"Perfil"}',
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador'),(2,'Professor'),(3,'Auxiliar');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_controller_action`
--

DROP TABLE IF EXISTS `perfil_controller_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_controller_action` (
  `id_perfil_controller_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_controller` int(11) NOT NULL,
  `id_action` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id_perfil_controller_action`),
  KEY `ix_perfil_controller_action_controller` (`id_controller`),
  KEY `ix_perfil_controller_action_action` (`id_action`),
  KEY `ix_perfil_controller_action_perfil` (`id_perfil`),
  CONSTRAINT `fk_perfil_controller_action_action` FOREIGN KEY (`id_action`) REFERENCES `action` (`id_action`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_controller_action_controller` FOREIGN KEY (`id_controller`) REFERENCES `controller` (`id_controller`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_controller_action_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=673 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_controller_action`
--

LOCK TABLES `perfil_controller_action` WRITE;
/*!40000 ALTER TABLE `perfil_controller_action` DISABLE KEYS */;
INSERT INTO `perfil_controller_action` VALUES (4,4,1,1),(33,4,1,2),(87,9,1,1),(88,9,1,2),(93,11,1,1),(167,23,1,1),(168,23,6,1),(169,23,7,1),(170,23,8,1),(171,23,51,1),(172,23,52,1),(173,23,53,1),(174,23,54,1),(175,24,55,1),(176,25,1,1),(177,25,6,1),(178,25,7,1),(179,25,8,1),(180,25,51,1),(181,26,1,1),(182,26,6,1),(183,26,7,1),(184,26,8,1),(185,26,51,1),(191,29,1,1),(192,29,6,1),(193,29,7,1),(194,29,8,1),(195,29,51,1),(196,30,1,1),(197,30,6,1),(198,30,7,1),(199,30,8,1),(200,30,51,1),(201,31,1,1),(202,31,6,1),(203,31,7,1),(204,31,8,1),(205,31,51,1),(206,32,1,1),(207,32,6,1),(208,32,7,1),(209,32,8,1),(210,32,51,1),(211,33,1,1),(212,33,6,1),(213,33,7,1),(214,33,8,1),(215,33,51,1),(216,33,1,1),(217,33,6,1),(218,33,7,1),(219,33,8,1),(220,33,51,1),(221,25,57,1),(222,32,57,1),(244,35,1,1),(245,36,1,1),(246,36,6,1),(247,36,7,1),(248,36,8,1),(249,36,51,1),(250,37,1,1),(251,37,6,1),(252,37,7,1),(253,37,8,1),(254,37,51,1),(255,38,1,1),(256,38,6,1),(257,38,7,1),(258,38,8,1),(259,38,51,1),(260,39,1,1),(261,39,6,1),(262,39,7,1),(263,39,8,1),(264,39,51,1),(265,40,1,1),(266,40,6,1),(267,40,7,1),(268,40,8,1),(269,40,51,1),(288,41,1,1),(289,41,6,1),(290,41,7,1),(291,41,8,1),(292,41,51,1),(293,41,53,1),(294,41,58,1),(295,41,59,1),(296,11,1,2),(297,11,1,3),(315,12,1,1),(316,12,6,1),(317,12,7,1),(318,12,8,1),(469,45,1,1),(470,45,6,1),(471,45,7,1),(472,45,8,1),(473,45,51,1),(474,45,1,2),(475,45,6,2),(476,45,7,2),(477,45,8,2),(478,45,9,2),(479,45,51,2),(499,28,65,2),(500,28,66,2),(501,28,67,2),(502,28,68,2),(503,28,69,2),(504,28,71,2),(505,28,72,2),(506,28,73,2),(507,28,74,2),(508,28,75,2),(509,28,76,2),(510,28,77,2),(511,28,78,2),(512,3,1,2),(513,3,7,2),(514,3,14,2),(515,3,15,2),(516,3,17,2),(517,3,36,2),(518,3,37,2),(519,3,79,2),(520,3,1,1),(521,3,6,1),(522,3,7,1),(523,3,14,1),(524,3,15,1),(525,3,17,1),(527,3,36,1),(528,3,37,1),(529,3,51,1),(530,3,70,1),(531,3,79,1),(571,28,65,1),(572,28,71,1),(573,28,72,1),(574,28,6,1),(575,28,64,1),(576,28,83,1),(577,28,78,1),(578,28,73,1),(579,28,8,1),(580,28,63,1),(581,28,7,1),(582,28,75,1),(583,28,66,1),(584,28,76,1),(585,28,74,1),(586,28,69,1),(587,28,67,1),(588,28,1,1),(589,28,51,1),(590,28,77,1),(593,43,84,1),(594,43,62,1),(595,43,63,1),(596,43,69,1),(597,43,67,1),(598,43,79,1),(617,42,81,2),(618,42,83,2),(619,42,78,2),(620,42,82,2),(621,42,80,2),(622,42,77,2),(623,42,6,1),(624,42,60,1),(625,42,81,1),(626,42,68,1),(627,42,83,1),(628,42,78,1),(629,42,8,1),(630,42,7,1),(631,42,61,1),(632,42,82,1),(633,42,80,1),(634,42,1,1),(635,42,51,1),(636,42,9,1),(657,44,65,1),(658,44,71,1),(659,44,87,1),(660,44,86,1),(661,44,72,1),(662,44,6,1),(663,44,85,1),(664,44,8,1),(665,44,7,1),(666,44,1,1),(667,44,51,1),(668,44,65,2),(669,44,71,2),(670,44,87,2),(671,44,86,2),(672,44,72,2);
/*!40000 ALTER TABLE `perfil_controller_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prova`
--

DROP TABLE IF EXISTS `prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prova` (
  `id_prova` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `nm_prova` varchar(100) DEFAULT NULL,
  `ds_prova` text,
  `dt_aplicacao_prova` timestamp NULL DEFAULT NULL,
  `dt_geracao_prova` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_prova`),
  KEY `FK_Reference_47` (`id_usuario`),
  CONSTRAINT `FK_Reference_47` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prova`
--

LOCK TABLES `prova` WRITE;
/*!40000 ALTER TABLE `prova` DISABLE KEYS */;
INSERT INTO `prova` VALUES (17,1,'Primeira Prova do Semestre',NULL,'2016-12-31 02:00:00','2016-12-01 02:50:19');
/*!40000 ALTER TABLE `prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questao`
--

DROP TABLE IF EXISTS `questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questao` (
  `id_questao` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_usuario_alteracao` int(11) DEFAULT NULL,
  `id_classificacao_semestre` smallint(6) DEFAULT NULL,
  `id_nivel_dificuldade` tinyint(4) DEFAULT NULL,
  `id_temporizacao` smallint(6) DEFAULT NULL,
  `id_tipo_questao` smallint(6) DEFAULT NULL,
  `id_fonte_questao` smallint(6) DEFAULT NULL,
  `id_assunto_materia` int(11) DEFAULT NULL,
  `bo_utilizavel` char(1) DEFAULT 'S',
  `nm_titulo_questao` varchar(200) DEFAULT NULL,
  `tx_enunciado` text,
  `bo_ativo` char(1) DEFAULT NULL,
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tx_caminho_imagem_questao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_questao`),
  KEY `FK_Reference_48` (`id_usuario_cadastro`),
  KEY `FK_Reference_49` (`id_usuario_alteracao`),
  KEY `FK_Reference_50` (`id_classificacao_semestre`),
  KEY `FK_Reference_51` (`id_nivel_dificuldade`),
  KEY `FK_Reference_52` (`id_temporizacao`),
  KEY `FK_Reference_53` (`id_tipo_questao`),
  KEY `FK_Reference_54` (`id_fonte_questao`),
  KEY `FK_Reference_55` (`id_assunto_materia`),
  CONSTRAINT `FK_Reference_48` FOREIGN KEY (`id_usuario_cadastro`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_Reference_49` FOREIGN KEY (`id_usuario_alteracao`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_Reference_50` FOREIGN KEY (`id_classificacao_semestre`) REFERENCES `classificacao_semestre` (`id_classificacao_semestre`),
  CONSTRAINT `FK_Reference_51` FOREIGN KEY (`id_nivel_dificuldade`) REFERENCES `nivel_dificuldade` (`id_nivel_dificuldade`),
  CONSTRAINT `FK_Reference_52` FOREIGN KEY (`id_temporizacao`) REFERENCES `temporizacao` (`id_temporizacao`),
  CONSTRAINT `FK_Reference_53` FOREIGN KEY (`id_tipo_questao`) REFERENCES `tipo_questao` (`id_tipo_questao`),
  CONSTRAINT `FK_Reference_54` FOREIGN KEY (`id_fonte_questao`) REFERENCES `fonte_questao` (`id_fonte_questao`),
  CONSTRAINT `FK_Reference_55` FOREIGN KEY (`id_assunto_materia`) REFERENCES `assunto_materia` (`id_assunto_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questao`
--

LOCK TABLES `questao` WRITE;
/*!40000 ALTER TABLE `questao` DISABLE KEYS */;
INSERT INTO `questao` VALUES (24,1,1,1,3,1,1,1,1,'S','Marque a alternativa correta','A Lei nº. 9.784, de 29 de janeiro de 1.999, regula o Processo Administrativo no âmbito da Administração Pública Federal. A Administração Pública obedecerá, dentre outros, aos princípios da legalidade, finalidade, motivação, razoabilidade, proporcionalidade, moralidade, ampla defesa, contraditório, segurança jurídica, interesse público e eficiência. Nesse contexto, assinale a alternativa que CONTRADIZ os critérios legais.',NULL,'2016-12-01 02:45:47','2016-12-01 02:45:47',NULL),(25,1,1,1,2,1,1,1,1,'S','Marque a alternativa correta','Constitui ato de improbidade administrativa que causa lesão ao erário qualquer ação ou omissão, dolosa ou culposa, que enseje perda patrimonial, desvio, apropriação, malbaratamento ou dilapidação dos bens ou haveres das entidades referidas no art. 1º da Lei 8.429 de 02 de junho de 1992.\r\nAssinale a alternativa que NÃO caracteriza ato de improbidade administrativa que prejudica o erário público.',NULL,'2016-12-01 02:59:33','2016-12-01 02:59:33',NULL);
/*!40000 ALTER TABLE `questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questoes_prova`
--

DROP TABLE IF EXISTS `questoes_prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questoes_prova` (
  `id_questao_prova` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_questao` bigint(20) DEFAULT NULL,
  `id_prova` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_questao_prova`),
  KEY `FK_Reference_56` (`id_questao`),
  KEY `FK_Reference_57` (`id_prova`),
  CONSTRAINT `FK_Reference_56` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`),
  CONSTRAINT `FK_Reference_57` FOREIGN KEY (`id_prova`) REFERENCES `prova` (`id_prova`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questoes_prova`
--

LOCK TABLES `questoes_prova` WRITE;
/*!40000 ALTER TABLE `questoes_prova` DISABLE KEYS */;
INSERT INTO `questoes_prova` VALUES (1,24,17);
/*!40000 ALTER TABLE `questoes_prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexo` (
  `id_sexo` int(11) NOT NULL AUTO_INCREMENT,
  `nm_sexo` varchar(45) NOT NULL COMMENT '{"label":"Sexo"}',
  PRIMARY KEY (`id_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino'),(2,'Feminino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacao`
--

DROP TABLE IF EXISTS `situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacao` (
  `id_situacao` int(11) NOT NULL AUTO_INCREMENT,
  `nm_situacao` varchar(100) DEFAULT NULL COMMENT '{"label":"Situação"}',
  PRIMARY KEY (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacao`
--

LOCK TABLES `situacao` WRITE;
/*!40000 ALTER TABLE `situacao` DISABLE KEYS */;
INSERT INTO `situacao` VALUES (1,'Ativo'),(2,'Inativo');
/*!40000 ALTER TABLE `situacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacao_usuario`
--

DROP TABLE IF EXISTS `situacao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacao_usuario` (
  `id_situacao_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nm_situacao_usuario` varchar(100) DEFAULT NULL COMMENT '{"label":"Situação usuário"}',
  PRIMARY KEY (`id_situacao_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacao_usuario`
--

LOCK TABLES `situacao_usuario` WRITE;
/*!40000 ALTER TABLE `situacao_usuario` DISABLE KEYS */;
INSERT INTO `situacao_usuario` VALUES (1,'Ativo'),(2,'Inativo'),(3,'Congelado'),(4,'Atrasado');
/*!40000 ALTER TABLE `situacao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `nr_ddd_telefone` varchar(3) DEFAULT NULL COMMENT '{"label":"ddd"}',
  `nr_telefone` varchar(20) DEFAULT NULL COMMENT '{"label":"Telefone"}',
  `id_tipo_telefone` int(11) NOT NULL,
  `id_situacao` int(11) NOT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `ix_telefones_situacao` (`id_situacao`),
  KEY `FK_Reference_24` (`id_tipo_telefone`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`id_tipo_telefone`) REFERENCES `tipo_telefone` (`id_tipo_telefone`),
  CONSTRAINT `fk_telefones_situacao` FOREIGN KEY (`id_situacao`) REFERENCES `situacao` (`id_situacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'12','34567890',1,1),(2,'61','91613193',1,1),(3,'61','91613193',1,1),(4,'61','989898989',1,1),(5,'56','576756756',1,1),(6,'87','878778787',1,1),(7,'78','787878787',1,1),(8,'87','878787878',1,1),(9,'61','98745741',1,1);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporizacao`
--

DROP TABLE IF EXISTS `temporizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporizacao` (
  `id_temporizacao` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_unidade_tempo` smallint(6) DEFAULT NULL,
  `nm_temporizacao` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_temporizacao`),
  KEY `FK_Reference_46` (`id_unidade_tempo`),
  CONSTRAINT `FK_Reference_46` FOREIGN KEY (`id_unidade_tempo`) REFERENCES `unidade_tempo` (`id_unidade_tempo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporizacao`
--

LOCK TABLES `temporizacao` WRITE;
/*!40000 ALTER TABLE `temporizacao` DISABLE KEYS */;
INSERT INTO `temporizacao` VALUES (1,NULL,'5'),(2,NULL,'12'),(3,NULL,'2');
/*!40000 ALTER TABLE `temporizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_questao`
--

DROP TABLE IF EXISTS `tipo_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_questao` (
  `id_tipo_questao` smallint(6) NOT NULL AUTO_INCREMENT,
  `nm_tipo_questao` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_questao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_questao`
--

LOCK TABLES `tipo_questao` WRITE;
/*!40000 ALTER TABLE `tipo_questao` DISABLE KEYS */;
INSERT INTO `tipo_questao` VALUES (1,'Multipla Escolha');
/*!40000 ALTER TABLE `tipo_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_telefone` (
  `id_tipo_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `nm_tipo_telefone` varchar(100) DEFAULT NULL COMMENT '{"label":"Tipo telefone"}',
  PRIMARY KEY (`id_tipo_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefone`
--

LOCK TABLES `tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tipo_telefone` DISABLE KEYS */;
INSERT INTO `tipo_telefone` VALUES (1,'Residencial'),(2,'Comercial'),(3,'Celular');
/*!40000 ALTER TABLE `tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nm_tipo_usuario` varchar(100) DEFAULT NULL COMMENT '{"label":"Tipo usuário"}',
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Administrador'),(2,'Professor'),(3,'Auxiliar');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_tempo`
--

DROP TABLE IF EXISTS `unidade_tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_tempo` (
  `id_unidade_tempo` smallint(6) NOT NULL AUTO_INCREMENT,
  `nm_unidade_tempo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_unidade_tempo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_tempo`
--

LOCK TABLES `unidade_tempo` WRITE;
/*!40000 ALTER TABLE `unidade_tempo` DISABLE KEYS */;
INSERT INTO `unidade_tempo` VALUES (1,'Mes'),(2,'Semestre'),(3,'Ano'),(4,'Aplicaçao');
/*!40000 ALTER TABLE `unidade_tempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nm_usuario` varchar(250) NOT NULL COMMENT '{"label":"Usuário"}',
  `nm_funcao` varchar(200) DEFAULT NULL COMMENT '{"label":"Profissão"}',
  `id_sexo` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_situacao_usuario` int(11) NOT NULL,
  `id_email` int(11) DEFAULT NULL,
  `id_telefone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `ix_usuarios_sexo` (`id_sexo`),
  KEY `ix_usuarios_situacao_usuario` (`id_situacao_usuario`),
  KEY `ix_usuarios_emails` (`id_email`),
  KEY `ix_usuarios_telefones` (`id_telefone`),
  KEY `ix_usuarios_perfil` (`id_perfil`),
  CONSTRAINT `fk_usuarios_emails` FOREIGN KEY (`id_email`) REFERENCES `email` (`id_email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_sexo` FOREIGN KEY (`id_sexo`) REFERENCES `sexo` (`id_sexo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_situacao_usuario` FOREIGN KEY (`id_situacao_usuario`) REFERENCES `situacao_usuario` (`id_situacao_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_telefones` FOREIGN KEY (`id_telefone`) REFERENCES `telefone` (`id_telefone`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ix_usuarios_tipo_usuario` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Admin','Administrador',1,1,1,1,1),(2,'Alysson Vicuña de Oliveira','Professor',1,2,1,2,2),(3,'teste001',NULL,NULL,2,2,3,3),(4,'teste002',NULL,NULL,2,1,4,4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `bdprovatudo`
--

USE `bdprovatudo`;

--
-- Final view structure for view `acl`
--

/*!50001 DROP TABLE IF EXISTS `acl`*/;
/*!50001 DROP VIEW IF EXISTS `acl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `acl` AS (select `perfil_controller_action`.`id_perfil` AS `id_perfil`,concat(`controller`.`nm_controller`,'/',`action`.`nm_action`) AS `nm_resource` from ((`perfil_controller_action` join `controller` on((`controller`.`id_controller` = `perfil_controller_action`.`id_controller`))) join `action` on((`action`.`id_action` = `perfil_controller_action`.`id_action`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `auth`
--

/*!50001 DROP TABLE IF EXISTS `auth`*/;
/*!50001 DROP VIEW IF EXISTS `auth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `auth` AS (select `login`.`id_usuario` AS `id_usuario`,`perfil`.`id_perfil` AS `id_perfil`,`email`.`em_email` AS `em_email`,`login`.`pw_senha` AS `pw_senha`,`usuario`.`nm_usuario` AS `nm_usuario`,1 AS `id_contrato` from (((`usuario` join `login` on((`login`.`id_usuario` = `usuario`.`id_usuario`))) join `email` on((`email`.`id_email` = `login`.`id_email`))) join `perfil` on((`perfil`.`id_perfil` = `login`.`id_perfil`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-23 21:55:48
