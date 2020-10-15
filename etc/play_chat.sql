-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Okt 2020 pada 16.27
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
(6, 4281, 4, 1, 'Iyaa, hallo juga', '2020-10-15 14:18:19');

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
(13, 5, 1, 2435, '2020-10-15 13:40:25', 0);

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
(1, 'Bagas', 'bagasafrz7@gmail.com', '$2b$10$bxGOBAdU0x6B86H8MiMnkuoh6g1o2DjQ92AWOcE9Oko6viSdIspem', 'bagass_i', 'user_image-2020-09-27T09-52-54.758Z-nial.jpg', '085948372635', 'Ini bio tentang Bagas Afrizal', 1, 0, '', '', '2020-09-23 14:04:41', '2020-09-27 09:52:54'),
(2, 'Udin Raharja', 'udin@gmail.com', '$2b$10$G9FjJyMWL64VV4Wx6te4sOZ9qbTTTurkN5QbtSaYpLfDI8lssrPUe', 'udin_', 'user_image-2020-09-25T09-51-21.007Z-luis.jpg', '098474827364', 'Ini bio tentang Udin', 1, 0, '', '', '2020-09-23 16:32:07', '2020-09-25 09:51:21'),
(3, 'Sergio Aguero', 'aguero@gmail.com', '$2b$10$bK0YJ4pN1VJe7eea3mR3jO9RwUyHSTwDj9Wt.Gxm2zBEW/SGpa95K', 'aguero_', 'user_image-2020-09-25T09-46-06.814Z-luis.jpg', '2147483647', 'Ini bio tentang sergio aguero', 1, 0, '', '', '2020-09-24 04:30:38', '2020-09-25 09:46:07'),
(4, 'mawar De Jongh', 'mawar@gmail.com', '$2b$10$i2pOEUnBj5guZ5/VpvRpbO2Ot9m/ydX6x.SoIuIoZ7ARPGTHDbAm6', 'mawarrr', 'user_image-2020-09-28T14-52-00.484Z-mawar.jpg', '098983928423', 'Apa aje boleh', 1, 0, '', '', '2020-09-25 14:04:44', '2020-09-28 14:52:00'),
(5, 'Criss Jhon', 'jhon@gmail.com', '$2b$10$VPaw9dthPMFZwOajBuogs.affaxnwlSIMa8NoERRXUxDs4qbQiBYK', 'cris.jhon', 'user_image-2020-09-27T13-44-55.390Z-nial.jpg', '09798448734', 'Apa aje boleh', 1, 0, '', '', '2020-09-27 09:54:59', '2020-09-27 13:44:55'),
(16, 'Zahra', 'zahra@gmail.com', '$2b$10$ZwrjIYqLXacECvS5Wfzw8uH4UBbBWZNeZPvp6CQ8jdikuu9jiK0ey', '', 'blank-user.png', '', '', 1, 0, '', '', '2020-10-14 06:23:41', '2020-10-14 06:23:41');

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
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `room_chat`
--
ALTER TABLE `room_chat`
  MODIFY `id_roomchat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
