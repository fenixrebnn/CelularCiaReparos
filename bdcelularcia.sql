-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/06/2024 às 03:29
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdcelularcia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `problema` varchar(255) DEFAULT NULL,
  `marca_modelo_celular` varchar(200) DEFAULT NULL,
  `data_conserto` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `agenda`
--

INSERT INTO `agenda` (`id`, `id_usuario`, `problema`, `marca_modelo_celular`, `data_conserto`) VALUES
(14, 9, 'xxxxxxxxxxxxxxxxxxx', 'Samsung A10', '2024-06-29'),
(12, 11, 'tela quebrada', 'Motorola One', '2024-06-29'),
(8, 9, 'Tela quebrada ', 'Apple Iphone', '2024-06-20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `menu`
--

INSERT INTO `menu` (`id`, `menu`, `link`) VALUES
(1, 'Início', 'index.jsp'),
(2, 'Perfil', 'listar_perfil.jsp'),
(6, ' Usuários', 'listar_usuario.jsp'),
(7, ' Menu', 'listar_menu.jsp'),
(8, 'Receita', 'listar_receita.jsp'),
(15, 'Agendar Conserto', 'agendar_conserto.jsp'),
(11, 'Agendamentos', 'listar_agenda.jsp'),
(12, 'Nota de Serviço', 'listar_servico.jsp'),
(18, 'Meus Dados', 'meus_dados.jsp'),
(16, 'Sobre', 'sobre.jsp'),
(17, 'Mapa', 'mapa.jsp');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `id_menu` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`id_menu`, `id_perfil`) VALUES
(1, 1),
(1, 3),
(1, 8),
(2, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 8),
(16, 8),
(17, 8),
(18, 1),
(18, 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `perfil` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`) VALUES
(1, 'Administrador'),
(8, 'Cliente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `receita`
--

CREATE TABLE `receita` (
  `id` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `valor_servico` double DEFAULT NULL,
  `custo_pecas` double DEFAULT NULL,
  `lucro` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `receita`
--

INSERT INTO `receita` (`id`, `id_servico`, `valor_servico`, `custo_pecas`, `lucro`) VALUES
(4, 5, 150, 50, 250),
(7, 5, 120, 20, 100),
(5, 5, 350, 150, 350);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(11) NOT NULL,
  `id_agenda` int(11) NOT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `preco` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`id`, `id_agenda`, `diagnostico`, `data_entrega`, `preco`) VALUES
(5, 8, 'Tela quebrada', '2024-06-28', 150),
(12, 12, 'xxxxxxxxxxxxx', '2024-06-29', 120);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `id_perfil`, `nome`, `login`, `senha`, `email`) VALUES
(1, 1, 'Rebeca Nunes', 'rebeca', '123', 'rebeca@gmail.com'),
(5, 1, 'Sandra', 'sandra', '123', 'sandra@gmail.com'),
(6, 1, 'Marivaldo', 'marivaldo', '123', 'marivaldo@gmail.com'),
(7, 1, 'Simone', 'simone', '123', 'simone@gmail.com'),
(9, 8, 'Rayssa', 'rayssa', '123', 'rayssa@hotmail.com'),
(11, 8, 'leo', 'leo', '123', 'leo@gmail.com'),
(12, 8, 'maisa', 'mah', '123', 'maisa@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agenda_FKIndex1` (`id_usuario`);

--
-- Índices de tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD PRIMARY KEY (`id_menu`,`id_perfil`),
  ADD KEY `Menu_has_Perfil_FKIndex1` (`id_menu`),
  ADD KEY `Menu_has_Perfil_FKIndex2` (`id_perfil`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `receita`
--
ALTER TABLE `receita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receita_FKIndex1` (`id_servico`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servico_FKIndex1` (`id_agenda`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_FKIndex1` (`id_perfil`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `receita`
--
ALTER TABLE `receita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
