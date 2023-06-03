-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 02/06/2023 às 13:31
-- Versão do servidor: 10.11.2-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas3`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidades`
--

CREATE TABLE `cidades` (
  `codcidade` int(4) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(7) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `codcidade` int(4) NOT NULL,
  `cpf` int(11) DEFAULT NULL,
  `rua` varchar(150) DEFAULT NULL,
  `complemento` varchar(150) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `cod_compra` int(10) DEFAULT NULL,
  `cod_cliente` int(7) NOT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `cod_prod` int(10) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `preco` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `prod_comp`
--

CREATE TABLE `prod_comp` (
  `cod_prod_comp` int(10) NOT NULL,
  `cod_prodt` int(10) DEFAULT NULL,
  `cod_comp` int(10) DEFAULT NULL,
  `qtd_prod` int(5) DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`codcidade`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codcidade`);

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_prod`);

--
-- Índices de tabela `prod_comp`
--
ALTER TABLE `prod_comp`
  ADD PRIMARY KEY (`cod_prod_comp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
