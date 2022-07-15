-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13-Jul-2022 às 15:47
-- Versão do servidor: 10.1.39-MariaDB
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advocacia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `advogado`
--

CREATE TABLE `advogado` (
  `oab` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `codigoaa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `areaatuacao`
--

CREATE TABLE `areaatuacao` (
  `codigoaa` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

CREATE TABLE `atividade` (
  `numeroserial` int(11) NOT NULL,
  `datatermino` date NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `tipoatividade` varchar(50) NOT NULL,
  `valorcobrado` varchar(50) NOT NULL,
  `datapagamento` date NOT NULL,
  `definicao` varchar(50) DEFAULT NULL,
  `codigoca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `causa`
--

CREATE TABLE `causa` (
  `codigoca` int(11) NOT NULL,
  `dataabertura` date NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `dataencerramento` date NOT NULL,
  `codigoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigoc` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `endereco` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advogado`
--
ALTER TABLE `advogado`
  ADD PRIMARY KEY (`oab`),
  ADD KEY `codigoaa` (`codigoaa`);

--
-- Indexes for table `areaatuacao`
--
ALTER TABLE `areaatuacao`
  ADD PRIMARY KEY (`codigoaa`);

--
-- Indexes for table `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`numeroserial`),
  ADD KEY `codigoca` (`codigoca`);

--
-- Indexes for table `causa`
--
ALTER TABLE `causa`
  ADD PRIMARY KEY (`codigoca`),
  ADD KEY `causa_ibfk_1` (`codigoc`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigoc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advogado`
--
ALTER TABLE `advogado`
  MODIFY `oab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `areaatuacao`
--
ALTER TABLE `areaatuacao`
  MODIFY `codigoaa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atividade`
--
ALTER TABLE `atividade`
  MODIFY `numeroserial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `causa`
--
ALTER TABLE `causa`
  MODIFY `codigoca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigoc` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `advogado`
--
ALTER TABLE `advogado`
  ADD CONSTRAINT `codigoaa` FOREIGN KEY (`codigoaa`) REFERENCES `areaatuacao` (`codigoaa`);

--
-- Limitadores para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `codigoca` FOREIGN KEY (`codigoca`) REFERENCES `causa` (`codigoca`);

--
-- Limitadores para a tabela `causa`
--
ALTER TABLE `causa`
  ADD CONSTRAINT `causa_ibfk_1` FOREIGN KEY (`codigoc`) REFERENCES `cliente` (`codigoc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
