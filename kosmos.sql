-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.2
-- Время создания: Ноя 11 2024 г., 14:06
-- Версия сервера: 8.2.0
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kosmos`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gagarin_flights`
--

CREATE TABLE `gagarin_flights` (
  `id` bigint UNSIGNED NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gagarin_flights`
--

INSERT INTO `gagarin_flights` (`id`, `data`, `created_at`, `updated_at`) VALUES
(1, '{\"landing\": {\"date\": \"1961-04-12\", \"site\": {\"name\": \"Смеловка\", \"country\": \"СССР\", \"coordinates\": {\"latitude\": 51.27, \"longitude\": 45.997}}, \"details\": {\"mpc\": 7, \"parachute_landing\": true}}, \"mission\": {\"name\": \"Восток 1\", \"spacecraft\": {\"name\": \"Восток 3KA\", \"manufacturer\": \"OKB-1\", \"crew_capacity\": 1}, \"launch_details\": {\"launch_date\": \"1961-04-12\", \"launch_site\": {\"name\": \"Космодром Байконур\", \"location\": {\"latitude\": 45.965, \"longitude\": 63.305}}}, \"flight_duration\": {\"hours\": 1, \"minutes\": 48}}, \"cosmonaut\": {\"bio\": {\"career\": \"Отобран в отряд космонавтов в 1960 году...\", \"early_life\": \"Родился в Клушино, Россия..\", \"post_flight\": \"Стал международным героем..\"}, \"name\": \"Юрий Гагарин\", \"rank\": \"Старший лейтенант\", \"birthdate\": \"1934-03-09\"}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lunar_missions`
--

CREATE TABLE `lunar_missions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `launch_details` json NOT NULL,
  `landing_details` json NOT NULL,
  `spacecraft` json NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lunar_missions`
--

INSERT INTO `lunar_missions` (`id`, `name`, `launch_details`, `landing_details`, `spacecraft`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Apollo-17', '{\"launch_date\": \"1972-12-07\", \"launch_site\": {\"name\": \"Kennedy Space Center\", \"location\": {\"latitude\": 28.5721, \"longitude\": -80.648}}}', '{\"landing_date\": \"1972-12-19\", \"landing_site\": {\"name\": \"Taurus-Littrov\", \"coordinates\": {\"latitude\": 20.1908, \"longitude\": 30.7717}}}', '{\"crew\": [{\"name\": \"Evgeniy Cernan\", \"role\": \"Commander\"}, {\"name\": \"Harrison Schmitt\", \"role\": \"Lunar module pilot\"}, {\"name\": \"Ronald Evans\", \"role\": \"Lunar module pilot\"}], \"lunar_module\": \"Challenger\", \"command_module\": \"America\"}', 5, '2024-11-11 07:07:23', '2024-11-11 07:07:23'),
(2, 'Apollo-17', '{\"launch_date\": \"1972-12-07\", \"launch_site\": {\"name\": \"Kennedy Space Center\", \"location\": {\"latitude\": 28.5721, \"longitude\": -80.648}}}', '{\"landing_date\": \"1972-12-19\", \"landing_site\": {\"name\": \"Taurus-Littrov\", \"coordinates\": {\"latitude\": 20.1908, \"longitude\": 30.7717}}}', '{\"crew\": [{\"name\": \"Evgeniy Cernan\", \"role\": \"Commander\"}, {\"name\": \"Harrison Schmitt\", \"role\": \"Lunar module pilot\"}, {\"name\": \"Ronald Evans\", \"role\": \"Lunar module pilot\"}], \"lunar_module\": \"Challenger\", \"command_module\": \"America\"}', 5, '2024-11-11 07:41:14', '2024-11-11 07:41:14'),
(3, 'Apollo-17', '{\"launch_date\": \"1972-12-07\", \"launch_site\": {\"name\": \"Kennedy Space Center\", \"location\": {\"latitude\": 28.5721, \"longitude\": -80.648}}}', '{\"landing_date\": \"1972-12-19\", \"landing_site\": {\"name\": \"Taurus-Littrov\", \"coordinates\": {\"latitude\": 20.1908, \"longitude\": 30.7717}}}', '{\"crew\": [{\"name\": \"Evgeniy Cernan\", \"role\": \"Commander\"}, {\"name\": \"Harrison Schmitt\", \"role\": \"Lunar module pilot\"}, {\"name\": \"Ronald Evans\", \"role\": \"Lunar module pilot\"}], \"lunar_module\": \"Challenger\", \"command_module\": \"America\"}', 5, '2024-11-11 07:41:37', '2024-11-11 07:41:37'),
(4, 'Apollo-17', '{\"launch_date\": \"1972-12-07\", \"launch_site\": {\"name\": \"Kennedy Space Center\", \"location\": {\"latitude\": 28.5721, \"longitude\": -80.648}}}', '{\"landing_date\": \"1972-12-19\", \"landing_site\": {\"name\": \"Taurus-Littrov\", \"coordinates\": {\"latitude\": 20.1908, \"longitude\": 30.7717}}}', '{\"crew\": [{\"name\": \"Evgeniy Cernan\", \"role\": \"Commander\"}, {\"name\": \"Harrison Schmitt\", \"role\": \"Lunar module pilot\"}, {\"name\": \"Ronald Evans\", \"role\": \"Lunar module pilot\"}], \"lunar_module\": \"Challenger\", \"command_module\": \"America\"}', 5, '2024-11-11 07:53:28', '2024-11-11 07:53:28'),
(5, 'Apollo-17', '{\"launch_date\": \"1972-12-07\", \"launch_site\": {\"name\": \"Kennedy Space Center\", \"location\": {\"latitude\": 28.5721, \"longitude\": -80.648}}}', '{\"landing_date\": \"1972-12-19\", \"landing_site\": {\"name\": \"Taurus-Littrov\", \"coordinates\": {\"latitude\": 20.1908, \"longitude\": 30.7717}}}', '{\"crew\": [{\"name\": \"Evgeniy Cernan\", \"role\": \"Commander\"}, {\"name\": \"Harrison Schmitt\", \"role\": \"Lunar module pilot\"}, {\"name\": \"Ronald Evans\", \"role\": \"Lunar module pilot\"}], \"lunar_module\": \"Challenger\", \"command_module\": \"America\"}', 5, '2024-11-11 07:57:00', '2024-11-11 07:57:00');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '0001_01_01_000000_create_users_table', 1),
(6, '0001_01_01_000001_create_cache_table', 1),
(7, '0001_01_01_000002_create_jobs_table', 1),
(8, '2024_11_07_085740_create_personal_access_tokens_table', 1),
(9, '2024_11_11_065154_create_gagarin_flights_table', 2),
(11, '2024_11_11_080646_create_lunar_missions_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 5, 'token', '8cef48d07b21312fe780055233691d9379283430ab3711e4fe542d0756d8e46d', '[\"*\"]', NULL, NULL, '2024-11-08 07:30:05', '2024-11-08 07:30:05'),
(4, 'App\\Models\\User', 5, 'token', 'acd22ab0218770035f7ab6d7e48f270d03136451734a6569ca147841a4ee6eea', '[\"*\"]', NULL, NULL, '2024-11-08 08:05:49', '2024-11-08 08:05:49'),
(5, 'App\\Models\\User', 5, 'token', '6c76d69be1f061a35f59ed48ee315d39f1dadda762f6cdd498a98d684e0bc738', '[\"*\"]', NULL, NULL, '2024-11-08 08:06:21', '2024-11-08 08:06:21'),
(6, 'App\\Models\\User', 5, 'token', '6bfcf39eca2aecc361465947bda173e52697d7a03fc0f6635b9fc974adc82571', '[\"*\"]', NULL, NULL, '2024-11-11 03:52:54', '2024-11-11 03:52:54'),
(7, 'App\\Models\\User', 5, 'token', 'e11f491ec333abc2351c931bc6e6d5ff29092efffefbfa2e3ba9936b5050b794', '[\"*\"]', NULL, NULL, '2024-11-11 03:56:09', '2024-11-11 03:56:09'),
(8, 'App\\Models\\User', 5, 'token', '160a94e9310baa73fcbd39d0df91ded16cb568292665dd3019201833983cc83a', '[\"*\"]', NULL, NULL, '2024-11-11 03:56:22', '2024-11-11 03:56:22'),
(9, 'App\\Models\\User', 5, 'token', '19fee2bafa495ff03b44def5a680511e8243e8e7fe7d9a1b823aaa6bd11d4e8e', '[\"*\"]', NULL, NULL, '2024-11-11 03:57:43', '2024-11-11 03:57:43'),
(11, 'App\\Models\\User', 5, 'token', '0b310b6b98fd2154260dda7324616b7ae1c450bae93dde6151212d689422f8c6', '[\"*\"]', '2024-11-11 07:57:00', NULL, '2024-11-11 05:55:38', '2024-11-11 07:57:00'),
(12, 'App\\Models\\User', 5, 'token', '31784e42c1db557fe3362f8ac5eb60337a59fe213fb7a79f97480fbbe93644d8', '[\"*\"]', NULL, NULL, '2024-11-11 06:29:11', '2024-11-11 06:29:11'),
(13, 'App\\Models\\User', 5, 'token', 'b811ebc6346033f59510cc777efd61ce71d9475a53a9983a1a6aff1b82f5e801', '[\"*\"]', NULL, NULL, '2024-11-11 06:30:23', '2024-11-11 06:30:23');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('c4x1vKQcQTCsG2EFFSWURppYRrXZJ6FxForloDSm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjAzdjJFZGtqdjhwcnBVQUkxOU81MThyMTlMWTZkTHlOeEV1SzU2dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHBzOi8va29zbW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731047621),
('JoN6Ak5nMGXPQct1xEEeoSpHf38XKbEFVBOImkbL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHd4Y3pwS3RPSk9aQmdvamdMdUJ3aUdpQkZtY09kWEZNZHdTWDNBVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHBzOi8va29zbW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731307424),
('MH5A9OO7De31Tc7nskPPxZCXxiljdZdQQnN9l6oK', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFFkaW9IS3lXSTlLMURqSUZXSTQ0QmlxS0VkZHlUekJCbHJvTzVmMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHBzOi8va29zbW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731049879);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `patronymic`, `email`, `password`, `birth_date`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'first', 'last', 'pat', 'emal@mail.ru', '$2y$12$a000UcF7ffMCOEfEGHDFMu0gOTKmwP5F1kupE.p2fMfW2F1mXKPmG', '2000-04-04', NULL, '2024-11-08 04:10:48', '2024-11-08 04:10:48'),
(2, 'first', 'last', 'pat', 'email@mail.ru', '$2y$12$y.qNaJWGhmPrm4PgJNfvQODRGPUOZl2RdW4gifvXpJ7js2.S06f2e', '2000-04-04', NULL, '2024-11-08 04:12:09', '2024-11-08 04:12:09'),
(3, 'first', 'last', 'pat', 'eml@mail.ru', '$2y$12$0BUcvb5jpRDNMnVEhWu6yOppa.NAeueP3ku9m5s52eUj41YuhYvD2', '2000-04-04', NULL, '2024-11-08 04:15:55', '2024-11-08 04:15:55'),
(4, 'first', 'last', 'pat', 'ml@mail.ru', '$2y$12$7E5M12vMZATKqwOSs0DnDOGhxMcCajhjWYRTXO3FsY7ZXtAR.n04m', '2000-04-04', NULL, '2024-11-08 05:56:45', '2024-11-08 05:56:45'),
(5, 'first', 'last', 'pat', 'meel@mail.ru', '$2y$12$dZ1SwaXGHRdjXWv9vPb.yOgA2VBEcxfb0dAN1w10DFXXdRlSCdeNq', '2000-04-04', NULL, '2024-11-08 06:01:36', '2024-11-08 06:01:36');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `gagarin_flights`
--
ALTER TABLE `gagarin_flights`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lunar_missions`
--
ALTER TABLE `lunar_missions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lunar_missions_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gagarin_flights`
--
ALTER TABLE `gagarin_flights`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lunar_missions`
--
ALTER TABLE `lunar_missions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lunar_missions`
--
ALTER TABLE `lunar_missions`
  ADD CONSTRAINT `lunar_missions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
