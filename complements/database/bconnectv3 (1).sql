-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 25-10-01 10:19
-- 서버 버전: 10.4.32-MariaDB
-- PHP 버전: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `bconnectv3`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `card` int(12) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user` varchar(50) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `uid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `administradores`
--

INSERT INTO `administradores` (`id`, `card`, `name`, `user`, `position`, `pass`, `uid`) VALUES
(51, 1316884582, 'Jairon', 'jairo032198@gmail.com', 'Administrador', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'A0000'),
(52, 1316884582, 'Jaime', 'jaime@gmail.com', 'Administrador', '2a097b21dfbe7d9b3356a0a4979c5d8f5d4bb47111a9a39656f00dab3d0ddd09', 'A00052'),
(53, 1723456789, 'Ana Gabriela Torres Mendoza', 'ana.torres@educativo.com', 'Rector', 'fcf7bb6d546cfb82d2e55486984ae7a1862a666acb441e0cf8b4ed34a4fcf9d7', 'R00053'),
(54, 912345678, 'Luis Fernando Castillo Rivas', 'luis.castillo@instituto.edu.ec', 'Docente', '58fe56c875defb7f4f7252d268e5262cc6ccaf2ff104a398491cbc84b5a12d62', 'D00054'),
(55, 1109876543, 'María José Almeida Viteri', 'mj.almeida@admin.org', 'Estudiante', '91ab6ef5cd3f0eb8d6255b8af0ddc7b69457cd080c4d2bc932a6315702e4d3b8', 'E00055'),
(56, 601122334, 'Diego Armando Paredes Cevallos', 'dparedes@colegioandino.edu.ec', 'Representante', '0c1b171c34144215cc0154c2c698bd0fe0c28da7b2b393d96dd859c291cfc5ec', 'R00056'),
(57, 1809988776, 'Karla Estefanía Zambrano Ortiz', 'karla.zambrano@admin.edu.ec', 'Representante', '441794c6249462ac3d6a61da9117b1f13e5e8242a86b788e09a9ba3fc4ffb835', 'R00057'),
(58, 205566778, 'José Miguel Andrade Salazar', 'jmandrade@educativo.org', 'Representatnte', 'e659542abd156dcba907edad047de5c4d81f2ffd1162467dd137683114bc8fd2', 'R00058');

-- --------------------------------------------------------

--
-- 테이블 구조 `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `ruc` varchar(15) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `contact` varchar(13) DEFAULT NULL,
  `renewal` varchar(1) DEFAULT NULL,
  `position` varchar(7) DEFAULT NULL,
  `uid` varchar(10) DEFAULT NULL,
  `id_compay` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `companies`
--

INSERT INTO `companies` (`id`, `ruc`, `Name`, `reason`, `mail`, `contact`, `renewal`, `position`, `uid`, `id_compay`) VALUES
(3, '1316884582', 'Universidad Estatal del Sur de Manabi', '2', 'jairo032198@gmail.com', '0939616273', '1', 'Empresa', 'E0003', 'E3UESM');

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesm`
--

CREATE TABLE `e3uesm` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Card` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `UID` varchar(11) DEFAULT NULL,
  `Recognitions` varchar(11) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `date` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_horario` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesm`
--

INSERT INTO `e3uesm` (`id`, `Name`, `Card`, `role`, `UID`, `Recognitions`, `pass`, `date`, `email`, `id_horario`) VALUES
(5, 'jairon', 1326884582, 1, 'E0004', '0005836368', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '21031198', '', '115'),
(6, 'cnpe', 1356884582, 1, 'E84527', '67', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-28', '', NULL),
(7, 'Maria', 1316884582, 3, 'A84526', '4', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-27', NULL, NULL),
(8, 'Luis Fernando Castillo Rivas', 912345678, 2, 'D45609', '7', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-10', NULL, NULL),
(9, 'Carlos AndrÃ©s Molina Jaramillo', 923456789, 2, 'D56731', NULL, '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-01', NULL, NULL),
(10, 'Carlos Eduardo Molina Jaramillo', 956789012, 3, 'A89018', '5', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-19', NULL, NULL),
(11, 'SofÃ­a Carolina VÃ©lez Mendoza', 967890123, 2, 'D90124', NULL, '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-25', NULL, NULL),
(12, 'prueba', 1250007, 1, 'E00120', '5678999', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-26', NULL, NULL),
(13, 'p2', 135447892, 2, 'D00130', NULL, '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-25', NULL, NULL),
(14, 'fgdjsfjdsfh', 135688475, 2, 'D00140', '1', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-13', NULL, NULL),
(15, 'pruebabconnect', 1205554111, 1, 'E00150', '0', '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '2025-09-29', NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesmaterias`
--

CREATE TABLE `e3uesmaterias` (
  `id_materia` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `creditos` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesmaterias`
--

INSERT INTO `e3uesmaterias` (`id_materia`, `nombre`, `codigo`, `nivel`, `creditos`, `estado`) VALUES
(1, 'Matematicas', '01012', 'Primaria', '2', 'Activa'),
(2, 'Ingles', '01013', 'Primaria', '0', 'Activa'),
(3, 'Biologia', '01013', 'Primaria', '0', 'Activa'),
(4, 'Estudios Sociales', '01013', 'Primaria', '0', 'Activa'),
(5, 'Fisica', '01013', 'Primaria', '0', 'Activa'),
(6, 'Quimica', '01013', 'Primaria', '0', 'Activa');

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesmaula`
--

CREATE TABLE `e3uesmaula` (
  `id_aula` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesmaula`
--

INSERT INTO `e3uesmaula` (`id_aula`, `nombre`, `tipo`, `ubicacion`, `estado`) VALUES
(7, 'Aula 101', 'Practica', 'Colegio', 'Disponible'),
(8, 'Aula 102', 'Practica', 'Colegio', 'Disponible'),
(9, 'Aula 103', 'Practica', 'colegio', 'Disponible'),
(10, 'Aula 104', 'Practica', 'colegio', 'Disponible'),
(11, 'Aula 105', 'Practica', 'colegio', 'Disponible');

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesmclases`
--

CREATE TABLE `e3uesmclases` (
  `id_clases` int(11) NOT NULL,
  `id_teacher` varchar(255) DEFAULT NULL,
  `id_aula` varchar(255) DEFAULT NULL,
  `id_materias` varchar(255) DEFAULT NULL,
  `Mingreso` varchar(255) DEFAULT NULL,
  `Msalida` varchar(255) DEFAULT NULL,
  `id_estudiante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesmclases`
--

INSERT INTO `e3uesmclases` (`id_clases`, `id_teacher`, `id_aula`, `id_materias`, `Mingreso`, `Msalida`, `id_estudiante`) VALUES
(1, '11', '1', '1', '18:18', '18:10', NULL),
(2, '9', '8', '2', '13:58', NULL, '0'),
(3, '13', '7', '1', '12:59', '16:59', '0'),
(4, '9', '8', '3', '16:06', '16:10', '0');

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesmhistory`
--

CREATE TABLE `e3uesmhistory` (
  `id` int(11) NOT NULL,
  `datehystory` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `Detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesmhistory`
--

INSERT INTO `e3uesmhistory` (`id`, `datehystory`, `User`, `Detail`) VALUES
(1, '27 9ì 2025, 14:03', '7', 'Registro nuevo Docente'),
(2, '27 9ì 2025, 14:14', '7', 'Registro nuevo Docente'),
(3, '27/09/2025 14:25', '7', 'Registro nuevo Administrativo'),
(4, '27/09/2025 15:20', '7', 'Registro nuevo Docente'),
(5, '27/09/2025 17:13', '7', 'Registro nuevo Estudiante'),
(6, '27/09/2025 17:16', '7', 'Registro nuevo Docente'),
(7, '29/09/2025 10:49', '7', 'Registro nuevo Docente'),
(8, '30/09/2025 14:46', '7', 'Registro nuevo Estudiante');

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesmhorario`
--

CREATE TABLE `e3uesmhorario` (
  `id` int(11) NOT NULL,
  `jornada` varchar(1) DEFAULT NULL,
  `lu` varchar(1) DEFAULT NULL,
  `ma` varchar(1) DEFAULT NULL,
  `mi` varchar(1) DEFAULT NULL,
  `ju` varchar(1) DEFAULT NULL,
  `vi` varchar(1) DEFAULT NULL,
  `sa` varchar(1) DEFAULT NULL,
  `do` varchar(1) DEFAULT NULL,
  `hentrada` varchar(255) DEFAULT NULL,
  `hsalida` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesmhorario`
--

INSERT INTO `e3uesmhorario` (`id`, `jornada`, `lu`, `ma`, `mi`, `ju`, `vi`, `sa`, `do`, `hentrada`, `hsalida`) VALUES
(115, 'm', '3', '3', '1', '3', '3', '3', '3', '17:10', '21:06');

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesmingreso`
--

CREATE TABLE `e3uesmingreso` (
  `id_ri` int(11) NOT NULL,
  `id_est` varchar(11) DEFAULT NULL,
  `id_h` varchar(11) DEFAULT NULL,
  `Ring` varchar(11) DEFAULT NULL,
  `Rfe` varchar(255) DEFAULT NULL,
  `representante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesmingreso`
--

INSERT INTO `e3uesmingreso` (`id_ri`, `id_est`, `id_h`, `Ring`, `Rfe`, `representante`) VALUES
(1, '5', '1', '11:28', '28/09/2025', NULL),
(2, '5', '1', '11:28', '28/09/2025', 'marlon'),
(3, '5', NULL, NULL, NULL, NULL),
(4, '5', NULL, NULL, NULL, NULL),
(5, '5', NULL, NULL, NULL, NULL),
(6, '5', '1', NULL, NULL, NULL),
(7, '5', '115', NULL, NULL, NULL),
(8, '5', '115', '01:09', '01/10/2025 ', NULL),
(9, '5', '115', '01:14', '01/10/2025 ', 'Jairon Hernandez'),
(10, '5', '115', '01:32', '01/10/2025 ', 'Jairon Hernandez'),
(11, '5', '115', '01:33', '01/10/2025 ', 'Jairon Hernandez'),
(12, '5', '115', '01:34', '01/10/2025 ', 'Jairon Hernandez'),
(13, '5', '115', '01:36', '01/10/2025 ', 'Jairon Hernandez'),
(14, '5', '115', '01:36', '01/10/2025 ', 'Jairon Hernandez'),
(15, '5', '115', '01:40', '01/10/2025 ', 'Jairon Hernandez'),
(16, '5', '115', '01:43', '01/10/2025 ', 'Jairon Hernandez'),
(17, '5', '115', '01:49', '01/10/2025 ', 'Jairon Hernandez'),
(18, '5', '115', '01:52', '01/10/2025 ', 'Jairon Hernandez'),
(19, '5', '115', '01:57', '01/10/2025 ', 'Jairon Hernandez'),
(20, NULL, NULL, '01:57', '01/10/2025 ', NULL),
(21, NULL, NULL, '01:57', '01/10/2025 ', NULL),
(22, '5', '115', '01:57', '01/10/2025 ', 'Jairon Hernandez'),
(23, '5', '115', '02:05', '01/10/2025 ', 'Jairon Hernandez'),
(24, NULL, NULL, '02:05', '01/10/2025 ', NULL),
(25, NULL, NULL, '02:09', '01/10/2025 ', NULL),
(26, '5', '115', '02:18', '01/10/2025 ', 'Jairon Hernandez'),
(27, '5', '115', '02:18', '01/10/2025 ', 'Jairon Hernandez'),
(28, NULL, NULL, '02:18', '01/10/2025 ', NULL),
(29, '5', '115', '02:25', '01/10/2025 ', 'Jairon Hernandez'),
(30, '5', '115', '02:35', '01/10/2025 ', 'Jairon Hernandez'),
(31, '5', '115', '02:37', '01/10/2025 ', 'Jairon Hernandez'),
(32, '5', '115', '02:55', '01/10/2025 ', 'Jairon Hernandez'),
(33, '5', '115', '02:57', '01/10/2025 ', 'Jairon Hernandez'),
(34, '5', '115', '03:09', '01/10/2025 ', 'Jairon Hernandez'),
(35, '5', '115', '03:14', '01/10/2025 ', 'Jairon Hernandez');

-- --------------------------------------------------------

--
-- 테이블 구조 `e3uesmrepresentante`
--

CREATE TABLE `e3uesmrepresentante` (
  `id_repre` int(11) NOT NULL,
  `name_r` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_estu` varchar(11) DEFAULT NULL,
  `relacion_re` varchar(11) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `id_horario` varchar(11) DEFAULT NULL,
  `Cedula` int(11) NOT NULL,
  `status` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `e3uesmrepresentante`
--

INSERT INTO `e3uesmrepresentante` (`id_repre`, `name_r`, `phone`, `email`, `id_estu`, `relacion_re`, `extra`, `id_horario`, `Cedula`, `status`) VALUES
(1, 'Jairon Hernandez', '0939616273', 'jairo032198@gmail.com', '5', 'Padre', NULL, '115', 1316884582, '1'),
(2, 'Maria Velez ', '0939616273', 'jairo032198@gmail.com', '12', 'Madre', NULL, '115', 1316884583, '1');

-- --------------------------------------------------------

--
-- 테이블 구조 `prueba`
--

CREATE TABLE `prueba` (
  `nombre` int(11) NOT NULL,
  `apellido` int(11) NOT NULL,
  `ci` int(11) NOT NULL,
  `c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'jairo', '1998'),
(2, 'jaime', '19000'),
(3, 'sergio', 'werd'),
(4, 'Geovanna', 'castro'),
(5, 'prueba ', 'pruebita'),
(6, 'asdfr', '1234');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- 테이블의 인덱스 `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `e3uesm`
--
ALTER TABLE `e3uesm`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `e3uesmaterias`
--
ALTER TABLE `e3uesmaterias`
  ADD PRIMARY KEY (`id_materia`);

--
-- 테이블의 인덱스 `e3uesmaula`
--
ALTER TABLE `e3uesmaula`
  ADD PRIMARY KEY (`id_aula`);

--
-- 테이블의 인덱스 `e3uesmclases`
--
ALTER TABLE `e3uesmclases`
  ADD PRIMARY KEY (`id_clases`);

--
-- 테이블의 인덱스 `e3uesmhistory`
--
ALTER TABLE `e3uesmhistory`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `e3uesmhorario`
--
ALTER TABLE `e3uesmhorario`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `e3uesmingreso`
--
ALTER TABLE `e3uesmingreso`
  ADD PRIMARY KEY (`id_ri`);

--
-- 테이블의 인덱스 `e3uesmrepresentante`
--
ALTER TABLE `e3uesmrepresentante`
  ADD PRIMARY KEY (`id_repre`),
  ADD UNIQUE KEY `Cedula` (`Cedula`);

--
-- 테이블의 인덱스 `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 테이블의 AUTO_INCREMENT `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `e3uesm`
--
ALTER TABLE `e3uesm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 테이블의 AUTO_INCREMENT `e3uesmaterias`
--
ALTER TABLE `e3uesmaterias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 테이블의 AUTO_INCREMENT `e3uesmaula`
--
ALTER TABLE `e3uesmaula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 테이블의 AUTO_INCREMENT `e3uesmclases`
--
ALTER TABLE `e3uesmclases`
  MODIFY `id_clases` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `e3uesmhistory`
--
ALTER TABLE `e3uesmhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `e3uesmhorario`
--
ALTER TABLE `e3uesmhorario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- 테이블의 AUTO_INCREMENT `e3uesmingreso`
--
ALTER TABLE `e3uesmingreso`
  MODIFY `id_ri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- 테이블의 AUTO_INCREMENT `e3uesmrepresentante`
--
ALTER TABLE `e3uesmrepresentante`
  MODIFY `id_repre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 테이블의 AUTO_INCREMENT `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
