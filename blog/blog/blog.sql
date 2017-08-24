-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 08 月 24 日 10:27
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_admin`
--

CREATE TABLE IF NOT EXISTS `blog_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(45) NOT NULL DEFAULT '' COMMENT '用户名',
  `admin_password` varchar(60) NOT NULL DEFAULT '' COMMENT '登录密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台管理员表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `blog_admin`
--

INSERT INTO `blog_admin` (`admin_id`, `admin_username`, `admin_password`) VALUES
(1, 'a', 'a'),
(2, 'admin', '96e79218965eb72c92a549dd5a330112');

-- --------------------------------------------------------

--
-- 表的结构 `blog_arc_tag`
--

CREATE TABLE IF NOT EXISTS `blog_arc_tag` (
  `arc_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `fk_table1_blog_article1_idx` (`arc_id`),
  KEY `fk_table1_blog_tag1_idx` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章标签中间表';

--
-- 转存表中的数据 `blog_arc_tag`
--

INSERT INTO `blog_arc_tag` (`arc_id`, `tag_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(3, 11),
(4, 11),
(7, 1),
(7, 2),
(1, 2),
(1, 4);

-- --------------------------------------------------------

--
-- 表的结构 `blog_article`
--

CREATE TABLE IF NOT EXISTS `blog_article` (
  `arc_id` int(11) NOT NULL AUTO_INCREMENT,
  `arc_title` varchar(45) NOT NULL DEFAULT '' COMMENT '文章标题',
  `arc_author` varchar(45) NOT NULL DEFAULT '' COMMENT '文章作者',
  `arc_digest` varchar(200) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `arc_content` text,
  `sendtime` int(11) NOT NULL DEFAULT '0' COMMENT '发表时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '文章更新时间',
  `arc_click` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_recycle` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否在回收站，1在回收站2代表不在回收站，默认2',
  `arc_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '文章缩略图',
  `cate_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `arc_sort` int(11) NOT NULL DEFAULT '100' COMMENT '文章排序',
  PRIMARY KEY (`arc_id`),
  KEY `fk_blog_article_blog_cate_idx` (`cate_id`),
  KEY `fk_blog_article_blog_admin1_idx` (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `blog_article`
--

INSERT INTO `blog_article` (`arc_id`, `arc_title`, `arc_author`, `arc_digest`, `arc_content`, `sendtime`, `updatetime`, `arc_click`, `is_recycle`, `arc_thumb`, `cate_id`, `admin_id`, `arc_sort`) VALUES
(1, 'laravel常用命令  ', 'ysw', '启动laravel：   	php artisan serve\r\n创建控制器：    	php artisan make:controller TestController --plain\r\nmigrate\r\n撤销上一步操作：	php artisan migrate:rollback 然后可以修改表的字段\r\n上传表：        	php artisan migrate', '<p>启动laravel： &nbsp;&nbsp;<span style="line-height: 28px; white-space: pre;"></span>php artisan serve</p><p>创建控制器： &nbsp; &nbsp;<span style="line-height: 28px; white-space: pre;"></span>php artisan make:controller TestController --plain</p><p>migrate</p><p>撤销上一步操作：<span style="line-height: 28px; white-space: pre;"></span>php artisan migrate:rollback 然后可以修改表的字段</p><p>上传表： &nbsp; &nbsp; &nbsp; &nbsp;<span style="line-height: 28px; white-space: pre;"></span>php artisan migrate</p><p>创建表： &nbsp; &nbsp; &nbsp; &nbsp;<span style="line-height: 28px; white-space: pre;"></span>php artisan make:migration create_articles_table --create=articles</p><p>添加字段： &nbsp; &nbsp; &nbsp;<span style="line-height: 28px; white-space: pre;"></span>php artisan make:migration add_into_column_to_articles --table=artiles &nbsp;down:$table-&gt;dropColumn(&quot;字段名&quot;) 需要下载composer require doctrine/dbal;</p><p>Eloquent</p><p>创建模型： &nbsp; &nbsp;&nbsp;<span style="line-height: 28px; white-space: pre;"></span>php artisan &nbsp;make:model Article</p><p>laravel的命令行 &nbsp; &nbsp; php artisan tinker</p><p>protected $fillable = [&#39;title&#39;];可填充的意思</p><p>$article = App\\Article::create([&#39;title&#39; =&gt; &#39;Flight 10&#39;]);</p><p>Request创建表单验证 php artisan make:request CreateArticleRequest</p><p><span style="line-height: 28px; white-space: pre;"></span>php artisan route:list</p><p><br/></p>', 1503540231, 0, 2, 2, 'http://localhost/blog/public/uploads/20170824/ae183ce47bb17e794bc723233b2ad79a.jpg', 26, 2, 100);

-- --------------------------------------------------------

--
-- 表的结构 `blog_attachment`
--

CREATE TABLE IF NOT EXISTS `blog_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `filename` varchar(300) NOT NULL COMMENT '文件名',
  `path` varchar(300) NOT NULL COMMENT '路径',
  `extension` varchar(10) NOT NULL DEFAULT '' COMMENT '类型',
  `createtime` int(10) NOT NULL COMMENT '上传时间',
  `size` mediumint(9) NOT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `blog_attachment`
--

INSERT INTO `blog_attachment` (`id`, `name`, `filename`, `path`, `extension`, `createtime`, `size`) VALUES
(1, 'timg (1).jpg', 'ae183ce47bb17e794bc723233b2ad79a.jpg', 'uploads/20170824/ae183ce47bb17e794bc723233b2ad79a.jpg', 'jpg', 1503540088, 128944);

-- --------------------------------------------------------

--
-- 表的结构 `blog_cate`
--

CREATE TABLE IF NOT EXISTS `blog_cate` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(45) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `cate_pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `cate_sort` int(11) NOT NULL DEFAULT '100' COMMENT '栏目排序',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目管理' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `blog_cate`
--

INSERT INTO `blog_cate` (`cate_id`, `cate_name`, `cate_pid`, `cate_sort`) VALUES
(26, 'laravel', 0, 1),
(13, 'as', 11, 2),
(14, '2333333332', 11, 121),
(15, 'asasa', 11, 2),
(17, '2112', 16, 2),
(25, 'php', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_link`
--

CREATE TABLE IF NOT EXISTS `blog_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(45) NOT NULL DEFAULT '' COMMENT '友链名称',
  `link_url` varchar(100) NOT NULL DEFAULT '' COMMENT '友链url',
  `link_sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '友链排序',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友链数据表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `blog_link`
--

INSERT INTO `blog_link` (`link_id`, `link_name`, `link_url`, `link_sort`) VALUES
(2, 'baidu', 'http://www.baidu.com', 100);

-- --------------------------------------------------------

--
-- 表的结构 `blog_tag`
--

CREATE TABLE IF NOT EXISTS `blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(45) NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='标签管理' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `blog_tag`
--

INSERT INTO `blog_tag` (`tag_id`, `tag_name`) VALUES
(1, '框架'),
(2, '学习'),
(3, '视频'),
(4, 'php'),
(5, 'html'),
(11, '运动');

-- --------------------------------------------------------

--
-- 表的结构 `blog_webset`
--

CREATE TABLE IF NOT EXISTS `blog_webset` (
  `webset_id` int(11) NOT NULL AUTO_INCREMENT,
  `webset_name` varchar(45) NOT NULL DEFAULT '' COMMENT '配置项名称',
  `webset_value` varchar(45) NOT NULL DEFAULT '' COMMENT '配置项值',
  `webset_des` varchar(45) NOT NULL DEFAULT '' COMMENT '配置项描述',
  PRIMARY KEY (`webset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='站点配置' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `blog_webset`
--

INSERT INTO `blog_webset` (`webset_id`, `webset_name`, `webset_value`, `webset_des`) VALUES
(1, 'title', 'PHP-从点滴学起', '网站名称'),
(2, 'email', '15172365702@163.com', '站长邮箱'),
(3, 'copyright', 'Copyright @ 2017 ', '版权信息');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
