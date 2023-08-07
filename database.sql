CREATE TABLE auth_pwd (auth_pwd_pkey int(12) NOT NULL AUTO_INCREMENT, user_fkey int(4) NOT NULL, salt varchar(255), pwd varchar(255), update_date datetime NOT NULL, PRIMARY KEY (auth_pwd_pkey), UNIQUE INDEX (auth_pwd_pkey));
CREATE TABLE auth_social (auth_social_pkey int(12) NOT NULL AUTO_INCREMENT, user_fkey int(4) NOT NULL, sns_type int(1) comment '0 kakao
1 naver', sns_id varchar(255), access_token varchar(255), update_date datetime NOT NULL, PRIMARY KEY (auth_social_pkey), UNIQUE INDEX (auth_social_pkey));
CREATE TABLE chatroom (chatroom_pkey int(12) NOT NULL AUTO_INCREMENT, user_fkey int(4) NOT NULL, rand_num int(8), title varchar(50) DEFAULT '대화방', created_at datetime NULL, PRIMARY KEY (chatroom_pkey), UNIQUE INDEX (chatroom_pkey));
CREATE TABLE chatroom_text (chatroom_text_pkey int(128) NOT NULL AUTO_INCREMENT, chatroom_fkey int(12) NOT NULL, user_fkey int(4), text text NOT NULL, nickname varchar(255), created_at datetime NULL, PRIMARY KEY (chatroom_text_pkey), UNIQUE INDEX (chatroom_text_pkey));
CREATE TABLE login_log (login_log_pkey int(12) NOT NULL AUTO_INCREMENT, user_fkey int(4) NOT NULL, status int(1) DEFAULT 0 comment '0 not login
1 login', ip varchar(20) NOT NULL, fail_count int(1) NOT NULL, latest_login_date datetime DEFAULT now() NULL, PRIMARY KEY (login_log_pkey), UNIQUE INDEX (login_log_pkey));
CREATE TABLE subtitle_setting (subtitle_setting_pkey int(12) NOT NULL AUTO_INCREMENT, user_setting_fkey int(8) NOT NULL, color int(2) DEFAULT 1 comment 'color options
1 white
2
3
4
5', `size` int(2) DEFAULT 2 comment '1 small
2 medium
3 large
4 extra large', bold int(1) DEFAULT 0 comment '0 not bold
1 bold', bg_color int(2) DEFAULT 0 comment '0 nothing
1 black
2', PRIMARY KEY (subtitle_setting_pkey), UNIQUE INDEX (subtitle_setting_pkey));
CREATE TABLE `User` (user_pkey int(4) NOT NULL AUTO_INCREMENT, id_email varchar(128) UNIQUE, login_type int(1) comment '0 id_email and pwd
1 social login', status int(1) comment '0 register
1 dormant
2 block
3 withdrawal', PRIMARY KEY (user_pkey), UNIQUE INDEX (user_pkey));
CREATE TABLE user_activity_log (user_activity_log_pkey int(11), user_fkey int(11), `어떤 activity` int(11));
CREATE TABLE user_info (user_info_pkey int(12) NOT NULL AUTO_INCREMENT, user_fkey int(4) NOT NULL, name varchar(40), birth int(11), gender int(1) comment '0 nothing
1 female
2 male', certificated_email int(1) NOT NULL comment '0 not certificated
1 certificated', certificated_date datetime NOT NULL, join_date datetime NULL, update_date datetime NOT NULL, PRIMARY KEY (user_info_pkey), UNIQUE INDEX (user_info_pkey));
CREATE TABLE user_setting (user_setting_pkey int(8) NOT NULL AUTO_INCREMENT, user_fkey int(4) NOT NULL, subtitle int(1) DEFAULT 1 comment '0 no subtitle
1 subtitle', nickname varchar(30), update_date datetime DEFAULT now() NULL, PRIMARY KEY (user_setting_pkey), UNIQUE INDEX (user_setting_pkey));
ALTER TABLE user_info ADD INDEX FKuser_info373145 (user_fkey), ADD CONSTRAINT FKuser_info373145 FOREIGN KEY (user_fkey) REFERENCES `User` (user_pkey);
ALTER TABLE user_setting ADD INDEX FKuser_setti207119 (user_fkey), ADD CONSTRAINT FKuser_setti207119 FOREIGN KEY (user_fkey) REFERENCES `User` (user_pkey);
ALTER TABLE login_log ADD INDEX FKlogin_log783716 (user_fkey), ADD CONSTRAINT FKlogin_log783716 FOREIGN KEY (user_fkey) REFERENCES `User` (user_pkey);
ALTER TABLE auth_social ADD INDEX FKauth_socia82905 (user_fkey), ADD CONSTRAINT FKauth_socia82905 FOREIGN KEY (user_fkey) REFERENCES `User` (user_pkey);
ALTER TABLE subtitle_setting ADD INDEX FKsubtitle_s507190 (user_setting_fkey), ADD CONSTRAINT FKsubtitle_s507190 FOREIGN KEY (user_setting_fkey) REFERENCES user_setting (user_setting_pkey);
ALTER TABLE auth_pwd ADD INDEX FKauth_pwd765474 (user_fkey), ADD CONSTRAINT FKauth_pwd765474 FOREIGN KEY (user_fkey) REFERENCES `User` (user_pkey);
ALTER TABLE chatroom_text ADD INDEX FKchatroom_t274559 (chatroom_fkey), ADD CONSTRAINT FKchatroom_t274559 FOREIGN KEY (chatroom_fkey) REFERENCES chatroom (chatroom_pkey);
ALTER TABLE chatroom ADD INDEX FKchatroom466101 (user_fkey), ADD CONSTRAINT FKchatroom466101 FOREIGN KEY (user_fkey) REFERENCES `User` (user_pkey);
