CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL unique,
  `nick` varchar(256),
  `avatar` varchar(256),
  `phone` varchar(256),
  `pwd` varchar(256) NOT NULL,
  `salt` varchar(256),
  `roleIds` varchar(256),
  `permIds` varchar(256),
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `is_delete` boolean default false,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(256),
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `is_delete` boolean default false,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(256),
  `permIds` varchar(256),
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `is_delete` boolean default false,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


