-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 01:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `league`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `img_url` varchar(2083) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL CHECK (`rating` >= 0 and `rating` <= 10),
  `price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `img_url`, `rating`, `price`) VALUES
(1, 'Phasmophobia', 'Phasmophobia is a cooperative horror game where players investigate haunted locations using ghost-hunting tools to identify different types of paranormal entities. It combines eerie atmospheres, teamwork, and unpredictable ghost behavior for a thrilling experience.', 'https://howlongtobeat.com/games/83704_Phasmophobia.jpg', 7.3, 20.00),
(2, 'League of Legends', 'League of Legends is a fast-paced multiplayer online battle arena (MOBA) game where players team up to compete in strategic 5v5 matches, aiming to outplay their opponents and destroy their base.', 'https://mediaproxy.tvtropes.org/width/1200/https://static.tvtropes.org/pmwiki/pub/images/leagueoflegends.png', 7.1, 10.00),
(3, 'Valorant', 'Valorant is a tactical first-person shooter where players engage in 5v5 matches, combining precise gunplay with unique agent abilities to outsmart and outplay the enemy team.', 'https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S2_1200x1600-7bf61b8b77e394c4bc709f6b02c0db24', 6.3, 10.00),
(4, 'Call of Duty: Modern Warfare', 'Call of Duty: Modern Warfare is a first-person shooter that reimagines the iconic series with a modern, gritty storyline. Players experience intense combat in realistic, contemporary settings, featuring both a thrilling single-player campaign and action-packed multiplayer modes.', 'https://assets.xboxservices.com/assets/71/b5/71b50f29-5799-4be1-97ef-d58d57c9fe37.jpg?n=CoD-Modern-Warfare-III_GLP-Page-Hero-0_1083x1222_02.jpg', 8.5, 7.00),
(6, 'Counter-Strike 2', 'Counter-Strike 2 (CS2) is a tactical first-person shooter, the latest installment in the Counter-Strike series. It builds on its legacy with updated graphics, refined gameplay, and classic 5v5 bomb planting and defusal action, offering a highly competitive and strategic multiplayer experience.', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/CS2_Cover_Art.jpg/220px-CS2_Cover_Art.jpg', 7.2, 5.00),
(7, 'Uncharted 4: A Thiefs End', 'Uncharted 4: A Thiefs End is an action-adventure game that follows the journey of Nathan Drake, a retired treasure hunter pulled back into the world of adventure. The game features stunning visuals, thrilling exploration, and intense combat while unraveling a gripping story of betrayal, redemption, and lost treasures.', 'https://m.media-amazon.com/images/I/71B73lI4BjL._AC_UF894,1000_QL80_.jpg', 9.4, 49.99),
(8, 'Overwatch 2', 'Overwatch 2 is a team-based first-person shooter that builds on its predecessor with new heroes, maps, and modes. It features 5v5 multiplayer battles where players choose from a diverse cast of heroes, each with unique abilities, to work together and secure victory through strategic teamwork and fast-paced action.', 'https://m.media-amazon.com/images/M/MV5BOGMxODVmNDgtZGE1Yy00Y2VlLTk3ZTMtYzU5YTcxODhiNzMxXkEyXkFqcGc@._V1_.jpg', 5.5, 10.00),
(9, 'Minecraft', 'Minecraft is a sandbox video game that allows players to explore, build, and survive in a blocky, procedurally generated world. With endless possibilities for creativity, players can craft structures, mine resources, and engage in various adventures, whether solo or with others in multiplayer mode.', 'https://m.media-amazon.com/images/M/MV5BNjQzMDlkNDctYmE3Yi00ZWFiLTlmOWYtMjI4MzQ4Y2JhZjY2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpgg', 8.7, 19.95),
(10, 'Overcooked 2', 'Overcooked 2 is a chaotic cooking simulation game where players must work together to prepare and serve meals in increasingly complex and absurd kitchens. The game emphasizes teamwork, communication, and quick thinking as players race against the clock to keep up with orders and avoid kitchen disasters..', 'https://cdn1.epicgames.com/salesEvent/salesEvent/egs-overcooked2-tall_1200x1600-fbae89fad70c05cd1979316f620e64a9', 7.7, 4.99),
(11, 'Roblox', 'Roblox is an online platform that allows users to create, share, and play games created by other users. It features a wide variety of user-generated experiences, from adventure games to simulations, and provides tools for players to design their own virtual worlds and games using its built-in development environment.', 'https://images.rbxcdn.com/5348266ea6c5e67b19d6a814cbbb70f6.jpg', 6.2, 7.99),
(12, 'PUBG', 'PUBG (PlayerUnknowns Battlegrounds) is a battle royale game where 100 players are dropped onto a large map and must fight to be the last one standing. Players scavenge for weapons, gear, and resources while avoiding a shrinking play area, creating intense and strategic combat situations.', 'https://img.redbull.com/images/c_fill,g_auto,w_450,h_600/q_auto:low,f_auto/redbullcom/2017/07/18/2dd60382-b4b5-41ff-8ff4-bf364f301fa2/pubg-pro-players.jpg.jpg', 6.4, 9.99),
(13, 'Fortnite', '\r\nFortnite is a battle royale game that combines shooting, building, and survival elements. Players fight to be the last one standing on an ever-shrinking island, gathering resources, building structures, and using a variety of weapons to outlast opponents. The game is known for its vibrant visuals, frequent updates, and special events.', 'https://m.media-amazon.com/images/M/MV5BMTZlMmIxM2EtN2Y4Zi00M2ZhLTk3NzgtNjJmZTU0MTQ3YjcwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 6.6, 9.99),
(14, 'The Mortuary Assistant', '\r\nThe Mortuary Assistant is a psychological horror game where players take on the role of a mortuary assistant tasked with preparing bodies for burial. As the night progresses, the player encounters eerie and unsettling supernatural events while working in a morgue filled with dark secrets. The game combines tension-filled moments with puzzle-solving and exploration, creating a deeply immersive and creepy atmosphere.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_O5svDF97g_Me5NyK8hL-fc2Iq0wmKS3atkVRVP-d1rvz7U6TBznAh2OUwnVOkYJaOVa7', 7.2, 92.38),
(15, 'The Witcher 3: Wild Hunt', '\r\nThe Witcher 3: Wild Hunt is an open-world action RPG that follows Geralt of Rivia, a monster hunter, as he searches for his adopted daughter while navigating a war-torn world filled with mythical creatures, dark magic, and complex moral choices. The game is known for its deep storytelling, richly detailed world, and branching narratives where player decisions shape the outcome.', 'https://cdn1.epicgames.com/offer/14ee004dadc142faaaece5a6270fb628/EGS_TheWitcher3WildHuntCompleteEdition_CDPROJEKTRED_S2_1200x1600-53a8fb2c0201cd8aea410f2a049aba3f', 8.0, 39.99),
(16, 'Black Myth: Wukong', '\r\nBlack Myth: Wukong is an upcoming action RPG inspired by the classic Chinese novel Journey to the West. The game follows the legendary Monkey King, Sun Wukong, as he embarks on a journey filled with mythical creatures, powerful gods, and ancient secrets. Known for its stunning visuals and fast-paced combat, the game features transformation abilities, unique combat styles, and an open-world setting.', 'https://cdn1.epicgames.com/spt-assets/ca9ef1bcf2f54043baac351366aec677/black-myth-wukong-jjjfw.png', 8.9, 59.99),
(17, 'Apex Legends', '\r\nApex Legends is a free-to-play battle royale game where squads of three fight to be the last team standing. Players choose from unique characters, each with special abilities, in fast-paced, team-based combat..', 'https://cdn1.epicgames.com/spt-assets/5dcd88f4e2094a698ebffa43438edc33/apex-legends-1o5il.jpg', 7.3, 7.99),
(18, 'Elden Ring', '\r\nElden Ring is an action RPG set in a vast, open world filled with challenging enemies, intricate lore, and deep exploration. Players take on the role of the Tarnished, a character seeking to restore the Elden Ring and gain the title of Elden Lord in a dark, fantasy world.', 'https://assets.xboxservices.com/assets/7b/54/7b54f5e4-0857-4ce3-8a18-2b8c431e8a9e.jpg?n=Elden-Ring_GLP-Page-Hero-0_1083x1222_01.jpg', 9.4, 59.99),
(19, 'The Sims 4', '\r\nThe Sims 4 is a life simulation game where players create and control virtual people, guiding them through everyday activities, relationships, careers, and more. The game offers endless customization and creativity, allowing players to build homes, shape personalities, and explore different life stories.', 'https://m.media-amazon.com/images/I/71otyq1xFNL._AC_UF1000,1000_QL80_.jpg', 6.8, 5.99),
(20, 'Diablo IV', '\r\nDiablo IV is an action RPG set in the dark fantasy world of Sanctuary, where players battle through dungeons and open-world areas filled with demons and other monstrous enemies. With intense combat, deep lore, and a variety of character classes, players must confront the return of the demoness, Lilith, and the forces of Hell.', 'https://m.media-amazon.com/images/M/MV5BMWNmYjhjNWUtMmM0Yi00ODE2LWIxNTMtYjA0NDcxOGIwOTExXkEyXkFqcGc@._V1_.jpg', 6.8, 66.99),
(21, 'Mortal Kombat 11', '\r\nMortal Kombat 11 is a brutal fighting game featuring iconic characters and new warriors in intense one-on-one combat. Players engage in fast-paced battles with a focus on devastating combos, fatalities, and special moves, set in a story-driven campaign and competitive multiplayer modes.', 'https://i.pinimg.com/736x/92/ce/b4/92ceb473df88375ac637cecc63ac5f79.jpg', 8.4, 49.99);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(2, 'Sabrina', 'Beslagic', 'SabrinaB', 'beslagic.sabrina7@gmail.com', '$2y$10$CvE.zIMWn2j0d996bLAPYelOUrMAJrag3ES7XqFdkLfY5dZORwc1a', 'user', '2025-01-04 16:45:20', '2025-01-08 12:10:59'),
(3, 'Asja', 'Hadzic', 'AsjaH', 'asjah@gmail.com', '$2y$10$xHeJrAwnFRmZfef4Xrdfr.Bbydapf3fiAoPoFwOx6DU4gi6yggjBu', 'user', '2025-01-05 11:54:32', '2025-01-05 11:54:32'),
(4, 'Admin', 'Admin', 'Admin1', 'admin.admin@gmail.com', '$2y$10$dxggCOGWo.EzgDxTTOkYUuLKniLeghBficZv7h224IsA/cJeUnrd2', 'admin', '2025-01-05 12:03:39', '2025-01-05 12:04:02'),
(5, 'Edah', 'Imamovic', 'EdahI', 'edahimamovic@gmail.com', '1234majda', 'user', '2025-01-06 10:34:02', '2025-01-07 20:20:34'),
(7, 'Sejla', 'Sakovic', 'Sweh', 'sejlasakovic@gmail.com', '1234sejla', 'user', '2025-01-07 20:14:29', '2025-01-07 20:18:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
