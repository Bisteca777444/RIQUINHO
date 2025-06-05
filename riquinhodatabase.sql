-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 18/01/2024 às 18:00
-- Versão do servidor: 10.6.16-MariaDB-cll-lve
-- Versão do PHP: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sono7249_cassino`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `inviter` int(10) UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT 0.00,
  `commission_type` varchar(191) DEFAULT NULL,
  `deposited` tinyint(4) DEFAULT 0,
  `deposited_amount` decimal(10,2) DEFAULT 0.00,
  `losses` bigint(20) DEFAULT 0,
  `losses_amount` decimal(10,2) DEFAULT 0.00,
  `commission_paid` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_categories`
--

CREATE TABLE `bet_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_section_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_events`
--

CREATE TABLE `bet_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_category_id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `event_a` varchar(191) NOT NULL,
  `event_a_logo` varchar(191) NOT NULL,
  `event_b` varchar(191) NOT NULL,
  `event_b_logo` varchar(191) NOT NULL,
  `event_day` datetime NOT NULL,
  `event_result_a` varchar(191) DEFAULT NULL,
  `event_result_b` varchar(191) DEFAULT NULL,
  `finished` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_sections`
--

CREATE TABLE `bet_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `bet_sections`
--

INSERT INTO `bet_sections` (`id`, `name`, `image`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Futebol', 'ALVXctT91C99nxCSwT75jMhB6i6MEv-metac3BvcnQucG5n-.png', 1, '2023-10-21 18:17:46', '2023-10-21 18:17:46'),
(2, 'Voleibol ', '0cMzW5nEZekYTEgAsTRc06uvckbGEc-metadm9sbGV5YmFsbF9zcG9ydF81MDQ0LnBuZw==-.png', 1, '2023-10-21 18:21:19', '2023-10-21 18:21:19'),
(3, 'Fórmula 1', 'u1ieAxuLnYL4RlVEE4xkB4QE0chWEG-metaNjE4OTUxLnBuZw==-.png', 1, '2023-10-21 18:23:57', '2023-10-21 18:23:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_users`
--

CREATE TABLE `bet_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_event_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `event_result_a` varchar(191) NOT NULL,
  `event_result_b` varchar(191) NOT NULL,
  `reward_received` decimal(20,2) DEFAULT NULL,
  `winner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(11, 'Exclusive', 'Exclusive', NULL, 'exclusive', '2024-01-18 19:10:14', '2024-01-18 19:10:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) NOT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `provider_service` varchar(50) DEFAULT NULL,
  `technology` varchar(50) NOT NULL DEFAULT '0',
  `has_lobby` tinyint(4) NOT NULL DEFAULT 0,
  `is_mobile` tinyint(4) NOT NULL DEFAULT 0,
  `has_freespins` tinyint(4) NOT NULL DEFAULT 0,
  `has_tables` tinyint(4) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `views` bigint(20) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `category_id`, `name`, `uuid`, `image`, `type`, `provider`, `provider_service`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `slug`, `active`, `views`, `created_at`, `updated_at`) VALUES
(2, 7, 'Fortune Tiger', 'd2eca6ec0cee46189bcc99620e08f844', '45PcOZKe8thultp9Z1IFpO7UE9dbOx-metadGh1bWItbWFnbmF0YS1mb3J0dW5lLnBuZw==-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 1, 0, 0, 'pgsoft-fortune-tiger', 0, 72, '2023-09-24 22:19:54', '2023-10-07 00:27:07'),
(4, 7, 'Fortune Ox', 'a05e42412e1b4ea2aa385d46cab73815', 'OmGtj5H94ZHXIMIdOdQJBMxbidDUwq-metadGh1bWItZm9ydHVuZW94LnBuZw==-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 1, 0, 0, 'pgsoft-fortune-ox', 0, 5, '2023-09-29 20:39:25', '2023-09-30 06:52:06'),
(5, 7, 'Fortune Rabbit', 'c3befcf4f6e24010a5bc41da10054f23', 'HvVGCyDvICECXlM3KQClrJNl75ReF1-metadGh1bWItZm9ydHVuZXJhYmJpdC5wbmc=-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 1, 0, 0, 'pgsoft-fortune-rabbit', 0, 12, '2023-09-29 20:42:38', '2023-10-02 12:31:56'),
(8, 7, 'Fortune Mouse', 'b50151fecdcc409b82d2e1542d9c7531', 'oE9xGt81IrgaOoviohAYAahIyVyvfd-metaQnlsTHpkV28xRy1iOTg0NGUwOWFhNjNkYWMwNWI4MjY5NDg0MWEwZjNlNC5wbmc=-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'pgsoft-fortune-mouse', 0, 16, '2023-09-30 03:11:56', '2023-10-04 09:39:27'),
(11, 7, 'Piggy Gold', 'fe21a6cfa2e94e6087a0fdc86dae2f3b', 'wYIGgatRNObHuWwE4ucXnKAWqVHkMv-metacGdzX3BpZ2d5Z29sZC1lbi1VUy5wbmcuZTUyMzY3MTAyYzA0YWM0OGE2ZDRjN2Y1ODFiNDA3NTYucG5n-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'pgsoft-piggy-gold', 0, 3, '2023-09-30 03:37:33', '2023-09-30 19:11:12'),
(12, 3, 'Balloon', '9d102c4944c742acbb3ac49dad3bda1e', '2AJCX333BJFDNqHiUtCg5y7n1tFIBO-metadGh1bWItYmFsbG9vbi5wbmc=-.png', 'slots', 'SmartSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'smartsoft-balloon', 0, 9, '2023-09-30 11:03:43', '2023-10-02 20:58:20'),
(15, 3, 'Cappadocia', '40f1aaa03a5c403ea3148b17e1894ece', 'WqZ6M9oli8VmY4USb6TUrU3p52kWnT-metadGh1bWItY2FwcGFkb2NpYS5wbmc=-.png', 'slots', 'SmartSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'smartsoft-cappadocia', 0, 11, '2023-09-30 12:02:05', '2023-10-02 20:27:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_hashes`
--

CREATE TABLE `games_hashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `hash` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_kscinus`
--

CREATE TABLE `games_kscinus` (
  `id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `cover` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rtp` decimal(10,2) DEFAULT 0.00,
  `category_id` tinyint(4) DEFAULT 0,
  `developer` varchar(26) DEFAULT NULL,
  `type` tinyint(4) DEFAULT 2,
  `key` varchar(64) DEFAULT NULL,
  `money_ratio` varchar(5) DEFAULT NULL,
  `device` tinyint(4) DEFAULT 0,
  `views` bigint(20) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_exclusives`
--

CREATE TABLE `game_exclusives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `cover` varchar(191) NOT NULL,
  `icon` varchar(191) NOT NULL,
  `winLength` bigint(20) NOT NULL DEFAULT 3,
  `loseLength` bigint(20) NOT NULL DEFAULT 20,
  `influencer_winLength` bigint(20) NOT NULL DEFAULT 20,
  `influencer_loseLength` bigint(20) NOT NULL DEFAULT 1,
  `iconsJson` text NOT NULL,
  `active` tinyint(4) DEFAULT 1,
  `views` bigint(20) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `velocidade` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `game_exclusives`
--

INSERT INTO `game_exclusives` (`id`, `category_id`, `uuid`, `name`, `description`, `cover`, `icon`, `winLength`, `loseLength`, `influencer_winLength`, `influencer_loseLength`, `iconsJson`, `active`, `views`, `created_at`, `updated_at`, `velocidade`) VALUES
(1, 11, 'fortunetiger', 'Fortune Tiger', '<p>&nbsp;Diz a lenda que existe um imperador de mil anos que governa um império chamado Imortal. O segredo de sua imortalidade é seu raro tigre dourado que sempre fica ao seu lado como guardião. Possui lindo pelo listrado que brilha como a luz do sol e um par de olhos dourados que podem arrebatar a alma de quem olha para eles. Não só este tigre mantém a paz em Immortal, mas também concedeu ao imperador uma vida imortal. O tigre só dá à luz uma vez a cada doze anos, e este ano é um desses anos! O imperador está muito animado em convidar o povo para testemunhar o milagre. Diz-se que uma chuva dourada cairá do céu quando o filhote de tigre nascer. A chuva tem o poder de fertilizar o solo e curar todo tipo de doenças. Jogue “Fortune Tiger” agora para testemunhar o nascimento do tigre dourado e ser abençoado com uma vida inteira de sorte!\\n\\nFortune Tiger é um vídeo slot de 3 cilindros e 3 linhas com respins e multiplicador x10. O recurso Fortune Tiger pode ser acionado aleatoriamente durante qualquer giro! Se houver 1 ou mais símbolos adicionais (seja um símbolo escolhido aleatoriamente ou um símbolo Wild) aparecendo nas bobinas, todas as bobinas girarão novamente! Além disso, quando todos os símbolos nos rolos estiverem envolvidos numa vitória, a vitória será multiplicada por x10.&nbsp;</p>', 'CvKb3VQ1WDnpSpX2TD5i3xXXBCIJkM-metaZHNkZWVlLnBuZw==-.png', 'Lq6sofAr3rU4AvAbUaw2dazLpOhoFD-metadGlnZXItMi5wbmc=-.png', 15, 30, 1, 0, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 3166, '2023-10-07 16:18:46', '2024-01-18 20:23:36', NULL),
(2, 11, 'fortuneox', 'Fortune OX', '<p>&nbsp;Ox is the second of the 12-year periodic sequence of animals in the Chinese zodiac. It plays an important role throughout China agriculture history and acts as the symbol of “productivity” due to its diligence and tenacity. The ancient Chinese always said: “Farming is best done in the year of the Ox”. This is because there is always fair weather in every year of the Ox, making all the work go smoothly! The Ox also represents an auspicious animal. Legend has it, there is an immortal person who rides his mighty Ox in Mount Taibai. It is said that whoever has the chance to touch the horns of the Ox will be blessed with happiness for their whole life! However, this immortal person and his ox are hard to track, and only the destined few can meet them and be blessed with good luck! Play “Fortune Ox” now, let the Ox bless you with good fortune and prosperity! Fortune Ox is a 3-reel, 3-row (for reel 1 and 3) and 4-row (for reel 2) video slot featuring respins until win and x10 multiplier. Fortune Ox Feature may be randomly triggered during any spin! During the Fortune Ox Feature, when the first and third reel share the same symbols, all reels will respin until there is a win! Not only that, full reels win will reward x10 wins too!&nbsp;</p>', 'Z8DfWMbrUnbZT69TB61uVgw4MfLLHf-metaZHNkc2QucG5n-.png', 'eSwugWYqXBDiRKo4V3a93fivawpzqc-metab3gucG5n-.png', 15, 30, 20, 1, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 668, '2023-10-07 16:58:11', '2024-01-18 19:24:55', NULL),
(3, 11, 'fortunemouse', 'Fortune Mouse', '<p>&nbsp;Legend has it that the Jade Emperor organized a river crossing competition to select twelve animals to be the twelve zodiac signs. Many animals enthusiastically entered after hearing about this news. On the day of the competition, the cow was ahead of the race. But unbeknownst to the cow, the clever mouse had been hiding on the cow’s back. When the cow was about to cross the finish line, the mouse jumped off the cow’s back and thus became the first of the zodiac signs.<br>Mice are not only clever; they were also regarded as a symbol of wealth during ancient times. It was said that if your home had mice stealing food, it meant your family was rich and prosperous enough to have a surplus of food at home for the mice to steal! So let “Fortune Mouse” bring you unlimited luck and endless wealth in the year of the Mouse!<br>Fortune Mouse is a 3-reel, 3-row video slot featuring respins until win. 3 Wild symbols may be added to the middle reel during any spin in the Fortune Mouse Feature. The first and third reel will respin until there is a win. Be awarded with 1000x of the total bet in Maximum Win when Wild symbols occupy all the reels!&nbsp;</p>', '4v1pdl8t86pKmP3HOaXLZ2aH8Ni9Re-metac3NzLnBuZw==-.png', 'BsJCiMUt4sLYcvRUaw4zqAjsUW4oqk-metabW91c2UucG5n-.png', 15, 30, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 721, '2023-10-07 17:06:52', '2024-01-18 19:26:51', NULL),
(4, 11, 'fortunepanda', 'Fortune Panda', '<p>\"Uma emocionante jornada que promete trazer grandes ganhos financeiros! Bem-vindo ao Panda, a nova adição à Família Fortune.\"</p>', 'qmfgj0deQ117cFnq7fLgcaJY3V9Lo8-metaZHNhZS5wbmc=-.png', 'x9jw5Eu29n3UIJzr6ud8zhdqiO8u4d-metacGFuZGEucG5n-.png', 15, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 560, '2023-10-07 20:18:52', '2024-01-18 20:26:35', NULL),
(5, 11, 'phoenixrises', 'Phoenix Rises', '<p>&nbsp;Ressurge das cinzas para trazer sorte até você. Venha se divertir com nossa nova atração!&nbsp;</p>', 'Cuclk7s6m4ZYSiyQSAgLZSJCnKg3w6-metad3d3d3cucG5n-.png', 'x7iN6vEcayfBZIQoy7XC7zbe2UVgns-metaZmVuaXgucG5n-.png', 15, 20, 2, 20, '{\n    \"success\": true,\n    \"data\": [\n        {\n            \"icon_name\": \"Symbol_0\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_1\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_2\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 20,\n            \"win_4\": 50,\n            \"win_5\": 120,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_3\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 15,\n            \"win_4\": 45,\n            \"win_5\": 100,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_4\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_5\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 6,\n            \"win_4\": 15,\n            \"win_5\": 50,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_6\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 30,\n            \"win_4\": 60,\n            \"win_5\": 150,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_7\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_8\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_9\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        }\n    ],\n    \"message\": \"List icons success\"\n}', 1, 393, '2023-10-07 20:58:18', '2024-01-18 20:26:41', NULL),
(6, 11, 'queenofbounty', 'Queen of Bounty', '<p>Queen of Bounty</p>', 'h90FIUHmZpRbRTQm2lpc1MKZwBCwkk-metaZXJlLnBuZw==-.png', 'D4KfDqMiKGkeNYXnnTNdofzXAuohRj-metadGVzb3VyZS5wbmc=-.png', 10, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 30, '2023-10-07 21:43:26', '2024-01-18 19:31:25', NULL),
(7, 11, 'treasuresofaztec', 'Treasures of Aztec', '<p>Treasures of Aztec</p>', 'nI2tw7MLe1f1syhEWTgYxgBJGhswCe-metaZGVkZXcucG5n-.png', 'SvaQYvS346lt4Qt4UTdAJ5k34Iv6Ew-metaMTM1NzUzOS5wbmc=-.png', 10, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 277, '2023-10-07 22:22:00', '2024-01-18 19:32:31', NULL),
(8, 11, 'bikiniparadise', 'Bikini Paradise', '<p>Bikini Paradise</p>', 'O1vF5d1gsJBqxJ5ENewboFZTMBu31B-metaZHNkc2QzLnBuZw==-.png', 'zSBdC8WTBkhpKWeL1qBv4ZU5NR3bdY-metaMjc5MzkzMy5wbmc=-.png', 15, 30, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 54, '2023-10-08 22:57:29', '2024-01-18 19:33:49', NULL),
(9, 11, 'hoodvswoolf', 'Hood VS Wolf', '<p>Hood VS Wolf</p>', 'dqkyGyqmsqeNw8ffHFPeCQCal4yd1R-metaZHNhZGFzZHNhLnBuZw==-.png', 'llnN2dNJTN2FAyFYDvoW4pGhX6mQkQ-metadHJhbnNmZXJpci5wbmc=-.png', 15, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 24, '2023-10-08 23:07:30', '2024-01-18 20:27:01', NULL),
(10, 11, 'jackfrost', 'Jack Frost´s', '<p>Jack Frost´s</p>', '9zNO9ZHPYf8bjQw9trAzKPD3u3nyfz-metaZGVkZWRlLnBuZw==-.png', 'ciJKswrHRTZocwtMtDfIjerQp7y8od-metaMjQ5MjAyNi5wbmc=-.png', 10, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 30, '2023-10-09 20:23:13', '2024-01-18 19:36:03', NULL),
(11, 11, 'songkranparty', 'Song Kran Party', '<p>Song Kran Party</p>', 'oZbpLoziah8fk1vHYVOkJ3axZt8bvo-metaZWVlZC5wbmc=-.png', '6li5RylQgxWOwFaKx5ijUbfG8GJ2x7-metaMTQ3MTQzNS0yMDAucG5n-.png', 15, 20, 2, 20, '{\n    \"success\": true,\n    \"data\": [\n        {\n            \"icon_name\": \"Symbol_0\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_1\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_2\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 20,\n            \"win_4\": 50,\n            \"win_5\": 120,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_3\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 15,\n            \"win_4\": 45,\n            \"win_5\": 100,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_4\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_5\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 6,\n            \"win_4\": 15,\n            \"win_5\": 50,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_6\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 30,\n            \"win_4\": 60,\n            \"win_5\": 150,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_7\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_8\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_9\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        }\n    ],\n    \"message\": \"List icons success\"\n}', 1, 23, '2023-10-09 20:25:21', '2024-01-18 19:37:04', NULL),
(12, 11, 'fortunerabbit', 'Fortune Rabbit', '<p>Fortune Rabbit</p>', 'YOuCTDDcC8uPkvwKy5FHkMp3Qrk98K-metaZGVyZS5wbmc=-.png', 'G6c2v0xJxlqTdY3nPMhk4MsyF0cuem-metacmFiaWl0aWNvbi5wbmc=-.png', 20, 20, 2, 20, '[]', 1, 1330, '2023-10-10 20:45:45', '2024-01-18 19:38:03', NULL),
(13, 11, 'sub', 'Subway Surfers', '<p>Subway Surfers</p>', 'HC6dw6qJ7Q12FwAK1zW7Q3iQB34pk8-metac3Vid2F5cy5qcGVn-.jpg', '5IoE2qlfQWqb5NTfbOqTwlGNq1DPdD-metaaWNvLnBuZw==-.png', 20, 10, 20, 1, '{}', 1, 187, NULL, '2024-01-18 20:40:18', 130),
(14, 11, 'mario', 'Mario', '<p>Mario</p>', 'RTK8VaIO1TtZcWBr6ENm3piC1CNU1Z-metabWFyaW8ucG5n-.png', '9DFb0R4w1xzSZZ0lgfvd2bS9Im7hbu-metaaWNvLnBuZw==-.png', 5, 10, 20, 1, '{}', 1, 160, NULL, '2024-01-18 20:42:08', 1),
(15, 11, 'flappy', 'Flappy', '<p>Flappy</p>', 'aYf79I5Gy2ELS0kN1JVFBoAzGcr46m-metaZmxhcHB5LnBuZw==-.png', '95xRUPbTH4DrzirBVI7auli4hpoBQ1-metaaWNvLnBuZw==-.png', 5, 10, 5, 20, '{}', 1, 102, NULL, '2024-01-18 20:41:52', 3),
(16, 11, 'fruit', 'Fruit Ninja', '<p>Fruit</p>', 'P8h5Tb7mDew5axMe76OO4Dwdter5hp-metaZnJ1aXQuanBn-.jpg', 'pViNN3LFAry2dcnHkeM6eJBTzwV397-metaaWNvLnBuZw==-.png', 3, 20, 1, 1, '{}', 1, 81, NULL, '2024-01-18 20:20:49', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_24_214554_add_field_to_users_table', 2),
(6, '2023_09_24_215008_create_wallets_table', 2),
(7, '2023_09_24_215356_create_games_table', 2),
(8, '2023_09_24_215619_create_games_hashes_table', 2),
(9, '2023_09_24_215903_create_orders_table', 2),
(10, '2023_09_24_233733_create_settings_table', 3),
(11, '2023_09_24_211517_create_teams_table', 4),
(12, '2023_09_24_214013_add_team_id_to_users_table', 5),
(13, '2023_09_25_113635_create_withdrawals_table', 6),
(14, '2023_09_25_113654_create_deposits_table', 6),
(15, '2023_09_25_204419_add_fields_to_settings_table', 7),
(16, '2023_09_24_214008_create_categories_table', 8),
(17, '2023_09_27_214903_create_wallet_changes_table', 9),
(18, '2023_09_30_230009_create_transactions_table', 10),
(19, '2023_10_01_171432_add_smtp_to_settings_table', 11),
(20, '2023_10_02_213820_create_affiliate_histories_table', 12),
(22, '2023_10_07_183921_create_game_exclusives_table', 13),
(23, '2023_10_08_111755_add_fields_to_game_exclusives_table', 14),
(24, '2023_10_10_010619_create_soccer_categories_table', 15),
(25, '2023_10_10_010632_create_soccer_matches_table', 15),
(26, '2023_10_10_010641_create_soccer_bets_table', 15),
(27, '2023_10_11_144956_create_system_wallets_table', 16),
(30, '2023_10_12_183005_create_teams_table', 17),
(31, '2023_10_12_185145_create_permission_tables', 18),
(32, '2023_10_13_005036_add_is_admin_to_users_table', 19),
(33, '2023_10_16_103614_create_permission_tables', 20),
(34, '2023_10_17_105300_create_suit_pay_payments_table', 21),
(35, '2023_10_17_212504_create_notifications_table', 22),
(36, '2023_10_21_112530_create_bet_sections_table', 23),
(37, '2023_10_21_112532_create_bet_categories_table', 24),
(38, '2023_10_21_112826_create_bet_events_table', 25),
(39, '2023_10_21_112906_create_bet_users_table', 26),
(40, '2023_10_23_115759_add_auth_to_users_table', 27),
(41, '2023_10_25_132459_create_game_pragmatics_table', 28),
(42, '2023_10_25_140317_create_game_logs_table', 28),
(43, '2023_10_25_150440_create_jpg_table', 29),
(44, '2023_10_25_152044_create_sessions_table', 29);

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 27);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `game` varchar(191) NOT NULL,
  `game_uuid` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `type_money` varchar(50) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `providers` varchar(191) NOT NULL,
  `refunded` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `round_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 16:23:45', '2023-10-12 18:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 16:23:56', '2023-10-12 18:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 16:25:06', '2023-10-12 18:11:10'),
(4, 'admin-view', 'web', '2023-10-12 17:56:35', '2023-10-12 17:56:35'),
(5, 'admin-create', 'api', '2023-10-12 18:56:02', '2023-11-22 12:29:37'),
(6, 'admin-edit', 'api', '2023-10-12 18:56:27', '2023-11-22 12:30:56'),
(7, 'admin-delete', 'api', '2023-10-12 18:56:55', '2023-11-22 12:32:23'),
(8, 'category-view', 'api', '2023-10-12 19:01:31', '2023-11-22 12:33:30'),
(9, 'category-create', 'api', '2023-10-12 19:01:46', '2023-11-22 12:35:30'),
(10, 'category-edit', 'api', '2023-10-12 19:01:59', '2023-11-22 12:37:17'),
(11, 'category-delete', 'api', '2023-10-12 19:02:09', '2023-11-22 12:44:05'),
(12, 'game-view', 'web', '2023-10-12 19:02:27', '2023-10-12 19:02:27'),
(13, 'game-create', 'web', '2023-10-12 19:02:36', '2023-10-12 19:02:36'),
(14, 'game-edit', 'web', '2023-10-12 19:02:44', '2023-10-12 19:02:44'),
(15, 'game-delete', 'web', '2023-10-12 19:02:54', '2023-10-12 19:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 19:05:49', '2023-10-12 19:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 19:06:01', '2023-10-12 19:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 19:06:11', '2023-10-12 19:06:11'),
(19, 'wallet-delete', 'api', '2023-10-12 19:06:18', '2023-11-22 12:44:20'),
(20, 'deposit-view', 'api', '2023-10-12 19:06:44', '2023-11-22 12:44:05'),
(21, 'deposit-create', 'web', '2023-10-12 19:06:56', '2023-10-12 19:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 19:07:05', '2023-10-12 19:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 19:08:00', '2023-10-12 19:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 19:08:11', '2023-10-12 19:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 19:09:31', '2023-10-12 19:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 19:09:40', '2023-10-12 19:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 19:09:51', '2023-10-12 19:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 19:10:00', '2023-10-12 19:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 19:10:09', '2023-10-12 19:10:09'),
(30, 'order-view', 'web', '2023-10-12 19:12:36', '2023-10-12 19:12:36'),
(31, 'order-create', 'web', '2023-10-12 19:12:47', '2023-10-12 19:12:47'),
(32, 'order-edit', 'web', '2023-10-12 19:12:56', '2023-10-12 19:12:56'),
(33, 'order-update', 'web', '2023-10-12 19:13:06', '2023-10-12 19:13:06'),
(34, 'order-delete', 'web', '2023-10-12 19:13:19', '2023-10-12 19:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 20:26:06', '2023-10-12 20:26:06'),
(36, 'setting-view', 'web', '2023-10-12 21:25:46', '2023-10-12 21:25:46'),
(37, 'setting-create', 'web', '2023-10-12 21:25:57', '2023-10-12 21:25:57'),
(38, 'setting-edit', 'web', '2023-10-12 21:26:06', '2023-10-12 21:26:06'),
(39, 'setting-update', 'web', '2023-10-12 21:26:19', '2023-10-12 21:26:19'),
(40, 'setting-delete', 'web', '2023-10-12 21:26:33', '2023-10-12 21:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'api', '2023-10-12 16:20:41', '2023-11-22 12:17:25'),
(2, 'afiliado', 'api', '2023-10-12 16:21:08', '2023-11-22 12:19:31'),
(88, 'Smith', 'api', '2023-11-22 13:02:41', '2023-11-22 13:02:41'),
(90, 'Subadmin', 'api', '2023-12-07 16:58:36', '2023-12-07 16:58:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 90),
(2, 1),
(2, 90),
(3, 1),
(3, 90),
(4, 1),
(4, 90),
(5, 90),
(6, 90),
(7, 90),
(8, 90),
(9, 90),
(10, 90),
(11, 90),
(12, 1),
(12, 90),
(13, 1),
(13, 90),
(14, 1),
(14, 90),
(15, 1),
(15, 90),
(16, 1),
(16, 90),
(17, 1),
(17, 90),
(18, 1),
(18, 90),
(19, 90),
(20, 90),
(21, 1),
(21, 90),
(22, 1),
(22, 90),
(23, 1),
(23, 90),
(24, 1),
(25, 1),
(25, 90),
(26, 1),
(26, 90),
(27, 1),
(27, 90),
(28, 1),
(28, 90),
(29, 1),
(29, 90),
(30, 1),
(30, 90),
(31, 1),
(31, 90),
(32, 1),
(32, 90),
(33, 1),
(33, 90),
(34, 1),
(34, 90),
(35, 1),
(35, 90),
(36, 1),
(36, 90),
(37, 1),
(37, 90),
(38, 1),
(38, 90),
(39, 1),
(39, 90),
(40, 1),
(40, 90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `software_description` varchar(255) DEFAULT NULL,
  `software_logo_white` varchar(255) DEFAULT NULL,
  `software_logo_black` varchar(255) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint(20) DEFAULT 20,
  `ngr_percent` bigint(20) DEFAULT 20,
  `soccer_percentage` bigint(20) DEFAULT 30,
  `prefix` varchar(191) NOT NULL DEFAULT 'R$',
  `storage` varchar(191) NOT NULL DEFAULT 'local',
  `initial_bonus` bigint(20) DEFAULT 0,
  `merchant_url` varchar(191) DEFAULT NULL,
  `merchant_id` varchar(191) DEFAULT NULL,
  `merchant_key` varchar(191) DEFAULT NULL,
  `min_deposit` decimal(10,2) DEFAULT 20.00,
  `max_deposit` decimal(10,2) DEFAULT 0.00,
  `min_withdrawal` decimal(10,2) DEFAULT 20.00,
  `max_withdrawal` decimal(10,2) DEFAULT 0.00,
  `suitpay_uri` varchar(255) DEFAULT NULL,
  `suitpay_cliente_id` varchar(255) DEFAULT NULL,
  `suitpay_cliente_secret` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maintenance_mode` tinyint(4) DEFAULT 0,
  `software_smtp_type` varchar(30) DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) DEFAULT NULL,
  `kscinus_pub_key` varchar(255) DEFAULT NULL,
  `kscinus_pvt_key` varchar(255) DEFAULT NULL,
  `hoopay_uri` varchar(255) DEFAULT NULL,
  `hoopay_cliente_id` varchar(255) DEFAULT NULL,
  `hoopay_cliente_secret` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_logo_white`, `software_logo_black`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `merchant_url`, `merchant_id`, `merchant_key`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `created_at`, `updated_at`, `maintenance_mode`, `software_smtp_type`, `software_smtp_mail_host`, `software_smtp_mail_port`, `software_smtp_mail_username`, `software_smtp_mail_password`, `software_smtp_mail_encryption`, `software_smtp_mail_from_address`, `software_smtp_mail_from_name`, `kscinus_pub_key`, `kscinus_pvt_key`, `hoopay_uri`, `hoopay_cliente_id`, `hoopay_cliente_secret`) VALUES
(1, 'JOGUINHO', 'Plataforma de Cassino Online', '[]', '[]', 'BRL', 'dot', 'left', 50, 10, 40, 'R$', 'local', 50, 'https://staging.slotegrator.com/api/index.php/v1/', '', '', 20.00, 500.00, 200.00, 500.00, 'https://ws.suitpay.app/api/v1/', '', '', '2023-09-24 17:40:05', '2024-01-18 20:28:26', 0, 'smtp', 'mail.joguinho.shop', '465', 'contato@joguinho.shop', 'suasenhae', 'tsl', 'contato@joguinho.shop', 'JOGUINHO', 'b95d5abc-b731-4345-a369-fd921f7f9227', 'WZ4cUtUmnrwYlgQeElbMYAOEJ25nZSWFBHSI2M0hTfw=', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_id` bigint(20) DEFAULT NULL,
  `pix_key` varchar(255) DEFAULT NULL,
  `pix_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` char(32) NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT 0.000000000000,
  `balance_min` decimal(27,12) NOT NULL DEFAULT 10000.100000000000,
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT 45.00,
  `mode` enum('balance_min','percentage') NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(20) NOT NULL DEFAULT 'usd',
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` tinyint(4) DEFAULT 3,
  `name` varchar(191) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `last_name` varchar(255) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `token_time` bigint(20) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `logged_in` tinyint(4) DEFAULT 0,
  `banned` tinyint(4) DEFAULT 0,
  `inviter` int(10) UNSIGNED DEFAULT NULL,
  `affiliate_revenue_share` decimal(20,2) DEFAULT 0.00,
  `affiliate_cpa` decimal(20,2) DEFAULT 0.00,
  `affiliate_baseline` decimal(20,2) DEFAULT 0.00,
  `is_demo_agent` tinyint(4) DEFAULT 0,
  `oauth_id` varchar(100) DEFAULT NULL,
  `oauth_type` varchar(50) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kscinus` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `is_admin`, `last_name`, `cpf`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `token_time`, `token`, `logged_in`, `banned`, `inviter`, `affiliate_revenue_share`, `affiliate_cpa`, `affiliate_baseline`, `is_demo_agent`, `oauth_id`, `oauth_type`, `status`, `created_at`, `updated_at`, `kscinus`) VALUES
(1, 0, 'Admin', 1, NULL, '500.600.700-80', '(66) 98101-5430', 'admin@hotmail.com', NULL, '$2y$10$K51daBuqYZ/KJfhsz62fzuZkhl/1EXzyZqd.4Lb3wIkWwLJH0TDbS', '', 0, '', 0, 0, 10, 20.00, 20.00, 0.00, 0, NULL, NULL, 'active', '2024-01-10 15:20:16', '2024-01-18 20:57:51', 1),
(448, 3, 'Demo', 0, NULL, NULL, '(66) 63636-3636', 'demo@hotmail.com', NULL, '$2y$10$8YbsktPLWnJOgXpqpvIy0euQi1v1A71kbGLnsE7dad5NQ8rtNSKNq', 'ml6QetM3EEg03Zzw4qKXN129Ny0Qhi8VEFsEX3am9DrgwUHf1isC9VppDTbc', NULL, NULL, 0, 0, NULL, 0.00, 0.00, 0.00, 0, NULL, NULL, 'active', '2024-01-18 20:51:53', '2024-01-18 20:51:53', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `anti_bot` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_won` decimal(20,2) DEFAULT 0.00,
  `total_lose` decimal(20,2) DEFAULT 0.00,
  `last_won` decimal(20,2) DEFAULT 0.00,
  `last_lose` decimal(20,2) DEFAULT 0.00,
  `hide_balance` tinyint(4) DEFAULT 0,
  `refer_rewards` decimal(20,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `balance_bonus`, `anti_bot`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `hide_balance`, `refer_rewards`, `created_at`, `updated_at`) VALUES
(1, 1, 949.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, NULL, '2024-01-18 20:42:08'),
(316, 448, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2024-01-18 20:51:53', '2024-01-18 20:51:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `change` varchar(50) DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_roi` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_entry` decimal(20,2) NOT NULL DEFAULT 0.00,
  `game` varchar(191) DEFAULT NULL,
  `user` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) NOT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `chave_pix` varchar(255) DEFAULT NULL,
  `tipo_chave` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `bet_categories`
--
ALTER TABLE `bet_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bet_categories_bet_section_id_foreign` (`bet_section_id`) USING BTREE;

--
-- Índices de tabela `bet_events`
--
ALTER TABLE `bet_events`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bet_events_bet_category_id_foreign` (`bet_category_id`) USING BTREE;

--
-- Índices de tabela `bet_sections`
--
ALTER TABLE `bet_sections`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `bet_users`
--
ALTER TABLE `bet_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bet_users_bet_event_id_foreign` (`bet_event_id`) USING BTREE,
  ADD KEY `bet_users_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `slug` (`slug`) USING BTREE;

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Índices de tabela `games_hashes`
--
ALTER TABLE `games_hashes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `games_hashes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `games_kscinus`
--
ALTER TABLE `games_kscinus`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_exclusives`
--
ALTER TABLE `game_exclusives`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `game_exclusives_category_id_foreign` (`category_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `team_user_team_id_index` (`team_id`) USING BTREE,
  ADD KEY `team_user_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `bet_categories`
--
ALTER TABLE `bet_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bet_events`
--
ALTER TABLE `bet_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=660;

--
-- AUTO_INCREMENT de tabela `bet_sections`
--
ALTER TABLE `bet_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `bet_users`
--
ALTER TABLE `bet_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `games_hashes`
--
ALTER TABLE `games_hashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games_kscinus`
--
ALTER TABLE `games_kscinus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de tabela `game_exclusives`
--
ALTER TABLE `game_exclusives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
