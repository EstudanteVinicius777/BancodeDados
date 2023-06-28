-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 28/06/2023 às 11:09
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
-- Banco de dados: `avvv11`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes_compram_pecas`
--

CREATE TABLE `clientes_compram_pecas` (
  `id_compra` int(5) NOT NULL,
  `cod_peca` int(5) DEFAULT NULL,
  `cpf_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `homem`
--

CREATE TABLE `homem` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `cnpj` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mulher`
--

CREATE TABLE `mulher` (
  `cpf` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `cpf_homem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pecas`
--

CREATE TABLE `pecas` (
  `cod_pecas` int(5) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `observacoes` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `cod_produto` int(10) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `cnpj_empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `clientes_compram_pecas`
--
ALTER TABLE `clientes_compram_pecas`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `cod_peca` (`cod_peca`),
  ADD KEY `cpf_cliente` (`cpf_cliente`);

--
-- Índices de tabela `homem`
--
ALTER TABLE `homem`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices de tabela `mulher`
--
ALTER TABLE `mulher`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `cpf_homem` (`cpf_homem`);

--
-- Índices de tabela `pecas`
--
ALTER TABLE `pecas`
  ADD PRIMARY KEY (`cod_pecas`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_produto`),
  ADD KEY `cnpj_empresa` (`cnpj_empresa`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `clientes_compram_pecas`
--
ALTER TABLE `clientes_compram_pecas`
  ADD CONSTRAINT `clientes_compram_pecas_ibfk_1` FOREIGN KEY (`cod_peca`) REFERENCES `pecas` (`cod_pecas`),
  ADD CONSTRAINT `clientes_compram_pecas_ibfk_2` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf`);

--
-- Restrições para tabelas `mulher`
--
ALTER TABLE `mulher`
  ADD CONSTRAINT `mulher_ibfk_1` FOREIGN KEY (`cpf_homem`) REFERENCES `homem` (`cpf`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`cnpj_empresa`) REFERENCES `marca` (`cnpj`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
