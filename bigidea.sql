USE [master]
GO
/****** Object:  Database [bigidea]    Script Date: 2019/3/30 12:18:40 ******/
CREATE DATABASE [bigidea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bigidea', FILENAME = N'E:\1\bigidea.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bigidea_log', FILENAME = N'E:\1\bigidea_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bigidea] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bigidea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bigidea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bigidea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bigidea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bigidea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bigidea] SET ARITHABORT OFF 
GO
ALTER DATABASE [bigidea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bigidea] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bigidea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bigidea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bigidea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bigidea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bigidea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bigidea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bigidea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bigidea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bigidea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bigidea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bigidea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bigidea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bigidea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bigidea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bigidea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bigidea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bigidea] SET RECOVERY FULL 
GO
ALTER DATABASE [bigidea] SET  MULTI_USER 
GO
ALTER DATABASE [bigidea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bigidea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bigidea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bigidea] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bigidea', N'ON'
GO
USE [bigidea]
GO
/****** Object:  Table [dbo].[Advices]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Advices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Subhead] [varchar](100) NULL,
	[PicUrl] [varchar](50) NULL,
	[Daoyan] [varchar](500) NULL,
	[CoverStory] [varchar](500) NULL,
	[Dinting] [varchar](500) NULL,
	[Snakes] [varchar](500) NULL,
	[Arbitrary] [varchar](50) NULL,
 CONSTRAINT [PK__Advices__3214EC07164452B1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Tags] [varchar](50) NULL,
	[Trade] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[Type] [varchar](20) NULL,
	[Media] [varchar](20) NULL,
	[Author] [varchar](20) NULL,
	[Agency] [varchar](50) NULL,
	[MainPicUrl] [varchar](40) NOT NULL,
	[Cont] [varchar](8000) NOT NULL,
	[Research] [varchar](20) NULL,
	[CreateTime] [datetime] NULL,
	[PubTime] [datetime] NULL,
	[ReadTimes] [int] NULL,
 CONSTRAINT [PK__Article__3214EC070519C6AF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Collect]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collect](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[Cont] [varchar](200) NOT NULL,
	[UserId] [int] NULL,
	[CommentTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Photos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PicUrl] [varchar](50) NOT NULL,
	[ArticleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Radios]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Radios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RadioUrl] [varchar](50) NOT NULL,
	[Cont] [varchar](50) NULL,
	[ArticleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReArticle]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReArticle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[PosId] [int] NULL,
	[Weight] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
	[Note] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleGive]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleGive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](10) NOT NULL,
	[Passward] [varchar](100) NOT NULL,
	[Sex] [char](1) NOT NULL,
	[NickName] [varchar](20) NOT NULL,
	[HeadSculpture] [varchar](50) NULL,
	[SelfSInfo] [varchar](100) NULL,
	[HeadPicUrl] [varchar](100) NULL,
	[Email] [varchar](40) NULL,
	[LastLoginTime] [datetime] NULL,
	[IsDel] [char](1) NULL,
	[IsStop] [char](2) NULL,
 CONSTRAINT [PK__User__3214EC077F60ED59] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_Collect]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Collect]
AS
SELECT     dbo.Collect.Id, dbo.Article.Title, dbo.[User].UserName, dbo.Article.Author, dbo.Article.Agency, dbo.Article.MainPicUrl, dbo.Article.ReadTimes, 
                      dbo.Article.Id AS ArticleId
FROM         dbo.Article INNER JOIN
                      dbo.Collect ON dbo.Article.Id = dbo.Collect.ArticleId INNER JOIN
                      dbo.[User] ON dbo.Collect.UserId = dbo.[User].Id

GO
/****** Object:  View [dbo].[View_Comment]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Comment]
AS
SELECT     dbo.Article.Id, dbo.Article.Title, dbo.Comment.Id AS comId, dbo.Comment.Cont, dbo.[User].UserName, dbo.Comment.CommentTime, dbo.[User].HeadPicUrl
FROM         dbo.Article INNER JOIN
                      dbo.Comment ON dbo.Article.Id = dbo.Comment.ArticleId INNER JOIN
                      dbo.[User] ON dbo.Comment.UserId = dbo.[User].Id

GO
/****** Object:  View [dbo].[View_Rec]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Rec]
AS
SELECT     dbo.ReArticle.PosId, dbo.ReArticle.Weight, dbo.Article.Id, dbo.Article.Title, dbo.Article.MainPicUrl, dbo.Article.Author, dbo.Article.Agency, dbo.Article.ReadTimes
FROM         dbo.Article INNER JOIN
                      dbo.ReArticle ON dbo.Article.Id = dbo.ReArticle.ArticleId

GO
/****** Object:  View [dbo].[View_User]    Script Date: 2019/3/30 12:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_User]
AS
SELECT     dbo.RoleGive.Id, dbo.[User].UserName, dbo.Role.RoleName, dbo.Role.Note
FROM         dbo.RoleGive INNER JOIN
                      dbo.[User] ON dbo.RoleGive.UserId = dbo.[User].Id INNER JOIN
                      dbo.Role ON dbo.RoleGive.RoleId = dbo.Role.Id


GO
SET IDENTITY_INSERT [dbo].[Advices] ON 

INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (8, N'情报第二十九期：你可能对品牌年轻化有些误解', N'无论是消费观念还是购买能力当下的年轻人是绝对的主力人群', N'photos/QingBao/QB29.png', N'<p><span style="font-family: PingFangTC-light; font-size: 13px; letter-spacing: 2px; text-align: justify; text-size-adjust: auto;">最近，四年一度的世界杯正在如火如荼地进行当中，这是一场属于球迷的狂欢，更是一场属于品牌的狂欢，各大品牌都坐不住要加入到这场狂欢中，品牌追世界杯热点已经不足为奇。那这两周又有哪些值得学习和借鉴的案例呢？</span><br/></p>', N'<p>你可能对品牌年轻化有些误解</p><p>Gap案例：尝试讨好所有人，可能会被所有人抛弃</p>', N'<p>碳酸饮料销量连续下滑18年，可口可乐和百事可乐如何【自救】？<br/></p><p>信任感都丢了，还谈什么以后啊<br/></p><p>王菊可能是个营销天才</p><p>GE案例：To B品牌如何做好营销？</p><p><br/></p>', N'<p>王老吉首次启用明星代言<br/></p><p>花呗的logo成精了<br/></p><p>这可能是世界上最无聊的广告牌<br/></p><p>凯迪拉克找刘雯和马东拍了一系列广告片<br/></p><p>王源又签下一个代言，这次是FILA<br/></p><p>汉堡袜子、薯条围嘴，麦当劳只送不卖</p>', N'英国设计公司JQ')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (10, N'情报第二十八期：冈本——抛弃了安全套营销套路的冈本，走上了一条文艺的路', N'经济越不好，安全套行业的销售状况就越好', N'photos/QingBao/QB28.png', N'<p><span style="font-family: PingFangTC-light; font-size: 13px; letter-spacing: 2px; text-align: justify; text-size-adjust: auto;">最近我们的身边被一波突如其来的“菊文化”包围，就算你没看过《创造101》，估计也对这位无处不在的王菊有所知晓。这样一种刷屏的态势，也让很多品牌趋之若鹜。在“菊文化”的背后，很多品牌依旧给我们带来了很多优秀的案例：</span></p>', N'<p class="p1"><span class="s1">1、冈本——抛弃了安全套营销套路的冈本，走上了一条文艺的路</span>2、路虎——真正的英国绅士70岁了，但探索的心依旧年轻</p><p><span class="s1"><br/></span></p>', N'<p class="p1"><span class="s1">1、复盘漫威的这10年，它正在精心布局一盘营销大局</span></p><p class="p1"><span class="s1">2、适不适合和他/她结婚，去趟宜家就知道了</span></p><p class="p1"><span class="s1">3、为了这双筷子，也要点份外卖！</span></p><p class="p1"><span class="s1">4、“你本来就很美”这句slogan，如何在12年后依旧赢得女人心</span></p><p><br/></p>', N'<p class="p1"><span class="s1">1、衣二三最新时尚大片：最潮奶奶返老还童</span></p><p class="p1"><span class="s1">2、可口可乐在日本发布第一款酒精饮料——Lemon-Do</span></p><p class="p1"><span class="s1">3、GDPR数据隐私保护法案刚刚颁布，宜家的热点就来了</span></p><p class="p1"><span class="s1">4、《舌尖2》导演为海澜之家拍摄了一支广告片，每个人可以成为风景</span></p><p class="p1"><span class="s1">5、奥利奥DJ台“饼干会打碟”</span></p><p class="p1"><span class="s1"><br/></span></p>', N'Yeaaah!studio 设计工作室')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (11, N'情报第二十七期：星巴克——从不做广告，为何如此成功?', N'星巴克成功地创立了一种以创造“星巴克体验”为特点的“咖啡宗教”', N'photos/QingBao/QB27.png', N'<p>上周的母亲节成为很多品牌争相追逐的热点，它们都用自己的洞察和创意展现出对母亲的爱和尊敬。比如自然堂用“妈妈给你独一无二的美”展现“你本来就很美”的品牌主张；网易智造从年轻人的角度出发，展现出母亲对孩子的爱和担忧···那除了母亲节的借势营销案例外，过去的两周又有哪些值得我们学习的案例？</p>', N'<p class="p1"><span class="s1">1、星巴克——从不做广告，为何如此成功?</span></p><p class="p1"><span class="s1">——星巴克成功地创立了一种以创造“星巴克体验”为特点的“咖啡宗教”</span></p><p class="p1"><span class="s1">2、乐事——用快乐营销哲学稳坐世界第一薯片宝座的背后有什么秘诀?<span class="Apple-converted-space"> <br/></span></span></p>', N'<p class="p3"><span class="s2">1、</span><span class="s1">蒂凡尼打造了一部嘻哈版《蒂凡尼的早餐》</span></p><p class="p3"><span class="s2">2、</span><span class="s1">90后们难道是真的“买不起”吗？</span></p><p class="p1"><span class="s1">3、为了迎接70岁，“硬汉”路虎找来了一群小朋友为自己庆生</span></p><p class="p1"><span class="s1">4、宜家在传统媒体上玩创新，打通你的听觉和嗅觉</span></p><p><br/></p>', N'<p class="p1"><span class="s1">1、饿了么——用一个意想不到的美味方式保护环境</span></p><p class="p1"><span class="s1">2、50岁的巨无霸又收到一个新礼物 ——巨无霸可乐罐！</span></p><p class="p1"><span class="s1">3、百威打算在今年世界杯期间用无人机送啤酒</span></p><p class="p1"><span class="s1">4、七喜通过六款复古限量瓶串起50年的回忆</span></p><p class="p1"><span class="s1">5、为了庆祝英国小王子的到来，John Lewis改名字了</span></p>', N'西班牙设计师 Berta Porta Santacana')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (12, N'情报第二十六期：芬达——想要年轻消费者喜欢你?那就和他们玩在一起! ', N'一个有着战争背景的品牌', N'photos/QingBao/QB26.png', N'<p>过去的两周，美团收购摩拜后，摩拜CEO离职了；小米上市前，两位联合创始人离职了；Facebook遭遇信任危机···一系列事件让我们感受到过去两周的不平静，那在广告圈，又发生了些什么事？</p>', N'<p>芬达——想要年轻消费者喜欢你?那就和他们玩在一起!&nbsp;</p><p>芝华士——将品牌内化成一种?活方式，完美诠释“创造性奢侈”</p>', N'<p>知乎为什么将六年前就用过的Slogan又拿出来了？</p><p>MINI打造了一部“舌尖上的荒野求生”，这或许会是你向往的生活</p><p>10秒销售破亿，为什么这么多人被华为P20撩到？</p><p>16秒售罄 | Supreme到底给消费者灌了什么迷药？</p><p><br/></p>', N'<p>椰树发布2018年品牌广告片</p><p>卡夫推出针对中国年轻人新品——趣族</p><p>网易严选联手MINI打造了一家移动咖啡馆，提供生活的另一种选择</p><p>那个一举拿下8个戛纳大奖的“无畏女孩”搬家了</p><p>出道12天，偶像练习生已经拿下了第一个代言</p>', N'北京设计师MA SHIRUI')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (13, N'情报第二十五期：铁达时——不在乎天长地久，只在乎曾经拥有', N'铁达时在上世纪?九十年代的广告至今仍是经典中的经典', N'photos/QingBao/QB25.png', N'<p>最近，阿里收购了饿了么、美团收购了摩拜，营销圈似乎掀起了一场改姓的风波。在娱乐圈，随着《偶像练习生》的完结，这些刚刚出道的偶像们瞬间超越了流量小生成为当下最炙手可热的明星，在未出道时就已经签下了代言。那广告圈最近两周又有哪些大事发生</p>', N'<p>铁达时——不在乎天长地久，只在乎曾经拥有</p><p>Old Spice——宝洁旗下最不正经的品牌，如何成男性市增长率第一? <br/></p>', N'<p>1、扎克伯格接受美国国会听证后，Facebook股价上涨4.5%，这次危机公关值得我们关注</p><p>2、小猪佩奇和优衣库合作，作为“社会人”的你应该了解一下</p><p>3、网易云音乐和亚朵合作打造音乐主题酒店，亚朵在IP酒店的路上越走越远了</p><p>4、三只松鼠同名 3D 动画片开播，它可不止想让人们多吃点坚果</p><p><br/></p>', N'<p>1、易烊千玺成为天猫首位代言人</p><p>2、Line Friends要在肯德基开Party了</p><p>3、G-SHOCK打造“巨无霸”庆祝其诞生50周年</p><p>4、范丞丞成为《偶像练习生》拿下首个代言的选手</p><p>5、奥美中国发布电商白皮书《2018品牌在中国电商的突围战》</p>', N'Nike X ACRONYM')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (14, N'情报第二十四期：尊尼获加｜注定成为广告人的天堂， 成为一个经典的广告品牌', N'你不需要把它当做是一个酒类广告看待，把它当做一件奢侈品来看就好。', N'photos/QingBao/QB24.png', N'<p><span style=";font-family:宋体;font-size:16px"><span style="font-family:宋体">刚刚过去的</span>3<span style="font-family:宋体">月可以说是悲惨的一月，很多传奇人物相继离我们而去，时尚大师纪梵希、李敖、还有霍金。而在广告圈，这一个月也是不平凡，各大品牌都开始了自己全新一年的营销活动。来看看过去的两周品牌们都做了些什么：</span></span></p>', N'<p class="p1"><span class="s1">尊尼获加｜注定成为广告人的天堂，成为一个经典的广告品牌</span></p><p class="p1"><span class="s1">你不需要把它当做是一个酒类广告看待，把它当做一件奢侈品来看就好。</span></p><p class="p2"><span class="s1"></span><br/></p><p class="p1"><span class="s1">Jeep——不是所有吉普都叫Jeep</span></p><p><br/></p>', N'<p class="p1"><span class="s1">1、Airbnb发布新一轮营销战役，这些旅行攻略你在网上可找不到</span></p><p class="p1"><span class="s1">2、被称为“广告脑洞王”的Old Spice进驻中国，第一支广告就找来了邓超</span></p><p class="p1"><span class="s1">3、新版《海尔兄弟》引发争议，这个经典IP已经不是你记忆中的样子了</span></p><p class="p1"><span class="s1">4、抖音正式进行品牌升级，“年轻”“炫酷”已经不再是产品重点</span></p><p><br/></p>', N'<p class="p1"><span class="s1">1、网红麦当劳川味辣酱，终于回国了</span></p><p class="p1"><span class="s1">2、苹果发布了2018首支品牌大片——《一个人可以改变世界》</span></p><p class="p1"><span class="s1">3、OPPO跨界时尚领域，打造R15定制款T恤</span></p><p class="p1"><span class="s1">4、星巴克打造了一家宠物友好门店</span></p><p class="p1"><span class="s1">5、Airbnb联手豆瓣邀你“住进电影里”</span></p>', N'Sebastian Curi')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (15, N'情报第二十三期：亚马逊——以创造消费者需求打造未来品牌', N'在这里，人们可以找到和发现他们想从网上购买的一切', N'photos/QingBao/QB23.png', N'<p><span style=";font-family:宋体;font-size:16px"><span style="font-family:宋体">我们的广告圈《情报》终于又和大家见面了。过去的两周国内外发生了不少大事件，十三届三中全会的召开、第</span>90<span style="font-family:宋体">届奥斯卡颁奖典礼的举行、霍金的逝世、时尚大师纪梵希的逝世···这些大事件也多多少少地影响到了广告圈，看看过去的两周有哪些值得我们记住的案例吧。</span></span></p>', N'<p class="p1"><span class="s1">亚马逊——以创造消费者需求打造未来品牌</span></p><p class="p3"><span class="s1">——在这里，人们可以找到和发现他们想从网上购买的一切</span><span class="s2">。</span></p><p class="p1"><span class="s1">DIESEL——不仅是牛仔裤,更是一种处世态度</span></p>', N'<p class="p1"><span class="s1">1、麦当劳拍摄了一部“麦当劳版舌尖上的中国”，打造本土化营销新方式</span></p><p class="p1"><span class="s1">2、Gucci 用一场秀，告诉你他的后人类世界观</span></p><p class="p1"><span class="s1">3、人民日报用“一分钟”震撼中国人，其实它早已不是我们印象中的“传统媒体”</span></p><p class="p1"><span class="s1">4、2年推出了64款包装，从这个日本茶饮品牌的走红看包装营销应该怎么做</span></p><p><br/></p>', N'<p class="p1"><span class="s1">1、香奈儿在东京开了一家游戏厅</span></p><p class="p1"><span class="s1">2、第90届奥斯卡落幕，《水形物语》成最大赢家</span></p><p class="p1"><span class="s1">3、壳牌建了个网站，和所有地球公民创造未来</span></p><p class="p1"><span class="s1">4、人民日报用“一分钟”震撼中国人</span></p><p class="p1"><span class="s1">5、饿了么发明了一种只能自己打开的外卖盒</span></p><p><br/></p>', N'Andrés Guerrero')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (20, N'情报第二十二期：百事可乐经典春节营销案例', N'百事可乐把《把乐带回家》玩成了IP', N'photos/QingBao/QB22.png', N'<p><span style=";font-family:宋体;font-size:16px"><span style="font-family:宋体">最近，各大品牌的春节热点广告相继推出，广告圈也被各种</span>“团圆”、“喜庆”、“走心”、“煽情”的氛围围绕着。当然除了“春节”，过去的两周，我们还被一股养蛙风环绕着，这股养蛙风还吹到了广告圈，各大品牌开始借势“养蛙”，整个广告圈呈现出一种“红配绿”的现象。</span></p>', N'<p style="white-space: normal;">百事可乐经典春节营销案例</p><p style="white-space: normal;">21大品牌Social案例精选 <br/></p>', N'<p style="white-space: normal;">最近朋友圈刮起了一股养蛙风，这款放置类游戏为什么会风靡？</p><p style="white-space: normal;">麦当劳找来李雷和韩梅梅教你英语，这对经典CP已经成为国民IP了</p><p style="white-space: normal;">旺旺这个充满童年回忆的国产品牌，仅用3个月就赢回年轻人的心</p><p><br/></p>', N'<p style="white-space: normal;">欧莱雅跨界国博，打造中国风彩妆系列</p><p style="white-space: normal;">TFboys和小虎队玩了把隔空对唱</p><p style="white-space: normal;">网易云音乐推出《音乐故事集》，把故事唱给你听</p><p style="white-space: normal;">Airbnb携手《蓝色星球2》推出一间特别的民宿</p><p style="white-space: normal;"><br/></p><br/>', N'摩登天空MVM')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (25, N'情报第二十一期：RED BULL —一个专注做极限内容营销的功能性饮料', N'红牛其实是一家体育内容营销公司，只是......顺便在卖饮料而已。', N'photos/QingBao/QB21.png', N'<p><span style="font-family: 宋体;font-size: 17px">2018<span style="font-family:宋体">年的第一份广告圈情报来了！</span><span style="font-family:Helvetica">2018</span><span style="font-family:宋体">年一开年，就出现了很多刷屏案例和新的风口，比如网易云音乐的年度歌单、支付宝的年度账单、各种直播答题</span><span style="font-family:Helvetica">App</span><span style="font-family:宋体">的出现</span><span style="font-family:宋体"></span></span></p>', N'<p class="p1"><span class="s1">RED BULL ：一个专注做极限内容营销的功能性饮料</span></p><p class="p3"><span class="s1">全球最好看的圣诞广告都在这里！</span></p>', N'<p class="p1"><span class="s1">大胆预测 | 2018年，广告营销领域会出现哪些趋势？</span></p><p class="p1"><span class="s1">各大平台先后上线“舞蹈”功能，“舞蹈”会成为2018年的一大热词吗？</span></p><p class="p1"><span class="s1">直播答题分钱模式爆红，不到10天就冲上App Store排行榜前10</span></p><p class="p1"><span class="s1">二次元市场已达1000亿元，看罗森如何用二次元做营销</span></p><p><br/></p>', N'<p class="p1"><span class="s1">红旗汽车换logo了</span></p><p class="p1"><span class="s1">宜家推出一个杂志广告，让你在广告上尿尿</span></p><p class="p1"><span class="s1">可口可乐推出自己首款专属字体</span></p><p class="p1"><span class="s1">网易云音乐打造了一个“镜面长廊”</span></p>', N'巴西设计师Estudio Pum')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (48, N'情报第二十期：妮维雅——百年护肤品牌以小搏大迅速占领市场', N'凭借一个秘密武器稳扎稳打地赢得市场的认可', N'photos/QingBao/QB20.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">在过去的两周，似乎被圣诞季的广告占领了。但除了暖暖爱意的圣诞节日广告外，广告圈也发生了不少大事。</span></span></p>', N'<p><span style="font-family: Helvetica;font-size: 16px"><span style="font-family:宋体">天猫</span>——<span style="font-family:宋体">为消费者打造未来的理想生活</span></span></p>', N'<p class="p1"><span class="s1">大胆预测 | 2018年，广告营销领域会出现哪些趋势？</span></p><p class="p1"><span class="s1">各大平台先后上线“舞蹈”功能，“舞蹈”会成为2018年的一大热词吗？</span></p><p class="p1"><span class="s1">直播答题分钱模式爆红，不到10天就冲上App Store排行榜前10</span></p><p class="p1"><span class="s1">二次元市场已达1000亿元，看罗森如何用二次元做营销</span></p><p><br/></p>', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">腾讯</span>QQ<span style="font-family:宋体">正式上线了一个尬舞功能</span></span></p><p><span style="font-family: Times;font-size: 16px"><span style="font-family:宋体">汉堡王在圣诞节前送了一整个餐厅给粉丝</span></span></p><p><span style="font-family: Times;font-size: 16px"><span style="font-family:宋体">吴亦凡成为茶</span>π<span style="font-family:宋体">最新代言人</span></span></p><br/>', N'波兰插画师Bartosz Kosowski')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (58, N'情报第十九期：Google | 一个创造未来生活的品牌', N'我们允许工程师花20%的工作时间做自己想做的事情', N'photos/QingBao/QB19.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">从双</span>11<span style="font-family:宋体">到黑五再到双</span><span style="font-family:Helvetica">12</span><span style="font-family:宋体">，持续了近两个月的购物狂欢节要暂时告一段落了。除了各大电商之间的比拼外，上两周的广告圈还有哪些大事发生呢？又有哪些品牌的成功营销是我们需要了解的？</span></span></p>', N'<p><span style="font-family: Helvetica;font-size: 16px"><span style="font-family:宋体">匡威</span> | <span style="font-family:宋体">一个一百多岁的年轻品牌</span><span style="font-family:Helvetica">,</span><span style="font-family:宋体">如何变成年轻人文化的一部分</span><span style="font-family:Helvetica">?</span></span></p>', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">《国家宝藏》火了，这档豆瓣评分</span>9.3<span style="font-family:宋体">分的文博类节目为何会吸引年轻人？</span></span></p>', N'<p><span style="font-family: Helvetica; font-size: 16px;"><span style="font-family:宋体">无印良品用</span>37968<span style="font-family:宋体">支笔打造了一个圣诞礼物</span></span></p>', N'罗马设计师')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (63, N'情报第十八期：百威啤酒——有着百年历史的营销老手', N'鼎盛时期，每售出的两瓶啤酒中，就有一瓶是百威', N'photos/QingBao/QB18.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">过去的两周，我们的各大公众平台被三种颜色刷了屏。而在这三种颜色刷屏的背后，我们的广告圈又在悄悄地发生着什么</span>?</span></p>', N'<p>百威啤酒——有着百年历史的营销老手<br/>必胜客——美国总统都愿意为它拍广告</p>', N'<p>1.圣诞季来了,星巴克为何能让消费者为了纸杯买咖啡？<br/>2.2017维多利亚的秘密结束了，而OPPO这侧获利有点多！<br/>3.从“不负好时光”到“把每个平凡日常变成美好时光”来聊聊腾讯视频的品牌升级<br/>4.为了2018年重回一线城市，德克士都做了哪些努力?</p>', N'<p>农夫山泉出奇招推护肤品<br/>易烊千玺成为Adidas neo全新品牌代言人<br/>麦当劳用自己的食材做了一顿法国大餐<br/>优衣库开始连载漫画了</p>', N'Tom HRVB')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (64, N'情报第十七期：Vans——从破产到成为年轻潮流文化标签的营销之路', N'一个超越地心引力和规则束缚的品牌', N'photos/QingBao/QB17.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">过去的两周，广告圈似乎要被各种双</span>11<span style="font-family:宋体">营销活动霸屏了。而对于国外的广告圈来说，圣诞季已经悄悄到来了，每年最期待的</span><span style="font-family:Helvetica">John Lewis</span><span style="font-family:宋体">也带来了其最新的圣诞广告大片。来看看在购物季和圣诞季的双重夹击下，广告圈还发生了哪些大事？</span></span></p>', N'<p>Vans——从破产到成为年轻潮流文化标签的营销之路<br/>本田 | ?个把汽车玩出趣的品牌</p>', N'<p>最近“吃鸡游戏”大火，这会给广告圈带来怎样的影响？<br/>盘点 | 那些紧随市场环境变化下4A公司的整合<br/>谁说中年男人会很油腻？来聊聊广告人发现的那些中年人洞察<br/>红星二锅头 | 为了转型和升级，这个68年的白酒品牌都做了什么？</p>', N'<p>John Lewis推出2017最新圣诞大片<br/>德克士也开始了“无人自助”餐厅<br/>微信公布了2017 最新数据报告<br/>必胜客和网易一起开了一家“黑店”<br/>伍迪·艾伦新作《摩天轮》预告片来了，或许会勾起你的怀旧感<br/>惊！汉堡王把国王的胡子剃掉了！</p>', N'法国插画家 Florent Hauchard')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (65, N'情报第十六期：UNDER ARMOUR | 从细分市场入手，二十年间成为体育品牌巨头', N'这个仅仅用了二十年就成为了世界第二体育用品巨头的品牌在广告营销方面都做了那些努力？', N'photos/QingBao/QB16.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">上两周也是相当的丰富，十九大开幕，点燃了满满的爱国情怀；双十一预热也随即展开，一年一度的购物狂欢节，天猫和京东也是玩得不亦乐乎。除了这些，广告圈还有不少有趣的事发生。</span></span></p>', N'<p>UNDER ARMOUR | 从细分市场入手，二十年间成为体育品牌巨头<br/>KFC | 用不变的炸鸡味道，火了近70年<br/></p>', N'<p>丹麦国宝IP乐高今年深度布局中国，他们做了什么来吸引中国中产阶级？<br/>双11将至，各大电商巨头玩法盘点——京东<br/>天猫双11预售已经开始了，这一届的预热不仅仅有海报那么简单！<br/>喜迎十九大，为我党传播力疯狂打call！</p>', N'<p>宜家一则“逼婚”广告引争议，官方表示已撤下<br/>妮维雅男士联手饿了么做了个早餐盒<br/>窦靖童代言SK-II的第一则广告宣传片来了，和之前的画风有点与众不同<br/>《王者荣耀》登录北美，中国游戏或将风靡全球<br/>红星二锅头三大主力产品全面升级焕新<br/>伦敦最大的广告牌想要捕捉你的情绪</p>', N'葡萄牙设计师Serafim Mendes')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (66, N'情报第十五期：健力士黑啤|一个在全球拥有大量死忠粉的品牌,是如何一步步虏获人心的?', N'在营销方面，健?士一直不断地在升级?己的品牌,以及升级?己品牌与消费者沟通的方式 。', N'photos/QingBao/QB15.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">国庆假期结束了，重回工作岗位的你感觉怎么样？有没有被各种广告、八卦、新闻扰乱了节奏？我们整理了一下这两周广告圈发生的大事，快来看看吧！</span></span></p>', N'<p>健力士黑啤|一个在全球拥有大量死忠粉的品牌,是如何一步步虏获人心的?<br/>曼妥思|一个趣味十足的品牌<br/></p>', N'<p>90岁的国货回力再度成为爆款，在这背后都做了什么<br/>深度｜ofo跨界之王的成功营销案例，有哪些值得借鉴的营销思维？<br/>因为一部热播动画片让麦当劳再次成为网红，一盒四川辣酱竟然拍卖到14700美元！<br/>距双11还有40多天，我们对去年天猫双11营销内容做了复盘<br/></p>', N'<p>必胜客用送货袋打造了一款冬季夹克<br/>大众点评 × 摩拜 | 这可能是最炫的共享单车了<br/>多芬为涉种族歧视广告道歉<br/>士力架 X ofo小黄车，联手打造饿货专享单车<br/>谷歌开了一家甜甜圈小店，这是要进军美食界的节奏吗<br/>宜家全新品牌店即将开张，用17000把钥匙做了一个猎鹰<br/></p>', N'Chicago Delicious Design League')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (67, N'情报第十四期：米其林—一个玩了上百年的超级大IP', N'IP如此火热的当下，如何才能玩转一个好IP', N'photos/QingBao/QB14.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">国庆中秋双节来临之际，大家一定都在忙着赶路回家或去到你们的旅行目的地，但也不要忘了还有很多其它广告圈情报需要了解。</span></span></p>', N'<p>米其林—一个玩了上百年的超级大IP<br/>汇丰银行 | 顺应经济形势下的品牌重塑之路</p>', N'<p>你可能还不知道广告圈已经开始玩“解构主义”了<br/>大卫·奥格威曾经说过：这个人改变了我一生<br/>豆瓣评分9.0的国产网剧《白夜追凶》火爆背后，我们应该了解些什么？<br/>故宫这个“百年IP”爆红的背后可不是卖个萌就可以了</p>', N'<p>回力90周年，推出海外专属系列“WOS33”<br/>用弹珠来讲述麦肯锡的发展史<br/>Apple Watch 3首支广告片《Roll》上线了<br/>绝对伏特加推出史诗级广告片<br/>汉堡王 X 抖音：舔肘挑战<br/>继王老吉变黑后，百事可乐也变黑了</p>', N'设计工作室 Studio Zwupp')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (72, N'情报第十三期：大众甲壳虫 | 文案必看的“消费者攻心套路”', N'一个利用反传统的逆向定位法强调产品缺点的品牌', N'photos/QingBao/QB13.png', N'<p><span style="font-family: Helvetica;font-size: 15px">iPhone X<span style="font-family:宋体">面世了，热门又被段子手们霸占了！虽然到底是</span><span style="font-family:Helvetica">iPhone</span><span style="font-family:宋体">好还是小米好的问题一直被争论着，但也不要忘了还有很多其它广告圈情报需要了解。<span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体"></span></span></span></span></p>', N'<p>大众甲壳虫 | 文案必看的“消费者攻心套路”<br/>多芬｜从贩卖一块香皂到女性个性化营销</p>', N'<p>“尬文化”已经成为2017年不可忽视的一个现象<br/>补脑系列 | 另类、荒诞，却令广告圈着迷的“邪典电影”风<br/>洞察研究 | 那些天天发朋友圈的人到底心里在想什么？<br/></p>', N'<p>FACEBOOK 开始玩线下交友了？<br/>肯德基 | 以后吃饭可以直接“刷脸支付”了！<br/>王老吉包装变黑了，已经有20万人下订单！<br/>GAP怎么了？未来三年将关闭200家门店<br/>淘宝《一千零一夜》第二季来了！又到了深夜放毒时间<br/></p>', N'澳门艺术家Au Chon Hin')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (73, N'情报第十二期：百事可乐—原来在80年期，它就在用时下最火的营销方法！', N'百事可乐如何寻找差异，抢占可乐的市场份额？', N'photos/QingBao/QB12.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">虽然最近两天一直在被</span>“<span style="font-family:宋体">小朋友</span><span style="font-family:Helvetica">”</span><span style="font-family:宋体">画廊刷屏，前两天的海底捞公关稿也霸占了好几天的热搜榜，但也不要忘了还有很多其它广告圈情报需要了解。看看这两周广告圈又有什么大事发生</span></span><br/></p>', N'<p>百事可乐—原来在80年期，它就在用时下最火的营销方法！<br/>KIT KAT—— 一个营销战役60年的经久不衰之路<br/></p>', N'<p>作为一名合格的广告人，这些经典广告你应该知道一下！<br/>战狼为什么这么火？因为吴京除了会拍电影，他还懂营销<br/>复盘 | 2017年上半年广告黑榜<br/>天猫超级品类日 | 消费升级了，天猫开始这样卖货了！</p>', N'<p>ofo小黄车 X 凤凰 | 那个充满回忆的“二八车”又回来了<br/>让大楼整个动起来，可口可乐做到了<br/>亨氏推出了最新Campaign，让你品尝到被发到朋友圈的那些美食<br/>Nissan找来了一只猪作为跑道的设计师，心疼赛车手！</p>', N'The Cult Film Festival')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (81, N'情报第十一期：ADIDAS—全明星营销打造世界级运动品牌', N'只有与消费者成功沟通，你的广告才满足及格的标准', N'photos/QingBao/QB11.png', N'<p>这个8月感觉过得出奇的快，每天都在《战狼2》一次又一次的票房记录中度过。除了《战狼2》，广告圈也是一个接一个的大事发生，第一篇文章中提到的李维斯打码广告足足刷了一周的屏</p>', N'<p>ADIDAS—全明星营销打造世界级运动品牌<br/>多力多滋-?户的需求才是营销的本质</p>', N'<p>腾讯 VS 阿里 | 8月8日，两大巨头都来搞事情！<br/>为什么各大品牌如此喜欢《中国有嘻哈》？<br/>《奇葩说》开了一家冰淇淋快闪店，“IP+新零售”真的会是下一个风口吗？<br/></p>', N'<p>被称为“星巴克之父”的咖啡品牌要来中国了！<br/>腾讯QQ和innisfree悦诗风吟走到一起了<br/>网易建了座爱情碑谷，想让你和死去的爱情来一场正式的告别<br/></p>', N'俄罗斯设计师Erik Musin')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (82, N'情报第十期：乐高 | 1个玩具公司到优秀媒体的进阶之路', N'乐高市场产品部执行副总裁马斯尼佩尔表示', N'photos/QingBao/QB10.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">话说，这已经是第十期广告圈情报了，看了这么多期，你觉得怎么样？（有什么样的建议和想法都可以留言告诉我们）还是老规矩，接下来就看看近两周广告圈都发生了什么大事吧！</span></span></p>', N'<p>乐? | ?个玩具公司到优秀媒体的进阶之路<br/>李维斯 | 如何扭转落后局面，重回巅峰地位？</p>', N'<p>喜茶 | 一个品牌走向网红的背后都做了些什么<br/>在“Just Do It”诞生29年之际，Nike的广告是要改走幽默路线了吗?<br/>抖音 | 日均播放量超3.5亿的App，背后都做了什么？<br/>脑补了！盘点近期广告视觉中最火的设计风格！</p>', N'<p>可口可乐宣布正式下架零度可乐<br/>肯德基代言人队伍再次壮大，这次请来了TFboys<br/>继ofo小黄车定位为“轻”后，摩拜也给自己了一个定位<br/>百事可乐推出了一系列没有文案和logo的广告<br/>汉堡王曾因一只鸡红极一时，KFC却恰恰败在一只鸡上</p>', N'Omakase Room by Tatsu')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (83, N'情报第九期：Perrier | 你不会想到一瓶水可以如此性感', N'法国人说：我们接吻前用Perrier漱口；伍迪艾伦说：没了Perrier，叫我们知识分子怎么活？', N'photos/QingBao/QB9.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">又到了每两周一次的广告圈情报汇总的时候了，这两周又被刷屏了好几次，比如广告人不可能不知道的戛纳国际创意节，还有淘宝造物节、沙县轻食</span>···<span style="font-family:宋体">那么，除此之外，这两周还有哪些值得关注的广告圈资讯呢？</span></span></p>', N'<p>Perrier | 你不会想到一瓶水可以如此性感<br/>新秀丽|用多元化构建全球旅行箱领导品牌</p>', N'<p>Droga5又拍了一条零差评广告！<br/>让戛纳评委告诉你：赢得狮子的正确姿势！<br/>揭秘迅速爆红的“沙县轻食”<br/>江小白骨子里就是一家创意公司</p>', N'<p>孙俪成为依云首位全球大使的中国代表<br/>亚马逊“Prime会员日”来中国了，它能赶超淘宝京东吗？<br/>广电总局找来32位明星拍摄了一则广告片<br/>什么？KFC正式更名为K’eh FC？</p>', N'阿迪达斯位50个州设计了50双鞋')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (84, N'情报第八期：奥迪——我们不追时髦，我们设计自己的风格', N'奥迪创始人奥古斯特·霍希说：我决心任何情况下，都只生产动力强劲高品质的汽车。', N'photos/QingBao/QB8.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">刷屏了</span>2<span style="font-family:宋体">周的戛纳创意节终于在上周结束了，感觉整个广告圈都充斥着戛纳两个字，所以，这次我们整理了除戛纳创意节以外的广告圈资讯，看看上两周广告圈都发生了哪些大新闻吧！</span></span></p>', N'<p>奥迪—我们不追时髦，我们设计自己的风格<br/>潘多拉—珠宝行业的“叛逆者”</p>', N'<p>特劳特回答为什么华语版《深夜食堂》如此失败<br/>PITCHINA X 佛海佛瑞：一家小而美的创意热点如何实现全球化<br/>广告人夜生活指南<br/>不小心卖起了披萨的“科技公司”，如何“完虐”必胜客？</p>', N'<p>华尔街上那个无畏的女孩一举拿下戛纳4项全场大奖<br/>SK-II | 撕下女孩手腕上的“保质期”<br/>10年后，麦当劳再签约代言人，这次是吴亦凡<br/>继音乐盒后，奥利奥准备把口味也换一换<br/>芬达推出了最新版的“扭扭瓶”，这个设计花了5年时间<br/>你知道看到10亿种颜色是什么感觉吗？</p>', N'墨西哥插画师')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (85, N'情报第七期：优衣库 | 撕下“快时尚”标签之路', N'优衣库的创始人柳井正曾说：优衣库成长的过程，就是一个历经了无数次失败的过程。', N'photos/QingBao/QB7.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">看完浓浓酸菜味的中国版《深夜食堂》，又到了半月一次的大创创划重点时刻！过去两周广告圈发生的大事都在这了！</span></span></p>', N'<p>优衣库 | 撕下“快时尚”标签之路<br/>新西兰航空—航空界网红的创新营销</p>', N'<p>广告人的心酸<br/>汉堡王改名字了！原因竟然是惹毛了比利时王室！<br/>lululemon | 先别急着卖产品，这之前还有更重要的事要做！<br/>原来场景化营销还可以这样玩！宜家厉害了！</p>', N'<p>奢侈品牌“借鉴”了宜家的环保袋，宜家就此炫耀了2个月<br/>日服《阴阳师》推出TVC，颜值绝对在线<br/>鹿晗成为adidas Originals全新大中华区品牌形象代言人<br/>苹果急了？最新广告怒怼安卓！<br/>厉害了！Airbnb上出现了史上最大房东！<br/>搜狗 | 什么？连狗狗也开始靠脸吃饭了？！</p>', N'法国插画家Lili des Bellons')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (86, N'情报第六期：可口可乐—130年不变的霸主之路', N'可口可乐在可乐界的霸主地位毋庸置疑，毕竟可乐这个产品是由可口可乐公司发明的。', N'photos/QingBao/QB6.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">虽然还没瘦到有粽子一样的尖下巴，但粽子可别忘了吃！话说，你们那里是吃甜粽子还是咸粽子？粽子节，也不能少了定期划重点的时刻！看看过去两周广告圈又发生了什么大事吧？</span></span></p>', N'<p>可口可乐—130年不变的霸主之路<br/>奥利奥—如何成功“泡到”消费者？</p>', N'<p>TWG TEA | 一个来自新加坡的茶品牌，如何颠覆人们对茶的认知？<br/>人工智能制作的广告真的出街了！<br/>苹果的营销新模式：一不小心，你可能就看了1小时的广告！<br/>Tiffany文案合集，单身人士···绕行！</p>', N'<p>TFBOYS拍摄了一个士力架版《降妖记》<br/>Papi酱变“鸟人”了<br/>“ofo”改名了变成“ofo小黄车”<br/>奥利奥推出黑科技音乐盒<br/>麦当劳推出送餐到桌服务，这和普通餐厅还有什么区别？<br/>梦龙携手MOSCHINO推出“双倍梦龙”</p>', N'Mark Gmehling')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (89, N'情报第五期：汉堡王多变的广告营销策略之路', N'曾经销量一度赶超麦当劳的汉堡王，如今却离霸主地位越来越远。', N'photos/QingBao/QB5.png', N'<p>随着现在自媒体时代的到来，“信息碎片化”这个词经常在各种场合被提到，虽然我们每天都在接收着大量的信息，但难免会没有重点。所以，我们就来给大家对于过去两周的大事划个重点！<strong><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体"></span></span></strong></p>', N'<p>汉堡王多变的广告营销策略之路<br/>茶里王——玩转年轻上班族策略</p>', N'<p>这个世界怎么了？“负能量”为何也能成为营销热点？<br/>在还没有特劳特《定位》的年代，它就已经这样做广告了！<br/>“一周一花”的营销模式还能火多久？<br/>一个成人网站推出免费看高清片活动，销量反而增加了50倍！</p>', N'<p>时隔五年，“嫩牛五方”强势回归<br/>Droga5策划了一场“慢动作马拉松”<br/>苹果第一次在全球推出了中国主题的广告片<br/>MICHAEL KORS联手Faceu，打造出了“包”治百病贴图<br/>肯德基联手《中国国家地理》玩起了摄影<br/></p>', N'名牌恩怨 中国插画师郑鸣浩')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (93, N'情报第四期：雀巢咖啡—用差异化营销让人爱上喝咖啡', N'针对不同的咖啡文化，雀巢咖啡会制定相应的营销策略，这也是雀巢咖啡的一个营销特点——差异化营销。', N'photos/QingBao/QB4.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">最近真的很同情各位同行，热点一个接一个，什么世界地球日、世界读书日、第一艘中国制造的航母首次下水</span>···<span style="font-family:宋体">除此之外，还有震惊广告圈内外的</span><span style="font-family:Helvetica">“</span><span style="font-family:宋体">黄小厨事件</span><span style="font-family:Helvetica">”</span><span style="font-family:宋体">。</span></span></p>', N'<p><span style="font-family: Helvetica;font-size: 16px"><span style="font-family:宋体"></span></span>雀巢咖啡—用差异化营销让人爱上喝咖啡<br/>【农夫山泉】如何讲好一瓶水的故事？<span style="font-family: Helvetica;font-size: 16px"><span style="font-family:宋体"></span></span></p><p><br/></p>', N'<p>莺屋书店—为什么它一来，连【诚品书店】都慌了？<br/>给你一本设计与排版的葵花宝典！<br/>台湾全联超市经典文案合集<br/></p>', N'<p>彩虹合唱团又有大动作！优雅地吐槽，用内容为品牌服务！<br/>百事可乐广告被撤后，竟然急疯了广告人<br/>苹果给自己戴了顶绿帽子<br/>达康书记火了之后，还兼职做上了安全体验官！<br/></p>', N'菲律宾插画师Ivan Despi')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (94, N'情报第三期：杜蕾斯——如何成为营销界的老司机？', N'利用“性”进行传播是很危险的，利用的好能引起话题，利用的不好就是对品牌形象的损坏。', N'photos/QingBao/QB3.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">最近到处都是有大新闻的节奏，白百合出轨，顶着巨大压力的金三胖，还有天天帮忙查</span>“<span style="font-family:宋体">贪官</span><span style="font-family:Helvetica">”</span><span style="font-family:宋体">的广大人民群众</span><span style="font-family:Helvetica">···</span><span style="font-family:宋体">回到广告圈，最近也是不得安宁，可能是因为水逆，接连两则广告都被撤下了。</span></span></p>', N'<p>杜蕾斯——如何成为营销界的老司机？<br/>士力架——“饿货”策略打造魔性品牌</p>', N'<p>什么？品牌要进入“老龄化”了？<br/>他就是靠着这4招叱咤整个平面设计江湖的！<br/>做社会化媒体运营的9个Tips<br/>百事可乐投放了一天的广告，就被骂得撤销了！</p>', N'<p>可口可乐请来“股神”当代言人<br/>香奈儿携手“暮光女郎”演绎嘉柏丽尔精神<br/>墨西哥地铁出现了带有“丁丁”的座位，仅男士可坐<br/>陌陌MOMO换新logo了！<br/>刚刚被央视点了名的Nike，转身就上了天了！</p>', N'巴西插画师Johann Vernizzi')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (95, N'情报第二期：这么多互动营销新“姿势”，还怕玩不出创意吗？', N'到底什么是互动营销？如何做一场有创意的互动营销？互动营销有哪些值得学习的成功案例？', N'photos/QingBao/QB2.png', N'<p><span style="font-family: Helvetica;font-size: 15px"><span style="font-family:宋体">从三八妇女节的借势热点，到</span>315<span style="font-family:宋体">晚会各大品牌有喜有忧，过去的两周有很多有趣又值得我们深思的营销事件产生，本期情报就来总结一下。</span></span></p>', N'<p>这么多互动营销新“姿势”，还怕玩不出创意吗？<br/>IBM的智慧营销之路—用简单创造价值</p>', N'<p>看了这些才知道，原来蔡康永是个金牌文案！<br/>9大影响消费者行为的心理学原则<br/>做营销最常出现的6种错误<br/>开脑洞 | 只有广告人，可以把世界名画玩成这样！</p>', N'<p>Youtube用6秒的时间讲完了一本世界名著！<br/>奥利奥推出新口味，能让你的便便变成粉色！<br/>以后华尔街那头标志性的铜牛身边都会多个女孩！<br/>三星虽然躲过了315，但电池爆炸这个问题可躲不过<br/>0成本，也能制作一个刷屏案例！<br/>“老佛爷”被代言了肯德基5号！</p>', N'Andrew Fairclough')
INSERT [dbo].[Advices] ([Id], [Title], [Subhead], [PicUrl], [Daoyan], [CoverStory], [Dinting], [Snakes], [Arbitrary]) VALUES (96, N'情报第一期：绝对伏特加的绝对公式', N'就因为这个公式，让绝对伏特加在借势营销和话题方面，可谓是“为所欲为”。', N'photos/QingBao/QB1.png', N'<p>绝对伏特加的绝对公式<br/>诚品书店—因为梦想这件事是诚品做的，所以意义就不同</p>', NULL, N'<p>安迪·沃霍尔—一位执着于做广告的鬼才艺术家<br/>从《三生三世十里桃花》看植入式广告历史<br/>关于怎样写好文案，大卫·奥格威有话说<br/>这有27个问题，你在写文案前最好问问自己<br/></p>', N'<p>PLAYBOY | 把穿上的衣服又脱掉了<br/>奥迪 | 这可能是至今为止最先进的玩具了！<br/>华盛顿邮报声称：民主将在黑暗中消亡<br/>百事可乐 | 准备把自己的广告拍成电影<br/>这有的广告你接受吗？<br/>用六种不同“肤色”的包装回击种族歧视</p>', N'英国新锐插画师：Jenni Desmond')
SET IDENTITY_INSERT [dbo].[Advices] OFF
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (41, N'Instgram发布节日送礼指南', N'营销，创意，视频', N'互联网', N'国外', N'文案', N'平面媒体', N'unknow', NULL, N'photos/photo/201812141648241588.png', N'<p><span style="font-size: 18px;">上就到圣诞节了,互送礼物的季节即将到来,要想为心中的那个他(她)挑选一份诚意满满的礼物,可得牢记不</span></p><p><span style="font-size: 18px;">仑你想在圣诞树下放什么样的礼物,可千万要保证当它被晒在 nstgram上时,一定是美美的。</span></p><p><br/></p><p><span style="font-size: 18px;">国外数字媒体公司 Sweety Highs在2017年的一项名为20172世代年轻人收送节日礼物习惯及影响因素”的报告中</span></p><p><span style="font-size: 18px;">以13-22岁的女孩为调查对象)显示,在13-16岁的女孩中,有58%的人表示希望收到的礼物可以帮助她们在社交</span></p><p><span style="font-size: 18px;">媒体上获得点赞和分享,其中在17-19岁的女孩中,这个比例为29%;20-22岁的女孩中为26%。对于乙世代年轻人</span></p><p><span style="font-size: 18px;">来说,他们之间的联系尤为紧密,并且随时在互联网上把握着彼此的动向,所以收到一个能晒的出手的节日礼物对</span></p><p><span style="font-size: 18px;">其而言真的很重要。</span></p><p><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;">近曰 Instagram联合了平台上 Fitbit、 Everland、 Follin、 Levis、 Bulletin. co等34个品牌拍摄了6支短片(类似于微</span></p><p><span style="font-size: 18px;">博故事),短片中充满了各种颇具时尚风格的NS风元素,还有当下较为热门的ASMR场景,品牌标签也能在短片</span></p><p><span style="font-size: 18px;">中找到,此外这6支短片被标上# InstaGiftGuide主标签,当然还有今年 Instagram上最热门的6个标签,包括</span></p><p><span style="font-size: 18px;"># catsofinstagram、# oddlysatisfying等</span></p><p><span style="font-size: 18px;"><br/></span></p><p><br/></p>', NULL, CAST(0x0000A9B601177FC9 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (49, N'Spotify今年的年终活动承包用户收听“怪癖”', N'营销，创意，事件营销，酷品牌，大数据', N'互联网', N'国外', N'文案', N'平面媒体', N'<br/>', N'Agency', N'photos/newAnli/2.jpg', N'<p style="text-align: justify;">Spotify的全球年终营销活动【Wrapped】在今年进行到了第三年，今年的活动主题是挖掘和分享平台用户的古怪歌单。比如不同的歌名中带有相同的单词“shark”，但是收听次数悬殊很大。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912817633787.png" title="1543554142918909.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912819665944.png" title="1543554142904716.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912824811615.png" title="1543554142461122.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912854318525.png" title="1543554143688387.png"/></p><p><span style="text-align: justify;">Spotify</span><span style="text-align: justify;">自</span><span style="text-align: justify;">2016</span><span style="text-align: justify;">年</span><span style="text-align: justify;">12</span><span style="text-align: justify;">月开始以平台上的用户听歌数据来做化外广告，</span><span style="text-align: justify;">2016</span><span style="text-align: justify;">年的出街广告中，包含了一些有趣的用户听歌数据，比如在</span><span style="text-align: justify;">2016</span><span style="text-align: justify;">年的情人节当天，《</span><span style="text-align: justify;">Sorry</span><span style="text-align: justify;">》这首歌当天平均播放次数高达</span><span style="text-align: justify;">42</span><span style="text-align: justify;">次；距离身处电影院附近的用户，最爱听音乐剧原声带《</span><span style="text-align: justify;">Hamilton Soundtrack</span><span style="text-align: justify;">》，在</span><span style="text-align: justify;">2016</span><span style="text-align: justify;">年共听了</span><span style="text-align: justify;">5376</span><span style="text-align: justify;">次；还有用户竟然在</span><span style="text-align: justify;">6</span><span style="text-align: justify;">月份就听起圣诞歌曲，是迫不及待等着过节收礼么？这些有趣的用户数据被</span><span style="text-align: justify;">Spotify </span><span style="text-align: justify;">挖掘出来并透过诙谐的文案巧妙的利用在户外广告牌中，让路人在会心一笑中对</span><span style="text-align: justify;">Spotify</span><span style="text-align: justify;">的距离感也近了些。</span></p><p><span style="text-align: justify;"></span></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912866050754.jpg" title="1543554177585739.jpg"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912865747792.jpg" title="1543554177911501.jpg"/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-family: &quot;Microsoft JhengHei&quot;, Arial; font-size: 10px; background-color: rgb(255, 255, 255);">法国Spotify户外广告</span></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912862877517.jpg" title="1543554177493340.jpg"/></p><p style="text-align: center;"><span style="font-family: &quot;Microsoft JhengHei&quot;, Arial; background-color: rgb(255, 255, 255); color: rgb(127, 127, 127); font-size: 10px;">英国Spotify户外广告</span><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452912873436875.jpg" title="1543554177451967.jpg"/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 10px;">写给从六月份开始听圣诞歌曲的孩子，哈</span><br/></p><p style="text-align: justify;">Spotify
的2017年的“Wrapped”功能是为会员提供基于收听喜好的定制播放列表（有点像去年年终网易云推出的个人一年歌曲收听回顾），该活动不仅让会员们
觉得Spotify很重视他们（个性化服务），而且还通过强调用户一年花在Spotify上的时间来重申用户对这个平台的贡献，因此Spotify用户对
该功能的回应大部分是积极的。这种利用用户数据的营销活动，在实施过程中品牌要注意的是不要侵犯到用户的隐私，毕竟用户的平台数据是个人化信息，用于商业
宣传需谨慎。</p><p style="text-align: center;"><br/></p><p style="text-align: center;"><br/></p>', N'Spotify', CAST(0x0000A9BC0100CE96 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (86, N'2019年日历合集', N'营销，创意，生活', N'互联网', N'国外', N'视频', N'平面媒体', N'<br/>', NULL, N'photos/newAnli/201812201623478482.jpg', N'<p style="white-space: normal; text-align: justify;">对讲究生活仪式感的人来说，新年伊始，身 边一定要备好两件东西，新一年的日历以及新一年的手账，然后在元旦这一天，翻开日历的第一页，对自己说一句：新的一年，又要开始啦！当然，对于年末纠结于 为许久不见的好友挑选一份心意好礼的你，一本有质感、有内涵的日历该是个不错的选择，当他收到这本日历，每天翻过崭新的一页就能想到你一次哦（小心机）~ 年末将至我们为大家梳理了一份好玩又不失调性的日历清单，时间不会将你遗忘，大创意也会陪伴你充实度过每一天。</p><p style="white-space: normal; text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>1、单向历</strong></span></p><p style="white-space: normal; text-align: justify;">由单向空间推出的单向历绝对算得上国内文创手撕日历的先锋以及主力，他家的单向历每天都附上每日“宜忌”，配以相关的大师之言。2019年单向历的手撕日历分为四个版本，传统的曙红、铸黑，高级的黑金限量款，以及不断提醒你珍惜时间的倒计时款。</p><p style="white-space: normal; text-align: center;"><br/></p><p style="white-space: normal; text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545102815877951.png" title="1545102815877951.png"/></p><p style="white-space: normal; text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>2、豆瓣电影日历</strong></span><br/></p><p style="white-space: normal; text-align: justify;">豆瓣出的翻页日历也是文艺青年们人手一本的。同往年一样，2019年也是森林绿、朱砂红和乌木黑三种颜色，套装版还配有豆瓣2019日程本，内页包括了年历、月计划以及日计划，简单的设计适合不喜欢过多装饰的人。</p><p style="white-space: normal; text-align: center;"><img src="http://www.pitchina.com.cn/Uploads/20181218/1545103082654650.png" title="1545103082654650.png"/></p><p style="white-space: normal; text-align: center;"><br/></p><p style="white-space: normal; text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>3、<span style="text-align: justify; font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; letter-spacing: 0.544px;"></span><span style="color: rgb(51, 51, 51); letter-spacing: 0.544px; text-align: justify;">国家地理摄影原创日历</span></strong></span></p><p style="white-space: normal;"><span style="text-align: justify;">今年值得关注的还有国家地理中文网出版的【2019国家地理摄影原创日历】。</span><span style="text-align: justify;">这不仅是一本日历，更是一本值得收藏的摄影集，365张照片，自然、人物、动物、风光全都在里面，每一天翻开新一页，去探索新的世界。</span></p><p style="white-space: normal;"><br/></p><p><section><section><section><section><section><p style="text-align: center;"><img src="http://www.pitchina.com.cn/Uploads/20181218/1545103416779520.png" title="1545103416779520.png" alt="屏幕快照 2018-12-18 上午11.22.49.png"/></p><span style="background-color: rgb(255, 192, 0);"><strong>4、网易云音乐日历</strong></span><br/></section><section><p style="text-align: justify;">网易云的日历，采用黑胶唱片的设计，非常复古而日历内页紧扣音乐品牌的理念，一首歌、一段歌词，带给你每天不一样的音乐体验。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; overflow-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(47, 47, 47); box-sizing: border-box !important; overflow-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; font-size: 13px; letter-spacing: 1px; box-sizing: border-box !important; overflow-wrap: break-word !important;"></span></span></p><p style="text-align: center;"><img src="http://www.pitchina.com.cn/Uploads/20181218/1545103664655883.png" title="1545103664655883.png" alt="屏幕快照 2018-12-18 上午11.27.41.png"/></p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>&nbsp;5、虾米音乐日历&nbsp;</strong></span></p><p style="text-align: center;">虾 米音乐订制款日历十分特别，以经典录音机为原型设计，每一款日历都包含两个部分：实体磁带和抽拉式日历。实体磁带的灵感，来源于虾米播放器横屏时出现的卡 带页面。特别的播放设计深受虾米粉丝的喜爱，磁带一度成为虾米的“icon”之一。日历的独特之处，除了抽拉式的互动感，还包括音乐专题的内容性。此次， “不撞衫”日历的主题为：365天环球音乐之旅。基于此，虾米音乐以12个月份站点，设计了184张日历页面、365个虾小编精选音乐专题，鼓励用户用 365天发现全新的自己。</p><p><br/></p></section></section></section></section></section></p><p><br/></p><p><br/></p>', NULL, CAST(0x0000A9BC010E6A50 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (87, N'《天猫双11全球狂欢节十周年》', NULL, N'互联网', N'国外', N'视频', N'平面媒体', N'<br/>', NULL, N'photos/newAnli/1.jpeg', N'<p></p><p><article><h3 class="emd-title"><img src="/ueditor/asp/upload/image/20181220/15452945267441114.jpeg" alt="/Uploads/20181203/nwWH2kWkXyh2XBSNuf.jpeg"/><span style="font-size: 16px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><br/></h3><p>“天猫双11”，对于很多人来说，已经不仅仅是买买买了。如今，它已经成为一场全球购物狂欢节。从“光棍节”的打折促销和
秒杀到今天，“天猫双11“十岁了。也许十年前你还没有实实在在的参与到这项革命性的购物体验，但总有那么一天你不知不觉的将网购当成放学去校门口小卖店
买干脆面一样平常。而这就是我们正在经历的，十年，我们见证天猫，天猫也在见证我们。</p><p>2009年，为了在“十一”黄金周后的淡季里帮助商家清库存，阿里巴巴首次开展“双11”活动。十年过去了，“双11”从
一场简单的打折促销活动已经演变成一场全球的狂欢，而这十年，不仅仅有天猫的成长，更有每个人的故事，我们何时拍下了双11的第一单，在双11买的最贵的
一件物品是什么···这些都留存着每个消费者的记忆。本期《42》月刊，我们将带你启动天猫双11时光机···感受这十年来，天猫双11的改变。</p></article></p><p></p><p><br/></p>', NULL, CAST(0x0000A9BC010FA71A AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (88, N'PITCHINA金牌会员计划', N'新闻', N'互联网', N'国内', N'视频', N'平面媒体', N'<br/>', NULL, N'photos/newAnli/3.jpg', N'<blockquote><p style="text-align: center;"><strong>? 12个月会员资格</strong></p><p style="text-align: center;"><strong><strong style="white-space: normal;">?&nbsp;</strong>每月4份案例</strong></p><p style="text-align: center;"><strong><strong style="white-space: normal;">?&nbsp;</strong>月末附赠彩蛋</strong></p><p style="text-align: center;"><strong><strong style="white-space: normal;">?&nbsp;</strong>加入专属社群</strong></p></blockquote><p><br/></p><p style="text-align: center;"><strong><span style="color: rgb(255, 192, 0);">——金牌会员介绍——</span></strong></p><p><strong><span style="color: rgb(255, 192, 0);"><br/></span></strong></p><p><span style="font-size: 14px;">PITCHINA一直相信：当你看到足够多好的案例时，你会发现更多“可能性”，也只有在看过更多优秀案例后，你才会有源源不断的好创意，才可能做出比这些案例更优秀的案例。因此PITCHINA在2016年11月正式推出了年度会员制案例学习项目——【金牌会员】。</span></p><p><span style="font-size: 14px;">订阅年度金牌会员后，你将在每周三收到一份由PITCHINA整理编辑的广告营销案例集，每月一共四份案例集，额外还会附送一份案例彩蛋。</span></p><p><span style="font-size: 14px;">除了案例集之外，PITCHINA还提供【金牌会员群】，供大家结识人脉、交流经验、分享心得。</span></p><p>&nbsp;</p><p style="text-align: center;"><strong><span style="color: rgb(255, 192, 0);">——订阅内容——</span></strong></p><p><span style="font-size: 14px;">目前PITCHINA的案例集主要按品牌维度整理，当然，我们也会在合适的时候推出不同主题的案例集。每份案例集中（除彩蛋外），你都将看到：</span></p><p style="text-align: center;"><span style="font-size: 14px;">一份PDF文档</span></p><p style="text-align: center;"><span style="font-size: 14px;"><img src="/ueditor/asp/upload/image/20181220/15452948235317182.png" title="1534819388644671.png" alt="屏幕快照 2018-08-21 上午10.42.44.png"/></span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 14px;">案例集的核心。其中包含某个品牌的背景、品牌分析、广告策略分析、品牌发展脉络、历年精选案例的说明。</span></p><p style="text-align: center;"><span style="font-size: 14px;">若干视频及平面文件</span></p><p style="text-align: center;"><span style="font-size: 14px;"><img src="/ueditor/asp/upload/image/20181220/15452948234424641.png" title="1534819402726811.png" alt="屏幕快照 2018-08-21 上午10.42.53.png"/></span></p><p style="text-align: center;"><span style="font-size: 14px; color: rgb(127, 127, 127);">案例集的附件。我们会将我们所能搜集到的所有有关这个品牌/主题相关的案例附件，尽可能多地将参考提供给大家。</span></p><p><span style="font-size: 14px;"><br/></span></p><p style="text-align: center;"><strong><span style="font-size: 14px;">特别提醒</span></strong></p><p style="text-align: center;"><span style="font-size: 14px; background-color: rgb(0, 0, 0); color: rgb(255, 255, 255);"><strong>NOTICE</strong></span></p><p><span style="font-size: 14px; background-color: rgb(255, 255, 255); color: rgb(127, 127, 127);">金牌会员案例集中仅提供已经出街的案例作品，并不涉及任何策划方案、活动方案、创意方案、执行方案，提案文件、PPT文件……我们分享的是案例，并非商业机密。</span></p><p><span style="font-size: 14px; background-color: rgb(255, 255, 255); color: rgb(127, 127, 127);">因此，需要这类机密文件的朋友，请免开尊口。我们不提供，也不知道哪里提供，同时我们不相信无缘无故一夜刷屏的假案例，绝对杜绝拿别人的方案作参考，或者拿别人的案例随便改改就变成自己的。</span></p><p>&nbsp;</p><p style="text-align: center;"><span style="color: rgb(255, 192, 0);"><strong>——会员期——</strong></span></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">本月内进行订阅，会员期将从本月算起，往后持续12个月。而本月已出的案例集将在订阅完成后的当天之内发送到你的邮箱。具体请见以下订阅情况：</span></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;"><br/></span></p><p style="text-align: center;"><span style="color:#7f7f7f"><span style="font-size: 14px; color: rgb(0, 0, 0);">月初订阅</span></span></p><p style="text-align: center;"><span style="font-size: 14px; background-color: rgb(0, 0, 0); color: rgb(255, 255, 255);">SITUATION 1</span></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">若本月最新案例还未更新，则需要等到周三更新当日收取案例，往后正常每周三领取案例。</span></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">例如：2018年4月1日订阅，会员期将于4月算起，一直持续到2019年3月31日。而4月的第一份案例将于4月4日（四月的第一个周三）更新，在案例更新后，你将于案例更新日当天之内收到你的第一份案例。往后于案例更新日（每周三）收取案例，直到会员期截止。</span></p><p style="text-align: center;"><span style="font-size: 14px;">月中订阅</span></p><p style="text-align: center;"><span style="font-size: 14px; background-color: rgb(0, 0, 0); color: rgb(255, 255, 255);">SITUATION 2</span></p><p><span style="font-size: 14px; color: rgb(127, 127, 127);">月中订阅，将在订阅后的当天内收取到本月已推出的案例集，往后正常每周三领取案例。</span></p><p><span style="font-size: 14px; color: rgb(127, 127, 127);">例如：2018年4月12日订阅，会员期将于4月算起，一直持续到2019年3月31日。而4月已经推出的2份案例将于订阅当天发送到你的邮箱。往后于案例更新日（每周三）收取案例，直到会员期截止。</span></p><p style="text-align: center;"><span style="font-size: 14px;">月末订阅</span></p><p style="text-align: center;"><span style="font-size: 14px; background-color: rgb(0, 0, 0); color: rgb(255, 255, 255);">SITUATION 3</span></p><p><span style="font-size: 14px; color: rgb(127, 127, 127);">将一次性拿到本月全部案例，往后正常每周三收取案例。</span></p><p><span style="font-size: 14px; color: rgb(127, 127, 127);">例如：</span><span style="color: rgb(127, 127, 127); font-size: 14px;">2018年4月30日订阅，会员期从4月算起，一直持续到2019年3月31日。而4月已经推出的4份案例和1份彩蛋将于订阅当天之内，一次性全部推送到你的邮箱。往后于案例更新日（每周三）收取案例，直到会员期截止。</span></p><p>&nbsp;</p><p style="text-align: center;"><span style="color: rgb(255, 192, 0);"><strong>——更新时间——</strong></span></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">每周三24点前更新案例集。</span></p><p>&nbsp;</p><p style="text-align: center;"><span style="color: rgb(255, 192, 0);"><strong>——收取方式——</strong></span></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">邮件领取，请在订阅时认真填写你的预留邮箱地址并核实。我们将用vip@pitchina.com.cn的邮箱发送案例集，请注意查收。</span></p><p>&nbsp;</p><p style="text-align: center;"><strong><span style="color: rgb(255, 192, 0);">——订阅往期内容——</span></strong></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">请联系PITCHINA金牌会员主理人大创创（微信：pitchina_dcc）详谈。</span></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">&nbsp;</span></p><p style="text-align: center;"><strong><span style="color: rgb(255, 192, 0);">——没收到案例——</span></strong></p><p><span style="color: rgb(127, 127, 127); font-size: 14px;">请不要慌张。因为我们VIP邮箱日常的发送量很大，经常会被判定为垃圾邮件。如果在更新日你没有收到最新案例，请先检查垃圾箱，或订阅邮件栏目，如果都没有收到，请随时联系PITCHINA金牌会员主理人大创创（微信：pitchina_dcc）。</span></p><p>&nbsp;</p><p><br/></p>', NULL, CAST(0x0000A9BC0110F829 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (89, N'2019年日历合集 ', N'营销，创意，生活', N'互联网', N'国内', N'视频', N'社交媒体', N'<br/>', NULL, N'photos/newAnli/4.jpg', N'<p style="white-space: normal; text-align: justify;">对讲究生活仪式感的人来说，新年伊始，身
边一定要备好两件东西，新一年的日历以及新一年的手账，然后在元旦这一天，翻开日历的第一页，对自己说一句：新的一年，又要开始啦！当然，对于年末纠结于
为许久不见的好友挑选一份心意好礼的你，一本有质感、有内涵的日历该是个不错的选择，当他收到这本日历，每天翻过崭新的一页就能想到你一次哦（小心机）~
年末将至我们为大家梳理了一份好玩又不失调性的日历清单，时间不会将你遗忘，大创意也会陪伴你充实度过每一天。</p><p style="white-space: normal; text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>1、单向历</strong></span></p><p style="white-space: normal; text-align: justify;">由单向空间推出的单向历绝对算得上国内文创手撕日历的先锋以及主力，他家的单向历每天都附上每日“宜忌”，配以相关的大师之言。2019年单向历的手撕日历分为四个版本，传统的曙红、铸黑，高级的黑金限量款，以及不断提醒你珍惜时间的倒计时款。</p><p style="white-space: normal; text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452949899394346.png" title="1545102815298825.png"/></p><p style="white-space: normal; text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452949904560872.png" title="1545102815877951.png"/></p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>2、豆瓣电影日历</strong></span><br/></p><p style="text-align: justify;">豆瓣出的翻页日历也是文艺青年们人手一本的。同往年一样，2019年也是森林绿、朱砂红和乌木黑三种颜色，套装版还配有豆瓣2019日程本，内页包括了年历、月计划以及日计划，简单的设计适合不喜欢过多装饰的人。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452949914859680.png" title="1545103082654650.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452949926954970.png" title="1545103082114943.png"/></p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>3、<span style="text-align: justify; font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; letter-spacing: 0.544px;"></span><span style="color: rgb(51, 51, 51); letter-spacing: 0.544px; text-align: justify;">国家地理摄影原创日历</span></strong></span></p><p><span style="text-align: justify;">今年值得关注的还有国家地理中文网出版的【2019国家地理摄影原创日历】。</span><span style="text-align: justify;">这不仅是一本日历，更是一本值得收藏的摄影集，365张照片，自然、人物、动物、风光全都在里面，每一天翻开新一页，去探索新的世界。</span></p><p><section><section><section><section><section><p><img src="/ueditor/asp/upload/image/20181220/15452949922066012.png" title="1545103416779520.png" alt="屏幕快照 2018-12-18 上午11.22.49.png"/><img src="/ueditor/asp/upload/image/20181220/15452949938226033.gif" title="1545103416856094.gif" alt="640.gif"/></p><span style="background-color: rgb(255, 192, 0);"><strong>4、网易云音乐日历</strong></span><br/></section><section><p style="text-align: justify;">网易云的日历，采用黑胶唱片的设计，非常复古而日历内页紧扣音乐品牌的理念，一首歌、一段歌词，带给你每天不一样的音乐体验。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; overflow-wrap: break-word !important; text-align: center;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; overflow-wrap: break-word !important; color: rgb(47, 47, 47);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; overflow-wrap: break-word !important; font-size: 13px; letter-spacing: 1px;"></span></span><img src="/ueditor/asp/upload/image/20181220/15452949948544128.png" title="1545103664655883.png" alt="屏幕快照 2018-12-18 上午11.27.41.png"/></p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>&nbsp;5、虾米音乐日历&nbsp;</strong></span></p><p style="text-align: justify;">虾
米音乐订制款日历十分特别，以经典录音机为原型设计，每一款日历都包含两个部分：实体磁带和抽拉式日历。实体磁带的灵感，来源于虾米播放器横屏时出现的卡
带页面。特别的播放设计深受虾米粉丝的喜爱，磁带一度成为虾米的“icon”之一。日历的独特之处，除了抽拉式的互动感，还包括音乐专题的内容性。此次，
“不撞衫”日历的主题为：365天环球音乐之旅。基于此，虾米音乐以12个月份站点，设计了184张日历页面、365个虾小编精选音乐专题，鼓励用户用
365天发现全新的自己。</p><p></p></section></section></section></section></section></p><p><br/></p>', NULL, CAST(0x0000A9BC0111C7AB AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (90, N'梨视频回顾2018年诠释“不变的力量”', N'营销，精选，合集，视频', N'互联网', N'国内', N'视频', N'社交媒体', N'<br/>', N'', N'photos/newAnli/5.png', N'<p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);">岡本#0.01见#玩转冷酷感</span></p><p style="white-space: normal;">近
几日，社交媒体上也出现了一个热词#0.01见#，在这个凛冬里引起了网上热火朝天的讨论，成为了年末年轻人的话题之一。#0.01见#是由岡本为12月
18号的天猫超级品牌日发起的话题，为了超级品牌日的预热，冈本竟然开了家圣诞版本的刨冰店。全球唯一的&nbsp;0.01&nbsp;冷酷薄冰店，很冷酷很动感。整家店面
以圣诞节日作为主题，主色调以节日常用的香槟金作为主色调，搭配一些稍显透明的银色，还有不少专属的红色和绿色，渲染出浓厚的节日氛围。冈本选择用“冷
酷”来表达热恋，把“冷酷刨冰店”搬到大众的面前，使得人们对这款圣诞限量产品形成独特的记忆点<span class="s1">。</span><img src="/ueditor/asp/upload/image/20181220/15452951529709105.jpg" title="1545230386369722.jpg"/></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);">Vans |&nbsp;不胖、不立，肥年快乐</span></p><p style="white-space: normal; text-align: justify;">随
著中国农历新年的到来，Vans&nbsp;携手设计师苏五口其品牌&nbsp;Purlicue&nbsp;特别推出「猪年」生肖联名系列别注鞋款，今回系列特别以「不胖，不立，肥年
快乐」作为主题，透过独特「放大」的设计语言，演绎时下年轻人忠于自我、自由生长，而收获精神的余裕的生活哲学。为了展现“肥”元素，球鞋的鞋带都设计成
超宽系列，后跟的标志性Logo贴片也做了放大处理。</p><p style="white-space: normal; text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452951534194340.png" title="1545231131730350.png" alt="屏幕快照 2018-12-19 下午10.08.00.png"/></p><p style="white-space: normal; text-align: center;"><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="800" height="100" src data-setup="{}"></video></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0); text-align: justify;">OPPO开启「奇幻新年」</span><br/></p><p style="white-space: normal; text-align: justify;">OPPO
 为 R17 | R17 Pro 新年版开启「奇幻新年」，不仅携手&nbsp;Ignasi Monreal 
从东西方神话中汲取灵感带来系列画作及影片，将福、运、爱等 9 
个最美好的主题融入其中，还在上海上演「奇幻新年大秀」，亮相装点着传统中式元素的时尚服装，为消费者带来新年的奇幻祝福。<a href="https://www.pitchina.com.cn/index.php/Work/article_apply?work_id=5161" target="_blank" title="1">(点此查看更多）</a></p><p style="white-space: normal; text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452951551448013.png" title="1545230709437005.png" alt="屏幕快照 2018-12-19 下午10.45.36.png"/></p><p><br/></p>', NULL, CAST(0x0000A9BC01127841 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (91, N'偷懒和变美可以兼得，这款养生零食看来要火', N'营销，创意，视频，洞察，大品牌，', N'互联网', N'国内', N'视频', N'社交媒体', N'zhenzhen', N'unknown', N'photos/newAnli/6.png', N'<p>12.19—21号是天猫超级品类日的燕窝专场，以“理想生活&nbsp; 
美丽一气喝成”为口号主打即食燕窝，和往常一样，每场天猫超级品类日都会找准专场品类的目标人群，同时从人群画像中找到一个共有的insight，对其进
行营销宣传。与超级品牌日及大促活动不同，超级品类日的定位是一个主打消费升级、加速潜力品类增长的营销IP。一方面，超级品类日能够透过平台累积的消费
数据，帮助商家了解已经形成一定规模的消费新趋势，并通过调动平台资源，给予商品一定的流量倾斜，抢先一步抓住变化的消费者。另一方面，超级品类日结合品
类现状及消费者洞察推出的创意内容，帮助消费者建立对新品类及新品牌的认知。自去年5月推出的“天猫超级品类日”就瞄准了踩在消费（升级）趋势上的潜力品
类，帮助创意能力不足、预算有限的品牌与更多消费者建立连接，在提升品牌力的同时带来销售转化。</p><p><br/></p><p style="text-align: justify;">此次，超品日即食燕窝专场瞄准了九零后养生大军，说道传统养生补品燕窝，给人的感觉是中年贵妇专享的保养品？NO NO，近期<span style="color: rgb(25, 31, 37); font-family: &quot;Microsoft YaHei&quot;, &quot;Segoe UI&quot;, system-ui, Roboto, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif, Tahoma, &quot;Segoe UI Symbol&quot;; font-size: 14px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 21px; white-space: pre-wrap; widows: 1; background-color: rgb(255, 255, 255);">COSMO</span>和
天猫大数据合作推出了一组关于九零后养生现状的行为调研，其中提炼出很多有趣的洞察，比如26-30岁非单身男生的燕窝购买力最强（女友或者丈母娘都要送
啦）、90后孕妈购买燕窝单笔投入高达5000元、90后已成为即食燕窝消费主力而且趋于年轻化等等，总的来说，90后热衷于养生但是因为种种不可控的现
状导致养生工作无法推进，所以新晋养生单品即食燕窝现在是为广大朋克养生90后种草的好时机，毕竟红枣枸杞已经满足不了他们高涨的养生热情。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452954464616254.jpg" title="1545277389460964.jpg" alt="69937224f65e4ca1acb82d18ed1b48ac.jpg"/></p><p style="text-align: center;"><span style="font-size: 10px; color: rgb(127, 127, 127);">来自<span style="color: rgb(25, 31, 37); font-family: &quot;Microsoft YaHei&quot;, &quot;Segoe UI&quot;, system-ui, Roboto, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif, Tahoma, &quot;Segoe UI Symbol&quot;; font-size: 14px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 21px; white-space: pre-wrap; widows: 1; background-color: rgb(255, 255, 255);">COSMO</span>(部分数据）</span></p><p><span style="text-align: justify;">在此次天猫超品日即食燕窝产品的推广</span><span style="text-align: justify;">TVC</span><span style="text-align: justify;">中，一共出现六类、覆盖了</span><span style="text-align: justify;">90</span><span style="text-align: justify;">后的大部分人群，其中针对</span><span style="text-align: justify;">90</span><span style="text-align: justify;">后的</span><span style="text-align: justify;">“</span><span style="text-align: justify;">懒式养生</span><span style="text-align: justify;">”</span><span style="text-align: justify;">来输出即食燕窝的产品特点</span><span style="text-align: justify;">——</span><span style="text-align: justify;">既省事又能保持冻龄，据</span><span style="text-align: justify;">9</span><span style="text-align: justify;">月份天猫超级品类日的面部精华日数据透露，超过</span><span style="text-align: justify;">50%</span><span style="text-align: justify;">的精华被</span><span style="text-align: justify;">90</span><span style="text-align: justify;">后包揽，所以对于</span><span style="text-align: justify;">“</span><span style="text-align: justify;">保鲜</span><span style="text-align: justify;">”</span><span style="text-align: justify;">这件事，还有谁能比她们更上心呢</span><span style="text-align: justify;">~</span><br/></p><p><span style="text-align: justify;"><br/></span></p><p><span style="text-align: justify;"></span></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452954489952275.jpg" title="1545277544611330.jpg"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452954497954941.jpg" title="1545277544713377.jpg"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452954507277281.jpg" title="1545277544275008.jpg"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452954516833804.jpg" title="1545277544829012.jpg"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452954527317601.jpg" title="1545277544236363.jpg"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452954536555328.jpg" title="1545277544227746.jpg"/></p><p><br/></p>', N'unknown', CAST(0x0000A9BC0113DD3F AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (92, N'2018 我们如何与世界相处？', N'新闻，视频，大品牌，现在将来时', N'互联网', N'国内', N'文案', N'社交媒体', N'BAZINGA', N'知乎', N'photos/newAnli/7.png', N'<p>每到年末，各大平台都会推出一个年度盘点，在继Google和百度之后，知乎也推出了自己的2018 年度大事记——《2018 我们如何与世界相处？》。</p><p>知乎对于这一问题的答案是——热爱。</p><p><br/></p><p><br/></p><p>知乎用其平台自身最受关注的问题作为视频的连接，和单纯盘点不同的是，知乎的这些问题不仅可以让我们看到2018年大家都在思考些什么，还能引发人们的好奇去知乎搜寻答案。知乎不仅是这些事件的见证者，也见证了每个用户对事件的发声。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452958087246244.png" title="1545276699940650.png" alt="屏幕快照 2018-12-20 上午11.30.12.png"/></p><p>2017年，知乎也推出了一支年度大事记，其中记录了“美联航强制乘客下机”、“韩国总统朴槿惠被罢免”、、“WePhone创始人自杀”、“共享单车大战”、“章莹颖美国遇害案”、“好莱坞性侵丑闻”、“江歌案宣判”等事件，让我们看到了人们的知识、经验和见解。</p><p><br/></p><p><br/></p>', NULL, CAST(0x0000A9BC011579F3 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (93, N'OPPO携中西方众神来拜早年了', N'视频', N'互联网', N'国内', N'文案', N'社交媒体', N'BAZINGA', N'', N'photos/newAnli/8.png', N'<p>前两天，OPPO R17 
Pro推出了一直新年版广告片。有网友看到后评论说，还以为是Gucci推出的广告片。这并不让人意外，众神的形象与现代元素的结合，与近两年Gucci
的风格却有相似之处，而这个作品背后的创作者之一也是之前和Gucci有过合作的西班牙艺术家Ignasi Monreal。</p><p><br/></p><p>这一系列东西方神话的碰撞，给我们带来了一个乌托邦世界：</p><p><br/></p><p>除了这支广告片，Ignasi Monreal还为OPPO R17 Pro创作了一系列有趣的画作。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217287630678.gif" title="1545217287630678.gif" alt="OPPO-qihuanxinnian-13-2018-12-18.gif"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217298620206.jpg" title="1545217298620206.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217298774077.jpg" title="1545217298774077.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217299900672.jpg" title="1545217299900672.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217299685735.jpg" title="1545217299685735.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217299633647.jpg" title="1545217299633647.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217299355087.jpg" title="1545217299355087.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217300337335.jpg" title="1545217300337335.jpg"/></p><p>与此同时推出的新品发布会，OPPO也将其打造成了一场奇幻大秀，邀请一众模特演绎中国古典元素的西装服饰。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217316502171.jpg" title="1545217316502171.jpg" alt="65ef2e69gy1fy9xixa44nj20u013ohdt.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181219/1545217319959099.jpg" title="1545217319959099.jpg" alt="65ef2e69gy1fy9xpzkk7nj218s0u0e81.jpg"/></p><p><br/></p>', NULL, CAST(0x0000A9BC0115F8B1 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (94, N'网易云为听歌戳泡泡的Sati减压空间拍了支TVC', N'营销方法，运营，创意，精选，合集', N'互联网', N'国内', N'文案', N'社交媒体', N'Pitchina', N'', N'photos/newAnli/9.jpg', N'<p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);"><br/></span></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);">网易云为听歌戳泡泡的Sati减压空间拍了支TVC</span></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);"><br/></span></p><p style="white-space: normal;">网
易云为自己的Sati空间推出一支TVC，从中能看到ASMR元素。通过观察Sati空间着3种模式，睡眠模式、专注模式和解压模式，网易云是想打造一个
相对舒适解压的空间。结合Sati的命名其实不难看出网易云音乐的用心：它在倡导正念的理念，帮助人们去享受正念的好处，这也是网易云音乐的野心——它想
培养用户的一种生活方式。说不定就在不远的将来，这个Sati空间就会像网易云音乐里面的用户生产内容（UGC）一样，成为平台的核心战斗力，打造一大批
极致忠诚的用户，与其他贩卖数字专辑的音乐APP成为有着最根本的差异。</p><p><br/></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);">雷佳音“入职”支付宝</span></p><p style="white-space: normal;">今
天，支付宝宣布，有一位新员工「入职」，他的职务是「支付宝会员体验官」。这位老兄尽职尽责，接了10个会员客服电话，结果，竟有7个人把他当成骗子……
今天（12月18日），邀请雷佳音作为“支付宝会员体验官”支付宝会员体系全面升级，原“蚂蚁会员”频道更名为“支付宝会员”频道，新增理财课程、书籍订
阅、购物红包等百项权益兑换服务。2019年起，每月20日设定为“支付宝会员日”，届时会推出明星专场音乐会、电影节门票等限量福利。</p><p><br/></p><p style="white-space: normal; text-align: justify;"><span style="background-color: rgb(255, 192, 0);">2019年日历合集 | 如果留不住时间，就让美好停驻吧</span></p><p style="white-space: normal;">这里给各位种草了15款2019年精美日历，来自不同的品牌和行业，希望各位在2019年的每天都能留下点小美好。</p><p style="white-space: normal; text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452961269357954.png" title="1545131460297992.png" alt="屏幕快照 2018-12-18 下午7.11.24.png"/></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0); text-align: justify;">这一套Supreme卡片有点意思</span><br/></p><p style="white-space: normal;">这家广告公司竟然在没有授权情况下，自己出了一套Supreme卡片。有趣的是这些卡片上的文字是用真的<span style="text-align: justify;">Supreme水笔写上的，卡片也是限量发售的，最后的收益将建赠给英国当地的慈善机构</span>。</p><p style="white-space: normal; text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452961268344975.png" title="1545131304532842.png" alt="屏幕快照 2018-12-18 下午7.08.46.png"/></p><p><br/></p>', N'这里都是圣诞广告', CAST(0x0000A9BC0116F42B AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (95, N'蛙儿子终于可以替你还花呗了', N'营销，创意，视频，营销方法，酷品牌，', N'互联网', N'国内', N'文案', N'社交媒体', N'知乎', N'unknown', N'photos/newAnli/10.png', N'<p><br/></p><p style="text-align: justify;">今年对于蚂蚁花呗的“花小呗”来说，是出道的一年。从最初登上商超舞台到各地巡演现场
脱口秀，还有重大购物节也有它的出镜，一路走来花小呗的形象越来越丰满，对于这个不按套路出牌、“爱串场”的戏精来说，每次它出场就一定能带来欢乐气氛，
也为花呗塑造出年轻化、亲近感、土萌的品牌人格，与当下年轻人形成一种心理上的契合。</p><p style="text-align: justify;">最近，听说《旅行青蛙》中的蛙儿子和花小呗竟然搭伙去世界各地旅行了，#花蛙CP#确实属于意料之外的联合。不过，一个佛系青蛙、一个花呗戏精，两个极具冲突的人设，在内容上营造了一种具有趣味感的冲突，在这份冲突的画风里，倒是给消费者带来了不同的内容体验。</p><p style="text-align: center;"><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="800" height="100" src data-setup="{}"></video></p><p style="text-align: justify;">阿
里系这两个差异化极强的两个形象相遇，并碰撞出趣味的火花，并不是偶然，而是阿里鱼在IP交易领域的规划与推动。对于代理《旅行青蛙》这款“凉凉”的游
戏，网友表示阿里对游戏市场的反应太过迟钝，但游戏本身的活跃度或许不是阿里最关心的方面。自今年4月份阿里鱼拿下《旅行青蛙》之后，对于这个深受年轻人
喜欢的 IP 
开发就一直不止步，阿里鱼围绕影视、周边实体等形式开展商品化授权、营销授权、空间授权启动全渠道合作，最大程度挖掘游戏本身所具有的品牌价值，从《旅行
青蛙》中获得品牌变现价值。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545121329481513.png" title="1545121329481513.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545121329297230.png" title="1545121329297230.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545121329170988.png" title="1545121329170988.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545121329765935.png" title="1545121329765935.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545121329112128.png" title="1545121329112128.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545121329356194.png" title="1545121329356194.png"/></p><p><span style="text-align: justify;">此外，对于蚂蚁花呗与《旅行青蛙》这两个完全不相干领域的跨界合作，其实更能引起受众的关注，尤其是在消费者对双方的IP认知度都不低的情况下，将二者联合一起，定能吸引目标消费群体的参与热情。自从蚂蚁花呗和旅行青蛙官宣两者的旅行后，</span><span style="text-align: justify;">社交媒体上</span><span style="text-align: justify;">相关</span><span style="text-align: justify;">social </span><span style="text-align: justify;">话题的谈论度就一度飙升，比如#</span><span style="text-align: justify;">花蛙 CP、</span><span style="text-align: justify;">#戏精花小呗和佛系青蛙、#</span><span style="text-align: justify;">蛙儿子长大了，能帮老母亲还花呗了么、#青蛙帮你还花呗等热门话题，</span><span style="text-align: justify;">旅行青蛙和花呗的官微也用调侃的方式出来互动，抽取幸运用户帮他们还花呗。</span><br/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545120090924373.png" title="1545120090924373.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181218/1545120090373040.png" title="1545120090373040.png"/></p><p><br/></p>', N'这里都是圣诞广告', CAST(0x0000A9BC0117ED86 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (96, N'关于一只脆皮炸鸡的二次元宫斗神剧', N'营销，创意，视频，大品牌，xin''li', N'互联网', N'国内', NULL, N'社交媒体', N'zhenzhen', N'有妖气', N'photos/newAnli/11.png', N'<p style="text-align: justify;">近日，德克士的脆皮炸鸡腿在社
交平台上掀起了一波回忆杀，这要从一批85、90后的童年记忆说起。德克士与肯德基、麦当劳等快餐品牌由大城市向中小城市渗透的发展模式不同，它采取了
“农村包围城市”的策略，依靠先入为主，早些年在国内二三线甚至四五线城市占据了绝对竞争优势，德克士的脆皮炸鸡在这些地区已经成为西式炸鸡的代名词，也
由此成为无数小镇青年的童年美好回忆。据悉，德克士一年就要卖出9000万块脆皮炸鸡，你能想象吗，把这些炸鸡堆起来就相当于1000座喜马拉雅山~</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452968543895414.png" title="1545284070586640.png"/></p><p style="text-align: justify;">因
为德克士的招牌产品脆皮炸鸡是在符合中国人口味的前提下不断调整，使得脆皮炸鸡稳坐“炸鸡头牌”。只是近几年德克士没有在广告上着力宣传这款产品，可能就
没有肯德基手枪腿的知名度高，近几日微博上德克士与颐和园联合发起 #国潮上桌# 
话题，并带来在年轻群体中颇具号召力的“有妖气”创作的TVC，以宫斗题材上演一场“皇家炸鸡”失踪案。</p><p style="text-align: center;"><span style="text-align: justify;"><img src="/ueditor/asp/upload/image/20181220/15452968552427052.png" title="1545284618151377.png" alt="屏幕快照 2018-12-20 下午1.44.02.png"/></span></p><p style="text-align: center;"><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="800" height="100" src data-setup="{}"></video><img src="/ueditor/asp/upload/image/20181220/15452968566059662.png" title="1545284070885475.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452968563326735.png" title="1545284070437405.png"/></p><p style="text-align: justify;">视
频一出，网友纷纷爆出了自己的童年回忆，总的来说“国脆”（与国粹谐音）与宫斗剧情结合的创意的确让人感到惊喜，也许，对于后互联网时代的年轻人来
说，“Remix”真的颇具吸引力。一个月前，德克士也做过一场“Remix”跨界——与气味图书馆推出一款香水，也是德克士的首款香水。这款香水不是手
枪腿味、香脆薯条味、虾堡味、黑胡椒味，竟然是烟熏火燎的味道……原来是德克士为了推出新品“南美烟熏烧烤系列”汉堡，以“气味”作为切入点和记忆点将香
水产品和快餐产品建立关联，不仅很好的解决了受众对&quot;烟熏&quot;的联想难点，也创造了话题性十足的传播点。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181220/15452968585326205.png" title="1545284131482802.png" alt="屏幕快照 2018-12-20 下午1.03.38.png"/></p><p><br/></p>', N'这里都是圣诞广告', CAST(0x0000A9BC011A7ADF AS DateTime), NULL, 2)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (97, N'一家小而美但浑身是传奇的法国独立广告公司', N'创意', N'互联网', NULL, NULL, N'社交媒体', N'<br/>', N'', N'photos/newAnli/12.png', N'<p><br/></p><p>Fred &amp; Farid算得上法国最早期也是最成功的独立广告公司之一，很多国外媒体在提到这两位创意人时都会用上一个词——“传奇”。如果你对这两个名字感到陌生，也没关系，在你看到他们的一些作品后，肯定会恍然大悟：“原来是他们做的”。</p><p><br/></p><p>Fred 和 Farid对自己的规模有着严格的控制，他们把每个工作室的人数控制在150人以内，Farid表示：我们有一个不成文的规定，每家FF工作室不得超过150人。因为一旦超过150人，就很难建立统一的公司文化，很难调动大家的积极性，也很难让这么多人在一起更好地协作，所以我们把规模尽量控制在低于150人。</p><p><br/></p><p>对于创意团队的管理，FF也有着自己的理念，因为FF的员工来自各个国家不同皮肤，所以他们十分注重文化的开放性。同时，他们也很注重扁平化管理，他们认为这样平等的交流可以让更多人想出更好的idea。</p><p></p>', N'这里都是圣诞广告', CAST(0x0000A9BD00A2ECF0 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (98, N'FAQ | 金牌会员常见问题 ', N'详情', N'互联网', NULL, NULL, N'社交媒体', N'<br/>', N'', N'photos/newAnli/13.png', N'<section><section><section><p style="text-align: center;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/BL6ZDmmobeJeM6RUERntER2iba24HY8MTEiaDGsUYpSpXnUQHMA2eA8Q5iciaFKwS3sr9T8Z9J3iaBsgJAvDBSyGT6Q/640?wx_fmt=jpeg&wxfrom=5&wx_lazy=1&wx_co=1"/></p><p style="box-sizing: border-box;"><br/></p></section></section></section><p><section><section><section><section><section><section><section><p style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Q&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong style="box-sizing: border-box;">什么是金牌会员？</strong></p></section></section></section></section></section></section></section><section><section><section><p style="white-space: normal;box-sizing: border-box;text-align: left;">【金牌会员】是PITCHINA大创意推出的一项会员制活动，每周三会推送一份广告营销案例，每个月一共4份广告营销案例，外加一个神秘彩蛋。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p><p style="white-space: normal;box-sizing: border-box;">另外，我们还有【金牌会员群】供大家结识人脉、交流经验、分享心得。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p><p style="white-space: normal;box-sizing: border-box;">我们一直相信：当你看到足够多好的案例时，你会发现更多“可能性”，也只有在看过更多优秀案例后，你才可能做出比这些案例更优秀的案例，才会有源源不断的好创意。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p></section></section></section><section><section><section><section><section><section><section><p style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Q&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong style="box-sizing: border-box;">金牌会员都提供哪些内容？</strong></p></section></section></section></section></section></section></section><section><section><section><p style="white-space: normal;box-sizing: border-box;">金牌会员除了在每周收到一个品牌案例外，目前暂时得不到其他了。不过未来说不准，但只能说保证你亏不着。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p></section></section></section><section><section><section><section><section><section><section><p style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Q&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong style="box-sizing: border-box;">案例是历史悠久的案例还是最新的案例？</strong></p></section></section></section></section></section></section></section><section><section><section><p style="white-space: normal;box-sizing: border-box;">我们会收集从品牌创立之初到现在的几乎所有案例，以展现整个品牌的广告营销发展史，所以案例中会出现很多经典的老广告，但同时我们也会放入近些年不错的广告案例。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p><p style="white-space: normal;box-sizing: border-box;">对于大多数年轻品牌来讲，想要成功，要先看看这些知名品牌在年轻时做了些什么；对于已经成熟的品牌来讲，看看过往的案例，更新一下创意，扩展一下可能性，只有好处。另外这里还有一句话：研究前人的作品，要做好被前人打败的准备，因为你会发现，你想到的东西他们早就想过了，而你没想到的东西，他们已然想到了。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p><p style="white-space: normal;box-sizing: border-box;">插播一下：如果想看最新的广告营销案例在我们的网站上可以随时看。网址：www.pitchina.com.cn。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p></section></section></section><section><section><section><section><section><section><section><p style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Q&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong style="box-sizing: border-box;">你们是否有传播、提案、执行的PPT案例？</strong></p></section></section></section></section></section></section></section><section><section><section><p style="white-space: normal;box-sizing: border-box;">没有。我们提供的品牌案例中除了品牌的视频广告和平面广告外，包括品牌分析、广告策略分析、品牌优秀广告案例分析、全球Campaign分析，除此之外，还会涉及到品牌的包装设计，品牌VI等。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p><p style="white-space: normal;box-sizing: border-box;">但传播、提案、执行的PPT我们是不提供的，我们分享的是案例，不是分享商业机密。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p><p style="white-space: normal;box-sizing: border-box;">PITCHINA的金牌会员们都是抱着看案例为自己开启更多可能性为目的而来的，更多的人会懂得如何透过案例看到策略本身。</p><p style="white-space: normal;box-sizing: border-box;"><br/></p><p style="white-space: normal;box-sizing: border-box;">我们不相信无缘无故一夜刷屏的假案例，绝对杜绝拿别人的方案作参考，或者拿别人的案例随便改改就变成自己的。</p></section></section></section></p><p><br/></p><p><br/></p>', N'这里都是圣诞广告', CAST(0x0000A9BD00A696B2 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (99, N'网易云为听歌戳泡泡的Sati减压空间拍了支TVC', N'营销方法，运营，创意，精选，合集', N'互联网', N'国内', NULL, N'社交媒体', N'Pitchina', N'', N'photos/newAnli/14.png', N'<p><br/></p><p><span style="background-color: rgb(255, 192, 0);">网易云为听歌戳泡泡的Sati减压空间拍了支TVC</span></p><p><span style="background-color: rgb(255, 192, 0);"><span style="background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="background-color: rgb(255, 192, 0);"><span style="background-color: rgb(255, 255, 255);">网易云为自己的Sati空间推出一支TVC，从中能看到ASMR元素。通过观察Sati空间着3种模式，睡眠模式、专注模式和解压模式，网易云是想打造一个相对舒适解压的空间。结合Sati的命名其实不难看出网易云音乐的用心：它在倡导正念的理念，帮助人们去享受正念的好处，这也是网易云音乐的野心——它想培养用户的一种生活方式。说不定就在不远的将来，这个Sati空间就会像网易云音乐里面的用户生产内容（UGC）一样，成为平台的核心战斗力，打造一大批极致忠诚的用户，与其他贩卖数字专辑的音乐APP成为有着最根本的差异。</span></span></p><p><br/></p><p><span style="background-color: rgb(255, 192, 0);">雷佳音“入职”支付宝</span></p><p><br/></p><p>今天，支付宝宣布，有一位新员工「入职」，他的职务是「支付宝会员体验官」。这位老兄尽职尽责，接了10个会员客服电话，结果，竟有7个人把他当成骗子……今天（12月18日），邀请雷佳音作为“支付宝会员体验官”支付宝会员体系全面升级，原“蚂蚁会员”频道更名为“支付宝会员”频道，新增理财课程、书籍订阅、购物红包等百项权益兑换服务。2019年起，每月20日设定为“支付宝会员日”，届时会推出明星专场音乐会、电影节门票等限量福利。</p><p><br/></p><p><span style="background-color: rgb(255, 192, 0);">2019年日历合集 | 如果留不住时间，就让美好停驻吧</span></p><p><br/></p><p>这里给各位种草了15款2019年精美日历，来自不同的品牌和行业，希望各位在2019年的每天都能留下点小美好。</p><p></p>', N'这里都是圣诞广告', CAST(0x0000A9BD00A948F9 AS DateTime), NULL, 3)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (100, N'蛙儿子终于可以替你还花呗了', N'营销，创意，视频', N'互联网', N'国内', NULL, N'社交媒体', N'zhenzhen', N'unknown', N'photos/newAnli/15.png', N'<p>最近，听说《旅行青蛙》中的蛙儿子和花小呗竟然搭伙去世界各地旅行了，#花蛙CP#确实属于意料之外的联合。不过，一个佛系青蛙、一个花呗戏精，两个极具冲突的人设，在内容上营造了一种具有趣味感的冲突，在这份冲突的画风里，倒是给消费者带来了不同的内容体验。</p><p><br/></p><p>阿里系这两个差异化极强的两个形象相遇，并碰撞出趣味的火花，并不是偶然，而是阿里鱼在IP交易领域的规划与推动。对于代理《旅行青蛙》这款“凉凉”的游戏，网友表示阿里对游戏市场的反应太过迟钝，但游戏本身的活跃度或许不是阿里最关心的方面。自今年4月份阿里鱼拿下《旅行青蛙》之后，对于这个深受年轻人喜欢的 IP 开发就一直不止步，阿里鱼围绕影视、周边实体等形式开展商品化授权、营销授权、空间授权启动全渠道合作，最大程度挖掘游戏本身所具有的品牌价值，从《旅行青蛙》中获得品牌变现价值。</p><p><br/></p><p>此外，对于蚂蚁花呗与《旅行青蛙》这两个完全不相干领域的跨界合作，其实更能引起受众的关注，尤其是在消费者对双方的IP认知度都不低的情况下，将二者联合一起，定能吸引目标消费群体的参与热情。自从蚂蚁花呗和旅行青蛙官宣两者的旅行后，社交媒体上相关social话题的谈论度就一度飙升，比如#花蛙 CP、#戏精花小呗和佛系青蛙、#蛙儿子长大了，能帮老母亲还花呗了么、#青蛙帮你还花呗等热门话题，旅行青蛙和花呗的官微也用调侃的方式出来互动，抽取幸运用户帮他们还花呗。</p>', N'这里都是圣诞广告', CAST(0x0000A9BD00ABEF2F AS DateTime), NULL, 2)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (101, N'末日指南 | 打包了几个城市青年“万能趴”', N'节日，生活，电影', N'互联网', N'国内', NULL, N'平面媒体', N'<br/>', N'', N'photos/newAnli/16.png', N'<p style="text-align:center"><img src="/photos/photo/20181221/15453592952752973.png" title="1541162757925134[1].png" alt="1541162757925134[1].png"/></p><p>作为广告人，你肯定深知创意的重要性，但创意不是push出来的，很多创意其实来自于生活，所以懂得放松，如何利用闲暇的时间很重要。你如果在纠结闲暇时该干点什么？我们无法帮你做决定，但可以帮你提供选择。</p><p><br/></p><p><strong>末日来临，毁灭忙碌，这里是第55期《末日指南》。</strong></p><p><strong><br/></strong></p><p><strong>我们为你推荐了3个选择，外出或宅在家都ok，反正生活和宅与不宅无关，随你喜欢，我们的宗旨就是Relax。</strong></p><p style="text-align:center"><img src="/photos/photo/20181221/15453594054415891.jpg" title="1544170439947430[1].jpg" alt="1544170439947430[1].jpg"/></p><p></p><p>周末来到，本周首先不能错过由陈冠希呈现的 2018 INNERSECT 国际潮流文化体验展，在这次的展会期间将会有多款限定产品发售，包括 NEIGHBORHOOD x Dr.Woo 联名系列、CLOT x Air Jordan XIII Low“Terracotta Warriors”等，同时还有多位潮流大拿、艺术家助阵，由陈冠希主持的交流论坛也是不能缺席的环节。而周末两天晚上还有陈冠希、顽童 MJ116、Higher Brothers、Jay Park、Playboi Carti 等音乐人将带来演出环节。<br/></p>', N'这里都是圣诞广告', CAST(0x0000A9BD00AD4F3A AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (103, N'Droga5推出了一系列Supreme节日贺卡', N'新闻', N'互联网', N'国外', NULL, N'社交媒体', N'BAZINGA', N'', N'photos/newAnli/24.png', N'<p><br/></p><p>Supreme的产品设计大多很简单，这也导致了一大批假货的出现，前段时间，有消息称三星要和Supreme合作，结果发现也是个假货品牌。最近上映的美剧Patriot Act with Hasan Minhaj（哈桑·明哈杰:爱国者有话说）中也提到了Supreme，它并没有说人们对它有多狂热，更多地把焦点放在了品牌本身炒作，比如对艺术家Barbara Kruger的侵权和去年刚刚入股的Carlyle Group。这也引起很多人对Supreme的争议。</p><p><br/></p><p>最近，Droga5也参与到这个争议中，推出了#real supreme christmas cards#的活动，并打造了一系列“合理但不合法”的Supreme卡片，不合法的原因在于他们并没有和Supreme合作，也没有得到授权。这些卡片有自己的专属网站，可以在上面购买，5英镑到50英镑不等，收益将全部捐给英国慈善机构Shelter，帮助那些无家可归的人们。</p><p><br/></p><p>最近，Droga5也参与到这个争议中，推出了#real supreme christmas cards#的活动，并打造了一系列“合理但不合法”的Supreme卡片，不合法的原因在于他们并没有和Supreme合作，也没有得到授权。这些卡片有自己的专属网站，可以在上面购买，5英镑到50英镑不等，收益将全部捐给英国慈善机构Shelter，帮助那些无家可归的人们。</p><p style="text-align:center"><img src="/photos/photo/20181221/15453602666847715.png" title="1545121373184416[1].png" alt="1545121373184416[1].png"/></p><p><br/></p>', N'这里都是圣诞广告', CAST(0x0000A9BD00B12E4F AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (105, N'汉堡王又玩火，还推出了一个99美元的周边', N'视频，大品牌', N'互联网', N'国外', NULL, N'平面媒体', N'BAZINGA', N'', N'photos/newAnli/26.png', N'<p>1697年，瑞典发生了一场大火，当时因为瑞典的很多建筑是木质结构，所以这场大火损失惨重，包括瑞典当时的皇宫和国家图书馆。现在瑞典的王子卡尔·菲利普（Prins Carl Philip）几年前为了让大家铭记这场大火设计了一个壁炉防风屏，将当时被大火付之一炬的建筑用防风屏的形式展现，放在壁炉前时，那场大火仿佛就在眼前。</p><p><br/></p><p>最近，瑞典的汉堡王也用同样的方式打造了一个壁炉防风屏。来自斯德哥尔摩代理商Ingo将汉堡王的大火史也搬到了壁炉前，是不是想起了汉堡王曾经用其大火照片做的一系列广告。不同的是，这次汉堡王真的推出了这个产品，99美元，可以在亚马逊购买。</p>', N'这里都是圣诞广告', CAST(0x0000A9BD00B3E5A5 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (106, N'CCTV倾情制作，2018世界杯海报', N'cctv，世界杯，创意', N'互联网', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'', N'photos/newAnli/27.png', N'<p>后天就是举世瞩目的世界杯开赛日了，今年关于世界杯的营销可谓是花样众多，不知道哪款最能迎合球迷粉丝们的口味呢？值得一提的是CCTV这两天的刷
频海报，这是CCTV首次为世界杯参赛队定制专属中文海报，同时也是国内首创。标语文字形态充满张力，由南门书法创始人朱敬一执笔完成。<br/></p><p><br/></p><p><br/></p><p style="text-align: center;">A组</p><p><img src="/ueditor/asp/upload/image/20181221/15453670865563963.jpeg"/></p><p style="text-align: center;">俄罗斯队</p><p><img src="/ueditor/asp/upload/image/20181221/15453670874588749.jpeg"/></p><p style="text-align: center;">沙特队</p><p><img src="/ueditor/asp/upload/image/20181221/15453670871044265.jpeg"/></p><p style="text-align: center;">埃及队</p><p><img src="/ueditor/asp/upload/image/20181221/15453670872037763.jpeg"/></p><p style="text-align: center;">乌拉圭队</p><p style="text-align: center;"><br/></p><p style="text-align: center;"><strong>B组</strong></p><p><img src="/ueditor/asp/upload/image/20181221/15453670889787616.jpeg"/></p><p style="text-align: center;">葡萄牙队</p><p style="text-align: center;">“上天给了你太多的才华</p><p style="text-align: center;">就注定不会给你太平坦的路”</p><p><br/></p>', N'这里都是圣诞广告', CAST(0x0000A9BD00D03DB4 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (107, N'娱乐圈最著名的球迷鹿晗', N'社会化，营销，创意，文案，视频，精选', N'互联网', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'', N'photos/newAnli/28.png', N'<p><span style="background-color: rgb(255, 192, 0);">娱乐圈最著名的球迷鹿晗，在2018世界杯开始前被委以重任</span></p><p><br/></p><p>昨日鹿晗在优酷·世界杯战略发布会上，被授予全能分享官身份。现场鹿晗说起足球来头头是道，预测东道主俄罗斯队会以2：0赢得开幕战胜利，但本届比赛他最看好法国队。至于自己的踢球风格，鹿晗自评是C罗+贝克汉姆。</p><p><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453672576395765.jpg" title="1528800018874050.jpg" alt="鹿晗.jpg"/></p><p><br/></p><p>鹿
晗曾因足球打破吉尼斯世界纪录。2014年8月5日，鹿晗凭借微博平台上一条于2012年9月10日转发自曼彻斯特联队球迷俱乐部的微博，获得了
13162859条评论，从而创造吉尼斯世界纪录中微博上最多评论的博文的纪录称号。也因为这条微博，让大众熟知了他曼联球迷的身份。作为一名足球爱好
者，他还发起致力于足球普及的公益项目《足球第一课》。</p><p><br/></p><p><br/></p><p><span style="background-color: rgb(255, 192, 0);">CéLINE 为了商业化运作模式展开【一周一 Drop】</span></p><p><span style="background-color: rgb(255, 192, 0);"><br/></span></p><p>今
年2月1日， Saint Laurent 原创意总监 Hedi Slimane 出任Céline 艺术、创意及形象总监。他计划尝试 
SUPREME 等街头品牌所偏爱的发布模式，且极有可能开设首个 Céline Pop-up 
Store。相比起以时装周为基础的季度发布模式，「一周一 Drop」不仅在时间上更为灵活，还将使Céline 拥有更商业化的运作模式。LVMH 的
 CEO Bernard Arnault 在今年一月举行的投资者会议中透露道：他非常期待 Céline 的营业额能在 Slimane 
的带领下，于五年内从 10 亿欧元上涨到20 或 30 亿欧元，甚至更多。</p><p><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453672574769200.jpeg" title="1528800092539169.jpeg" alt="1deb18633d0b34a2e8b17c983f2592ac.jpeg"/></p><p><br/></p><p><br/></p><p><span style="background-color: rgb(255, 192, 0);">英国品牌Boots | 夏季传播主题“夏季就应该过得跟七岁一样”</span></p><p><span style="background-color: rgb(255, 192, 0);"><br/></span></p><p>品
牌到了夏季似乎都“苏醒”起来，一系列营销活动都围绕着“快乐、自由”的主题自带轻松节奏感地开展，这会儿你有没有想到昨天大创意更新的天猫泰式广告
呢？Boost 
作为英国排名第一的药妆美妆零售连锁店，通过今年夏季的传播主题“夏季就应该过得跟七岁一样”，将品牌亲民、自然的品牌形象完美地传达出来。对呀，夏天都
到了，你还有什么不开心的呢~ <a href="https://www.pitchina.com.cn/index.php/Work/article_apply?work_id=4401" target="_blank" title="BOOTS">(点此查看更多)</a></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453672578982575.jpeg" title="1528800446732425.jpeg" alt="boost.jpeg"/></p><p><br/></p><p><span style="background-color: rgb(255, 192, 0);">通过世界杯营销，华帝加快实施品牌升级战略</span></p><p><br/></p><p>作为中国高端厨电品牌的华帝，在2018年俄罗斯世界杯到来之际积极展开重大营销举措。首先，华帝与法国国家足球队在2018年年初签约，成为法国国家队官方合作伙伴，两者在产品和品牌等众多层面展开<a href="http://www.chinabyte.com/keyword/%E5%AF%86%E5%88%87/" style="color: rgb(0, 0, 0); text-decoration-line: none;">密切</a>合作；
接着，华帝近日宣布，法国著名球星、足坛传奇前锋蒂埃里·亨利(Thierry 
Henry)成为其品牌代言人；除此之外，为了吸引更多消费者加入到世界杯的营销活动中，华帝还推出了一个“赌球”活动：若法国国家足球队在2018年俄
罗斯世界杯夺冠，则对于在2018年6月1日0时至2018年6月30日22时期间，凡购买华帝“夺冠套餐”的消费者，华帝将按所购“夺冠套餐”产品的发
票金额退款。<a href="https://www.pitchina.com.cn/index.php/Work/article_apply?work_id=4409" target="_blank" title="华帝">(点此查看更多)</a></p><p><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453672576610960.png" title="1528800494687623.png" alt="华帝股份董事长.png"/></p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D10852 AS DateTime), NULL, 2)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (109, N'谷歌云通过AI留住珍贵的视觉遗产', N'事件营销，现在将来时，大品牌', N'互联网', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'unknown', N'photos/newAnli/29.png', N'<p style="text-align: justify;">Google Cloud 
和《纽约时报》合作推出一支宣传片，讲述 Google 
是如何利用自己的最新技术，把保存了很多年的照片进行复原和数字储存。仅仅存储高分辨率图像不足以创建照片管理者可以轻松使用的系统，谷歌云中的技术处理
和识别图像中可以找到的文本、手写内容和其它细节。“资料档案室保存的照片可以追溯到19世纪末期，其中许多内容具有巨大的历史价值——很多照片是世界上
其他地方都没有的。2015年，一个破损的管道淹没了档案馆使整个馆藏面临风险。 
幸运的是，当时只有轻微的损害，但这一事件引发了人们反思：这些最宝贵的实物资产该如何安全存储？资料档案室是一个易腐文件的宝库，不仅是《纽约时报》的
历史，而且是近一个多世纪以来影响我们现代社会的全球事件的无价编年史。”《纽约时报》新任首席技术官Nick 
Rockwell在谈到此次与谷歌云的合作时谈到。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181130/1543551751353019.png" title="1543551751353019.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181130/1543551751791082.png" title="1543551751791082.png"/></p><p style="margin: 0px 8px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; line-height: 1.75em; box-sizing: border-box !important; overflow-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; overflow-wrap: break-word !important; letter-spacing: 0.5px; font-size: 14px; color: rgb(136, 136, 136);">《纽约时报》的资料档案室</span></p><p style="text-align: center;"><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="800" height="100" src data-setup="{}"></video><br/></p><p>据
悉，谷歌云的AI技术不仅可以将老照片数字化还原的同时还能扫描再现照片的背景信息，这对于《纽约时报》来说，在美国时代广场办公室附近的地下室（资料档
案室），其中珍藏的老照片是珍贵的历史资料档案，谷歌云的加入能将大约500—700万张“视觉遗产”复原，经过高分辨率扫描处理后的照片信息还能永久存
储在谷歌云中。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181130/1543551213108456.png" title="1543551213108456.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181130/1543551213837533.png" title="1543551213837533.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181130/1543551213163951.png" title="1543551213163951.png"/></p><p style="text-align: justify;">为
了使《纽约时报》资料档案室的图片更加便于使用，利用谷歌额外的GCP功能是有益的。在《纽约时报》的案例中，扫描照片的更大挑战是添加有关老照片的内容
数据，而Cloud Vision 
API可以帮助填补这一空白。比如《纽约时报》旧宾州车站的这张照片，来看下经过API处理后的正面和背面的详细信息。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181130/1543551328139876.png" title="1543551328139876.png" alt="屏幕快照 2018-11-30 下午12.04.30.png"/></p><p>这
是一张漂亮的黑白照片，但经过岁月的侵蚀失去了背景信息，但看照片的正面也不清楚它在讲述什么，只有照片背面含大量有用信息，Cloud Vision 
API可以帮助使用者还原、存储和阅读它的信息，当谷歌将图像的背面提交给API（无需额外处理）时，便可以看到Cloud Vision 
API检测到照片原有的文本。以后也许不止是《纽约时报》可以利用到谷歌云AI技术，对于多数图书馆、博物馆来说珍藏的史料信息都有可能在这一尖端技术下
复原，为珍贵的视觉遗产找到安全存储之地。</p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D1EE8F AS DateTime), NULL, 185)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (110, N'在小红书，尽情做自己', N'营销，创意，视频', N'互联网', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'KARMA', N'photos/newAnli/34.png', N'<p>小红书是中国最大的生活方式分享社区，年轻人在这里分享吃穿玩乐买买买，以及每一个对生活心动的时刻。当然，你也可以把小红书当成种草攻略、吐槽树洞、宇
宙最全爱马仕购买指南、网红店打卡大全、“千颂伊本伊”出道app、给偶练小哥哥和101小姐姐打call阵地……小红书的这片红薯地能给大家带来一片自
由天地，随心表达，真诚点赞，能够做自己。不过，最重要的还是，在小红书，标记你的生活，做最想做的自己。</p><p><br/></p><p></p><p>小红书联手独立广告公司KARMA推出全新品牌广告片《一切小美好，都值得被标记》，视频中呈现多人物、多场景，都被红相框标记，以此传达「标记我的生活」品牌主张，戚薇、张雨绮、许魏洲等明星艺人也出镜其中。</p><p><br/></p><p>小
红书提供的不仅仅是商品的信息，“居民们”在这里分享着生活的方方面面，这个平台已经能够提供更多的信息帮助大家去完成一些交易的决策和生活中的下一步，
这也是小红书这座城市看到的机会，这也是这座城市想要提供的价值。带着“社区即城市”这样的视角，小红书首先在产品定位上避免落入沉醉于添加功能和创造形
式的自我陶醉的怪圈，所以可以更加 focus 
从用户的视角去解读用户群体是如何真实使用小红书社区，小红书“城市居民们”的日常就是他们用文字，图片，视频的方式记录自己生活中的每一天。有人分享自
己的日常穿搭，有人分享宝宝和爱宠的点滴片段，有人分享和闺蜜一起的旅行片段，有人分享一个人独自的健身打卡。这些可爱的小红书居民们在 show 
出自己的同时，也把一些真实的心得、经验和同在小红书里的其他居民们交流和讨论，他们从一开始的彼此陌生到后来的经常彼此串门，逐渐成为了朋友。</p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D2DF5E AS DateTime), NULL, 5)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (111, N'这个卖车的平台竟任性的说：我们没有想卖车给你', N'营销，创意，视频', N'互联网', N'国内', N'文章', N'平面媒体', N'Moonpie', N'上海纳恩文化艺术公司', N'photos/newAnli/35.png', N'<p style="text-align: justify;">嘿，朋友，你有没有带着艳羡关注过别人的生活？以至于有那么一瞬间渴望成为他们？影视
剧里攻无不克的主角？别人眼中的成功人士？又或者，对方可能只是你熟悉的某某。但，他们拥有与你不一样的生活。或许是一份不用赶早高峰打卡的工作，可以一
起打游戏的爱人，一辆你心心念念好久的汽车。如果有机会成为他们，你愿意嘛？</p><p style="text-align: justify;">事实上，不管你现在的生活过的怎样，所有人都有过换一个身份的想法。残酷的现实无法让人快意抉择，好在，电影可以带领我们体验到另类人生，就像下面视频里的主角一样。</p><p style="text-align: center;"><br/></p><p style="text-align: justify;">这部长达7分钟的影片是国内汽车融资租赁创新品牌——弹个车，携手亚太最优秀导演罗景壬，及国内顶级营销机构W最近推出的电影级新作。影片的名字叫《我们没有想卖车给你&nbsp;》。很难想象吧，一个汽车新零售领域的大佬任性的对消费者说：我们没有想卖车给你。</p><p style="text-align: justify;">故事中，主角光环加身的男主拥有了令人羡慕的互换人生的技能。从“一辆车就是一种生活方式”这个核心价值出发，巧妙的用一段荒谬的超现实魔幻影片，将鼓励消费者“换车”这件事转换成一种对于一成不变生活的抵抗，以及打开未来可能可能性的钥匙。</p><p style="text-align: justify;">伴随着一次次不可思议的人生置换，影片告诉你我：只有真正做一位汽车的主人，才能在给予未来更弹性的生活空间。而花1成首付，灵活购车的弹个车，才能让时间、账户里余额尚满的我们，参与和实现多样的人生。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453678274052381.png" title="1540448886488766.png"/></p><p>所以，弹个车品牌形象IP弹哥才任性的说：我没打算卖车给你。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453678283999333.png" title="1540448886940629.png"/></p><p style="text-align: justify;">一段荒谬的超现实魔幻影片，无疑让不少人记住了弹个车——互联网车企平台。</p><p style="text-align: justify;">“新
零售”概念提出后，近年来BAT及各大投资方纷纷对二手车领域投资布局。拥有长时间历史积累的传统汽车制造商，拥有大量用户，产品的用户触点极多，与每个
人的生活都息息相关。汽车金融产品竞相争艳，试图通过广告建立起竞争壁垒的市场环境，但在营销层面一直难以突破。以至于提及汽车行业，似乎免不了被打上
“同质化”的烙印。<br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453678281256576.png" title="1540449218702929.png" alt="屏幕快照 2018-10-25 下午2.30.13.png"/></p><p style="text-align: justify;">而
弹个车自2017年起，试图通过一次次赋能#你要换好车#不同的主题和新的含义，来突破传统汽车营销的局面和思路。无论是2017年推出10支鬼畜广告引
发积极反响，还是这次电影级新作。这些案例都在展示着，情节性、个性化的营销不仅能够激发出消费者内心柔软的情感共振，也可以帮助品牌赋予不一样的情感价
值与其他品类区别开来。</p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);">个性化虚拟IP——弹哥</span></p><p style="text-align: justify;">别看《我们没有想卖车给你&nbsp;》里，这支兔子的戏份很少，事实上它可是弹个车品牌形象IP——弹哥。<br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453678295385710.png" title="1540449194677447.png" alt="屏幕快照 2018-10-25 下午2.31.05.png"/></p><p style="text-align: justify;">与其他魔性广告优选大咖明星背书不同，弹个车的代言人是品牌原创的虚拟IP——弹哥。这也是品牌战役里另辟心机的点睛之笔。相较于“高高在上”的明星代言，一支以消费者为原型创造的兔子更接地气，事实也证明这支兔子的圈粉程度远大于当红炸子鸡。</p><p style="text-align: justify;">从2018年1月14日正式上线以来，弹个车推出全新的品牌IP打造计划，并一连创作出10只关于弹个车品牌ICON-弹哥的品牌影片，触达数亿人群。<br/></p><p style="text-align: justify;">凭借独特的形象增强品牌记忆点，让人忍不住看了又看。</p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);">情节性“你要换好车”叙事平台</span><br/></p><p><br/></p><p style="text-align: justify;">#你要换好车 1成首付弹个车#是弹个车品牌现阶段的品牌广告语。拥有互联网基因的弹个车希望以“1成首付”跨越传统买车消费模式的限制，用“换”的方式，让更多的人轻松的换享心仪好车，更实质拥有想要的任何一种汽车生活。<br/></p><p style="text-align: justify;">而在营销上，弹个车也不断尝试各种情节性的事件营销延展“你要换好车”叙事平台。2017年，弹个车依托停车场场景试图触发换车情绪，精准打中市场上潜力巨大的一片处女地。而本次《我们没有想卖车给你&nbsp;》品牌电影级别的首尝展现的则是品牌的人性关怀与思考。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453678296372516.png" title="1540449204744483.png" alt="屏幕快照 2018-10-25 下午2.32.53.png"/></p><p style="text-align: justify;"><br/></p><p>汽
车作为出行工具，不同的消费者寄予的期待不同，使用场景不同。如今，中国人的汽车消费心理需求从曾经的A点到B点的代步工具、逐渐变成生活伙伴、自我个性
的表达方式。但高昂的买车、用车、养车成本依旧成为大多数人的困扰、束缚、甚至像视频里的男主一样正在被绑架着，限缩着生活。</p><p class="p2"><span class="s2"></span></p><p style="text-align: center;"><span style="text-align: justify;"><img src="/ueditor/asp/upload/image/20181221/15453678303905247.png" title="1540449271923961.png" alt="屏幕快照 2018-10-25 下午2.34.07.png"/></span><br/></p><p>品牌巧妙的用一个看似荒谬的超现实魔幻影片刻画了，社会中因汽车财富上演的快乐与艰辛。用弹性化的新购车消费模式，人性化的瓦解汽车作为社会财富标签和阶级分类的桎梏，让人们轻松的跨越社会阶级界线，帮助你我真正做一位汽车的主人。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453678306402618.png" title="1540449332942253.png" alt="屏幕快照 2018-10-25 下午2.31.05.png"/></p><p style="text-align: justify;">再回到开篇的那个话题，你想换更舒适的工作，换更适合的城市，换一群交心的好友，或者换种活法，就从任性的换台车开始吧。弹个车，让你想换就换！</p><p style="text-align: center;"><span style="text-align: justify; background-color: rgb(255, 192, 0);">插入花絮</span><br/></p><p style="text-align: center;"><span style="text-align: justify;">在此奉上:</span><span style="text-align: justify;">本次弹个车</span><span style="text-align: justify;">2018品牌影片独家花絮(PS</span><span style="text-align: justify;">：</span><span style="text-align: justify;"> </span><span style="text-align: justify;">戛纳金狮导演罗景壬首次出镜)</span></p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D3A60F AS DateTime), NULL, 3)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (112, N'果壳 | 这个博物馆有点意思', N'洞察，营销方法，创意方法', N'互联网', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'果壳', N'photos/newAnli/36.png', N'<p style="text-align: justify;">提起博物馆大部分人印象可能停留在学生时代的“跟团游”，以前的博物馆参观者大多是听专家老师讲，近几年增加了更多科技互动的博物馆也让更多人愿意在馆内“学习”，最近果壳推出了一个【有意思博物馆】，用科技带动科学学习和消费。</p><p style="text-align: justify;">果壳首届大型“科技与博物”主题年度体验活动——有意思博物馆，在上个周末登陆北京天桥艺术中心，【有意思博物馆】结合博物馆式演讲分享、市集展览、科技互动体验是【有意思博物馆】的三大模块。果壳在成立的第八个年头打造“意思博物馆”IP，以“科技与博物”为主题，结合年轻人喜爱的活动形式，打开了“通往每个小世界的任意门”。</p><p style="text-align: center;"><span style="text-align: justify;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540366512127278.png" title="1540366512127278.png" alt="屏幕快照 2018-10-24 下午3.32.16.png"/></span></p><p style="text-align: center;"><span style="text-align: justify;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540367114854320.png" title="1540367114854320.png" alt="屏幕快照 2018-10-24 下午3.44.35.png"/></span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">果壳CEO、轮值馆长 姬十三 说，「对于科学知识，人们已经从看和讨论进阶到沉浸式体验，开始消费科学。」</span></p><p style="text-align: justify;">【有意思博物馆】是果壳品牌的一次集中展示，首先活动命名是来自果壳成立8年以来的slogan“科技有意思”，同时现场的一些活动版块也是果壳旗下的果壳商店、吃货研究所、饭团、果壳少年等子品牌的具象化。果壳市场总监冯颖表示：“如今线下活动已成为一种新的内容生产方式。在知识盈余的时代，我们希望这座有意思博物馆能够如同真正的“博物馆”，让用户在游玩体验的同时会有所收获，带给参与者一次知识与灵魂的共振。”在整场活动中，果壳以市集、互动体验为基础，结合全新博物馆演讲，参观者<span style="color: rgb(14, 14, 14); font-family: &quot;Microsoft YaHei&quot;, 黑体; background-color: rgb(255, 255, 255);">在消费过程中与品牌产生交互，提升了购买用户的忠诚度。</span>虽然科学传播形式多样化，但知识本身没有发生变化，果壳近两年一直在尝试把科技和消费相结合，此次【有意思博物馆】线下活动聚焦科学知识，把<span style="color: rgb(14, 14, 14); font-family: &quot;Microsoft YaHei&quot;, 黑体; background-color: rgb(255, 255, 255);">科学传播带到一个更立体、更沉浸、更互动的方式，当科学元素已经成为流行文化的一部分，果壳想让消费科技也成为一种新型时尚。</span></p><p style="text-align: center;"><span style="font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); color: rgb(127, 127, 127);"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540366825203622.png" title="1540366825203622.png" alt="屏幕快照 2018-10-24 下午3.40.00.png"/></span></p><p style="text-align: center;"><span style="font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); color: rgb(127, 127, 127);"><span style="letter-spacing: 0.544px;">【有意思博物馆】活动现场</span></span></p><p style="text-align: center;"><span style="font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); color: rgb(127, 127, 127);"><span style="letter-spacing: 0.544px;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540367139324113.png" title="1540367139324113.png"/><span style="text-align: center;"></span></span></span></p><p style="text-align: center;"><span style="font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.544px; text-align: justify; background-color: rgb(255, 255, 255); color: rgb(127, 127, 127);"><span style="letter-spacing: 0.544px;"></span></span></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540367139295409.png" title="1540367139295409.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540367139717709.png" title="1540367139717709.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540367139618383.png" title="1540367139618383.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540367139541783.png" title="1540367139541783.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20181024/1540367139719543.png" title="1540367139719543.png"/></p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D4380D AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (113, N'百度AI地图要为人类指条明路', N'营销，创意，视频', N'互联网', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'意类GOODZILLA', N'photos/newAnli/37.png', N'<p style="text-align: justify;">最近，意类广告为百度地图打造了三支广告，从AI的视角出发带我们一览人类在出行路上的“愚蠢”和“妄为”。片子呈现了3个在城市交通系统下摸不着北的人类，以及在百度地图AI指挥中心，智慧的AI算法官和机智的数据人为人类无私奉献、出谋划策。</p><p class="p1" style="text-align: center;"><strong><span style="color: rgb(127, 127, 127); font-size: 12px;">八级地震</span></strong></p><p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 12px;"><strong><span style="color: rgb(127, 127, 127);">算法官的关怀</span></strong></span></p><p style="text-align: center;"><span style="font-size: 12px;"><strong><span style="color: rgb(127, 127, 127);"></span></strong></span></p><p><span style="font-size: 12px;"><strong><span style="color: rgb(127, 127, 127);"></span></strong></span></p><p style="text-align: center;"><span style="font-size: 12px;"><strong><span style="color: rgb(127, 127, 127);">疯狂指令</span></strong></span></p><p style="text-align: center;"><span style="font-size: 12px;"><strong><span style="color: rgb(127, 127, 127);"></span></strong></span></p><p><span style="text-align: justify;">【为人类指条明路】的创意能顺利产出也少不了泰国导演</span><span style="text-align: justify;">Rong</span><span style="text-align: justify;">的贡献，话说这样脑洞大开创意是意类一贯的拿手好戏（</span><span style="text-align: justify;">AI</span><span style="text-align: justify;">拟人化），意类广告把百度地图</span><span style="text-align: justify;">AI</span><span style="text-align: justify;">的智慧算法、实景导航以及智能语音（小度小度）功能通过有趣的故事情节</span><span style="text-align: justify;">“</span><span style="text-align: justify;">安排</span><span style="text-align: justify;">”</span><span style="text-align: justify;">的清清楚楚，让人看过即懂。为了保证人类每次的顺利出行，</span><span style="text-align: justify;">AI</span><span style="text-align: justify;">技术可是发挥了大作用。</span></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453680498833082.png" title="1538030813506926.png"/></p><p><span style="text-align: justify;">百度地图探索人工智能的背后也少不了对消费环境的洞察，根据美国最近的一项调查显示，计划在未来两年购买汽车的消费者中，只有</span><span style="text-align: justify;">11</span><span style="text-align: justify;">％的人希望拥有采用自动驾驶技术的汽车，自适应巡航系统偏好的消费者有</span><span style="text-align: justify;">28</span><span style="text-align: justify;">％，车道保持系统偏好的消费者仅为</span><span style="text-align: justify;">21</span><span style="text-align: justify;">％，在未来一段时间内导航地图仍旧是刚需。</span></p><p><span style="text-align: justify;">在百度地图看来，在出行中一般的文字或触屏的交互方式，很多是可以被语音来替代的。语音交互是更为顺畅的交互方式，特别是在驾驶环境下，文字输入非常不方便。如果语音应用到地图上，只要达到</span><span style="text-align: justify;">“</span><span style="text-align: justify;">听清、听懂、满足</span><span style="text-align: justify;">”</span><span style="text-align: justify;">的能力，就可以实现</span><span style="text-align: justify;">“</span><span style="text-align: justify;">我要从双井桥富力广场附近出发到三里屯的</span><span style="text-align: justify;">EVISU</span><span style="text-align: justify;">然后再去南锣鼓巷最后到我家，我要红绿灯少的不堵车的最快的路线，你帮我路线规划一下吧</span><span style="text-align: justify;">”</span><span style="text-align: justify;">这样的复杂要求</span><span style="text-align: justify;">~</span></p><p style="text-align: center;"><span style="text-align: justify;"><img src="/ueditor/asp/upload/image/20181221/15453680526386250.png" title="1538030813393423.png"/></span></p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D4A932 AS DateTime), NULL, 3)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (114, N'她挣扎48小时后死去···网易这支H5又刷屏了', N'营销，创意，洞察，营销方法', N'互联网', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'网易', N'photos/newAnli/38.png', N'<p style="text-align: justify;">网易总是能制造出一些刷屏级的
H5案例，让沉寂的朋友圈兴奋起来。这些刷屏作品的背后，足以见得其对社交话题与大众情绪的洞见。这次要讲的刷屏H5《她挣扎48小时后死去，无人知
晓》，是一个呼吁保护濒危动物的公益性H5，画面用互动条漫的形式展现，故事中的主角是一只蓝鲸，一开始被拟人化为人类小女孩，围绕“屠杀”的话题，从恶
魔对人类世界的杀戮转移到人类对动物世界的屠杀。</p><p><br/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 14px;">&nbsp;&nbsp;扫码阅读网易刷屏H5&nbsp;</span></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453681669137678.png" title="1536728430624145.png" alt="屏幕快照 2018-09-12 上午11.53.17.png"/></p><p><br/></p><p style="text-align: justify;">看
完整个H5故事你肯定会有点难过，甚至会同情濒危的动物以及为人类的无情屠杀而忏悔，它之所以能打动你，背后少不了创作者用心的设计。首先，黑白分明的画
风就为整支故事奠定了压抑和不安的基调，如同黑白木刻的画种风格一样极具视觉冲击力，而且黑白木刻自带“故事属性”，是很好的可以用来讲故事的艺术语言。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453681661729420.png" title="1536728468451201.png" alt="屏幕快照 2018-09-12 下午12.23.00.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453681679078430.png" title="1536728601601888.png" alt="屏幕快照 2018-09-12 下午12.24.17.png"/></p><p><span style="text-align: justify;">其次，是阅读视角的设计。《她挣扎</span><span style="text-align: justify;">48</span><span style="text-align: justify;">小时后死去，无人知晓》的画面内容采用了斜向下</span><span style="text-align: justify;">45°</span><span style="text-align: justify;">的阅读视角，比如电影院、音乐厅、运动赛场、斗兽场等等日常生活中常见的场所就能让你体验到此类视角，还有就是游戏爱好者最能体会到的倾斜</span><span style="text-align: justify;">45°</span><span style="text-align: justify;">向下俯视的视角：日式</span><span style="text-align: justify;">RPG</span><span style="text-align: justify;">游戏。日式</span><span style="text-align: justify;">RPG</span><span style="text-align: justify;">中强调的是剧情的推进，注重互动体验。画面上，这类游戏有着极强的代入感，玩家往往被剧情感动，不自觉的扮演了游戏中的角色。网易这支</span><span style="text-align: justify;">H5</span><span style="text-align: justify;">故事在这样的视角下，通过设计将主角的挣扎和害怕转化为另一种语言，让观者在不自觉的状态下受到影响进入故事内。</span><br/></p><p><br/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 14px;">经典日式RPG游戏场景</span></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453681686954146.png" title="1536728508560359.png" alt="屏幕快照 2018-09-12 下午12.35.38.png"/></p><p>最后，这支H5的故事进度需要读者手推才能进展下去，因此调动了观者的身体参与并促成交互体验，在滑动指尖时你甚至会觉得小女孩的命运就掌控在你的十指之间，随着故事发展主角的境遇越来越糟糕，想必你的情绪也会受到影响。</p><p>就是这样的用心设计让一支看似简单的H5变得不简单，更重要的是网易达成了它的传播目的，让公益话题被更多人看到、传播然后进行反思，承担起企业应有的社会责任。</p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D53674 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (115, N'蚂蚁森林让2亿人爱上种树', N'创意方法，背后故事', N'互联网', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'蚂蚁金服', N'photos/newAnli/39.png', N'<p style="text-align: justify;">上周，在阿里巴巴95公益周论
坛上，蚂蚁森林宣布推出“绿色星球计划”，经过两年的探索和发展，目前蚂蚁森林已上线18个低碳场景，涵盖了生活的方方面面。对于很多年轻人来说，收集蚂
蚁森林能量是晨起“任务”之一，顺便偷一下好友的能量或者帮好友收一下能量，等攒够了能量就能换取蚂蚁森林在荒漠种植一棵真树。穹顶之下，日行一善。蚂蚁
森林2017年10月晒出的航拍，在一片片干涸的土地上摇曳着一簇簇梭梭林，我们能够直观地看到这个项目施行后种下的61万棵树。很多蚂蚁森林的用户有了
发自内心的荣誉感：“我们正在干一件改变世界的大事”。&nbsp;</p><p style="text-align: center;"><span style="text-align: justify;">蚂蚁森林</span><span style="text-align: justify;">2017</span><span style="text-align: justify;">年</span><span style="text-align: justify;">10</span><span style="text-align: justify;">月</span>秋访视频</p><p style="text-align: center;"><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453683086424330.png" title="1536553832443323.png" alt="屏幕快照 2018-09-10 下午12.12.45.png"/></p><p><br/></p><p style="text-align: justify;">在蚂蚁森林的个人页面，能看到自己所种树木对应的详细地点，蚂蚁森林通过科技手段，解决了绿色公益项目的痛点——“信任”，兑换的每一棵真实的树，都有对应的编号和地点。蚂蚁森林让种下的树可视化，高能技术带来更高的透明度，增强了用户对于产品的信任和认同感。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453683084116475.png" title="1536553847401989.png" alt="image.png"/></p><p style="text-align: justify;">2016
年8月，蚂蚁森林正式上线，通过能量生成，把居民的绿色环保的公益行动记录下来，延伸到居民生活中的各个低碳场景。如果虚拟的树养成，在中国的荒漠化地区
将被种下一棵真实的树。蚂蚁森林的迅速壮大，无疑是这款产品抓住了公众“拥有一棵树”的朴素梦想，这既有普通人参与环保行动的价值实现，也是公益产品信息
反馈的内在诉求。</p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D5D3FF AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (118, N'墨迹天气联手麦当劳再次推出“35℃计划”', N'营销，洞察，营销方法', N'互联网', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'', N'photos/newAnli/40.png', N'<p style="text-align: justify;">今年是墨迹天气“35℃计划”连续举办的第四年，墨迹天气与麦当劳合作的“墨迹天气麦
当劳旗舰店”已覆盖全国20多个城市近60家店。墨迹天气相关负责人表示，推出“35℃计划”的初衷是希望基于墨迹天气这样一个用户量巨大的平台，通过这
样一个夏日降温活动呼吁用户关注环境变化和环境保护。在2016年，墨迹天气除了联手雪碧、麦当劳之外，“35℃计划”还联合30余家知名企业，如美图秀
秀、搜狐、百度外卖、唱吧和爱奇艺等品牌，共同发起一场“降温世界”的活动。APP开屏和微博接力的形式，将“降温世界”的理念拓展到公众的衣食住行各个
方面，30余家企业与墨迹天气共同表达对地球、对身边环境的关注，同时品牌还找来许嵩来参与“降温”活动，扩大了年轻群体中的参与度 。</p><p style="text-align: justify;"><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453685652110685.png" title="1536042728699843.png" alt="屏幕快照 2018-09-04 上午11.47.50.png"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p style="text-align: justify;">今
年在活动上线前，墨迹天气联合微博KOL发出微博话题#35度计划#和趣味视频#雪碧秘方泄漏#，以创意视频为活动导流，引发全网有关“雪碧秘方泄漏”的
讨论。在线下，墨迹天气“35℃计划”旗舰店让活动成为一场线上线下深度联动的品牌体验活动，也让线下麦当劳用户自然转化为墨迹天气线上用户。另外，今年
“35℃计划”还针对高校群体进行精准触达，覆盖60个高校的95后人群，带动年轻群体进行活动的自发传播。此外，电视媒体也被运用到活动传播中，辽宁电
视台《直播生活》，广东电视台《晚间新闻》等地方节目将活动延展到各个人群。&nbsp;</p><p style="text-align: justify;"><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453685669469152.png" title="1536042739816080.png" alt="屏幕快照 2018-09-04 上午11.48.00.png"/></p><p style="text-align: justify;">通
过四年的持续推动，“35℃计划”从一个气象IP发展成为一个跨领域、跨品牌的夏日营销活动。墨迹天气通过“高温”这个与品牌契合度高的视角，抓住用户的
情感记忆并实现了有效链接。墨迹天气、雪碧、麦当劳品牌联合营销活动对于用户及各个品牌方来说都是的一项“解渴活动”，三个品牌的用户画像具有重叠性，随
着三方流量叠加又能够扩大活动声量；“35℃计划”作为品牌联合营销活动，公益、环保等社会话题渗透在活动的各个环节，为大众群体搭建全新的公益平台，全
面提升了品牌形象和美誉度。</p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D71FDF AS DateTime), NULL, 3)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (119, N'喜马拉雅FM线下活动升级', N'洞察，营销方法，事件营销', N'互联网', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'', N'photos/newAnli/41.png', N'<p>喜马拉雅FM在成立一年半的时间内就吸纳1.4亿用户，远超过国内蜻蜓FM、荔枝FM等同类
音频APP，当线上用户资源逐渐庞大的同时，喜马拉雅尝试在线下打造出与众不同的阅读场景。早在三年前，喜马拉雅FM带着自己的“耳机森林”亮相上海书
展，为移动阅读时代下的互联网用户带来高品质的阅读体验，喜马拉雅FM的有声书展也成为上海书展成立12年历史上的首次跨界。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453687235894926.png" title="1534394430694709.png" alt="屏幕快照 2018-08-16 下午12.38.10.png"/></p><p>近
日喜马拉雅FM第四次亮相上海书展，打造国内首个【大脑加油站】，在展会现场区域，喜马拉雅的优质音频内容供分为6大块进行展示，为现场读者大脑充电。在
喜马拉雅的创意展台上，也少不了“耳机森林”，还有最近两年新开发的致力于为听众带来全方位阅读体验的线下智能化产品，比如：小雅AI音箱。喜马拉雅小雅
AI音箱是一款“内容型音箱”，它的断点续播功能可以赶超市面上的天猫精灵和小米音箱。在针对平台内容进行智能化产品开发这一模块，国内其它音频平台目前
只能望其项背。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453687242984883.png" title="1534394448260155.png" alt="屏幕快照 2018-08-16 下午12.38.35.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453687259840744.png" title="1534394639994822.png" alt="屏幕快照 2018-08-16 下午12.43.42.png"/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 14px;">（配图来自喜马拉雅FM）</span></p><p>从
线上到线下，喜马拉雅FM充分利用其平台优势音频内容进行全方位的开发和利用，为用户打造全方位、多空间的沉浸式阅读体验。喜马拉雅自去年年底开始打造线
下知识体验店，通过开展活动将线上人群引流到线下，进而提升用户对平台产品的依赖性；喜马拉雅是以知识付费为主的内容平台，所以线上的巅峰会员、万物有
声、精品付费课程等此类“金牌”项目也在知识体验店内生根发芽。</p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D7BEFD AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (120, N'支付宝城市周暖心广告', N'营销，营销方法，运营方法', N'互联网', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'', N'photos/newAnli/42.png', N'<p style="text-align: justify;">去年8月1日-8月8日，支付
宝宣布启动全球首个城市周，希望用一周密集且普惠的优惠活动，让更多人以最低门槛的体验移动支付。今年8月1日，支付宝宣布继续启动城市周，在一周内，所
有支付宝用户到店消费前有红包优惠、消费后可抽奖。作为推动数字城市进程的重要力量，支付宝称，“希望城市周会像双11一样每年办下去，让更多人充分体验
技术为生活带来的便利。”今年的城市周活动作为对去年的延续与改进，支付宝为其推出支付宝城市周情感大片，依旧是以温情的叙事方式传达品牌主张，在这支广
告中我们能看到城市不只有冷漠与冰冷的面庞，每个人或多或少会在城市得到陌生人的温暖，每个在城市用心生活的人都值得被尊重。</p><p style="text-align: center;"><br/></p><p>1
年前，支付宝在官微征集移动支付“死角”，收到了网友近2万条“需求”。1年后的今天再看，过去大家最关心的与支付挂钩的城市“角落”都已悄然改变。据统
计，全国主要城市8成以上中小商家都已接入移动支付，成为“码商”，每一笔交易在线，让他们有了获得理财、保险、信用、信贷等一揽子经营服务的最便捷机
会。此前两周，支付宝的设计师们利用业余时间给小商家定制了一套“定制创意海报”的小程序，于8月1日正式上线。码商们可以在支付宝里免费设计专属于自己
的店铺招牌、海报，这些海报可以打印出来直接寄送到家，让小商家也能有自己的个性化专属招牌。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453687953456098.png" title="1533530170178199.png" alt="屏幕快照 2018-08-06 下午12.35.56.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453687983294011.png" title="1533529898784984.png" alt="屏幕快照 2018-08-06 下午12.31.27.png"/></p><p>支付宝总裁倪行军表示，在支付宝城市周活动期间还会在全国选出对移动支付感情最深的“老铁”，作为支付宝首批城市之星，不仅将获得支付宝所有业务的最先内测、免费体验等机会，还有机会作为用户代表，走访支付宝、参加阿里日、去蚂蚁森林看树等。</p><p><br/></p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D8393F AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (121, N'世界杯广告非一个套路么？', N'营销方法，创意，视频', N'互联网', N'国内', N'文章', N'平面媒体', N'Pitchina', N'', N'photos/newAnli/43.png', N'<section><section><section><p style="text-align: left;"><br/></p><p style="text-align: left;">但
凡人类注意力之所及的地方，就意味着有品牌营销广告的身影。虽然在球场内的厮杀没有中国队的身影，但在本届世界杯广告营销费用投入上，中国企业却是王者。
市场研究公司Zenith最新数据显示，今年世界杯期间各国企业投入的广告费用总计达24亿美元（约合154亿元人民币），中国企业广告支出最多，达到
8.35亿美元（约合53.5亿元人民币），是美国（4亿美元）的两倍多，也远高于俄罗斯的6400万美元。</p><p style="text-align: left;">在
众多世界杯营销案例中我们总结出了本届世界杯营销三宝：球星、激情、狂洗脑！球迷们不断受到球赛战况的惊吓，而中国消费者们则是不断受到世界杯各类营销广
告套路的惊扰。在看过众多世界杯期间的广告之后引发我们一个思考：难道，世界杯营销广告就一定要有充满荷尔蒙气息的热血呐喊、进球之后释放激情的狂欢场
面、举杯齐欢乐的热闹非凡……吗？</p><p style="text-align: left;">Maybe真的不一定。就像今年的世界杯一样，在品牌的世界杯营销大战中，一样存在黑马。</p></section></section></section><p><br/></p><p></p><section><section><section><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);"><strong>1</strong></span></p></section></section></section><section><section><section><p style="text-align: center;">&nbsp;///世界杯爱情故事///&nbsp;</p></section></section></section><p></p><p><br/></p><p style="text-align: center;"><br/></p><p>记忆力是一种神奇的存在，它就像是一个巨大无比的容器，你人生中那些重要的、不重要的都装进了这个容器中一个又一个的抽屉，有的抽屉太深，平时不容易被开启，一旦开启，那些深藏在抽屉中的回忆就全被拖了出来。</p><p style="text-align:center"><br/></p><p style="text-align:center"><img src="/ueditor/asp/upload/image/20181221/15453689333212437.png" title="1531108141593702.png" alt="屏幕快照 2018-07-09 上午11.47.45.png"/></p><p>在这个故事中，夫妻两人相遇在2010年的世界杯期间，8年，褪去了激情之后，爱情平淡地让人觉得疲软。</p><p style="text-align:center"><img src="/ueditor/asp/upload/image/20181221/15453689332445846.png" title="1531108168559496.png" alt="屏幕快照 2018-07-09 上午11.47.54.png"/></p><p>但妻子多年坚持用的「10703」色号口红，最终成了打开记忆抽屉的密码，让那些深埋在两人记忆中的美好回忆，全都被激活。</p><p style="text-align:center"><img src="/ueditor/asp/upload/image/20181221/15453689341941358.png" title="1531108195339063.png"/></p><p style="text-align:center"><img src="/ueditor/asp/upload/image/20181221/15453689344904330.png" title="1531108195109999.png"/></p><p>片
尾那句「爱情不会褪色，当你为爱情选择了一个不褪色的色号」，就像是一句爱情/婚姻保鲜的攻略。婚姻渐冻、七年之痒、爱情疲软，这些可能无法避免，但聪明
的人总能在两人之间找到那个「不褪色的色号」，在合适的时候打开属于两人美好回忆的抽屉。同时，这句文案也是聚划算这次推出的品牌主张“品质生活 
精明之选”的另一种诠释。</p><p style="text-align:center"><img src="/ueditor/asp/upload/image/20181221/15453689357243856.png" title="1531108224518714.png" alt="屏幕快照 2018-07-09 上午11.48.22.png"/></p><p>聚
划算以天猫为基础，对优质商品再次进行择优精选，这在碎片化时代下无疑是帮消费者减少了筛选和决策的负担，让消费者在品质生活的路上，买得更加“精明”。
而聚划算品牌本身的精明在广告中也有所体现——通过彩蛋的形式植入聚划算的品牌形象，不多不少刚刚好，不用大喊大叫，不用强制洗脑，精致地存在于故事之
中，这是对消费者最大的尊重，也是最让消费者受用的方式。</p><p style="text-align:center"><img src="/ueditor/asp/upload/image/20181221/15453689351622054.png" title="1531108251969616.png" alt="屏幕快照 2018-07-09 上午11.48.42.png"/></p><p></p><section><section><section><p>神秘、安静、深刻、暖心。这支短片用所有人都认为「没可能」的方式，安安静静地讲一个与世界杯有关的故事。走了一个其他人都没有走的方向，将品牌的价值观和态度呈现在消费者面前。毕竟，不用套路，才是创意的真正奥义。</p><p style="text-align: center;"><br/></p></section></section></section><p style="text-align:center"><br/></p><section><section><section><section><section><section><p style="text-align: center;"><br/></p></section></section></section></section></section></section><p></p><p><br/></p>', N'这里都是泰国的广告', CAST(0x0000A9BD00D96BA4 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (122, N'朱茵、黄贯中的十年爱情保鲜秘籍在这里', N'营销，视频，创意，营销方法', N'汽车', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'时尚先生 Esquire ', N'photos/newAnli/44.png', N'<p style="text-align: justify;">这世间有什么物品是不会被人遗
忘的？在快速消费时代，物品的更迭速度前所未有的加快，面对眼花缭乱的选择人们的焦虑感也在蹭蹭蹭上涨。庆幸的是，总有一款物品让你爱的彻底，为了推广即
将上市的全新一代SUV牧马人，Jeep携手《时尚先生 Esquire 》打造了《爱彻底》微电影，并找来朱茵、黄贯中讲述他们的十年爱情故事。</p><p style="text-align: center;"><br/></p><p style="text-align: justify;">爱
情保鲜的秘籍是陪伴、信赖，是能在彼此身上找到一份安全感。能将人和物紧密相连的，除了物品的品质，还有一份人类才有的感情，情怀。当Jeep牧马人不再
是少数人的“玩具”，你愿意为情怀买单么？对于品牌来说，每年夸自己的产品硬件有多好已经难以打动消费者了，尤其是面对越来越挑剔的车主。Jeep找来朱
茵、黄贯中讲述十年如初见的爱情保鲜秘籍，就像是在表达Jeep与车主之间的微妙关系，在人与车的长期磨合中，Jeep牧马人的野性特质对车主产生的持续
性吸引，从一开始的热爱到时间久了产生的依赖，再到最后就是一份情怀了。联结人与物的且能与时间抗衡的就是情怀了，真爱难求情怀无价。一辈子很长，但一辈
子也很短，要爱，就要爱彻底。</p><p style="white-space: normal; text-align: center;"><span style="font-size: 12px; color: rgb(127, 127, 127);">我想要的安全感是什么？</span></p><p style="white-space: normal; text-align: center;"><span style="font-size: 12px; color: rgb(127, 127, 127);">是你永远牵着我的手，<br/></span></p><p style="white-space: normal; text-align: center;"><span style="font-size: 12px; color: rgb(127, 127, 127);">陪我一往直前，伸手摘星</span></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453691979283796.png" title="1539665325219205.png" alt="屏幕快照 2018-10-16 下午12.48.30.png"/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">你问我爱你的哪一面？</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">我爱作为无数人心中女神的你，</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">但我更爱那个对未知</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">充满好奇永远热情的你。</span></p><p style="text-align: center;"><span style="font-size: 12px;"></span><img src="/ueditor/asp/upload/image/20181221/15453691985666096.png" title="1539665376551457.png" alt="屏幕快照 2018-10-16 下午12.49.00.png"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important;"><span style="color: rgb(127, 127, 127); font-size: 12px; font-family: sans-serif;">为什么你从来都不问爱不爱我？</span><br/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">是因为无论在哪里，</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">我都能感受到你的爱。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; overflow-wrap: break-word !important;"><img src="/ueditor/asp/upload/image/20181221/15453691998742798.png" title="1539665428910085.png" alt="屏幕快照 2018-10-16 下午12.50.05.png"/></strong><br/></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">爱情到最后</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">是不是都会变成亲情？</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">我只知道跟你在一起的每日</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">都爱如初恋。</span></p><p style="text-align: center;"><span style="font-size: 12px;"><img src="/ueditor/asp/upload/image/20181221/15453692006964858.png" title="1539665302309873.png" alt="屏幕快照 2018-10-16 下午12.47.26.png"/></span></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DA04F5 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (123, N'生还是不生？中产阶级的烦恼', N'创意，洞察，视频，营销方法', N'汽车', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'GQ实验室', N'photos/newAnli/45.png', N'<p style="text-align: justify;">每个品牌都有自己的目标消费群
体，对于Jeep来说，这群人到底是肩负家庭责任的硬汉还是职场商务精英？亦或是Jeep正成为近两年“女子力”暴涨的形式下都市女性的新宠？当Jeep
遇上GQ实验室，这群人的神秘面纱被揭开：中产阶级，GQ凭借着对中产阶级深入骨髓的洞察，针对最近热门的“二胎政策”话题，为中产阶级种了把草。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453693001454251.png" title="1538025079907831.png" alt="屏幕快照 2018-09-27 下午1.10.55.png"/></p><p style="text-align: center;"><br/></p><p><span style="text-align: justify;">这支</span><span style="text-align: justify;">TVC</span><span style="text-align: justify;">的目标群很明确指向了中产阶级，通过不同人设将故事覆盖到整个中产圈层，将中产阶级画像汇聚一起围绕同一个话题展开讨论。在广告片中，</span><span style="text-align: justify;">GQ</span><span style="text-align: justify;">实验室打造的中产阶级人物走出</span><span style="text-align: justify;">“</span><span style="text-align: justify;">数字空间</span><span style="text-align: justify;">”</span><span style="text-align: justify;">并被演员们演绎得很到位，故事情节围绕他们的快乐与烦恼展开，圈层内的不同的人设都表达了自己关于</span><span style="text-align: justify;">“</span><span style="text-align: justify;">二胎政策</span><span style="text-align: justify;">”</span><span style="text-align: justify;">的态度和立场。创意人深知价格不是能打动中产购车的触发点，所以在广告中并没有硬性插入产品的优点，而是抛出数个</span><span style="text-align: justify;">“</span><span style="text-align: justify;">生不生二胎</span><span style="text-align: justify;">”</span><span style="text-align: justify;">的不同价值观于消费者拉近距离，并告诉他们：如果你真的要二胎，可能会需要空间更充裕的</span><span style="text-align: justify;">Jeep</span><span style="text-align: justify;">大指挥家。</span><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453693015500340.jpg" title="1538025179762857.jpg" alt="1.jpg"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453693022768981.png" title="1538025289157757.png" alt="屏幕快照 2018-09-27 下午1.13.26.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DA8AA5 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (124, N'  Uber打车新玩法：让司机跟着“光”走', N'营销，创意，营销方法', N'汽车', N'国内', N'文章', N'平面媒体', N'zhenzhen', N'Uber', N'photos/newAnli/46.png', N'<p>为了提供更加人性化的乘车服务，Uber一直在等待司机到达的环节做改进，比如给你送个小猫
咪解闷。最近，Uber在迈阿密市区内设置了一个大型的灯光交互式艺术装置，当乘客有打车需求时，走到互动装置内部，通过特制的打车“遥控”下单后，踩一
下所在位置的灯光启动按钮（三角形的），瞬间你就能看到艺术划破黑夜的光柱，对的，是属于你的一束光，接下来，司机师傅在人群中也能很容易发现“闪耀”的
乘客们。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453694459126280.png" title="1536301573251882.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453694482161320.png" title="1536301573334659.png"/></p><p><span style="text-align: justify;"><br/></span></p><p><span style="text-align: justify;">虽然是看似简单的打车互动装置，但是每位乘客可以根据自己的喜好定制不同
颜色的光，这种个性化体验足以吸引人们驻足体验。Uber这样做，不光是出于想让用户乘车变得个性化的目的，更重要的是，在人流量和车流量大的公共场所，
人们打车的时候容易出现因为找不到目标车辆而经常取消的情况，而这样的灯光装置可以大大减少乘客找车所用的时间，有助于提升用户体验，这对于一个拥有庞大
用户群体的共享软件来说非常重要。</span></p><p><span style="text-align: justify;"><br/></span></p><p style="text-align: justify;">早在2016年Uber在美
国尝试了通过自定义的灯光标记来帮乘客快速定位目标车辆，它就是Uber Beacon。Uber Beacon 
是一个灯光标志（电子灯光牌），它被安装在 Uber 专车的玻璃上面。当用户使用 Uber 
叫车的时候，可以对这个灯光牌的颜色进行自定义。当用户叫车之后，每一次调整灯光颜色，对应的车都会对 Beacon 
发出信号，即时做出反应，而且司机是不能调整这个灯光的颜色的。</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DB56A9 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (125, N'MINI打造旅行版《私人订制》', N'营销，洞察，营销方法，运营方法', N'汽车', N'国内', N'文章', N'平面媒体', N'Pitchinaina', N'', N'photos/newAnli/47.png', N'<p>一直在打造都市新贵生活方式的MINI，最近将目标对准了定制游领域，推出了一场名为“创意旅城”的活动。一群旅伴、6条路线，带你去发现攻略中看不到的趣味，带你去体验朋友圈中看不到的精彩，带你去感受一场独一无二、无法复制的旅行。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180810/1533874057847964.png" title="1533874057847964.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180810/1533874057916881.png" title="1533874057916881.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180810/1533874090371252.png" title="1533874090371252.png" alt="屏幕快照 2018-08-10 下午12.06.32.png"/></p><p>现
在，旅行在年轻人的生活中已经变得越来越频繁。据2017年的数据显示，国内旅游人数50.01亿人次，比上年同期增长12.8%；出境旅游总人数2.7
亿人次，同比增长3.7%。随着国民收入的提高让旅行不再是一个遥远的事情，大多数的旅行都是在走别人走过的路，大多数的旅行目的地也因为太多人重复一样
的路线而有了自己的标志性符号，就好像在朋友圈发了喂小鹿的照片，十个里有八个都是在奈良（还有两个假装在奈良）。这种心情其实也能理解，毕竟旅行地的标
志性符号，难得去一回，不和这些符号发生点什么，感觉就像错过一个亿。但真的接触下来之后，你大概心里会默默出现一个声音：嗯，实物与照片相符。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180810/1533874194844348.png" title="1533874194844348.png" alt="屏幕快照 2018-08-10 下午12.06.42.png"/></p><p>正
是如此，MINI这场“创意旅城”活动就用一种与众不同的旅行方式给了人们一种旅行新思路。旅行不止是去到一座城市，打一打卡，更多的是在这座城市有怎样
独特的体验，遇到哪些有趣的人。这些不同思想、不同体验可以激发我们新的灵感和启发，这是一场旅行带给我们的价值与意义。除此之外，这场旅行更多的是结交
新朋友，而不是找了朋友相陪伴，它会根据你的个性和需求找到和你志同道合的同伴。不管是旅行中的体验，还是新的好友，MINI这场旅行随处体现着它的“不
可复制”。</p><p>不仅是旅行方式变得不同，当下主力消费人群对旅行的态度也和上一代有所不同。</p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);">这一代年轻人有点“浪”</span></p><p style="text-align: justify;">现
在的都市人几乎每天都在被各种工作和生活压力压得喘不过气，他们一边在为现在和未来奔波，一边又在追求享受生活，工作对于他们来说并不是全部。调查显
示，90后的心理期待是一年能旅行3次，但因为假期不足和钱的原因，他们实际仅平均出行1.6次，75%的90后对旅行次数不满意。<br/></p><p style="text-align: justify;">同时，这群年轻人相比于上一代人，不倾向于跟团游，他们更喜欢自由的旅行时光。对于旅行目的，部分年轻人会表现出洒脱的一面，他们会因为一场演出、一场展览而旅行，数据显示，42%的90后曾为了一场演唱会开启旅行。<br/></p><p style="text-align: justify;">和
当下充满压力的日常生活相比，旅行是一种逃离，也是品质生活的一部分。对他们来说，旅行在也是一种时间上的奢侈。和大多数品牌不同，MINI一直在给消费
者打造一种逃离都市的舒适感生活，让人们在休息时来一场亲近大自然的机会。这次和猫途鹰、碧山旅行合作，也让MINI可以恰好借助“旅行”这一点来吸引更
多目标消费者。</p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);">不走寻常路</span></p><p>据艾瑞的《中国景区旅游消费研究报告》显示，我国的游客数量在稳定增长，同时，景区门票的在线交易额也在持续增长，但增长速度呈现下降趋势。这也意味着，越来越多的游客不再以景点作为旅行的唯一目的地。<br/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180810/1533874277653350.png" title="1533874277653350.png" alt="屏幕快照 2018-08-10 下午12.10.49.png"/></p><p>现
在年轻人旅行呈现这样一种趋势：大多数年轻人出门旅行都会尽量地当地化，住当地的民宿、找当地的小吃、和当地人聊天，这些能让他们的旅行看起来与众不同，
还能遇到不一样的体验。再加上年轻人追求个性、爱尝鲜的特点，“小众”成为了很多人喜欢的标签，小众旅行地、只有当地人才知道的美食都成为吸引年轻人的利
器，个性化已经成为年轻人旅行毋庸置疑的一大需求。就像MINI的这场不可复制的旅行一样，潜入后台、和当地创意人近距离接触，这些体验都是特别的体验。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180810/1533874360934693.png" title="1533874360934693.png" alt="屏幕快照 2018-08-10 下午12.11.52.png"/></p><p>从去哪儿网和艾瑞咨询联合调查显示，对于去哪儿网境外游的用户，由于受到语言和环境的限制，定制游占比为31.4%。<br/></p><p>从数据可以看出，定制游已经成为很多人的选择。它规避了跟团游和自由行所带来的麻烦，在给消费者极大的旅行自由的同时，给客户打造第一无二的定制化体验，让你既能享受到跟团游的省心，又能感受到独一无二的体验。<br/></p><p>定制游在中国暂时还给人“一种高端人士的选择”的印象，并没有普及到大多数人身边。但在未来，或许会有越来越多的人选择定制游，毕竟对于当下的主力消费群体来说，定制游满足了他们对旅行的几乎所有需求：自由、个性、本地、省心。<br/></p><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);">体验比景点打卡更重要</span></p><p>人
民网和飞猪联合发布的《年轻群体全球游特征及趋势报告》数据显示，重体验是年轻人旅行的一大特点。和逛景点、买买买相比，这一代主力消费人群更注重旅行中
的遇到的不同体验。不管是遇到的趣事、看到的新鲜物，还是遇到不同的人，对于他们来说都是旅行中的珍贵之处，给他们留下独特的旅行记忆。<br/></p><p>MINI的“创意旅城”活动将旅行中的体验感发挥到了极致，和不相识的旅伴去到一个陌生的国家，在独特的旅行目的地感受不一样的文化。这对于大多数人来说都是从未有过的经历，所以，从踏上旅行的那一刻，体验就开始了。<br/></p><p><br/></p><p><br/></p><p></p><p><section><section><section><section><section></section><section></section></section></section></section></section></p><p></p><p><br/></p><p>从上面这些主力消费人群对旅行的态度和趋势中可以看出，他们渴望有更多的旅行机会，青睐于旅行的定制化，也更喜欢和有相同兴趣的人交流。这也正是MINI“创意旅城”活动所能满足的，一场假期期间的旅行，10为志同道合的好友，还有独一无二的旅行体验。<br/></p><p>MINI
把重点放在旅行上是在打造一种生活方式，这也是MINI近两年一直在努力的。年初它曾推出过#MINI游牧酒店#的活动，将MINI 
COUNTRYMAN变成一家移动的酒店，车外是风景，车内是家。它不是传统意义上的旅行，但你可以醒来在群山之中泡个澡，躺在车顶帐篷里数星星，每个都
是不可复制的体验。用这些方式，MINI正在打造一种逃离城市、亲近自然的慢生活，一种打破常规、勇于探索的年轻生活理念。<br/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180810/1533874396393105.png" title="1533874396393105.png" alt="屏幕快照 2018-08-10 下午12.12.05.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DBD8DD AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (126, N'宝马为纪念BTCC60周年发布了一组怀旧海报', N'营销，社会化，创意', N'汽车', N'国外', N'文章', N'平面媒体', N'Echo', N'', N'photos/newAnli/48.png', N'<p class="p1"><span class="s1">英国房车锦标赛（BTCC）是世界上最受欢迎，最杰出和最着名的赛车锦标赛之一。自1958年成立以来（当时它被称为英国轿车锦标赛），它吸引并吸引了全世界数百万球迷。</span></p><p class="p1"><span class="s1">最近为了庆祝BTCC60周年，宝马和FCB Inferno发布了五个系列海报，包含1965年、1973年、1988年、1993年和2009年。</span></p><p class="p1"><span class="s1">从20世纪60年代到21世纪初，每张海报都是用这个时代的标志性艺术风格来庆祝每十年，包括流行艺术和黑科技。海报中的车辆代表了每个十年的赛车，具有当时那个时代的明显特征。怀旧的创意不仅体现了60年来英国首屈一指的赛车系列，而且还展现了宝马对赛车运动的热情。</span></p><p class="p1"><span class="s1">幸运的是，7月29日在Snetterton宝马展台上收集其中一张独家海报的人将带回家一段赛车历史。</span></p><p><br/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180730/1532918642396254.png" title="1532918642396254.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180730/1532918656764454.png" title="1532918656764454.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180730/1532918668529741.png" title="1532918668529741.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180730/1532918681274237.png" title="1532918681274237.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180730/1532918690551584.png" title="1532918690551584.png" alt="image.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DC8959 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (127, N'雷克萨斯的兼·融之道', N'视频，营销方法，运营方法', N'汽车', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'时尚先生 Esquire ', N'photos/newAnli/49.png', N'<p style="white-space: normal;">最
近，雷克萨斯携手《时尚先生 Esquire 
》与王千源一起呈现#雷克萨斯人生电影#系列短片——《好戏将至》。在影片一开始就透过王千源自白自己的演艺道路，让观者“入戏颇深”，雷克萨斯将自己的
“戏”加在王千源身上，两者融为一体娓娓道来，这不像是一部广告却又是超越一般意义之上的好广告。</p><p style="white-space: normal; text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453698617780180.png" title="1531715750263575.png" alt="屏幕快照 2018-07-16 下午12.22.23.png"/></p><p style="white-space: normal; text-align: center;"><br/></p><p style="text-align: center;">人生，是一部电影</p><p style="text-align: center;">编剧、导演和主演，都是自己</p><p style="text-align: center;">这部电影的高下，不在于剧情，不在于类型</p><p style="text-align: center;">而在于，真实的触动</p><p style="text-align: center;">与其抱怨人生是个笼子，</p><p style="text-align: center;">不如把它活成自己的容器。</p><p style="text-align: center;">喜欢演戏就是因为，</p><p style="text-align: center;">可以不断把新角色“偷”进自己的身体里。</p><p style="text-align: center;">当了二十多年的演员，推敲角色的过程，</p><p style="text-align: center;">其实是一场与丰富人性的严肃对话，</p><p style="text-align: center;">会慢慢懂得人的立体。</p><p style="text-align: center;">豪侠，有时自私。</p><p style="text-align: center;">狂徒，也懂眷恋。</p><p style="text-align: center;">有人问我，花了二十年，</p><p style="text-align: center;">成为一个被人记得住的演员，漫长吗？</p><p style="text-align: center;">我想说，眼里永远能看到更高的山，接着走。</p><p style="text-align: center;">也许会有你一生当中看不到的风景。</p><p style="text-align: center;">努力也好，运气也罢</p><p style="text-align: center;">一切皆是水到渠成</p><p>2017
年2月，王千源登上央视综艺栏目《朗读者》朗诵了海明威的名作《老人与海》，展示了深厚台词功底。9月凭借《解救吾先生》获得第31届中国电影金鸡奖最佳
男配角。他在很多的影视剧当中扮演的都是很生活化的小人物，戏不多，但总是表现得很有光彩。无论是被众人称赞的《解救吾先生》中的精彩发挥，还是斩获东京
电影节影帝的《钢的琴》中的质感演出，王千源每一次演绎都把角色偷进身体里，与丰富且立体的人性进行严肃对谈。<br/></p><p>王千源这种对“戏”
不妥协的追求，恰恰体现LEXUS雷克萨斯的品牌哲学——“YET兼?融之道”的独特魅力。YET 
兼·融之道作为一种独特的方法论和解决方案，无疑有着更为宽泛的社会价值。凭借无限的想象力和才华，追求多维度的极致，这不仅是一种共赢的不妥协，更是当
下时代中自我的向阳生长。</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DD14B9 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (128, N'张子栋出演礼橙专车第一支广告', N'营销方法，视频', N'汽车', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'unknown', N'photos/newAnli/50.png', N'<p>今年6月底，滴滴专车宣布品牌和服务升级，启用“礼橙专车”为新的品牌名称，此外，礼橙专车还将开发独立APP。 
滴滴方面表示，希望通过此次品牌升级在用户心中建立更为鲜明的印象。“礼”是代表最好的礼遇； 
“橙”与滴滴的桔子形象同属水果系，此外，“礼橙”谐音“里程”，寓意着“礼遇每一段里程”。礼橙专车的新logo是一个带着领结的服务者形象，代表着专
车的服务基因以及品牌的美好愿景。最近，滴滴邀请演员张子栋，拍摄了“出行奇遇记”短片，搞怪演绎出行路上的各种“奇遇”。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180710/1531189900585422.gif" title="1531189900585422.gif"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180710/1531189900483712.gif" title="1531189900483712.gif"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DD7E57 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (129, N'嘘~ 偷看蛙儿子的“旅行日记”', N'运营方法，创意', N'汽车', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'', N'photos/newAnli/51.png', N'<p style="text-align: justify;">此前，阿里鱼作为《旅行青蛙》在中国本土唯一的授权商务伙伴，与滴滴出行达成营销授权合作，围绕“行程分享功能”滴滴出行推出了一系列有趣的营销内容。这次还是行程分享和旅行青蛙的主题但是依然有趣和温情，设置你的行程分享，让关心你的人更放心吧。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180706/1530856458186979.png" title="1530856458186979.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180706/1530856458112541.png" title="1530856458112541.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180706/1530856458313056.png" title="1530856458313056.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180706/1530856458561240.png" title="1530856458561240.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180706/1530856458644436.png" title="1530856458644436.png"/></p><p><span style="text-align: justify;"></span><span style="text-align: justify;">秉承着让出行更美好、让生活更美好的企业理念，滴滴始终践行这一方向，为公共出行安全保驾护航。近期为了提醒用户设置“行程分享”，需要关联到朋友或家人以便于将行程分享，为出行的安全有添加了一份保障。在2016年</span><span style="text-align: justify;">滴滴出行发布了《2016年度企业公民报告》，通过经济、社会、公益等核心议题，反映滴滴实现共享价值的成果。《报告》显示，通过赋能弱势群体、关怀司机群体和鼓励、激发社会正能量，滴滴打造了全新的“路上公益”生态，成为我国社会公益诸场景中不可缺少的一环。</span><span style="text-align: justify;">滴滴的产品一直以来以技术为公众提供未来生活的解决方案，并将由此产生的能量，以更多的赋能传递给社会。</span></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DDD5A9 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (130, N'宋佳、赵又廷为宝马 X3 拍摄广告片《神奇爸爸》', N'营销方法，创意，视频', N'汽车', N'国内', N'文案', N'平面媒体', N'zhenzhen', N'unknown', N'photos/newAnli/52.png', N'<p style="text-align: justify;">搭载“无处不担当”的主题，全新BMW X3，现已上市。宋佳、赵又廷联袂出演为宝马 X3 拍摄广告片《神奇爸爸》。在将近 15 分钟的短片里，小孩子开脑洞想象爸爸在工作时的场景。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453701248046736.png" title="1530759608309447.png" alt="屏幕快照 2018-07-05 上午10.59.30.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453701258313664.png" title="1530759620427507.png" alt="屏幕快照 2018-07-05 上午10.59.37.png"/></p><p style="text-align: justify;">新
一代BMW 
X3装备了智能自适应驾驶模式，此前，智能自适应驾驶模式多用于装备了空气悬架的旗舰车型，未来将广泛应用于高配车型。除了可以识别手势，新一代BMW 
X3还装备了自然语音识别系统，不但可以识别人声、执行命令，还能识别地方方言、洞察用户的实际需求。这一次BMW会将原汁原味+驾驶乐趣作为产品的卖
点。有内部消息称，新一代BMW X3在产品调校阶段，曾与同级竞品进行对比，指向更准确、操控更灵活。</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DE5682 AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (131, N'Jeep这样说话可能不太合适吧？', N'创意', N'汽车', N'国外', N'文案', N'平面媒体', N'Pitchina', N'', N'photos/newAnli/53.png', N'<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;">Jeep阿根廷地区最近上线了一组高傲到不行的平面广告：</span></p><p></p><p></p><p></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;">带着穹顶的“海滩”边上一群正在“度假”的人；穿着汉字文化衫的亚洲人旅行团和西方人旅行团在雅典神庙前的不同表现；比萨斜塔前以各种姿势来寻找视觉差的游客们……然后配上了一句态度强烈的文案：</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box; text-align: center;"><strong style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box; background-color: rgb(255, 218, 81);">“GO WHERE THEY WON’T GO”</span></strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box; text-align: center;"><strong style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box; background-color: rgb(255, 218, 81);">（<strong style="margin: 0px; padding: 0px; font-size: 14px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-size: 13px; box-sizing: border-box;">去他们不会去到的地方）</span></strong></span></strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;">这三张平面中的照片均来自马格南图片社主席<strong style="margin: 0px; padding: 0px;">Martin Parr</strong>的作品集“Small World”。而Martin Parr本人是一位以讽刺幽默的摄影作品而闻名的英国纪录片摄影大师，他的作品虽不见得有很强的艺术观赏性，但却极具个人的观点和态度。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;"><br/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;"></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; text-align: center;"></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><br/><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;"></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;">在他的各种作品中，最广为人知的就是这一部带有强烈讽刺意味的“Small World”——主要表现80年代末至90年代初，全球旅游文化现象的一些观察和解读，反映了成功吸引游客的热门旅行景点最终导致游客们旅行质量体验的降低……</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;"><br/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box; text-align: center;"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;">Jeep将这一组照片放在了广告中，并配上了一种强烈“区隔化”的文案，希望用这种“与众不同”的旅行态度来获得消费者们的共鸣，以此来推广Jeep近期即将在阿根廷地区举行的自驾旅行项目。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; white-space: normal; box-sizing: border-box;"><strong style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 13px; font-family: PingFangTC-light; box-sizing: border-box;">有态度，有洞察，但让人不舒服。</span></strong></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DF3B8A AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (132, N'红旗替换葵花标，推出全新logo', N'事件营销', N'汽车', N'国内', N'文章', N'平面媒体', N'Mercury', N'', N'photos/newAnli/54.png', N'<p>2018年1月8日，“新红旗 让梦想成真”——中国一汽红旗品牌战略发布会在北京人民大会堂举行。传承是成功的根基，历经60年的风雨历程，红旗见证了中国汽车工业从无到有、由弱至强的发展历程。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453704309684523.png" title="1515567470668546.png" alt="image.png"/></p><p>发布会上，中国一汽发布了红旗品牌的未来发展战略，其中包括红旗汽车未来的造型理念、红旗新的产品序列以及全新的品牌LOGO等重磅信息。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453704337607243.png" title="1515567548155777.png" alt="image.png"/></p><p>金
葵花标在1964年，由轿车厂技术员艾必瑶设计，见证着中国发展的每一个历史时刻。1965年，首次应用在CA770三排座红旗高级轿车方向盘的圆心部
位。从此，金葵花标作为红旗高级轿车形象的重要组成部分，成为中国民族品牌高级轿车的象征，见证着中国发展的每一个历史时刻。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453704338989990.png" title="1515567691833704.png" alt="image.png"/></p><p>新红旗定海神针车标的设计沿用经典的金红色，设计灵感迎风飘扬的红旗，象征奋进向上的红旗精神。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453704336565642.png" title="1515567729465133.png" alt="image.png"/></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">全新红旗车标会应用于新车型的方向盘和轮毂上。<br/></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453704337249486.jpeg"/></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><br/></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453704347879983.jpeg" width="502px"/></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="border: 0px; margin: 0px; padding: 0px;">新红旗还发布了一张</span></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="border: 0px; margin: 0px; padding: 0px;">超级有科技感的全自动驾驶车型概念图</span></p><p style="border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00DFCAF1 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (133, N'蒙娜丽莎终于开口说话了', N'营销，事件营销，创意', N'汽车', N'国外', N'文案', N'社交媒体', N'zhenzhen', N'Jung von Matt', N'photos/newAnli/55.png', N'<p style="text-align: justify;">在今年的巴黎车展宝马集团展台上，全新一代人机交互系统BMW 
iDrive7.0千呼万唤始出来，宝马车与驾驶员的“对话”将成为寻常事。此外，BMW的智能个人助理将于2019年推出，成为宝马在数字互联领域的又
一创新突破。为了给具备23项语音功能的全新BMW 3系做宣传，宝马请来蒙娜丽莎“代言”，名人效应不言而喻。<br/><span class="s1"></span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">专业试驾&nbsp; 蒙娜丽莎</span></p><p style="text-align: center;"><br/></p><p><span style="text-align: justify;">前几日BMW先在网站上发出一个预热小视频，视频内的蒙娜丽莎一头乱发，还</span><span style="text-align: justify;">“</span><span style="text-align: justify;">得意</span><span style="text-align: justify;">”</span><span style="text-align: justify;">说道：我刚刚飙了新</span><span style="text-align: justify;">BMW 3</span><span style="text-align: justify;">，随后在法国蓬皮杜国家艺术文化中心前的广场上，蒙娜丽莎还和路人互动了起来。</span><br/></p><p><span style="text-align: justify;">“Hello, </span><span style="text-align: justify;">我是</span><span style="text-align: justify;">Mona Lisa</span><span style="text-align: justify;">，大家问我任何问题我都可以回答</span><span style="text-align: justify;">…”</span><br/></p><p style="text-align: justify;">“人生的意义是什么？”</p><p style="text-align: justify;">“你有男朋友吗？”</p><p>“你为什么在微笑？”</p><p>“什么时候能买到宝马3系”......</p><p>蒙娜丽莎终于开口说话了，在宝马的“协助”之下，她的第一句话是？</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E0972D AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (134, N'新款奥迪Q8｜最高规格的仪式感', N'营销，社会化，创意，视频', N'汽车', N'国外', N'文章', N'社交媒体', N'Mercury', N'BBH London', N'photos/newAnli/56.png', N'<p>9月3日，奥迪发布了最新款Q8的视频广告，为了表达对这款新车的期待，奥迪安排了一个特别的欢迎仪式。</p><p style="text-align: center;"><br/></p><p>视频中，一个装有新款Q8的集装箱从空中徐徐下降，地面上有一支100人组成的爱乐乐团正等待迎接它的到来而准备演奏，从大家面部紧张的表情可猜测这款车的隆重和尊贵。当集装箱的大门打开，新款Q8大灯打开，乐队紧张的开始演奏，气氛如同一次最高规格的领导人迎接仪式。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453707532967030.png" title="1536130338735800.png" alt="image.png"/></p><p>这
次仪式感超强的震撼效果，体现了奥迪对这款新车的期望，人格化的表达让观看者具有身临其境的体验，直观的感受这款新车的气场。据悉，该广告在乌克兰敖德萨
港拍摄，由Simon Cenamor和Raymond Chan创作，由Sam Brown通过Rogue Films进行执导。</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E13C29 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (135, N'沃尔沃｜地下停车场里的特殊停车标识', N'营销，社会化，创意', N'汽车', N'国外', N'文章', N'社交媒体', N'Moonpie', N'Grey London', N'photos/newAnli/57.png', N'<p>为了推广沃尔沃V60系列房车，最近在英国伦敦一个家著名商场Westfield的地下停车场设计了一些奇特的停车标识。这次沃尔沃与Pride London共同推出的的标志目的是通过新的“家庭停车”标志来展现现代家庭的多样性。</p><p>这些停车标识包括了，一位妈妈带两个儿童、夫妻俩和两个儿童、夫妻和一个婴儿、四个大人和一个孩子，基本上涵盖了当下所有家庭的家庭成员构成情况。这个创意有效的展现了沃尔沃V60系列房车能够满足所有家庭的需求。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180709/1531109107682686.png" title="1531109107682686.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180709/1531109127311425.png" title="1531109127311425.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180709/1531109134994337.png" title="1531109134994337.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180709/1531109141545030.png" title="1531109141545030.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180709/1531109156668275.png" title="1531109156668275.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180709/1531109166519379.png" title="1531109166519379.png" alt="image.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E1BC35 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (136, N'捷豹上演城市追车大战！', N'营销，社会化，视频，创意', N'汽车', N'国外', N'文案', N'社交媒体', N'Echo', N'Spark44', N'photos/newAnli/58.png', N'<p>当夜晚的都市上演一部追车大战会是什么景象？最近捷豹通过一支视频广告演绎了一场扣人心悬的追车大战。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453710087920942.png" title="1530511751436529.png" alt="image.png"/></p><p>还记得前段时间捷豹投放的另一只广告么？故事发生在夜里的赛车场，为了突出捷豹新款电动汽车的无声效果，车手来了一场无人察觉的一个人的比赛。是的，捷豹就是这样出人意料、处处散发着不羁的个性。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453710097547917.png" title="1530511775667199.png" alt="image.png"/></p><p>那么在推新的这支广告中，一辆捷豹SUV在夜晚的公路上先是超速并且撞倒摩托骑手，穿越胡同引发一系列狼藉和危险，城市的警察怎么都追不上，连直升机都出动了。但是最后一个看似杀手的人突然接到电话，驾车追赶，真正的正义与邪恶追车大战正式开始。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453710112584548.png" title="1530511844184952.png" alt="image.png"/></p><p>这
次依然是Spark44为捷豹提供的创意，并在这一支广告中提出了新概念——Playground，当然是希望强调驾驶本身没有那么枯燥，只要你敢想，就
应该有一种玩的心态。虽然在广告中捷豹使用了一个极其夸张的反例创意来表达这个概念，但是它在影片开始就提醒大家不要这样的去做，毕竟这个是创意，还是要
严格按照各地的交通限速来行驶。</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E25CD1 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (137, N'Follow柯米克一起打怪兽、一起释放自己', N'营销，社会化，创意，视频', N'汽车', N'国外', N'文章', N'社交媒体', N'Echo', N'', N'photos/newAnli/59.png', N'<p>作为入华十年之久的斯柯达品牌，在近两年更是连续创造了年销量超30万辆的记录。2018年斯柯达针对中国最大的单一市场，将推出斯柯达SUV家族
的第三位成员KAMIQ柯米克，这也是继KODIAQ柯迪亚克、KAROQ柯珞克之后布局A级SUV市场的重磅车型。该款车型已在今年北京车展正式亮相，
并且公布了12-14万元的售价区间，预计在6月27日正式上市。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453711002119886.png" title="1530188163362528.png" alt="image.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453711019945134.png" title="1530188187142051.png" alt="image.png"/></p><p>作为斯柯达SUV家族最小的SUV，柯米克定位为德系都市SUV，是年轻人的首选。为了配合柯米克的上市，推出了一支针对年轻人的MV《Follow米》，一起来感受下这款年轻人专属的都市SUV。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453711022286544.png" title="1530188213276725.png" alt="image.png"/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453711036588850.png" title="1530188239369700.png" alt="image.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E2D71A AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (138, N'路虎｜钟楚曦演绎“深藏BLUE”', N'营销，社会化，创意，视频', N'汽车', N'国内', N'文案', N'社交媒体', N'Echo', N'', N'photos/newAnli/60.png', N'<p class="p1"><span class="s1">今年路虎刚刚过完70岁生日，又推出了2018款揽胜极光梦莲湖蓝限量版，为了突出这款车的特别颜色，邀请到出演《芳华》女主的钟楚曦，在片中用演绎一段舞蹈的方式来呈现这款“深藏BLUE“蓝色的内涵诠释。</span></p><p class="p2" style="text-align: center;"><span class="s1"></span><img src="/ueditor/asp/upload/image/20181221/15453712118762770.png" title="1526277994907990.png" alt="image.png"/></p><p class="p2"><br/></p><p class="p1" style="text-align: center;"><span class="s1">每个人的心中</span></p><p class="p1" style="text-align: center;"><span class="s1"><img src="/ueditor/asp/upload/image/20181221/15453712119311910.png" title="1526278012393761.png" alt="image.png"/></span></p><p class="p1" style="text-align: center;"><span class="s1">都珍藏着一种力量</span></p><p class="p1" style="text-align: center;"><span class="s1">有人选择隐藏</span></p><p class="p1" style="text-align: center;"><span class="s1"><img src="/ueditor/asp/upload/image/20181221/15453712128315842.png" title="1526278026693408.png" alt="image.png"/></span></p><p class="p1" style="text-align: center;"><span class="s1">而有人却让她绽放</span></p><p class="p1" style="text-align: center;"><span class="s1">这是我的深藏BLUE</span></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E3454B AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (139, N'Mini｜带你在柏林街头“抄近路”', N'营销，社会化，创意，视频', N'汽车', N'国外', N'文章', N'社交媒体', N'Echo', N'Serviceplan', N'photos/newAnli/61.png', N'<p>最近在德国，Mini为了突出展现使用Mini车子的好处会让你在大都市里生活更加便捷，比如使用Mini可以节省时间，并总能带你找到一条更快的路，针对这样的洞察，做了一次特别的营销活动。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180511/1526011941379256.png" title="1526011941379256.png" alt="image.png"/></p><p>在柏林的市中心，找到了一些通常比较难走的路，但是Mini却想出了一些特别的办法，让平时需要花上十多分钟的路变成了可能只需要三分钟。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180511/1526011913863320.png" title="1526011913863320.png" alt="image.png"/></p><p>还有比如走入这扇门，可以让原本需要3分钟的路，变成了只需要15秒。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180511/1526012027777141.png" title="1526012027777141.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180511/1526012008423823.png" title="1526012008423823.png" alt="image.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E3B8AC AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (140, N'蔚来｜2018年北京国际车展', N'营销，社会化，视频，创意', N'汽车', N'国内', N'文章', N'社交媒体', N'Mercury', N'', N'photos/newAnli/62.png', N'<p>如果我们现在讨论一个话题叫“未来”，我们会怎么回答？可能这是一个非常大的话题，没办法一句话表达特别清楚，但是我可以把这个未来分成可见的未来和未知的未来。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180425/1524637454591793.png" title="1524637454591793.png" alt="image.png"/></p><p>不
知道大家有没有关注到一个新能源汽车的品牌叫做“蔚来”，这是一家来自中国的汽车企业，但是他们在百度百科中给自己的定义是这样的，“蔚来不仅仅是一家汽
车品牌。通过提供高性能的智能电动汽车与极致用户体验，蔚来致力于为用户创造愉悦的生活方式，打造全球范围内的 “用户品牌”。”</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180425/1524637501469136.png" title="1524637501469136.png" alt="image.png"/></p><p>所以接着说可见的未来，我们可以说这个品牌“蔚来”，因为传统汽车的时候，由于各种原因我们已经无法和欧洲各大品牌相提并论，而接下来新能源时代，我们有可能走在世界的前面。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180425/1524637522111348.png" title="1524637522111348.png" alt="image.png"/></p><p>最近，蔚来将发布新款车型Nio ES8，并将于12月16日蔚来日正式上市。让我们拭目以待吧。</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E440FC AS DateTime), NULL, 6)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (141, N'Volkswagen｜不幸的事故和有趣的故事', N'营销，创意', N'汽车', N'国外', N'文案', N'社交媒体', N'Mercury', N'DDB', N'photos/newAnli/63.png', N'<p>在车辆发生碰撞时自动启动制动系统是具有这种功能的安全表现，那么如何防止和即便发生了碰撞
但可以将事故的伤害降到最低？最近大众汽车为了强化该品牌在该项功能上超强记忆，通过一组平面广告来传递了信息。“你可能无法完全避免发生事故，但是你却
可以将事故严重性降到最低。”</p><p>大众汽车采用幽默的方式表现了三条不幸的事故链。<br/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524457064817122.png" title="1524457064817122.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524457109619813.png" title="1524457109619813.png" alt="image.png"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524457123906551.png" title="1524457123906551.png" alt="image.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E4BDF3 AS DateTime), NULL, 2)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (142, N'网易严选联手MINI打造了一家移动咖啡馆', N'营销', N'汽车', N'国内', N'文章', N'社交媒体', N'BAZINGA', N'', N'photos/newAnli/64.png', N'<p>“快闪店”已经成为近两年的一个营销现象，很多品牌都会选择用快闪店的形式为消费者带来线下场景体验。最近，网易严选联手MINI打造了一家特别的快闪店，特别之处就在于它可以随时移动。</p><p>4月20日，一家车上的移动咖啡馆现身舟山的沙滩上，一辆车、一套桌椅，如果你在沙滩上遇见这家咖啡店，不妨坐下来喝杯咖啡，享受一下海风。还能在夜幕降临时围着篝火，听听独立音乐人陈鸿宇的音乐。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524456610700602.jpg" title="1524456610700602.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524456610512506.jpg" title="1524456610512506.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524456610543627.jpg" title="1524456610543627.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524456610390917.jpg" title="1524456610390917.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524456610351194.jpg" title="1524456610351194.jpg"/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180423/1524456610667692.jpg" title="1524456610667692.jpg"/></p><p>网易严选和MINI这次的合作以“生活的另一种选择”为主题，为大家提供了忙碌都市生活外的另一种生活方式。</p><p>据
了解，今年，网易严选将推出一个与咖啡文化相关的全新线下空间，所以此次合作的移动咖啡馆或许是网易严选打造咖啡空间的一个预热。同时，MINI在中国一
直向消费者传递“暂时逃离都市生活，拥抱自然，找寻更好的自己”的价值观，所以活动也联合MINI的品牌特点，呈现出一种很多人所追求的理想生活。</p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E5415F AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (143, N'路虎｜吴尊出演路虎最新广告片，发现24节气', N'营销，社会化，创意，视频', N'汽车', N'国内', N'文章', N'社交媒体', N'Moonpie', N'', N'photos/newAnli/65.png', N'<p>最近，路虎推出了一支名为《24节气》的广告片，该广告片由吴尊出演。自从吴尊参加了去年的《爸爸去哪儿》栏目之后，大家给他身上贴上了好爸爸的标签。</p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453717422983961.png" title="1524206294153131.png" alt="image.png"/></p><p>这
一次，路虎通过在视频中吴尊为片中的孩子讲述24节气是什么，来体现路虎在一年中的陪伴，同时也表达了路虎在现代家庭中的地位。与此同时路虎也推出了相关
活动，号召大家去参加。开启#发现中国24节气#年度旅程，邀你带上全家一起行遍华夏大好山河，去感知时节的物候奇观，探享人文风俗秘境。</p><p><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453717431075184.png" title="1524206319916504.png" alt="image.png"/></p><p><br/></p><p style="text-align: center;"><img src="/ueditor/asp/upload/image/20181221/15453717441703994.png" title="1524206336461562.png" alt="image.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E5B8C8 AS DateTime), NULL, 2)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (144, N'MINI｜什么才是真正的男人？', N'营销，社会化，视频，创意', N'汽车', N'国外', N'文案', N'社交媒体', N'Mercury', N'Serviceplan', N'photos/newAnli/66.png', N'<p>最近Serviceplan为宝马提供了一支广告，在广告中通过一个美式足球教练的口吻讲述了如何成为一个真正的男人。</p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180419/1524122788499904.png" title="1524122788499904.png" alt="image.png"/></p><p>黑白视频体现了对比的性格坚毅，而影片中的故事是一场在雪地里的比赛，体现了对外在环境的不屈服。而特别是VO讲述的内容，作为一个真正男人要遵循五个标准，自信、为自己感到骄傲、全力以赴、尊重他人、坚韧。以上也是将MINI比喻成一个真正的男人。</p><p><br/></p><p style="text-align: center;"><img src="https://www.pitchina.com.cn/Uploads/20180419/1524122818711399.png" title="1524122818711399.png" alt="image.png"/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E62046 AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (145, N'凯迪拉克在本届奥斯卡上的重要亮相', N'奥斯卡，营销，社会化，创意，视频', N'汽车', N'国外', N'文章', N'社交媒体', N'Mercury', N' Rokkan', N'photos/newAnli/67.png', N'<p class="p1">
	<span class="s1">已经连续五年作为奥斯卡指定官方汽车合作伙伴的凯迪拉克，在今年第90届奥斯卡颁奖礼上有三个亮点展示，分别是性能、技术和未来。在这次亮相中，还第一次曝光了即将问世的凯迪拉克XT4 SUV。</span></p><p class="p2">
	<span class="s1"></span></p><p class="p1">
	<span class="s1">第一支60秒广告片中，“未来在这里”展示了凯迪拉克对未来的看法，并展示了自己的免提驾驶技术。在2015年奥斯卡颁奖典礼上首次亮相的汽车制造商&#39;Dare Greatly&#39;平台的演变，旨在展现凯迪拉克勇敢开拓的精神，其超级游轮，XT4和豪华订阅服务Book by Cadillac都证明了这一点。</span></p><p class="p1"><span class="s1"><br/></span></p><p class="p1"><span class="s1"></span></p><p class="p1">
	<span class="s1">第二支，“未来汽车”中，超级巡航再次展现了去年年底在CT6上首次推出的高速公路上第一款真正的免提驾驶技术。以30秒的时间为主题，30秒的时光回顾了虚拟和现实的创新，如Jetsons赛车和Speed Racer的Mach 5以及自己的赛车。</span></p><p class="p1" style="text-align:center;">
	<span class="s1"><br/></span></p><p class="p1">
	<span class="s1">第三支，Mark Ronson和Bruno Mars的Uptown Funk为凯迪拉克XT4打下了一个节拍，凯迪拉克XT4是该品牌首次进入高端紧凑型SUV领域，这款车型将于2018年3月27日纽约国际车展前，在凯迪拉克之家发布。</span></p><p class="p1" style="text-align:center;">
	<span class="s1"><br/></span></p><p class="p1"><span class="s1"><br/></span><br/></p><p><br/></p>', N'2017超级碗', CAST(0x0000A9BD00E6B9A1 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (146, N'大众汽车推出VW App-Connect', N'营销，创意，社会化', N'汽车', N'国内', N'文案', N'社交媒体', N'Moonpie', N'Ogilvy', N'photos/newAnli/68.png', N'<p>今天的智能手机越来越难以将视线转向别处，大多数人会不断的把眼睛定在屏幕上。 
大众汽车开发了应用程序连接（App-Connect），因此驾驶者可以从他们的汽车屏幕面板上选择智能手机应用程序，但是在将手机链接到汽车面板的时
候，你只能使用几个重要功能，比如打电话、听音乐、导航等，从而将注意力集中在公路上。 
为了传播这一概念，大众汽车设计了一系列平面广告，提醒人们安全驾驶的重要性。</p><p><img src="https://www.pitchina.com.cn/Uploads/20180227/1519726685949540.jpg" title="1519726685949540.jpg"/></p><p><img src="https://www.pitchina.com.cn/Uploads/20180227/1519726685268050.jpg" title="1519726685268050.jpg"/></p><p><img src="https://www.pitchina.com.cn/Uploads/20180227/1519726685744281.jpg" title="1519726685744281.jpg"/></p><p><img src="https://www.pitchina.com.cn/Uploads/20180227/1519726685621701.jpg" title="1519726685621701.jpg"/></p><p><img src="https://www.pitchina.com.cn/Uploads/20180227/1519726685294838.jpg" title="1519726685294838.jpg"/></p><p><br/></p>', NULL, CAST(0x0000A9BD00E73A35 AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (147, N'丰田｜当我们自由行动时，一切都是有可能的', N'营销，视频，社会化，创意', N'汽车', N'国外', N'文章', N'社交媒体', N'Echo', N'unknown', N'photos/newAnli/69.png', N'<p>本月丰田汽车发布了两支有关残奥会的视频广告，在广告中告诉大家，作为奥运会和残奥会的全球合作伙伴，丰田相信，“当我们自由行动时，任何事情都是可能的。”</p><p><br/></p><p style="text-align: center;">无论你是1岁还是100岁，我们都希望为所有人创造更好的运动</p><p>第二部视频跟随了劳伦·伍尔斯滕克罗夫特（Lauren Woolstencroft）的体育生涯，迄今为止，她共赢得了八枚残奥会金牌，而获得残奥会金牌的几率几乎达到10亿比1。</p>', NULL, CAST(0x0000A9BD00E7BE13 AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (148, N'“他们有毒，我们没药”', N'社会化，观点，热点', N'互联网', N'国内', N'文章', N'社交媒体', N'Aha', N'', N'photos/newAnli/70.png', N'<p style="white-space: normal;"><span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">尼尔·波兹曼在《娱乐至死》中说到：“人类无声无息地成为娱乐的附庸，毫无怨言，甚至心甘情愿。”</span></p><p style="white-space: normal;"><span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">抖
音是一款音乐创意短视频社交软件，用户可以通过这款软件选择歌曲，拍摄15秒的音乐短视频，形成自己的作品。抖音打着年轻人爱好社交的旗号于2016年9
月上线。2017年11月10日，今日头条10亿美元购北美音乐短视频社交平台Musica.ly，将之与抖音合并。2018年3月19日，抖音确定新
slogan“记录美好生活”。自《中国有嘻哈》节目播出以来，抖音逐渐受到人们越来越多的关注，每天下班回家刷一刷手机看看又有哪些有趣的视频渐渐也成
为绝大多数人生活中必不可少的一部分。</span></p><p style="white-space: normal;"><span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);"><img src="https://www.pitchina.com.cn/Uploads/20180718/1531888388455928.jpg" title="1531888388455928.jpg" alt="018f4e59464b5ba8012193a35ff8b4.jpg"/></span></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);"><strong>“嗑瓜子”理论</strong></span></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);"></span></p><p style="white-space: normal;">1.人们一旦嗑上第一粒瓜子，就会嗑第二粒、第三粒……一般停不下来，不用别人催促直到嗑完为止。</p><p style="white-space: normal;">2.无论人们喜欢与否，都很容易拿起第一粒瓜子。</p><p style="white-space: normal;">3.在嗑瓜子的过程中，人们可能会被一些其它的事情干扰，比如去洗手，打电话等等，但是之后还会继续回到位子上嗑瓜子，不需要他人提醒、督促。</p><p style="white-space: normal;">让
产品具有粘黏性，从吸引受众这一方面来讲抖音是成功的。牢牢牵住受众的同时又使他们对其产生依赖性，这种依赖性就好比吃了一段时间的瓜子后忽然有天不吃瓜
子了，你会感到无聊并且不知道该做些什么。而抖音很好的抓住了这一痛点来麻痹我们的大脑。给人们一种只需要动动手指就能体验到的新鲜和快乐。在这种快乐里
时间一眨眼就过去了，又开始埋怨日月如梭，从不怪自己碌碌无为。<br/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);"><strong>“Ctrl+C”+“Ctrl+V”</strong></span><br/></p><p style="white-space: normal;">内容的同质化是抖音无法避免的现象，让人们停留在这里的原因不同，但是快乐未免太过于雷同。同样的动作，同样的BGM，只是换了不同的人就能重复播放上万次。而沉浸在复制出来的快乐中的人们仿佛早习以为常，依旧乐此不疲的对着手机哈哈。</p><p style="white-space: normal;">别学长辈看抖音，他们哈哈完了就过去了；你哈哈过去就完了。</p><p style="white-space: normal;"><img src="https://www.pitchina.com.cn/Uploads/20180718/1531895356721746.png" title="1531895356721746.png" alt="f01508b9799c44cbccb11d573a76305.png" width="450" height="262"/>&nbsp;&nbsp; &nbsp;&nbsp;<img src="https://www.pitchina.com.cn/Uploads/20180718/1531896008573333.gif" title="1531896008573333.gif" alt="t018ef13cdb9a4d33b0.gif" width="360" height="261"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);"><strong>15s</strong></span><br/></p><p style="white-space: normal;">不
难发现的是，那些重复播放的BGM都极易在脑中循环并且无法控制，这类音乐大多都较为简单，节奏轻快。科学家把歌曲洗脑称为“无意识音乐成像”，当音乐暂
停时，大脑会强迫性地填补空白，由此形成循环。15秒的视频播放时间是电视时代遗留的传统，研究表明15秒左右的时间可以形成较为深刻的短时记忆，又能极
大程度上契合了碎片化空闲时间，方便受众随时随地的观看。如此“珍贵的”15秒使人们念念不忘，托尼<span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">·罗宾说：“人在回忆往事时，记不得大部分细节，但那些最闪亮的瞬间你一定无法忘记。”</span>抖音将其粘黏性和对受众的心理洞察发挥到极致，当你厌倦了生活的平淡无奇时，它给了你短暂而又精彩的瞬间，无数个这样的瞬间让你想要逃离现实生活的平淡无奇。也在你毫无察觉的情况下慢慢消磨你的意志。</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">&nbsp; &nbsp;&nbsp;<img src="https://www.pitchina.com.cn/Uploads/20180718/1531899307269432.gif" title="1531899307269432.gif" alt="t015e756d516658ea18.gif"/>&nbsp;&nbsp;<img src="https://www.pitchina.com.cn/Uploads/20180718/1531899374171687.gif" title="1531899374171687.gif" alt="t01d47a3e3e4112839f.gif"/>&nbsp;&nbsp;<img src="https://www.pitchina.com.cn/Uploads/20180718/1531899431527455.gif" title="1531899431527455.gif" alt="t01b7df9efef211ca56.gif"/>&nbsp;&nbsp;<img src="https://www.pitchina.com.cn/Uploads/20180718/1531899445579977.jpg" title="1531899445579977.jpg" alt="86dfbfd76be955b89e3de6f89a2ea5f.jpg"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><span style="background-color: rgb(255, 192, 0);"><strong>是孩子做错了？</strong></span><br/></p><p style="white-space: normal;">有数据统计：“抖音85%的用户在24岁以下，基本上都是95后，甚至00后。拍摄者中小学生占了很大比例。”</p><p style="white-space: normal;">有新闻报道称一位父亲学“抖音”携女儿挑战高难度动作，失手女儿脊髓受损；马来西亚一位父亲抱着尚在襁褓里的女儿在60米高空蹦极。在对孩子身体伤害的同时，对其三观的误导和注意力的转移更为严重。</p><p style="white-space: normal;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src="https://www.pitchina.com.cn/Uploads/20180718/1531901315723455.jpg" title="1531901315723455.jpg" alt="133374221415816727.jpg" width="504" height="329"/>&nbsp; &nbsp;<img src="https://www.pitchina.com.cn/Uploads/20180718/1531901408328251.png" title="1531901408328251.png" alt="1531901383(1).png" width="422" height="329"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">我们无法避免世界飞速的变化，也不能拒绝接受这个时代的推陈出新，每个互联网产品都想把质量做到最好吸引受众，那么一个成功吸引了无数受众的app又做错了什么呢？</p><p><br/></p>', NULL, CAST(0x0000A9BD00E83479 AS DateTime), NULL, 4)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (149, N'双11过后，最前沿的广告人都在谈论什么？', N'洞察', NULL, N'国内', NULL, NULL, N'<br/>', NULL, N'photos/newAnli/201812231616466382.png', N'<p style="text-align: justify;">激动人心的双11刚刚过去，接二连三的双11营销也暂时告一段落。接下来，广告圈又要发生一件大事——BIG BANG。</p><p style="text-align: justify;">近
两年，在中国广告营销行业出现了一个“井喷式”的现象，每天大量的新鲜案例看得人眼花缭乱，“1天一个平面、7天一个H5、10天一支视频”已经成为很多
创意人的日常，与此同时，“催泪”、“刷屏”、“曝光量”成了广告营销的关键词。在这个速度与激情并存的环境下，我们似乎正处在一个浑然不知的新时代——
“营销乱世纪”。<br/></p><p style="text-align: justify;">而在这个“营销乱世纪”下，乱的不仅仅是营销。<br/></p><p style="text-align: justify;">我
们都说这一代的消费者是最有个性的一代，随着人民生活水平的不断提高、手里的钱越来越多，接收到的信息越来越丰富，消费者的需求随之被不断细分、逐渐变得
越来越多元化。与此同时，移动互联网、智能设备的发展，让人们无时无刻不被繁杂的信息笼罩着，多屏成为人们的日常，不断分散着每一个人的注意力。<br/></p><p style="text-align: justify;"><strong>那么，<br/></strong></p><p style="text-align: justify;"><strong>为何在这个乱世纪，有些品牌即使不做广告，也比你“三天一个广告”更有影响力？</strong></p><p style="text-align: justify;"><strong>为何有些品牌在营销上没花多少钱，但效果却来得毫不费力？</strong></p><p style="text-align: justify;"><strong>为何消费者的注意力已经碎了一地，还有品牌能死死勾住消费者？赢得消费者的青睐？</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;"><span style="font-family: sans-serif; font-size: 16px;">我们不断在这个“营销乱世纪”中寻找着最适合自身品牌的营销方式，寻找着这个时代下的制胜法宝。而这一切的答案似乎又回归到了最初的——</span><span style="font-family: sans-serif; font-size: 16px; background-color: rgb(255, 192, 0);">“产品”</span><span style="font-family: sans-serif; font-size: 16px;">。</span><br/></p><p>不
可否认，产品是品牌的核心和基础，也是营销合力所要取得的制胜一环。换句话说，产品是形成“产品—营销—消费者”完美闭环的关键。品牌和营销从来都是密不
可分的，只不过在这个追求速度和爆点的时代，产品重要性似乎被削弱了，但说到底，营销不可以凌驾于产品之上，不管品牌和营销做得再好，消费者最终接触和体
验到的依然是产品本身。但和上世纪的以产品为中心的营销不同，这个时代的“大产品理念”在互联网所引领的新时代下又被重新定义，而它，或许就是让你找到逃
离“营销乱世纪”的一把秘钥。</p><p><br/></p><p><section><section><section><section><section><section><section><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);">BIG BANG</span></p></section></section></section></section></section></section></section></p><p><br/></p><p style="text-align: center;">本期我们的线下活动BIG BANG，就为你带来《大产品时代 —— 品牌在中国的将来》。<br/></p><p style="text-align: center;">什么是“大产品”（Big Product）？<br/></p><p style="text-align: center;">如何在大产品时代，率先占领一席之地？</p><p style="text-align: center;">如何用大产品思维攻占中国市场的未来？</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important;"><img src="/ueditor/asp/upload/image/20181223/15455529868023802.png" title="1542074963513643.png" alt="屏幕快照 2018-11-13 上午10.08.47.png"/></p><p><br/></p><p><br/></p><p><section><section><section><section><section><section><section><p style="text-align: center;"><span style="background-color: rgb(255, 192, 0);">活动环节</span></p></section></section></section></section></section></section></section></p><p><br/></p><p style="text-align: center;"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;"><span style="font-family: sans-serif; font-size: 16px;"><br/></span></p><p style="text-align: center;"><strong>【万有演说：解码爆款基因】</strong></p><p style="text-align: center;"><strong>主讲人：Monica</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, system-ui, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: 0.544px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; overflow-wrap: break-word !important;"><img src="/ueditor/asp/upload/image/20181223/15455529867565476.png" title="1542075031415796.png" alt="屏幕快照 2018-11-13 上午10.10.10.png"/></p><p style="text-align: center;"><span style="font-size: 12px;">Serviceplan（北京）策略长</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">在进入广告圈初期携手台湾MOTOROLA、味丹多喝水、雅虎奇摩门户等品牌团队，并于2009年加入处于社交风口的人人网。</span></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127); font-size: 12px;">2011年，重归北京奥美，从事品牌策略服务。目前在Serviceplan负责北京品牌策略咨询及策划。</span></p><p><span style="text-align: justify;">“爆款”是社交媒体上的一时躁动？天时地利人和的结果？还是充满心机的一场策划？</span><br/></p><p style="text-align: justify;">究竟有无规律可循？只有限定的行业品牌才能做？还是已经成为必备的营销手段？身处于追求品效合一的时代，如何放大产品魅力，积累品牌价值，打造一场品牌形象与销售同庆的狂欢。</p><p style="text-align: justify;"><br/></p><p style="text-align: center;"><br/></p>', NULL, CAST(0x0000A9BF010CEE72 AS DateTime), NULL, 8)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (159, N'42创刊号', NULL, NULL, NULL, NULL, NULL, NULL, N'《超级营销时代》', N'photos/newAnli/201812261425318695.jpg', N'<div class="emd-pic"><img src="https://www.pitchina.com.cn/Uploads/Work/20180831/539c33610f921b90f634d16a377daa2a.jpg" alt="/Uploads/Work/20180831/539c33610f921b90f634d16a377daa2a.jpg" width="929" height="488"/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><p></p><div class="emd-container"><p>&nbsp; &nbsp; &nbsp;在信息爆炸的时代下，人们每天都被各种繁杂的信息包围着，大量的信息让当下这群主力消费人群的眼界不断开阔，他们
开始去追求内心的理想生活。在这样一个环境下，每个人都有着自己的个性化追求，千人千面成为这个时代下的一个特点。这也让“读懂消费者”成为一件困难的
事，品牌很难分析每个消费者的习惯和喜好，这也催生出了大数据的力量。</p><p>&nbsp; &nbsp; &nbsp; 大数据的应用改变了营销方式。以前，品牌主在投放广告后无法得知其带来的效果，更别说它对销量有多大的影响了，似
乎每个广告投放出去换来的都是一个听天由命的未知。而现在，大数据可以精准地让我们知道每支广告、每个营销活动所带来的效果。从以前的未知到现在的已知，
品牌开始慢慢追求每场营销所带来的具体效果，“品效合一”成为当下衡量营销成功与否的重要指标。</p><p>&nbsp; “品效合一”这简简单单的四个字，影射出的是“洞察—产品—传播—销售”一个全方位立体的整合理念，同样也催生出一个新的时代——超级营销时代。</p><p>&nbsp; &nbsp; &nbsp;在这个时代下，在线购物平台因为其天然的优势在这个时代有着重要的地位。在线购物平台上聚集了大量的消费者，同时
大数据的赋能让它们成为了当下最懂消费者的人。它们懂得消费者的消费特征，懂得他们的需求，因此，现在的在线购物平台已经不单单是卖货这么简单，而是作为
品牌营销的主战场存在，在卖货的同时，进行品牌建设，最终达到“品效合一”的效果。</p><p>&nbsp; &nbsp; “超级营销时代”是当下的一个趋势，也是未来的必然。本期《42手册》就从“超级营销时代”入手，聊聊这个时代背
后所带来的各个维度变化；在超级营销时代，品牌做出了哪些改变，它们对这个时代又有着怎样自己的见解；线上购物平台有着怎样的地位和角色，它们又如何顺应
这个时代；对于品牌来说，它们该如何在这个时代下生存。希望本期的内容能为你带来新的思考。</p></div>', NULL, CAST(0x0000A9C200EE430F AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (160, N'42第三期', NULL, NULL, NULL, NULL, NULL, NULL, N'《万物有声》', N'photos/newAnli/201812261430079125.jpg', N'<div class="emd-pic"><img src="https://www.pitchina.com.cn/Uploads/20181101/cndD5TnsrX8MnY9HXw.jpeg" alt="/Uploads/20181101/cndD5TnsrX8MnY9HXw.jpeg" width="889" height="508"/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><p></p><div class="emd-container"><p>&nbsp; &nbsp; &nbsp; <span style="font-size: 18px;">&nbsp;边跑步边听音乐，边坐地铁边听书，边做家务边听剧，“边听边做”已经成为很多人生活的常态。在这个万物有声的世界里，逐渐出现了一个新的概念——“耳朵经济”。</span></p><p><span style="font-size: 18px;">&nbsp; &nbsp; &nbsp; &nbsp;什么是“耳朵经济”？有人把“耳朵经济”称作“倾听力经济”，是指大家用耳朵的听力消费信息所衍生的相关行业。比
如今天大家经常接触到的各类互联网音频平台，蜻蜓FM（2011年）、懒人听书（2012年）、喜马拉雅FM（2013年）、荔枝FM（2013年）、考
拉FM（2013年）···这些音频平台的发展也催生出各种各样的音频内容，从听音乐、听新闻、听交通，扩展到听书、听课、听节目、听剧，甚至出现了很多
付费内容。这些软件和内容的丰富，让人们不仅可以更加方便地收听，也给了人们更多收听选择，满足了越来越多不同消费者的需求。</span></p><p><span style="font-size: 18px;">&nbsp; &nbsp; &nbsp; 据了解，人们在接受到的外界信息中，83%以上的是通过眼睛，11%要借助听觉。同时，相比于视觉，听觉有时候给你的感受更加真实。可以说，耳朵一直是人们在接受讯息中不可忽视的一部分，也是其存在的独特价值。</span></p><p><span style="font-size: 18px;">那么，在这个“耳朵经济”迅速发展的时代下，又给我们带来哪些机遇和挑战？这期《42》从环境、平台、主播、设备等多个方面，为你深度解读“耳朵经济”。</span></p></div>', NULL, CAST(0x0000A9C200EF0135 AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (161, N'42第四期', NULL, NULL, NULL, NULL, NULL, NULL, N'《天猫双11全球狂欢节十周年》', N'photos/newAnli/201812261430444909.png', N'<div class="emd-pic"><img src="https://www.pitchina.com.cn/Uploads/20181203/nwWH2kWkXyh2XBSNuf.jpeg" alt="/Uploads/20181203/nwWH2kWkXyh2XBSNuf.jpeg" width="871" height="435"/>
 &nbsp; &nbsp; &nbsp; &nbsp;</div><p></p><div class="emd-container"><p>&nbsp; &nbsp; <span style="font-size: 18px;">&nbsp;“天猫双11”，对于很多人来说，已经不仅仅是买买买了。如今，它已经成为一场全球购物狂欢节。从“光棍节”的打折促销和
秒杀到今天，“天猫双11“十岁了。也许十年前你还没有实实在在的参与到这项革命性的购物体验，但总有那么一天你不知不觉的将网购当成放学去校门口小卖店
买干脆面一样平常。而这就是我们正在经历的，十年，我们见证天猫，天猫也在见证我们。</span></p><p><span style="font-size: 18px;">&nbsp; &nbsp; &nbsp; &nbsp;2009年，为了在“十一”黄金周后的淡季里帮助商家清库存，阿里巴巴首次开展“双11”活动。十年过去了，“双11”从
一场简单的打折促销活动已经演变成一场全球的狂欢，而这十年，不仅仅有天猫的成长，更有每个人的故事，我们何时拍下了双11的第一单，在双11买的最贵的
一件物品是什么···这些都留存着每个消费者的记忆。本期《42》月刊，我们将带你启动天猫双11时光机···感受这十年来，天猫双11的改变。</span></p></div>', NULL, CAST(0x0000A9C200EF5F3B AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Tags], [Trade], [Area], [Type], [Media], [Author], [Agency], [MainPicUrl], [Cont], [Research], [CreateTime], [PubTime], [ReadTimes]) VALUES (162, N'42第二期', NULL, NULL, NULL, NULL, NULL, NULL, N'《不年轻专科》', N'photos/newAnli/201812261432411921.jpg', N'<div class="emd-pic"><img src="https://www.pitchina.com.cn/Uploads/20181011/1xVU5pw3zTuySvuKbg.jpeg" alt="/Uploads/Work/20180831/539c33610f921b90f634d16a377daa2a.jpg" width="867" height="465"/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><p></p><div class="emd-container"><p>&nbsp; &nbsp; &nbsp;<span style="font-size: 18px;"> &nbsp;年轻人一直是行业中讨论的热点话题，不可否认，从营销的角度来说，年轻人是当下的主力消费人群，是营销中不可忽视
的重要群体，了解这个时代的年轻人是营销中的必选课。但在这个物质生活极其丰富、信息爆炸的时代下，我们的生活习惯发生了改变，也形成了这个时代下独有的
消费者特征——千人千面。虽然千人千面特征下的年轻人需求变得越来越多元，但他们中仍旧能找到一些共同特征和趋势。而这期《不年轻专科》就是从懂年轻人的
角度出发，让年轻人以更加立体的形象展现在我们面前。</span></p><p><span style="font-size: 18px;">&nbsp; &nbsp; &nbsp; &nbsp;了解这个时代下的年轻人，避免不了要去读懂他们的语言，了解他们在说“男人都是大猪蹄子”时他们想表达的涵义。与
此同时，这群追求个性、爱尝鲜的年轻人，他们价值观的改变也体现在衣、食、住、行、乐各个方面，比如他们开始享受一人食、一人租、一人旅行、一人看电影、
一人生活；开始不愿下厨，一日三餐靠外卖；开始忽略可以路边招手叫出租车，而只需“滴滴一下”；对待猫猫狗狗比自己还上心···从当下年轻人的语言到年轻
人的价值观，再到更好和年轻人沟通的方法，这期《42-不年轻专科》或许会给你些答案。</span></p></div>', NULL, CAST(0x0000A9C200EFE439 AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Collect] ON 

INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (5, 106, 1)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (9, 107, 1)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (10, 111, 1)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (11, 111, 2)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (12, 107, 2)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (13, 106, 2)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (14, 112, 2)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (15, 109, 1)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (16, 110, 1)
INSERT [dbo].[Collect] ([Id], [ArticleId], [UserId]) VALUES (19, 149, 3)
SET IDENTITY_INSERT [dbo].[Collect] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (4, 41, N'第一次测试', 1, CAST(0x0000A9BF00DB5664 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (5, 41, N'第二次测试', 2, CAST(0x0000A9BF00DB5664 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (6, 49, N'第三次测试', 1, CAST(0x0000A9BF00D6F164 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (8, 86, N'第四次测试', 1, CAST(0x0000A9BF00DB5664 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (9, 87, N'第五次测试', 1, CAST(0x0000A9BF00E42064 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (10, 88, N'第六次测试', 1, CAST(0x0000A9BF00DBE304 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (11, 89, N'第七次测试', 1, CAST(0x0000A9BF00DB5664 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (12, 109, N'sadfsad', 1, CAST(0x0000A9BF00DB5664 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (13, 109, N'随便评论的
', 1, CAST(0x0000A9BF00DB5664 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (14, 109, N'又一次测试', 1, CAST(0x0000A9C100F869B6 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (15, 109, N'最最新的一次测试', 2, CAST(0x0000A9C101068933 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (16, 109, N'xinxin的', 2, CAST(0x0000A9C1010864DE AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (17, 109, N'sdf', 1, CAST(0x0000A9C10182ED2F AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (18, 109, N'再一次', 1, CAST(0x0000A9C101833581 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (19, 109, N'再一次+1', 1, CAST(0x0000A9C1018408D4 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (20, 109, N'再一次+2', 1, CAST(0x0000A9C10189D3E5 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (21, 109, N'再一次+3', 1, CAST(0x0000A9C1018A1F57 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (22, 109, N'再一次+4', 1, CAST(0x0000A9C200002726 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (23, 109, N'再一次+5', 1, CAST(0x0000A9C200015E76 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (24, 109, N'再一次+6', 1, CAST(0x0000A9C200021CD0 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (25, 109, N'再一次+7', 1, CAST(0x0000A9C200031F61 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (26, 109, N'再一次+8', 1, CAST(0x0000A9C20003A729 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (27, 109, N'再一次+9', 1, CAST(0x0000A9C2000421BF AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (28, 109, N'123132', 1, CAST(0x0000A9C2001719AE AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (29, 109, N'最后一次了', 1, CAST(0x0000A9C200174FF8 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (30, 109, N'世人都逃不过真香定理，我又来了', 1, CAST(0x0000A9C20017A461 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (31, 109, N'+1', 1, CAST(0x0000A9C20017B586 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (32, 109, N'我又来评论了', 1, CAST(0x0000A9C200A97636 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (33, 109, N'我又来评论了+1', 1, CAST(0x0000A9C200A9F45F AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (34, 109, N'我又来评论了+2', 1, CAST(0x0000A9C200AA2DC0 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (35, 109, N'我又来评论了+3', 1, CAST(0x0000A9C200AA4673 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (36, 109, N'我又来评论了+4', 1, CAST(0x0000A9C200AA8AE8 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (37, 109, N'我又来评论了+5', 1, CAST(0x0000A9C200AADAD1 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (38, 109, N'我又来评论了+6', 1, CAST(0x0000A9C200ABB97D AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (39, 109, N'福音会', 1, CAST(0x0000A9C200ADF0A3 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (40, 109, N'福音会', 1, CAST(0x0000A9C200AF3F90 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (41, 109, N'福音会', 1, CAST(0x0000A9C200AF8B28 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (42, 109, N'福音会', 1, CAST(0x0000A9C200B17320 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (43, 109, N'福音会', 1, CAST(0x0000A9C200B21AB1 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (44, 109, N'福音会，福音会', 1, CAST(0x0000A9C200B6FC0A AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (45, 109, N'福音会，福音会', 1, CAST(0x0000A9C200B7279D AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (46, 109, N'福音会，福音会', 1, CAST(0x0000A9C200B77213 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (47, 109, N'统一教
', 1, CAST(0x0000A9C200B78EDA AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (48, 109, N'大麻', 1, CAST(0x0000A9C200B7B6B9 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (49, 109, N'这就是大麻啊', 1, CAST(0x0000A9C200B7E33D AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (50, 109, N'这是大麻啊', 1, CAST(0x0000A9C200B8DEDB AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (51, 109, N'我喜欢她啊', 1, CAST(0x0000A9C200BAF85F AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (52, 109, N'法轮功的', 1, CAST(0x0000A9C200BBE8A1 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (53, 109, N'法轮功', 1, CAST(0x0000A9C200BC0FD0 AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (54, 109, N'***，***', 1, CAST(0x0000A9C200BE617A AS DateTime))
INSERT [dbo].[Comment] ([Id], [ArticleId], [Cont], [UserId], [CommentTime]) VALUES (55, 107, N'第一次', 1, CAST(0x0000A9C30104328B AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[ReArticle] ON 

INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (8, 99, 1, 87)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (9, 129, 1, 151)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (10, 129, 2, 125)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (11, 148, 1, 454)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (13, 107, 1, 8)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (14, 94, 3, 2)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (15, 95, 3, 21)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (16, 96, 4, 3)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (17, 97, 4, 21)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (19, 99, 4, 2123)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (20, 100, 4, 21)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (21, 101, 4, 21)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (22, 106, 5, 21)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (23, 107, 5, 42)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (24, 109, 5, 42)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (26, 99, 2, 21)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (27, 107, 2, 547)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (28, 111, 2, 15)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (29, 143, 1, 455)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (30, 140, 1, 458)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (31, 147, 1, 456)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (32, 144, 1, 457)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (33, 147, 2, 546)
INSERT [dbo].[ReArticle] ([Id], [ArticleId], [PosId], [Weight]) VALUES (34, 147, 1, 225)
SET IDENTITY_INSERT [dbo].[ReArticle] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName], [Note]) VALUES (1, N'用户', N'只能登陆前台页面')
INSERT [dbo].[Role] ([Id], [RoleName], [Note]) VALUES (2, N'管理员', N'拥有登录后台的权限')
INSERT [dbo].[Role] ([Id], [RoleName], [Note]) VALUES (3, N'Boss', N'拥有最高权限')
INSERT [dbo].[Role] ([Id], [RoleName], [Note]) VALUES (4, N'数据添加员', N'只可访问案例管理，情报管理')
INSERT [dbo].[Role] ([Id], [RoleName], [Note]) VALUES (5, N'数据管理员', N'不能访问用户管理、案例管理')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[RoleGive] ON 

INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (4, 2, 1)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (5, 2, 2)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (6, 2, 5)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (12, 1, 1)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (13, 1, 2)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (15, 7, 1)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (16, 4, 1)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (18, 8, 1)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (20, 1, 3)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (21, 3, 1)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (22, 3, 2)
INSERT [dbo].[RoleGive] ([Id], [UserId], [RoleId]) VALUES (23, 2, 4)
SET IDENTITY_INSERT [dbo].[RoleGive] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Passward], [Sex], [NickName], [HeadSculpture], [SelfSInfo], [HeadPicUrl], [Email], [LastLoginTime], [IsDel], [IsStop]) VALUES (1, N'taotao', N'90E285950FA0D10BEFFA7FC9AF20F53A', N'1', N'ttttt', N'photos/Toutu/201812272221092945.gif', N'嗯，我也不知道说啥。呀，都说这么长了，算了不说了', N'images/default12.png', N'1263294262@qq.com', CAST(0x0000A9C400C04AAA AS DateTime), N'0', N'否')
INSERT [dbo].[User] ([Id], [UserName], [Passward], [Sex], [NickName], [HeadSculpture], [SelfSInfo], [HeadPicUrl], [Email], [LastLoginTime], [IsDel], [IsStop]) VALUES (2, N'yingying', N'90E285950FA0D10BEFFA7FC9AF20F53A', N'2', N'cyyxxn', N'images/headTwo.png', N'最可爱的人', N'photos/head/201812251111591483.jpg', N'15654561654@qq.com', CAST(0x0000A9C300D55F0A AS DateTime), N'0', N'否')
INSERT [dbo].[User] ([Id], [UserName], [Passward], [Sex], [NickName], [HeadSculpture], [SelfSInfo], [HeadPicUrl], [Email], [LastLoginTime], [IsDel], [IsStop]) VALUES (3, N'hehe', N'90E285950FA0D10BEFFA7FC9AF20F53A', N'1', N'zyhxbb', N'images/headTwo.png', N'最懒的人', N'images/default12.png', N'21654621@qq.com', NULL, N'0', N'否')
INSERT [dbo].[User] ([Id], [UserName], [Passward], [Sex], [NickName], [HeadSculpture], [SelfSInfo], [HeadPicUrl], [Email], [LastLoginTime], [IsDel], [IsStop]) VALUES (4, N'tongtong', N'90E285950FA0D10BEFFA7FC9AF20F53A', N'1', N'xiaott', N'images/headTwo.png', NULL, N'images/default12.png', N'sdafas@qq.com', CAST(0x0000A9B000C6BEDE AS DateTime), N'0', N'否')
INSERT [dbo].[User] ([Id], [UserName], [Passward], [Sex], [NickName], [HeadSculpture], [SelfSInfo], [HeadPicUrl], [Email], [LastLoginTime], [IsDel], [IsStop]) VALUES (7, N'12315', N'90E285950FA0D10BEFFA7FC9AF20F53A', N'1', N'13215', N'images/headTwo.png', NULL, N'images/default12.png', N'232232@qq.com', CAST(0x0000A9BB01436F4E AS DateTime), N'0', N'否')
INSERT [dbo].[User] ([Id], [UserName], [Passward], [Sex], [NickName], [HeadSculpture], [SelfSInfo], [HeadPicUrl], [Email], [LastLoginTime], [IsDel], [IsStop]) VALUES (8, N'safsad', N'CD4FCDECD0DCB5C3', N'1', N'safsad', N'images/headTwo.png', NULL, N'images/default12.png', N'1263294262@qq.com', NULL, N'0', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__HeadSculpt__023D5A04]  DEFAULT ('') FOR [HeadSculpture]
GO
ALTER TABLE [dbo].[Collect]  WITH CHECK ADD  CONSTRAINT [FK__Collect__Article__21B6055D] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[Collect] CHECK CONSTRAINT [FK__Collect__Article__21B6055D]
GO
ALTER TABLE [dbo].[Collect]  WITH CHECK ADD  CONSTRAINT [FK__Collect__UserId__22AA2996] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Collect] CHECK CONSTRAINT [FK__Collect__UserId__22AA2996]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__Article__1BFD2C07] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__Article__1BFD2C07]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__UserId__1CF15040] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__UserId__1CF15040]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK__Photos__ArticleI__0EA330E9] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK__Photos__ArticleI__0EA330E9]
GO
ALTER TABLE [dbo].[Radios]  WITH CHECK ADD  CONSTRAINT [FK__Radios__ArticleI__1367E606] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[Radios] CHECK CONSTRAINT [FK__Radios__ArticleI__1367E606]
GO
ALTER TABLE [dbo].[RoleGive]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleGive]  WITH CHECK ADD  CONSTRAINT [FK__RoleGive__UserId__286302EC] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RoleGive] CHECK CONSTRAINT [FK__RoleGive__UserId__286302EC]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [CK__User__Sex__014935CB] CHECK  (([Sex]=(2) OR [Sex]=(0) OR [Sex]=(1)))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [CK__User__Sex__014935CB]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [CK_User] CHECK  (([IsDel]=(0) OR [IsDel]=(1)))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [CK_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Article"
            Begin Extent = 
               Top = 0
               Left = 156
               Bottom = 227
               Right = 300
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Collect"
            Begin Extent = 
               Top = 145
               Left = 296
               Bottom = 267
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 239
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Collect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Collect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Article"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Comment"
            Begin Extent = 
               Top = 6
               Left = 220
               Bottom = 126
               Right = 376
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 246
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Article"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 151
               Right = 181
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "ReArticle"
            Begin Extent = 
               Top = 6
               Left = 220
               Bottom = 126
               Right = 362
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Rec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Rec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RoleGive"
            Begin Extent = 
               Top = 51
               Left = 266
               Bottom = 156
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 6
               Left = 480
               Bottom = 111
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_User'
GO
USE [master]
GO
ALTER DATABASE [bigidea] SET  READ_WRITE 
GO
