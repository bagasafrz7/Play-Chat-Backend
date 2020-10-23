-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Okt 2020 pada 16.58
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `play_chat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_friend`
--

CREATE TABLE `list_friend` (
  `id_list_friend` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `list_friend`
--

INSERT INTO `list_friend` (`id_list_friend`, `user_id`, `friend_id`) VALUES
(1, 1, 2),
(2, 1, 4),
(3, 1, 3),
(4, 2, 1),
(5, 2, 5),
(6, 2, 4),
(7, 2, 3),
(8, 4, 1),
(9, 4, 2),
(10, 13, 1),
(11, 13, 2),
(12, 14, 1),
(13, 14, 2),
(14, 15, 4),
(15, 15, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `message_crated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `messages`
--

INSERT INTO `messages` (`message_id`, `room_id`, `sender_id`, `receiver_id`, `message`, `message_crated_at`) VALUES
(1, 1234, 1, 2, 'oi', '2020-10-15 13:54:09'),
(2, 1234, 2, 1, 'ape ngab?', '2020-10-15 13:54:09'),
(3, 4321, 1, 3, 'Bang?', '2020-10-15 13:56:03'),
(4, 4321, 3, 1, 'Ape?', '2020-10-15 13:56:03'),
(5, 4281, 1, 4, 'Hallo', '2020-10-15 14:17:43'),
(6, 4281, 4, 1, 'Iyaa, hallo juga', '2020-10-15 14:18:19'),
(7, 1234, 1, 2, 'Lagi dimana?', '2020-10-18 06:48:41'),
(8, 1234, 2, 1, 'Di basecamp nih, buru sini', '2020-10-18 06:56:59'),
(9, 1234, 1, 2, 'Oke, otw nih', '2020-10-18 06:57:38'),
(10, 1234, 2, 1, 'Oke ditunggu', '2020-10-18 07:43:48'),
(11, 1234, 1, 2, 'Nanti gue bawain kopi', '2020-10-18 08:30:10'),
(12, 1234, 2, 1, 'Oke mantap', '2020-10-19 07:48:36'),
(13, 1234, 1, 2, 'Udah ada siapa aja?', '2020-10-19 12:48:04'),
(14, 1234, 2, 1, 'Udah rame nih, tinggal elu doang', '2020-10-19 12:53:40'),
(15, 1234, 1, 2, 'Wkwkwk sorry, gue langsung otw nih', '2020-10-19 12:56:33'),
(16, 1234, 2, 1, 'Yaudah buru sini', '2020-10-19 12:57:57'),
(17, 1234, 1, 2, 'Iyee ini otw', '2020-10-19 13:01:48'),
(18, 1234, 2, 1, 'Oi', '2020-10-23 03:30:15'),
(19, 1234, 1, 2, 'Apa?', '2020-10-23 04:00:13'),
(20, 1234, 2, 1, 'Besok jadi ga?', '2020-10-23 04:00:39'),
(21, 1234, 1, 2, 'Jadi dong', '2020-10-23 04:01:57'),
(22, 1234, 2, 1, 'Oke mantap', '2020-10-23 04:03:33'),
(23, 1234, 1, 2, 'Yoiii', '2020-10-23 04:03:57'),
(24, 1234, 2, 1, 'Gas', '2020-10-23 04:04:44'),
(25, 1234, 1, 2, 'Apa?', '2020-10-23 08:21:38'),
(26, 1234, 2, 1, 'Jadi skuy ga?', '2020-10-23 08:21:58'),
(27, 1234, 1, 2, 'Jadi', '2020-10-23 08:22:05'),
(28, 4321, 1, 3, 'Oi', '2020-10-23 08:22:15'),
(29, 1234, 2, 1, 'Mantap', '2020-10-23 08:22:49'),
(30, 4281, 1, 4, 'Halo Mawar', '2020-10-23 08:58:43'),
(31, 1234, 1, 2, 'Okelah kalo begitu', '2020-10-23 09:01:30'),
(32, 1234, 2, 1, 'Siap', '2020-10-23 09:01:57'),
(33, 4281, 4, 1, 'Ada apa gas?', '2020-10-23 09:04:58'),
(34, 4281, 1, 4, 'Besok gimana? jadi kan?', '2020-10-23 09:05:34'),
(35, 4281, 4, 1, 'Jadi kok, tenang aja', '2020-10-23 09:06:50'),
(36, 1234, 1, 2, 'Oi din', '2020-10-23 09:07:03'),
(37, 1234, 2, 1, 'Ape gas?', '2020-10-23 09:10:51'),
(38, 1234, 1, 2, 'Bromo apa kabar?', '2020-10-23 09:17:47'),
(39, 1234, 2, 1, 'Gatau nih bingung', '2020-10-23 09:18:05'),
(40, 1234, 1, 2, 'Gimana kalo ganti aja?', '2020-10-23 09:18:17'),
(41, 1234, 2, 1, 'Boleh tuh', '2020-10-23 09:18:37'),
(42, 1234, 1, 2, 'Kalo Rinjani gimana?', '2020-10-23 09:22:56'),
(43, 1234, 2, 1, 'Gokil, ide bagus tuh', '2020-10-23 09:26:13'),
(44, 1234, 1, 2, 'Nanti gue kabarin yang lain', '2020-10-23 09:26:32'),
(45, 1234, 2, 1, 'Siap', '2020-10-23 09:27:10'),
(46, 1234, 1, 2, 'Siapin dananya aje wkwkw', '2020-10-23 09:28:08'),
(47, 1234, 2, 1, 'Wkwkwk aman itu mah', '2020-10-23 09:28:48'),
(48, 4281, 1, 4, 'Nanti gue jemput di tempat biasa ya', '2020-10-23 09:29:09'),
(49, 4281, 4, 1, 'Oke gas wkwkw', '2020-10-23 09:29:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_chat`
--

CREATE TABLE `room_chat` (
  `id_roomchat` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `roomchat_crated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `room_chat`
--

INSERT INTO `room_chat` (`id_roomchat`, `sender_id`, `friend_id`, `room_id`, `roomchat_crated_at`, `status`) VALUES
(1, 1, 2, 1234, '2020-10-15 04:06:42', 0),
(2, 2, 1, 1234, '2020-10-15 04:06:42', 0),
(3, 1, 3, 4321, '2020-10-15 12:40:45', 0),
(4, 3, 1, 4321, '2020-10-15 12:40:45', 0),
(10, 1, 4, 4281, '2020-10-15 13:39:55', 0),
(11, 4, 1, 4281, '2020-10-15 13:39:55', 0),
(12, 1, 5, 2435, '2020-10-15 13:40:25', 0),
(13, 5, 1, 2435, '2020-10-15 13:40:25', 0),
(14, 2, 3, 5324, '2020-10-16 09:06:25', 0),
(15, 3, 2, 5324, '2020-10-16 09:06:26', 0),
(16, 2, 4, 3305, '2020-10-16 09:08:39', 0),
(17, 4, 2, 3305, '2020-10-16 09:08:40', 0),
(18, 2, 5, 2622, '2020-10-16 09:09:46', 0),
(19, 5, 2, 2622, '2020-10-16 09:09:46', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `user_phone` char(13) NOT NULL,
  `user_bio` varchar(255) NOT NULL,
  `user_status` int(1) NOT NULL,
  `user_key` int(11) NOT NULL,
  `user_lat` varchar(255) NOT NULL,
  `user_lng` varchar(255) NOT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `user_fullname`, `user_email`, `user_password`, `user_name`, `user_image`, `user_phone`, `user_bio`, `user_status`, `user_key`, `user_lat`, `user_lng`, `user_created_at`, `user_updated_at`) VALUES
(1, 'Bagas', 'bagasafrz7@gmail.com', '$2b$10$bxGOBAdU0x6B86H8MiMnkuoh6g1o2DjQ92AWOcE9Oko6viSdIspem', 'bagass_i', 'user_image-2020-09-27T09-52-54.758Z-nial.jpg', '085948372635', 'Ini bio tentang Bagas Afrizal', 1, 0, '-6.1701796', '106.6403236', '2020-09-23 14:04:41', '2020-09-27 09:52:54'),
(2, 'Udin Raharja', 'udin@gmail.com', '$2b$10$G9FjJyMWL64VV4Wx6te4sOZ9qbTTTurkN5QbtSaYpLfDI8lssrPUe', 'udin_', 'user_image-2020-09-25T09-51-21.007Z-luis.jpg', '098474827364', 'Ini bio tentang Udin', 1, 0, '-6.1701796', '106.6403236', '2020-09-23 16:32:07', '2020-09-25 09:51:21'),
(3, 'Sergio Aguero', 'aguero@gmail.com', '$2b$10$bK0YJ4pN1VJe7eea3mR3jO9RwUyHSTwDj9Wt.Gxm2zBEW/SGpa95K', 'aguero_', 'user_image-2020-09-25T09-46-06.814Z-luis.jpg', '2147483647', 'Ini bio tentang sergio aguero', 1, 0, '-6.1701796', '106.6403236', '2020-09-24 04:30:38', '2020-09-25 09:46:07'),
(4, 'mawar De Jongh', 'mawar@gmail.com', '$2b$10$i2pOEUnBj5guZ5/VpvRpbO2Ot9m/ydX6x.SoIuIoZ7ARPGTHDbAm6', 'mawarrr', 'user_image-2020-09-28T14-52-00.484Z-mawar.jpg', '098983928423', 'Apa aje boleh', 1, 0, '-6.1701796', '106.6403236', '2020-09-25 14:04:44', '2020-09-28 14:52:00'),
(5, 'Criss Jhon', 'jhon@gmail.com', '$2b$10$VPaw9dthPMFZwOajBuogs.affaxnwlSIMa8NoERRXUxDs4qbQiBYK', 'cris.jhon', 'user_image-2020-09-27T13-44-55.390Z-nial.jpg', '09798448734', 'Apa aje boleh', 1, 0, '-6.1701796', '106.6403236', '2020-09-27 09:54:59', '2020-09-27 13:44:55'),
(16, 'Zahra', 'zahra@gmail.com', '$2b$10$ZwrjIYqLXacECvS5Wfzw8uH4UBbBWZNeZPvp6CQ8jdikuu9jiK0ey', '', 'blank-user.png', '', '', 1, 0, '-6.1701796', '106.6403236', '2020-10-14 06:23:41', '2020-10-14 06:23:41');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `list_friend`
--
ALTER TABLE `list_friend`
  ADD PRIMARY KEY (`id_list_friend`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indeks untuk tabel `room_chat`
--
ALTER TABLE `room_chat`
  ADD PRIMARY KEY (`id_roomchat`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `list_friend`
--
ALTER TABLE `list_friend`
  MODIFY `id_list_friend` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `room_chat`
--
ALTER TABLE `room_chat`
  MODIFY `id_roomchat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
