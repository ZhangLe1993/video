create database video;

use video;
/**
	用户表
**/
drop table if exists user;
create table IF NOT EXISTS user
(
		user_id varchar(32) NOT NULL comment '用户ID',
		user_login_name varchar(50) comment '用户登录名',
		user_password varchar(64) comment '用户登录密码',
		user_phone varchar(11) comment '绑定手机号',
		user_email varchar(100) comment '绑定邮箱',
		user_photo blob comment '头像',
		user_status varchar(1) comment '激活状态',  /** 0未激活,1 已激活,2 警告   3：封号 **/
		user_level  varchar(1) comment '登记', /** 0:初出茅庐，1：久经沙场  2：饱经沧桑  2、 **/
		user_integral int comment '积分',  /** 积分**/	
		last_login_time varchar(16) comment '上次登录时间',/*2018-03-08 15:03*/
		last_login_ip varchar(15) comment '上次登录IP',
		user_register_time varchar(16) comment '注册时间',
		user_register_ip varchar(15) comment '注册IP',
		is_vip varchar(1) comment '是否是会员',/* 0：是  1：否 */
		vip_effective_time varchar(50) comment '会员激活时间',
		delete_flag varchar(1) comment '删除状态', /*  0:为删除  1::已删除 */
		user_real_name varchar(75) comment '真实姓名',
		user_nick_name varchar(75) comment '昵称',
		user_education_status varchar(1) comment '学历',
		user_address_divisions varchar(6) comment '地址区划',
		user_address_detail varchar(200) comment '详细地址',
		user_sex varchar(1) comment '性别：1男，2女，0：未知',
		user_age int comment '年龄',
		primary key(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/**
	用户扩展信息表
**/
drop table if exists user_infomation;
create table IF NOT EXISTS user_infomation
(
		user_id varchar(32) NOT NULL comment '用户ID',
		user_real_name varchar(75) comment '真实姓名',
		user_nick_name varchar(75) comment '昵称',
		user_education_status varchar(1) comment '学历',
		user_address_divisions varchar(6) comment '地址区划',
		user_address_detail varchar(200) comment '详细地址',
		user_sex varchar(1) comment '性别：1男，2女，0：未知',
		user_age int comment '年龄',
		PRIMARY key(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表';

/**
第三方应用授权表

**/
create table IF NOT EXISTS third_party_user
(
		open_id varchar(100) NOT NULL comment '第三方应用开放ID',
		user_id varchar(32) NOT NULL comment '用户ID',
		auth_type int comment '第三方类型 0：QQ，1：微信，2：微博', 
		auth_name varchar(20) comment 'QQ 微信  微博',
		auth_access_token varchar() comment '',
		auth_expires varchar() comment ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方应用授权表';

/**
	数据字典表
**/
create table IF NOT EXISTS data_dictionary
(
		id int NOT NULL auto_increment comment '字典ID',
		bm varchar(10) comment '字典编码',
		bmmc varchar(100) comment '编码名称',
		dm varchar(10) comment '代码',
		dmmc varchar(100) comment '代码名称',
		is_valid varchar(1) comment '是否启用',
		create_time varchar(16) comment '创建时间',
		update_time varchar(16) comment '创建时间',
		up_dm varchar(10) comment '父亲节点代码',
		primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典表';

/**
	用户钱包表
**/
create table IF NOT EXISTS user_wallet
(
		id varchar(32) NOT NULL COMMENT '自增主键',
		user_id varchar(100) comment '用户ID',
		pay_password varchar(32) comment '支付密码',
		user_real_name varchar(75) comment '提现姓名=真实名称',
		user_identifiers varchar(18) comment '身份证号',
		balance decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
		primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户钱包表';

/**

钱包变动日志
**/
CREATE TABLE IF NOT EXISTS user_wallet_log (
  log_id varchar(32) NOT NULL COMMENT '日志ID',
  record_sn char(20) NOT NULL COMMENT '交易流水sn，关联wallet_record表',
  user_id varchar(32) COMMENT '用户ID',
  change_money decimal(10,2) NOT NULL COMMENT '变动金额 增+ 减-',
  balance decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '变动后的金额',
  remark char(100) DEFAULT NULL COMMENT '备注',
  create_time int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  display tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示 1显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钱包变动日志';


/**
钱包交易记录表
**/
CREATE TABLE IF NOT EXISTS user_wallet_record (
  record_id varchar(32) NOT NULL COMMENT '自增ID',
  record_sn char(20) NOT NULL COMMENT '交易流水sn，ymdHis+2位随机数',
  from_user_id varchar(32) NOT NULL COMMENT '支付方UID，0系统充值',
  to_user_id varchar(32) NOT NULL COMMENT '接收方UID，0系统提现',
  type tinyint(2) NOT NULL DEFAULT '3' COMMENT '交易类型 1充值 2提现 3交易 ',
  money decimal(10,2) NOT NULL COMMENT '交易金额',
  pay_type tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付方式 0待定 1支付宝 2微信 3银行卡 4余额',
  remark varchar(100) NOT NULL COMMENT '备注信息',
  pay_status tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付状态 0待支付 -1失败 1成功',
  pay_time varchar(16) COMMENT '交易时间',
  fetch_status tinyint(2) NOT NULL DEFAULT '0' COMMENT '收款状态 0待收款 -1失败 1成功',
  fetch_time varchar(16) COMMENT '收款时间',
  check_status tinyint(2) NOT NULL DEFAULT '0' COMMENT '对账状态 0未对账 1已对账',
  check_time varchar(16) COMMENT '对账时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钱包交易记录表';


/**
	视频资源表总表
**/
create table if not exists video
(
		video_id varchar(32) NOT NULL comment '视频ID',
		video_name varchar(100) comment '视频名称',
		video_title varchar(100) comment '视频标题',
		video_descript varchar(200) comment '视频描述',
		video_content varchar(200) comment '视频内容',
		channel_type varchar(1) comment '栏目类型',
		video_type varchar(1) comment '小类型',
		video_source varchar(2) comment '视频来源 0：腾讯，1：优酷，2：土豆，3：爱奇艺，4：火山小视频，5：陌陌，6：其他。',
		upload_type varchar(1) comment '上传类型 0：用户上传，1：管理员上传',
		video_cover varchar(200) comment '视频封面海报',
		video_state varchar(1) comment '审核状态  0,：上传成功（待提交审核），1：提交审核（待审核）,2：审核不通过，3：审核通过，4：发布，5：下架，6：删除',
		audit_time varchar(16) comment '审核时间',
		audit_person_id varchar(32) comment '审核人ID',
		audit_person_name varchar(75) comment '审核人姓名',
		publish_time varchar(16) comment '发布时间',
		publish_person_type varchar(1) comment '发布人类型 0：用户，1：管理员',
		publish_person_id varchar(32) comment '发布人ID',
		publish_person_name varchar(75) comment '发布人姓名',
		unpublish_time varchar(16) comment '下架时间',
		unpublish_person_type varchar(1) comment '下架人类型 0：用户，1：管理员',
		unpublish_person_id varchar(32) comment '下架人ID',
		unpublish_person_name varchar(75) comment '下架人姓名',
		delete_time varchar(16) comment '删除时间',
		delete_person_id varchar(32) comment '删除人ID',
		delete_person_name varchar(75) comment '删除人姓名',
		create_time varchar(16) comment '上传时间',
		create_person_id varchar(32) comment '上传人ID',
		create_person_name varchar(75) comment '上传人姓名',
		download_count int(10) comment '下载次数',
		primary key(video_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频资源表总表';


/**
	用户上传的视频资源记录表
**/
create table if not exists user_upload_video_record
(
		id varchar(32) NOT NULL comment '上传记录ID',
		video_id varchar(32) comment '视频ID',
		create_time varchar(16) comment '上传时间',
		user_id varchar(32) comment '上传者ID',
		audit_state varchar(1) comment '审核状态0,：通过，1：不通过',
		audit_time varchar(16) comment '审核时间',
		account_id varchar(32) comment '审核人ID',
		status varchar(1) comment '视频状态 0：合法，1：不合法，2：删除',
		primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户上传的视频资源记录表';

/**
	用户下载视频资源记录表
**/
create table if not exists user_download_video_record
(
		id varchar(32) NOT NULL comment '下载记录ID',
		video_id varchar(32) comment '视频ID',
		download_time varchar(16) comment '下载时间',
		user_id varchar(32) comment '下载者ID',
		user_nick_name varchar(75) comment '下载者昵称',
		download_ip varchar(15) comment '下载地IP',
		primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户下载视频资源记录表';


/**
	管理员上传的视频资源记录表
**/
create table if not exists user_upload_video_record
(
		id varchar(32) NOT NULL comment '上传记录ID',
		video_id varchar(32) comment '视频ID',
		create_time varchar(16) comment '上传时间',
		account_id varchar(32) comment '上传者ID',
		status varchar(1) comment '视频状态 0：合法，1：不合法，2：删除',
		primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员上传的视频资源记录表';


create table if not exists account
(
	account_id varchar(32) not null comment '管理员ID',
	account_name varchar(75) not null comment '管理员姓名',
	account_login_name varchar(32) not null comment '管理员登录账号',
	account_password varchar(32) not null default '123456' comment '管理员登录密码',
	account_role varchar(2) not null comment '管理员角色',
	account_phone varchar(11) not null comment '电话号码',
	account_email varchar(32) comment '邮箱',
	account_address varchar(300) comment '地址',
	account_sex varchar(1) comment '性别',
	account_age int comment '年龄',
	account_identify varchar(18) not null comment '身份证号码',
	account_photo BLOB comment '证件照',
	account_gradu varchar(1) comment '学历',
	primary key(account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';


create table if not exists validate(
	info_id varchar(32) not null comment 'id',
	info_answer varchar(200) not null comment '答案',
	info_question varchar(200) not null comment '问题',
	info_state varchar(1) not null comment '是否启用',
	primary key(info_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证消息表';

