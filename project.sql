-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 07, 2022 at 08:24 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `url`, `created_at`, `updated_at`) VALUES
(1, 'public/banner-image/2020-10-02-21-45-39.jpeg', 'http://localhost/php-attendance/', '2020-10-02 23:15:24', '2020-10-05 00:22:47'),
(2, 'public/banner-image/2020-10-04-22-52-47.jpeg', 'http://localhost/php-attendance/', '2020-10-02 23:15:39', '2020-10-05 00:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(10, 'اقتصادی', '2019-07-13 12:32:56', '2019-07-13 16:06:36'),
(11, 'سیاسی', '2019-07-13 12:33:01', '2019-07-13 16:06:40'),
(13, 'خبری', '2019-07-13 12:33:12', '2020-08-03 01:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_persian_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` enum('unseen','seen','approved') COLLATE utf8_persian_ci NOT NULL DEFAULT 'unseen',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(20, 1, 'hello', 22, 'approved', '2020-08-11 01:49:46', '2020-10-04 23:55:00'),
(22, 1, 'test', 22, 'approved', '2020-10-04 23:56:16', '2021-10-21 19:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `url` varchar(300) COLLATE utf8_persian_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `parent_id`, `created_at`, `updated_at`) VALUES
(7, 'خانه', '/php-attendance/', NULL, '2019-07-17 12:04:56', '2020-10-04 23:59:18'),
(8, 'اخبار ویژه', '/admin-panel', NULL, '2019-07-17 12:05:03', '2020-06-19 22:44:30'),
(9, 'برترین ها', '/admin-panel', NULL, '2019-07-17 12:05:11', '2020-06-19 22:44:28'),
(10, 'درباره ما', '/admin-panel', NULL, '2019-07-17 12:05:22', '2020-06-19 22:44:13');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `summary` text COLLATE utf8_persian_ci NOT NULL,
  `body` text COLLATE utf8_persian_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `image` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `status` enum('disable','enable') COLLATE utf8_persian_ci NOT NULL DEFAULT 'disable',
  `selected` tinyint(5) NOT NULL DEFAULT 1,
  `breaking_news` tinyint(5) NOT NULL DEFAULT 1,
  `published_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `summary`, `body`, `view`, `user_id`, `cat_id`, `image`, `status`, `selected`, `breaking_news`, `published_at`, `created_at`, `updated_at`) VALUES
(15, 'نظام بانکی کشور نیاز به تغییر ندارد', 'به گفته ی رییس بانک مرکزی نظام بانکی ایران نیاز به تغییر ندارد', '<p>به گفته ی رییس بانک مرکزی نظام بانکی ایران نیاز به تغییر ندارد</p>\r\n', 1, 1, 13, 'public/post-image/2020-10-03-22-29-06.jpeg', 'disable', 1, 0, '1970-01-01 01:00:00', '2019-07-17 12:10:04', '2021-10-21 19:09:32'),
(21, 'واحدهای صندوق ', 'به گزارش خبرنگار اقتصادی خبرگزاری تسنیم، نخستین صندوق سرمایه‌گذاری قابل معامله دولتی تخحت عنوان \"دارا یکم\" که از سهام سه بانک و دو شرکت بیمه‌ای دولتی تشکیل شده است، پس از پذیره نویسی از جانب بانک‌ها و کارگزاری‌های بورس، از چهارم تیرماه جاری در بورس قابل معامله خواهد بود.\r\n\r\nبه گفته علی صحرایی مدیرعامل شرکت بورس تهران، معاملات این صندوق مانند سایر صندوق‌های سرمایه‌گذاری موجود در بازار سهام آغاز می‌شود و با این اقدام ابزاری جدید به بازار سرمایه در حوزه بانک و بیمه به سبد محصولات مالی اضافه می‌شود.\r\n\r\nاین گزارش می‌افزاید: وزیر اقتصاد به تازگی با اشاره به عرضه واحدهای صندوق ETF در اردیبهشت ماه گفت: این عرضه نخستین تجربه ما در واگذاری این صندوق‌ها بود که از طریق آن بزرگ‌ترین صندوق ETF کشور شکل گرفت.\r\n\r\nفرهاد دژپسند همچنین با بیان این که ارزش واحدهای خریداری‌شده این صندوق تاکنون دو برابر شده است، گفت: حدود سه میلیون و 600 هزار نفر واحدها و یونیت‌های نخستین صندوق ETF را خریداری کردند.\r\n\r\nوی با بیان اینکه باقیمانده سهام دولتی عرضه خواهد شد، گفت: در حال برنامه‌ریزی هستیم تا دو ماه آینده دومین صندوق ای‌تی‌اف را نیز در بازار سرمایه عرضه کنیم.', '<p>به گزارش خبرنگار اقتصادی خبرگزاری تسنیم، نخستین صندوق سرمایه&zwnj;گذاری قابل معامله دولتی تخحت عنوان &quot;دارا یکم&quot; که از سهام سه بانک و دو شرکت بیمه&zwnj;ای دولتی تشکیل شده است، پس از پذیره نویسی از جانب بانک&zwnj;ها و کارگزاری&zwnj;های بورس، از چهارم تیرماه جاری در بورس قابل معامله خواهد بود. به گفته علی صحرایی مدیرعامل شرکت بورس تهران، معاملات این صندوق مانند سایر صندوق&zwnj;های سرمایه&zwnj;گذاری موجود در بازار سهام آغاز می&zwnj;شود و با این اقدام ابزاری جدید به بازار سرمایه در حوزه بانک و بیمه به سبد محصولات مالی اضافه می&zwnj;شود. این گزارش می&zwnj;افزاید: وزیر اقتصاد به تازگی با اشاره به عرضه واحدهای صندوق ETF در اردیبهشت ماه گفت: این عرضه نخستین تجربه ما در واگذاری این صندوق&zwnj;ها بود که از طریق آن بزرگ&zwnj;ترین صندوق ETF کشور شکل گرفت. فرهاد دژپسند همچنین با بیان این که ارزش واحدهای خریداری&zwnj;شده این صندوق تاکنون دو برابر شده است، گفت: حدود سه میلیون و 600 هزار نفر واحدها و یونیت&zwnj;های نخستین صندوق ETF را خریداری کردند. وی با بیان اینکه باقیمانده سهام دولتی عرضه خواهد شد، گفت: در حال برنامه&zwnj;ریزی هستیم تا دو ماه آینده دومین صندوق ای&zwnj;تی&zwnj;اف را نیز در بازار سرمایه عرضه کنیم.</p>\r\n', 1, 1, 11, 'public/post-image/2020-10-03-22-28-49.jpeg', 'disable', 1, 1, '1970-01-01 01:00:00', '2020-06-19 22:37:10', '2021-10-21 19:09:17'),
(22, 'مهلت آزادسازی سهام عدالت کماکان ادامه دارد/ ابهامات کماکان پابرجا!', 'در حالی که دیشب (۵ شنبه) آخرین مهلت تعیین روش آزادسازی سهام عدالت توسط مشمولان بود، همچنان امکان مراجعه به سامانه سهام عدالت و انتخاب گزینه روش مستقیم وجود دارد.\r\n', '<p>ه گزارش خبرنگار اقتصادی خبرگزاری تسنیم، امکان انتخاب روش مستقیم سهامداری از سوی مشمولان سهام عدالت در حالی از روز 10 اردیبهشت در حال انجام است که این مهلت در روز 8 خرداد به پایان رسید اما این مهلت تا روز 5شنبه، 29 خرداد تمدید شد. با این حال با وجود پایان یافتن این مهلت، همچنان امکان مراجعه به سامانه سهام عدالت و انتخاب گزینه روش مستقیم وجود دارد. بر این اساس دارندگان سهام عدالت برای انتخاب روش مستقیم آزادسازی سهام عدالت خود باید به سامانه سهام عدالت مراجعه و در این زمینه اقدام کنند. همچنین عدم مراجعه به سایت WWW.SAMANESE.ir به معنی انتخاب روش غیرمستقیم است. این گزارش می&zwnj;افزاید: تاکنون 20 میلیون نفر از دارندگان سهام عدالت روش مستقیم را برای مدیریت سهام خود انتخاب کرده&zwnj;اند و طبق آمار حدود یک میلیون نفر نیز تاکنون سهام عدالت را فروخته&zwnj;اند. گفتنی است در حالی انتخاب روش آزادسازی سهام عدالت ادامه دارد که کماکان ابهامات مربوط به مزایا و معایب هر یک از روش&zwnj;های مستقیم و غیرمستقیم از طریق متولیان امر بویژه سازمان خصوصی&zwnj;سازی مشخص و اطلاع&zwnj;رسانی نشده و سهامداران عدالت در میان این دو روش سردرگم و سرگردان هستند.</p>\r\n', 65, 1, 13, 'public/post-image/2020-10-03-22-29-21.jpeg', 'disable', 0, 1, '1970-01-01 01:00:00', '2020-06-19 22:37:55', '2020-10-05 02:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `permission` enum('user','admin') COLLATE utf8_persian_ci NOT NULL DEFAULT 'user',
  `verify_token` varchar(191) COLLATE utf8_persian_ci DEFAULT NULL,
  `is_active` tinyint(5) NOT NULL DEFAULT 0,
  `forgot_token` varchar(191) COLLATE utf8_persian_ci DEFAULT NULL,
  `forgot_token_expire` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permission`, `verify_token`, `is_active`, `forgot_token`, `forgot_token_expire`, `created_at`, `updated_at`) VALUES
(1, 'kamran', 'kamran@gmail.com', '$2y$10$nlZ5dMJ2sv9HrKU4NJslDe0ick10lGSBZNM2i14zKtDGGAEqAdXVS', 'admin', NULL, 1, NULL, NULL, '2019-06-06 01:28:40', '2019-10-27 21:59:41'),
(4, 'nima', 'nima@yahoo.com', '$2y$10$CrqnkHtp2dKlyHfYRniXG.B8fWtrHtfavUyGVqc6bdiiF5lgwzi96', 'admin', NULL, 0, NULL, NULL, '2019-10-27 21:56:13', '2019-10-27 22:18:23'),
(5, 'usertest', 'test@yahoo.com', '$2y$10$FT8tF4bv55XiNKo2fvbAL.dPhJ82nFHeE3YH/2Uk6B76yOfQxIRmC', 'user', NULL, 0, NULL, NULL, '2020-04-09 02:25:39', '2020-08-03 00:25:59'),
(7, 'رامین', 'raminfaramarzi93@gmail.com', '$2y$10$LyiScQzrqyBB0QJs7K6FQOogYGYwLC6f5CMBwZtlHUp9hd8T0W72q', 'admin', '99297db4d6a61ca678dd0716e7c1103eb4733a05e88cd1ff5270c84f455cc243', 1, '02e01853f2d98e0f711e22ce983a7254e2ecc03aed1218cc57d9e8277947a0d1', '2020-10-05 00:39:17', '2020-10-02 20:17:02', '2020-10-05 01:56:34'),
(8, 'test', 'test@gmail.com', '$2y$10$ce0UJPJv2RO/U8hzXfGrJu/Kp61mQxlTdn72m39CiG9Z3HGS5stWW', 'user', 'f85a429aa94e6eef4744696f93b1b30db96c5c984efea30d1472d4e278e84dfb', 1, NULL, NULL, '2020-10-02 20:37:03', '2020-10-02 20:37:18'),
(9, 'testi', 'testi@gmail.com', '$2y$10$Iev2EnU0jOTyeElPj.IWS.9B0.9gxu3qA8OOKWbExDdiz5e8m9.b.', 'user', '67ea2b0666c0ff11aff4283e6ba037ccfea315bb19edbdd7b12983ef06e952be', 1, NULL, NULL, '2020-10-05 01:24:52', '2020-10-05 01:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `websetting`
--

CREATE TABLE `websetting` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_persian_ci DEFAULT NULL,
  `description` text COLLATE utf8_persian_ci DEFAULT NULL,
  `keywords` text COLLATE utf8_persian_ci DEFAULT NULL,
  `logo` text COLLATE utf8_persian_ci DEFAULT NULL,
  `icon` text COLLATE utf8_persian_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `websetting`
--

INSERT INTO `websetting` (`id`, `title`, `description`, `keywords`, `logo`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'وبسایت خبری', ' وبسایت خبری', ' وبسایت خبری', 'public/setting/logo.png', 'public/setting/icon.png', '2019-06-09 19:54:37', '2020-10-05 00:48:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `websetting`
--
ALTER TABLE `websetting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `websetting`
--
ALTER TABLE `websetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
