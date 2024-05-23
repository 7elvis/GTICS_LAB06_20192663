-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gticsbd
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `medicamentos_id_medicamentos` int NOT NULL,
  `usuario_id_usuario` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`medicamentos_id_medicamentos`,`usuario_id_usuario`),
  UNIQUE KEY `UK_q8lo2h78xo3ciomn54ydfdbr3` (`usuario_id_usuario`),
  CONSTRAINT `FKcmm852n4dcylbu5mjbe2rbyu9` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKkl7cqfhxmpse32fcfn1lucw92` FOREIGN KEY (`medicamentos_id_medicamentos`) REFERENCES `medicamentos` (`id_medicamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `detalle_compra_id` int NOT NULL,
  `medicamentos_id_medicamentos` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `usuario_id_usuario` int NOT NULL,
  PRIMARY KEY (`detalle_compra_id`,`medicamentos_id_medicamentos`,`usuario_id_usuario`),
  KEY `fk_usuario_has_medicamentos_medicamentos1_idx` (`medicamentos_id_medicamentos`),
  KEY `fk_dettale_compra_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_dettale_compra_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario_has_medicamentos_medicamentos1` FOREIGN KEY (`medicamentos_id_medicamentos`) REFERENCES `medicamentos` (`id_medicamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `id_medicamentos` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(400) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `foto` blob,
  `inventario` int DEFAULT NULL,
  `precio_unidad` double DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `dosis` varchar(45) DEFAULT NULL,
  `borrado_logico` int DEFAULT NULL,
  PRIMARY KEY (`id_medicamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Antipirético ampliamente utilizado para aliviar el dolor leve a moderado y reducir la fiebre','Paracetamol Pendejo',NULL,0,13.99,NULL,NULL,'2',0),(2,'Analgésico y antiinflamatorio no esteroideo (AINE) comúnmente utilizado para aliviar el dolor, la inflamación y la fiebre.','Ibuprofeno',NULL,150,7.99,'2024-04-10','Antidiarreico','2',0),(3,'Antibiótico para infecciones bacterianas','Amoxicilina',NULL,100,8.99,'2024-04-09','Antiseptico','2',0),(4,'Antihistamínico para alergias y rinitis.','Loratadina',NULL,120,9.99,'2024-04-08','Antiseptico','2',0),(5,'Benzodiazepina para trastornos de ansiedad y epilepsia','Clonazepam Jaaaa',NULL,0,14.99,NULL,NULL,'2',0),(6,'Inhibidor de la bomba de protones para el reflujo y úlceras','Omeprazol',NULL,90,6.99,'2024-04-06','Antiseptico','2',0),(7,'Antiviral para la influenza y gripe','Oseltamivir',NULL,50,12.99,'2024-04-05','Antiseptico','2',0),(8,'Anticoagulante para prevenir coágulos sanguíneos.','Warfarina',NULL,0,5.99,NULL,NULL,'2',0),(9,'Antidepresivo para trastornos de ansiedad y depresión gaaaa','Sertralina',NULL,0,9.99,NULL,NULL,'2',0);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_paciente`
--

DROP TABLE IF EXISTS `pedidos_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_paciente` (
  `idpedidos_paciente` int NOT NULL,
  `medico_que_atiende` varchar(45) DEFAULT NULL,
  `seguro` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `distrito` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `hora_de_entrega` time DEFAULT NULL,
  `receta` blob,
  `costo_total` double DEFAULT NULL,
  `tipo_de_pedido` varchar(45) DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `validacion_del_pedido` varchar(45) DEFAULT NULL,
  `comentario` varchar(45) DEFAULT NULL,
  `fecha_validacion` date DEFAULT NULL,
  `estado_del_pedido` varchar(45) DEFAULT NULL,
  `numero_tracking` varchar(45) DEFAULT NULL,
  `carrito_usuario_id_usuario` int NOT NULL,
  `nombre_paciente` varchar(45) DEFAULT NULL,
  `apellido_paciente` varchar(45) DEFAULT NULL,
  `metodo_de_pago` varchar(45) DEFAULT NULL,
  `dettale_compra_detalle_compra_id` int NOT NULL,
  `dettale_compra_medicamentos_id_medicamentos` int NOT NULL,
  `dettale_compra_usuario_id_usuario` int NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpedidos_paciente`,`carrito_usuario_id_usuario`,`dettale_compra_detalle_compra_id`,`dettale_compra_medicamentos_id_medicamentos`,`dettale_compra_usuario_id_usuario`),
  KEY `fk_pedidos_paciente_dettale_compra1_idx` (`dettale_compra_detalle_compra_id`,`dettale_compra_medicamentos_id_medicamentos`,`dettale_compra_usuario_id_usuario`),
  CONSTRAINT `fk_pedidos_paciente_dettale_compra1` FOREIGN KEY (`dettale_compra_detalle_compra_id`, `dettale_compra_medicamentos_id_medicamentos`, `dettale_compra_usuario_id_usuario`) REFERENCES `detalle_compra` (`detalle_compra_id`, `medicamentos_id_medicamentos`, `usuario_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_paciente`
--

LOCK TABLES `pedidos_paciente` WRITE;
/*!40000 ALTER TABLE `pedidos_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_reposicion`
--

DROP TABLE IF EXISTS `pedidos_reposicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_reposicion` (
  `id_pedidos_reposicion` int NOT NULL,
  `usuario_id_usuario` int NOT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `costo_total` double DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `estado_de_reposicion` varchar(45) DEFAULT NULL,
  `proveedor_id_proveedor` int NOT NULL,
  PRIMARY KEY (`id_pedidos_reposicion`,`usuario_id_usuario`,`proveedor_id_proveedor`),
  KEY `fk_ventas_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_pedidos_reposicion_proveedor1_idx` (`proveedor_id_proveedor`),
  CONSTRAINT `fk_pedidos_reposicion_proveedor1` FOREIGN KEY (`proveedor_id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `fk_ventas_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_reposicion`
--

LOCK TABLES `pedidos_reposicion` WRITE;
/*!40000 ALTER TABLE `pedidos_reposicion` DISABLE KEYS */;
INSERT INTO `pedidos_reposicion` VALUES (1,1,'2024-04-08',490.99,'2024-05-01','Solicitado',1),(2,1,'2024-04-09',491.99,'2024-05-02','En Proceso',2),(3,1,'2024-04-10',492.99,'2024-05-03','Empaquetado',3),(4,8,'2024-04-11',493.99,'2024-05-04','En ruta',4),(5,8,'2024-04-12',494.99,'2024-05-05','Entregado',5),(6,8,'2024-04-13',495.99,'2024-05-06','Empaquetado',6),(7,14,'2024-04-14',496.99,'2024-05-07','En Proceso',7),(8,14,'2024-04-15',497.99,'2024-05-08','En ruta',8),(9,14,'2024-04-16',498.99,'2024-05-09','En ruta',9),(10,14,'2024-04-17',499.99,'2024-05-10','En Proceso',10),(11,14,'2024-04-18',500.99,'2024-05-11','Solicitado',11),(12,14,'2024-04-19',501.99,'2024-05-12','Solicitado',12);
/*!40000 ALTER TABLE `pedidos_reposicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_reposicion_has_medicamentos`
--

DROP TABLE IF EXISTS `pedidos_reposicion_has_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_reposicion_has_medicamentos` (
  `pedidos_reposicion_id_pedidos_reposicion` int NOT NULL,
  `pedidos_reposicion_usuario_id_usuario` int NOT NULL,
  `pedidos_reposicion_envios_id_envios` int NOT NULL,
  `medicamentos_id_medicamentos` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`pedidos_reposicion_id_pedidos_reposicion`,`pedidos_reposicion_usuario_id_usuario`,`pedidos_reposicion_envios_id_envios`,`medicamentos_id_medicamentos`),
  KEY `fk_pedidos_reposicion_has_medicamentos_medicamentos1_idx` (`medicamentos_id_medicamentos`),
  KEY `fk_pedidos_reposicion_has_medicamentos_pedidos_reposicion1_idx` (`pedidos_reposicion_id_pedidos_reposicion`,`pedidos_reposicion_usuario_id_usuario`,`pedidos_reposicion_envios_id_envios`),
  CONSTRAINT `fk_pedidos_reposicion_has_medicamentos_medicamentos1` FOREIGN KEY (`medicamentos_id_medicamentos`) REFERENCES `medicamentos` (`id_medicamentos`),
  CONSTRAINT `fk_pedidos_reposicion_has_medicamentos_pedidos_reposicion1` FOREIGN KEY (`pedidos_reposicion_id_pedidos_reposicion`, `pedidos_reposicion_usuario_id_usuario`) REFERENCES `pedidos_reposicion` (`id_pedidos_reposicion`, `usuario_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_reposicion_has_medicamentos`
--

LOCK TABLES `pedidos_reposicion_has_medicamentos` WRITE;
/*!40000 ALTER TABLE `pedidos_reposicion_has_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_reposicion_has_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'P1','P1'),(2,'P2','P1'),(3,'P3','P1'),(4,'P4','P1'),(5,'P5','P1'),(6,'P6','P1'),(7,'P7','P1'),(8,'P8','P1'),(9,'P9','P1'),(10,'P10','P1'),(11,'P11','P1'),(12,'P12','P1');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `usuario_id_usuario` int NOT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `fk_rol_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_rol_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `id_sede` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Sede 1',NULL),(2,'Sede 2',NULL),(3,'Sede 3',NULL),(4,'Sede 4',NULL),(5,'Sede 5',NULL),(6,'Sede 6',NULL),(7,'Sede 7',NULL),(8,'Sede 8',NULL),(9,'Sede 9',NULL),(10,'Sede 10',NULL);
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede_has_medicamentos`
--

DROP TABLE IF EXISTS `sede_has_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede_has_medicamentos` (
  `sede_id_sede` int NOT NULL,
  `medicamentos_id_medicamentos` int NOT NULL,
  PRIMARY KEY (`sede_id_sede`,`medicamentos_id_medicamentos`),
  KEY `fk_sede_has_medicamentos_medicamentos1_idx` (`medicamentos_id_medicamentos`),
  KEY `fk_sede_has_medicamentos_sede1_idx` (`sede_id_sede`),
  CONSTRAINT `fk_sede_has_medicamentos_medicamentos1` FOREIGN KEY (`medicamentos_id_medicamentos`) REFERENCES `medicamentos` (`id_medicamentos`),
  CONSTRAINT `fk_sede_has_medicamentos_sede1` FOREIGN KEY (`sede_id_sede`) REFERENCES `sede` (`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede_has_medicamentos`
--

LOCK TABLES `sede_has_medicamentos` WRITE;
/*!40000 ALTER TABLE `sede_has_medicamentos` DISABLE KEYS */;
INSERT INTO `sede_has_medicamentos` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(1,2),(2,2),(4,2),(1,3),(2,3),(3,3),(1,4),(2,4),(6,5),(7,5),(9,7),(8,8),(1,9),(5,9);
/*!40000 ALTER TABLE `sede_has_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `codigo_colegiatura` varchar(45) DEFAULT NULL,
  `distrito` varchar(45) DEFAULT NULL,
  `seguro` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) NOT NULL,
  `foto` blob,
  `telefono` varchar(45) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `estado_solicitud` varchar(45) DEFAULT NULL,
  `motivo_rechazo` varchar(250) DEFAULT NULL,
  `borrado_logico` int DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Perez','juan@example.com','1234567877','CC123','Miraflores','SIS','1','Administrador',_binary 'contraseña1',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'admin'),(2,'Leonardo Iturriaga','Lopez ','maria@example.com','4321987','CC2344','Lince','Privado','1','Doctor',_binary 'contraseña2',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'admin'),(3,'Carlos Ayala','Garcia Torres','carlos@example.haaa','3456789','CC345','Surquillo','SIS','1','Farmacista',_binary 'contraseña3',NULL,'2024-04-20','Aceptado','',0,NULL,NULL,NULL,'profesor'),(4,'Ana','Martinez Gomez','ana@example.hag','45678955','CC45678','San Borja','Privado','1','Farmacista',_binary 'contraseña4',NULL,'2024-04-21','Aceptado','',0,NULL,NULL,NULL,'profesor'),(5,'Pedro','Rodriguez','pedro@example.comag','67899','CC56799','Lince','SIS','1','Doctor',_binary 'contraseña5',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'profesor'),(6,'Laura','Gomez','laura@example.com','67890123','CC678','Barrancones','Privado','1','Farmacista',_binary 'contraseña6',NULL,'2024-04-22','Aceptado','',0,NULL,NULL,NULL,'profesor'),(7,'Diego','Hernandez','diego@example.com','78901234','CC789','Jesus Maria','SIS','1','Farmacista',_binary 'contraseña7',NULL,'2024-04-23','Rechazado',NULL,0,NULL,NULL,NULL,'profesor'),(8,'Sofia','Diaz','sofia@example.com','89012345','CC890','La Molina','Privado','1','Administrador',_binary 'contraseña8',NULL,'2024-04-29',NULL,NULL,0,NULL,NULL,NULL,'alumno'),(9,'Julia','Sanchez','julia@example.com','90123456','CC901','Magdalena','ESALUD','1','Paciente',_binary 'contraseña9',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'alumno'),(10,'Alejandro','Ramos','alejandro@example.com','123457','CC012','Chorrillos','Privado','1','Doctor',_binary 'contraseña10',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'alumno'),(11,'Elena','Fernandez Aliaga','elena@example.com','23456789','CC234','San Isidro','Privado','1','Paciente',_binary 'contraseña11',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'alumno'),(12,'Gabriel','Lopez','gabriel@example.com','34567890','CC3456','Oxamarca','SIS','1','Farmacista',_binary 'contraseña12',NULL,'2024-04-29','Rechazado','',0,NULL,NULL,NULL,'alumno'),(13,'Valeria','Martinez','valeria_gordito@example.com','123456','CC45645','Chorrillos','SIS','1','Doctor',_binary 'contraseña13',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'alumno'),(14,'Hector','Gomez','hector@example.com','5678','CC567','Atte','SIS','1','Administrador',_binary 'contraseña14',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'alumno'),(15,'Camila','Rodriguez','camila_pila@example.com','3','CC6','Chorrillos','SIS','1','Doctor',_binary 'contraseña15',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'alumno'),(16,'Martin','Hernandez','martin@example.com','78901234','CC789','Jesus Maria','SIS','1','Paciente',_binary 'contraseña16',NULL,'2024-04-29',NULL,NULL,0,NULL,NULL,NULL,'alumno'),(17,'Carla','Diaz','carla@example.com','89012345','CC890','La Molina XD','Privado','1','Farmacista',_binary 'contraseña17',NULL,'2024-04-29','Aceptado','',0,NULL,NULL,NULL,'alumno'),(18,'Diego','Sanchez','diego@example.com','90123456','CC901','Magdalena','SIS','1','Paciente',_binary 'contraseña18',NULL,'2024-04-29',NULL,NULL,0,NULL,NULL,NULL,'alumno'),(19,'Lucia','Ramos','lucia@example.com','12345670','CC012','Chorrillos','Privado','1','Doctor',_binary 'contraseña19',NULL,'2024-04-29',NULL,NULL,0,NULL,NULL,NULL,'alumno'),(21,'Natalia','Garcia','natalia@example.com','34567892','CC234','San Isidro','Privado','1','Doctor',_binary 'contraseña21',NULL,'2024-04-29','','',1,NULL,NULL,NULL,'alumno'),(22,'Alejandra','Lopez','alejandra@example.com','45678903','CC345','Surco','SIS','1','Paciente',_binary 'contraseña22',NULL,'2024-04-29',NULL,NULL,1,NULL,NULL,NULL,'alumno'),(26,'Isabella','Hernandez','isabella@example.com','89012347','CC789','Jesus Maria','SIS','1','Paciente',_binary 'contraseña26',NULL,'2024-04-29',NULL,NULL,1,NULL,NULL,NULL,'alumno'),(28,'Mayra Liliana','Aliaga Machuca','constanza@example.com','71584175','CC901','Celendin Oxamarca','SIS','1','Administrador',_binary 'contraseña28',NULL,'2024-04-29','','',0,NULL,NULL,NULL,'alumno');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_sede`
--

DROP TABLE IF EXISTS `usuario_has_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_sede` (
  `sede_id_sede` int NOT NULL,
  `usuario_id_usuario` int NOT NULL,
  PRIMARY KEY (`sede_id_sede`,`usuario_id_usuario`),
  KEY `FKk28keemyh62t8bgibpi15rcrl` (`usuario_id_usuario`),
  CONSTRAINT `FKdm44iv65cu73ij8bglqal7prt` FOREIGN KEY (`sede_id_sede`) REFERENCES `sede` (`id_sede`),
  CONSTRAINT `FKk28keemyh62t8bgibpi15rcrl` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_sede`
--

LOCK TABLES `usuario_has_sede` WRITE;
/*!40000 ALTER TABLE `usuario_has_sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_sede` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 20:26:35
