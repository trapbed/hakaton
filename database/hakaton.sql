-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 28 2025 г., 18:58
-- Версия сервера: 5.7.39
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hakaton`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `exist`, `created_at`, `updated_at`) VALUES
(1, 'Языки мира', '1', '2024-12-14 03:17:57', '2024-12-20 21:06:04'),
(2, 'Дизайн', '1', NULL, '2024-12-20 16:52:21'),
(3, 'Рисование', '1', NULL, NULL),
(4, 'Программирование', '1', NULL, NULL),
(5, 'Психология', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` bigint(20) UNSIGNED NOT NULL,
  `student_count` int(11) NOT NULL DEFAULT '0',
  `test` json DEFAULT NULL,
  `answers` json DEFAULT NULL,
  `appl` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `access` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`id`, `category`, `title`, `description`, `image`, `author`, `student_count`, `test`, `answers`, `appl`, `access`, `created_at`, `updated_at`) VALUES
(1, 1, 'Английский язык #1', 'English is main language in USA, UK, AU.', 'english_language.png', 12, 15, '{\"1\": \"json_encode\", \"2\": \"test\", \"firstitem\": 1}', '{}', '1', '1', '2024-12-14 03:18:39', '2025-01-27 05:25:13'),
(2, 1, 'Французский язык', 'Donnez-moi une suite au Ritz,\r\nJe n\'en veux pas\r\nDes bijoux de chez Chanel,\r\nJe n\'en veux pas\r\nDonnez moi une limousine,\r\nJ\'en ferais quoi\r\n', 'bonjour.png', 12, 9, NULL, NULL, '0', '0', '2024-12-14 07:30:05', '2024-12-15 08:19:40'),
(3, 1, 'Корейский язык', '인생의 행복은 여러분이 가지는 생각의 질에 달려있습니다.', 'south-korea.png', 12, 1, NULL, NULL, '0', '1', '2024-12-14 07:50:05', '2024-12-20 14:26:29'),
(4, 1, 'Испанский язык', 'Todo el mundo sabe lo que tiene, pero nadie sabe lo que eso vale.', 'spain.png', 12, 5, NULL, NULL, '0', '1', '2024-12-14 07:51:05', '2025-01-23 00:46:38'),
(5, 1, 'Немецкий язык', 'Sieben, Sieben\r\nAi lyu lyu\r\nSieben, Sieben\r\nEin, zwei\r\nSieben, Sieben\r\nAi lyu lyu\r\nEin, zwei, drei', '', 12, 7, NULL, NULL, '0', '1', '2024-12-14 07:51:05', '2025-01-23 01:09:04'),
(6, 1, 'Татарский язык', 'Что-то на татарском', 'world.png', 12, 0, NULL, NULL, '0', '1', '2024-12-14 07:51:05', '2024-12-20 16:43:47'),
(7, 1, 'Башкирский язык', 'Башкорт теле', 'world.png', 12, 1, NULL, NULL, '0', '1', '2024-12-14 07:51:05', '2024-12-20 16:49:05'),
(8, 1, 'Арабский язык', 'Арабиан лангуаге', '', 12, 0, NULL, NULL, '0', '1', '2024-12-14 07:51:05', '2024-12-14 07:51:05'),
(9, 1, 'Белорусский язык', 'дранікі \r\nса смятанай', '', 12, 0, NULL, NULL, '0', '1', '2024-12-14 08:58:05', '2024-12-14 07:58:05'),
(10, 1, 'Японсикй язык', 'смотрите аниме без озвучки, оригинале', '', 12, 1, NULL, NULL, '0', '1', '2024-12-14 08:03:05', '2024-12-20 21:12:41'),
(11, 1, 'Китайский язык', 'ну наши друзья и соседи', '', 12, 0, NULL, NULL, '0', '1', '2024-12-14 08:02:05', '2024-12-14 07:58:05'),
(12, 1, 'Марийский язык', 'Йуршо йурыш', 'bonjour.png', 12, 3, NULL, NULL, '0', '1', '2024-12-14 08:01:05', '2024-12-20 06:00:05'),
(13, 1, 'Итальянский язык', 'Ad ogni uccello il suo nido è bello', '', 12, 0, NULL, NULL, '0', '1', '2024-12-14 07:59:05', '2024-12-14 07:58:05'),
(14, 1, 'Вьетнамский язык', 'Без плохих генералов не было бы хороших.', '', 12, 0, NULL, NULL, '0', '1', '2024-12-14 07:58:05', '2024-12-14 07:58:05'),
(15, 4, 'C##', 'Основы языка', 'C:\\OSPanel\\userdata\\temp\\upload\\php991F.tmp', 12, 0, NULL, NULL, '1', '0', NULL, '2024-12-20 09:12:42'),
(16, 4, 'C++', 'Основы ЯП', 'C:\\OSPanel\\userdata\\temp\\upload\\php2780.tmp', 12, 0, NULL, NULL, '1', '1', NULL, '2024-12-20 17:40:03'),
(17, 4, 'C#', 'Base of C# programming language', 'c-sharp.png', 12, 0, NULL, NULL, '1', '1', NULL, '2025-01-23 00:36:03'),
(18, 4, 'C#', 'Base of C# programming language', 'c-sharp.png', 12, 0, NULL, NULL, '1', '0', NULL, '2025-01-23 00:35:47'),
(19, 4, 'C#', 'Base of C# programming language', 'c-sharp.png', 12, 0, NULL, NULL, '0', '0', NULL, NULL),
(20, 3, 'Маленькие наброски', 'Учимся рисовать быстро небольшие картинки', 'human.png', 12, 0, NULL, NULL, '0', '0', NULL, NULL),
(21, 4, 'Основы JS', 'Основы javascript', 'fireworks.png', 12, 0, NULL, NULL, '0', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `course_applications`
--

CREATE TABLE `course_applications` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `wish_access` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Отправлена','Принята','Отклонена') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Отправлена',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `course_applications`
--

INSERT INTO `course_applications` (`id`, `course_id`, `wish_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 15, '1', 'Отклонена', '2024-12-20 19:03:29', '2024-12-20 23:34:42'),
(2, 16, '1', 'Принята', '2024-12-21 01:07:57', '2024-12-20 23:40:03'),
(3, 17, '1', 'Принята', '2024-12-21 01:08:44', '2024-12-20 23:40:06'),
(4, 18, '1', 'Принята', '2024-12-21 01:08:59', '2024-12-20 23:40:08');

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci,
  `deadline` datetime NOT NULL,
  `comments` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `title`, `content`, `task`, `deadline`, `comments`, `created_at`, `updated_at`) VALUES
(24, 1, 'Название урока', '[{\"txt\":\"\\u0417\\u0434\\u0435\\u0441\\u044c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043d\\u0430\\u0445\\u043e\\u0434\\u0438\\u0442\\u0441\\u044f \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043b\\u044e\\u0431\\u043e\\u0433\\u043e \\u0431\\u043b\\u043e\\u043a\\u0430 \\u0438\\u0437 \\u0443\\u0440\\u043e\\u043a\\u043e\\u0432\"},{\"img\":\"articles-1024x576.png\"},{\"txt\":\"\\u0422\\u0430\\u043a \\u0432\\u044b\\u0433\\u043b\\u044f\\u0434\\u0438\\u0442 \\u0435\\u0449\\u0435 \\u043e\\u0434\\u0438\\u043d \\u0431\\u043b\\u043e\\u043a \\u0441 \\u043a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442\\u043e\\u043c \\u0443\\u0440\\u043e\\u043a\\u0430\"}]', NULL, '2025-01-31 12:06:56', NULL, NULL, NULL),
(25, 5, 'Урок №2', '[{\"txt\":\"\\u0417\\u0434\\u0435\\u0441\\u044c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0438\\u043b\\u0438 \\u043f\\u0430\\u0440\\u0430\\u0433\\u0440\\u0430\\u0444\"},{\"img\":\"imya-syshchestvitelnoe.jpg\"},{\"txt\":\"\\u0414\\u043e\\u043f\\u0443\\u0441\\u0442\\u0438\\u043c, \\u0432\\u0442\\u043e\\u0440\\u043e\\u0439 \\u043f\\u0430\\u0440\\u0430\\u0433\\u0440\\u0430\\u0444.\"},{\"img\":\"articles-1024x576.png\"},{\"txt\":\"\\u0418...\\u0415\\u0449\\u0435 \\u043f\\u0430\\u0440\\u0430\\u0433\\u0440\\u0430\\u0444!!!\"}]', NULL, '2025-01-31 00:00:00', NULL, NULL, NULL),
(26, 1, 'Заголовок №3', '[{\"txt\":\"Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text\"},{\"img\":\"articles-1024x576.png\"},{\"img\":\"articles-1024x576.png\"},{\"img\":\"articles-1024x576.png\"},{\"txt\":\"\\u0414\\u043b\\u0438\\u043d\\u0430 \\u0442\\u0435\\u043a\\u0441\\u0442\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u043e\\u043b\\u044f \\u043c\\u0438\\u043d\\u0438\\u043c\\u0443\\u043c 10 \\u0441\\u0438\\u043c\\u0432\\u043b\\u043e\\u0432\"}]', NULL, '2025-01-24 00:00:00', NULL, NULL, NULL),
(27, 1, 'Лессон №2', '{\"1\":{\"img\":\"articles-1024x576.png\"},\"2\":{\"txt\":\"\\u0439\\u0446\\u0448\\u043e\\u0440\\u043c\\u043b\\u0434\\u043b\\u043e\\u0440\\u0430\\u043f\\u043b\\u0434\\u0442\\u044c\\u0438\\u043b\\u0434\\u0436\\u044d\"}}', NULL, '2025-01-25 00:00:00', NULL, NULL, NULL),
(28, 1, 'qqqqqqqqqqqqqqqqqqqqq', '[]', 'qweqweqweqwe', '2025-01-25 23:20:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_12_11_135000_create_categories_table', 1),
(4, '2024_12_11_135854_create_courses_table', 1),
(5, '2024_12_11_140522_create_lessons_table', 1),
(6, '2024_12_14_153855_create_users_applications_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rate_course`
--

CREATE TABLE `rate_course` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rate_course`
--

INSERT INTO `rate_course` (`id`, `user_id`, `course_id`, `rate`) VALUES
(1, 16, 1, 10),
(2, 16, 1, 10),
(3, 16, 1, 10),
(4, 16, 1, 10),
(5, 16, 1, 10),
(6, 16, 1, 10),
(7, 16, 1, 10),
(8, 16, 1, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Выгружен','Проверен') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Выгружен',
  `mark` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `uploads`
--

INSERT INTO `uploads` (`id`, `user_id`, `lesson_id`, `file`, `status`, `mark`, `comments`) VALUES
(1, 4, 28, 'name_file', 'Проверен', 5, NULL),
(2, 4, 28, 'user_2.pdf', 'Проверен', 5, 'grfrg'),
(3, 4, 28, 'user_work.word', 'Проверен', 5, 'Коммент'),
(4, 16, 28, 'education_platform (2).sql', 'Проверен', 5, 'ihi');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','student','author') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `all_courses` json DEFAULT NULL,
  `completed_courses` json DEFAULT NULL,
  `blocked` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `password`, `all_courses`, `completed_courses`, `blocked`, `created_at`, `updated_at`) VALUES
(1, 'rori6688', 'rori@mail.ru', 'admin', '$2y$10$Y4ZoWaaS1DdlJXZgdhbX.eRroYJi7fNU1B3lwFZKSaNwSpcVZ0/Jy', NULL, NULL, '1', '2024-12-11 09:36:25', '2024-12-20 23:27:47'),
(2, 'capricorn', 'capricorn@mail.ru', 'author', '$2a$12$1niF81UCklKbUHQ/o6nhVeHldYRlbOZDJIsV7KmOS5OA51LZFHA/u\n', NULL, NULL, '0', '2024-12-11 10:33:19', '2024-12-18 01:42:24'),
(4, 'hopecore', 'hopecore@mail.ru', 'author', '$2y$10$UnuudxI6zbBQNnZG4FtCvuSAHccz7bXznhf.N2NvFGeFFe/m4nYYy', NULL, NULL, '0', '2024-12-11 10:50:40', '2024-12-11 10:50:40'),
(10, 'trapbed', 'trapbed@mail.ru', 'admin', '$2a$12$gcBRwBZw6pES7JRs7tbZG.bM2yU4XGFcogG17is6oXCSqEMQ68aY6', NULL, NULL, '0', '2024-12-13 19:53:42', '2025-01-23 00:36:36'),
(11, 'ivan_d', 'ivan@mail.ru', 'student', '$2y$10$htYI45ZwHj8SbkY8G2cZ6.0Y4ByuJvA6ZiPkDVfAiBseKQ4jufJV6', NULL, NULL, '0', '2024-12-15 04:01:53', '2024-12-18 01:42:50'),
(12, 'vitaliy', 'vitya@mail.ru', 'author', '$2y$10$Iu.nOQvp.yjYpRTVbdLDaeDmFQY.ua2kjLlOZLJaq3YCVlHqor4bO', NULL, NULL, '0', '2024-12-16 06:38:51', '2024-12-16 06:38:51'),
(13, 'bob999', 'bob@b.b', 'student', '$2y$10$8jXsKkqVhu7UKgxcMClP0.R9OH.HrYmxVO5O35.u3uviEmM0Oct9q', NULL, NULL, '0', '2024-12-18 01:48:35', '2024-12-18 01:48:35'),
(14, 'Елизавета', 'elizabet@mail.ru', 'student', '$2y$10$WKMWJMCGY3M5SveZIUx8F.zRziEezjl8j09Y92R4x32GLvrDGa5..', '{\"courses\": [1, 3, 5, 4, 7]}', '{\"courses\": [1, 5]}', '0', '2024-12-10 10:16:41', '2024-12-20 19:14:07'),
(15, 'normal', 'normal@normal.ru', 'student', '$2y$10$p085l4ZZlGMcGfmZEHRsyOq0TNJVnR04SnSnPrLDYEFcWrX/HMTh6', '{\"courses\": [10, 1, 4]}', '{\"courses\": [\"1\"]}', '0', '2024-12-20 21:10:57', '2024-12-20 23:30:52'),
(16, 'johnjohn', 'john@mail.ru', 'student', '$2y$10$TT0GglDJ2/y87ijb6vIIJ.f/niUdedDDdMHE0SZCxHNRUc6r.q4Fe', '{\"courses\": [1, 4, 5]}', '{\"courses\": [\"1\"]}', '0', '2025-01-23 00:29:10', '2025-01-26 06:21:40'),
(17, 'Ivanov Ivan Ivanovich', 'ivanivan@mail.ru', 'student', '$2y$10$D1Az/U1z7xxRdiJuw3Qn.u3tVMoMvyLWCVuVCemDx8EYE0g9jKtnq', NULL, NULL, '0', '2025-01-25 02:41:41', '2025-01-25 02:41:41'),
(18, 'normal_name', 'normal_name@m.m', 'student', '$2y$10$HCqPTHwv1bhB3n6w7feso.FAKdf5prVLubLnoyhDkfzfzY0pqKmd6', '{\"courses\": [\"1\"]}', NULL, '0', '2025-01-27 05:25:06', '2025-01-27 05:25:13');

-- --------------------------------------------------------

--
-- Структура таблицы `user_applications`
--

CREATE TABLE `user_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `current_status` enum('student','admin','author') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `status_appl` enum('Отправлена','Принята','Отклонена') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wish_status` enum('admin','author') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_applications`
--

INSERT INTO `user_applications` (`id`, `user_id`, `current_status`, `date`, `status_appl`, `wish_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'student', '2024-12-14 00:00:00', 'Принята', 'admin', NULL, '2024-12-18 01:41:57'),
(2, 2, 'student', '2024-12-14 00:00:00', 'Принята', 'author', NULL, '2024-12-18 01:42:24');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_foreign` (`category`),
  ADD KEY `courses_author_foreign` (`author`);

--
-- Индексы таблицы `course_applications`
--
ALTER TABLE `course_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Индексы таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `rate_course`
--
ALTER TABLE `rate_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`course_id`);

--
-- Индексы таблицы `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`lesson_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_applications`
--
ALTER TABLE `user_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_applications_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `course_applications`
--
ALTER TABLE `course_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rate_course`
--
ALTER TABLE `rate_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `user_applications`
--
ALTER TABLE `user_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_author_foreign` FOREIGN KEY (`author`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_category_foreign` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_applications`
--
ALTER TABLE `user_applications`
  ADD CONSTRAINT `user_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
