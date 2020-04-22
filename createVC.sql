create table if not exists `codingyouth`.`video` (
    `video_id` int not null auto_increment,
    `video_owner_id` int not null,
    `video_owner_name` varchar(30) not null,
    `video_name` varchar(100) not null,
    `video_title` varchar(100) not null,
    `video_desc`  varchar(500) not null,
    `video_content` varchar(500) not null,
    `video_tag` varchar(20) not null,
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
);

create table if not exists `codingyouth`.`cover` (
    `cover_id` int not null auto_increment,
    `cover_name` varchar(100) not null,
    `cover_path` varchar(100) not null,
    `cover_time` datetime not null,
    primary key (`cover_id`)
);