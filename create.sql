drop database if exists codingyouth;
create database if not exists `codingyouth` character set utf8 collate utf8_general_ci;
use `codingyouth`;

create table if not exists `codingyouth`.`user` (
    `id` int not null auto_increment,
    `number` varchar(11) not null,
    `name` varchar(30) not null,
    `sex` varchar(10) not null,
    `image_path` varchar(100) not null,
    `password` char(32) not null,
    `birthday` varchar(10),
    `email` varchar(50),
    `money` int not null,
    `level` int not null,
    `exp` int not null,
    `identity` int not null,
    `post_num` int not null,
    `article_num` int not null,
    `reply_num` int not null,
    `video_num` int not null,
    `post_score` int not null,
    `article_score` int not null,
    `reply_score` int not null,
    `video_score` int not null,
    primary key (`id`),
    unique (`number`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;


create table if not exists `codingyouth`.`image` (
    `image_id` int not null auto_increment,
    `image_name` varchar(100) not null,
    `image_path` varchar(100) not null,
    `image_time` datetime not null,
    primary key (`image_id`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table if not exists `codingyouth`.`cover` (
    `cover_id` int not null auto_increment,
    `cover_name` varchar(100) not null,
    `cover_path` varchar(100) not null,
    `cover_time` datetime not null,
    primary key (`cover_id`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table if not exists `codingyouth`.`post` (
    `post_id` int not null auto_increment,
    `post_owner_id` int not null,
    `post_owner_name` varchar(30) not null,
    `post_title` varchar(50) not null,
    `post_content` varchar(200) not null,
    `post_tag` varchar(100) not null,
    `post_reply_num` int not null,
    `post_score` int not null,
    `post_money` int not null,
    `post_point` int not null,
    `post_time` datetime not null,
    `post_fav_num` int not null,
    primary key (`post_id`),
    unique (`post_title`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;


create table if not exists `codingyouth`.`video` (
    `video_id` int not null auto_increment,
    `video_owner_id` int not null,
    `video_owner_name` varchar(30) not null,
    `video_name` varchar(100) not null,
    `video_title` varchar(100) not null,
    `video_desc`  varchar(500) not null,
    `video_content` varchar(500) not null,
    `video_tag` varchar(100) not null,
    `video_duration` varchar(100) not null,
    `video_path` varchar(100) not null,
    `cover_path` varchar(100) not null,
    `video_reply_num` int not null,
    `visit_num` int not null,
    `video_score` int not null,
    `video_dis_score` int not null,
    `video_money` int not null,
    `video_time` datetime not null,
    `video_fav_num` int not null,
    primary key (`video_id`),
    unique (`video_title`)

) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table if not exists `codingyouth`.`article` (
    `article_id` int not null auto_increment,
    `article_owner_id` int not null,
    `article_owner_name` varchar(30) not null,
    `article_title` varchar(50) not null,
    `article_content` varchar(200) not null,
    `article_tag` varchar(20) not null,
    `article_reply_num` int not null,
    `article_score` int not null,
    `article_dis_score` int not null,
    `article_money` int not null,
    `article_time` datetime not null,
    `article_fav_num` int not null,
    primary key (article_id),
    unique (`article_title`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;


create table if not exists `codingyouth`.`reply` (
    `reply_id` int not null auto_increment,
    `post_id` int not null,
    `reply_object_id` int not null,
    `reply_owner_id` int not null,
    `reply_owner_name` varchar(30) not null,
    `reply_post_title` varchar(50) not null,
    `reply_content` varchar(200) not null,
    `reply_score` int not null,
    `reply_dis_score` int not null,
    `reply_time` datetime not null,
    `reply_state` int not null,
    primary key (`reply_id`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;


create table if not exists codingyouth.a_reply (
    `a_reply_id` int not null auto_increment,
    `article_id` int not null,
    `a_reply_object_id` int not null,
    `a_reply_owner_id` int not null,
    `a_reply_owner_name` varchar(30) not null,
    `a_reply_article_title` varchar(50) not null,
    `a_reply_content` varchar(200) not null,
    `a_reply_score` int not null,
    `a_reply_dis_score` int not null,
    `a_reply_time` datetime not null,
    primary key (`a_reply_id`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;


create table if not exists codingyouth.v_reply (
    `v_reply_id` int not null auto_increment,
    `video_id` int not null,
    `v_reply_object_id` int not null,
    `v_reply_owner_id` int not null,
    `v_reply_owner_name` varchar(30) not null,
    `v_reply_video_title` varchar(50) not null,
    `v_reply_content` varchar(200) not null,
    `v_reply_score` int not null,
    `v_reply_dis_score` int not null,
    `v_reply_time` datetime not null,
    primary key (`v_reply_id`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table if not exists codingyouth.sign (
    `user_id` int not null,
    `user_number` varchar(11) not null,
    `user_name` varchar(30) not null,
    `times` int not null,
    `point` int not null,
    primary key (`user_id`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table if not exists codingyouth.fav_post (
    `fav_post_owner_number` varchar(11) not null,
    `post_title` varchar(50) not null,
    `post_number_title` varchar(61) not null,
    `post_owner_id` int not null,
    `post_frequency` int not null,
    `fav_post_time` datetime not null,
    primary key (`fav_post_owner_number`),
    unique (`post_number_title`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table if not exists codingyouth.fav_article (
    `fav_article_owner_number` varchar(11) not null,
    `article_title` varchar(50) not null,
    `article_number_title` varchar(61) not null,
    `article_owner_id` int not null,
    `article_frequency` int not null,
    `fav_article_time` datetime,
    primary key (`fav_article_owner_number`),
    unique (`article_number_title`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table if not exists codingyouth.fav_video (
    `fav_video_owner_number` varchar(11) not null,
    `video_title` varchar(50) not null,
    `video_number_title` varchar(61) not null,
    `video_owner_id` int not null,
    `video_frequency` int not null,
    `fav_video_time` datetime not null,
    primary key (`fav_video_owner_number`),
    unique (`video_number_title`)
) ENGINE=InnoDB default charset=utf8 collate=utf8_unicode_ci;
