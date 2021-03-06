USE [master]
GO
/****** Object:  Database [online_bookstore]    Script Date: 12/20/2020 10:33:13 AM ******/
CREATE DATABASE [online_bookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'online_bookstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\online_bookstore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'online_bookstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\online_bookstore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [online_bookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [online_bookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [online_bookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [online_bookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [online_bookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [online_bookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [online_bookstore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [online_bookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [online_bookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [online_bookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [online_bookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [online_bookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [online_bookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [online_bookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [online_bookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [online_bookstore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [online_bookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [online_bookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [online_bookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [online_bookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [online_bookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [online_bookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [online_bookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [online_bookstore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [online_bookstore] SET  MULTI_USER 
GO
ALTER DATABASE [online_bookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [online_bookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [online_bookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [online_bookstore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [online_bookstore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [online_bookstore]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[info] [nvarchar](max) NULL,
	[picture] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](150) NULL,
	[price] [float] NULL,
	[sale_price] [float] NULL,
	[publish_year] [int] NULL,
	[picture] [varchar](max) NULL,
	[page_number] [int] NULL,
	[quantity] [int] NULL,
	[quotes_about] [nvarchar](max) NULL,
	[author_id] [int] NULL,
	[publisher_id] [int] NULL,
	[category_id] [int] NULL,
	[new] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coupons]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coupons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NOT NULL,
	[description] [nvarchar](100) NULL,
	[discount] [float] NULL,
	[max_value] [float] NULL,
	[valid_from] [datetime] NULL,
	[valid_until] [datetime] NULL,
	[count] [int] NULL,
	[is_enable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[districts]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[districts](
	[district_code] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[province_code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[district_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[order_id] [int] NULL,
	[book_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NULL,
	[required_date] [datetime] NULL,
	[shipped_date] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[comment] [nvarchar](max) NULL,
	[total] [float] NULL,
	[user_id] [int] NULL,
	[coupon_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provinces]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provinces](
	[province_code] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[province_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_date] [datetime] NULL,
	[star] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[book_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [varchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [varchar](11) NULL,
	[email] [varchar](100) NULL,
	[picture] [varchar](max) NULL,
	[province_code] [int] NULL,
	[district_code] [int] NULL,
	[ward_code] [int] NULL,
	[is_admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wards]    Script Date: 12/20/2020 10:33:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wards](
	[ward_code] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[district_code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ward_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[authors] ON 

INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (1, N'Tô Hoài', N'Tô Hoài (tên khai sinh: Nguyễn Sen; 27 tháng 9 năm 1920 – 6 tháng 7 năm 2014)[1] là một nhà văn Việt Nam. Một số tác phẩm đề tài thiếu nhi của ông được dịch ra ngoại ngữ. Ông được nhà nước Việt Nam trao tặng Giải thưởng Hồ Chí Minh về Văn học – Nghệ thuật Đợt 1 (1996) cho các tác phẩm: Xóm giếng, Nhà nghèo, O chuột, Dế mèn phiêu lưu ký, Núi Cứu quốc, Truyện Tây Bắc, Mười năm, Xuống làng, Vỡ tỉnh, Tào lường, Họ Giàng ở Phìn Sa, Miền Tây, Vợ chồng A Phủ, Tuổi trẻ Hoàng Văn Thụ.', N'https://upload.wikimedia.org/wikipedia/vi/7/73/Nhavan_t%C3%B4_ho%C3%A0i.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (2, N'Tố Hữu', N'Tố Hữu, tên thật là Nguyễn Kim Thành (4 tháng 10 năm 1920 – 9 tháng 12 năm 2002), quê gốc ở làng Phù Lai, nay thuộc xã Quảng Thọ, huyện Quảng Điền, tỉnh Thừa Thiên - Huế. Ông là một nhà thơ tiêu biểu của thơ cách mạng Việt Nam, đồng thời ông còn là một chính khách, một cán bộ cách mạng lão thành. Ông đã từng giữ các chức vụ quan trọng trong hệ thống chính trị của Việt Nam như Ủy viên Bộ Chính trị, Bí thư Ban Chấp hành Trung ương Đảng Cộng sản Việt Nam, Phó Chủ tịch thứ Nhất Hội đồng Bộ trưởng nước Cộng hòa Xã hội Chủ nghĩa Việt Nam.', N'https://upload.wikimedia.org/wikipedia/vi/thumb/1/18/To_Huu.jpg/175px-To_Huu.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (3, N'Nguyễn Nhật Ánh', N'Nguyễn Nhật Ánh (sinh ngày 7 tháng 5 năm 1955) là một nhà văn người Việt. Ông được biết đến qua nhiều tác phẩm văn học về đề tài tuổi mới lớn, các tác phẩm của ông rất được độc giả ưa chuộng và nhiều tác phẩm đã được chuyển thể thành phim. Ông lần lượt viết về sân khấu, phụ trách mục tiểu phẩm, phụ trách trang thiếu nhi và hiện nay là bình luận viên thể thao trên báo Sài Gòn Giải phóng Chủ nhật với bút danh Chu Đình Ngạn. Ngoài ra, ông còn có những bút danh khác như Anh Bồ Câu, Lê Duy Cật, Đông Phương Sóc, Sóc Phương Đông,...', N'https://upload.wikimedia.org/wikipedia/commons/9/96/Nguyen_Nhat_Anh.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (4, N'Xuân Quỳnh', N'Xuân Quỳnh (1942 – 1988) tên thật là Nguyễn Thị Xuân Quỳnh, là một nhà thơ nữ của Việt Nam. Bà được xem là nữ thi sĩ nổi tiếng với nhiều bài thơ được nhiều người biết đến như Thuyền và biển, Sóng, Thơ tình cuối mùa thu, Tiếng gà trưa,...... Bà được Nhà nước Việt Nam truy tặng Giải thưởng Nhà nước (Việt Nam) và Giải thưởng Hồ Chí Minh vì những thành tựu cho nền văn học nước nhà.', N'https://upload.wikimedia.org/wikipedia/vi/thumb/8/80/Xuan_Quynh.jpg/240px-Xuan_Quynh.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (5, N'Nguyễn Ngọc Thạch', N'Nguyễn Ngọc Thạch (sinh năm 1987) là một tác giả trẻ được đông đảo bạn trẻ biết đến và yêu mến). Anh nổi tiếng với những tác phẩm chuyên viết về đồng tính và những góc khuất trong thế giới thứ ba. Những tác phẩm “Đời Callboy”, hay “Chênh vênh 25” của nhà văn sinh 28 tuổi này được bạn đọc nhiệt tình đón nhận. Việc tạo dựng một phong cách riêng cho mình có vẻ đã đem đến cho Nguyễn Ngọc Thạch những thành công nhất định.', N'https://toplist.vn/images/800px/nha-van-noi-tieng-nhat-viet-nam-16396.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (6, N'Hamlet Trương', N'Hamlet Trương tên thật là Lê Văn Trương, sinh năm 1988, anh hoạt động trong nhiều lĩnh vực: ca sĩ, nhạc sĩ, nhà văn, MC cho Radio và Talk show trên truyền hình. Mặc dù phủ sóng ở nhiều lĩnh vực khác nhau nhưng cái tên Hamlet Trương khá lu mờ trong showbiz Việt, cho tới khi bén duyên với nghề viết, anh mới được biết tới rộng rãi và sở hữu một lượng độc giả nhất nhì làng sách.', N'https://toplist.vn/images/800px/hamlet-truong-299075.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (7, N'Đỗ Nhật Nam', N'Người ta thường nói \" Tuổi trẻ tài cao\" là câu nói không ngoa khi dành cho cậu bé thần đồng Việt Nam Đỗ Nhật Nam. “Bố mẹ đã cưa đổ tớ” là cuốn sách thứ 3 sau “Những con chữ biết hát” và “Tớ đã học tiếng Anh như thế nào”. Ở tuổi 13, với những thành tích mà Nhật Nam làm được, người ta không chỉ dành cho em một tràng pháo tay cổ vũ, mà đó là sự thán phục, ngưỡng mộ. Cậu bé tài năng xuất chúng này trước đây cũng thường xuyên xuất hiện trên một số chương trình truyền hình nhưng hiện nay cậu đã lên đường xuất ngoại.', N'https://toplist.vn/images/800px/do-nhat-nam-299074.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (8, N'Nguyễn Ngọc Sơn (Sơn Paris)', N'Nguyễn Ngọc Sơn, nghệ danh là Sơn Paris sinh năm 1994, dù tuổi đời còn non trẻ nhưng những tác phẩm anh mang lại cho người đọc, đặc biệt là giới trẻ lại chiếm được nhiều tình cảm và sự hâm mộ dành cho anh. Hiện nay anh đã xuất bản được hai cuốn sách ăn khách mang tên: “Trót lỡ chạm môi nhau”, “Muốn khóc thật to”. Từng là thủ khoa Học viện Ngoại giao và gặt hái được nhiều thành tích đáng nể, nhưng Sơn Paris lựa chọn viết sách là con đường lớn nhất cho mình. Sách của Sơn Paris luôn nằm trong những tác phẩm được đón đợi nhất, đặc biệt phù hợp với lứa tuổi học sinh và độc giả nữ.', N'https://toplist.vn/images/800px/nha-van-noi-tieng-nhat-viet-nam-16392.jpg')
INSERT [dbo].[authors] ([id], [name], [info], [picture]) VALUES (9, N'Trang Hạ', N'Được biết đến trong vai trò là dịch giả của “Xin lỗi, em chỉ là con đĩ”, Trang Hạ được đông đảo bạn trẻ đón nhận với lối viết phóng khoáng, giọng điệu đanh thép và mạnh mẽ của mình. Bên cạnh đó, cô còn có những tác phẩm bán chạy như \" Đàn bà 30\" hay \" Tình nhân không bao giờ đòi cưới\". Ngoài những cuốn sách “hot” trên thị trường, Trang Hạ còn gây sốc bởi những phát ngôn để đời, chủ yếu là mắng nhiếc đàn ông, phơi bày những thói hư tật xấu của đấng mày râu.', N'https://toplist.vn/images/800px/nha-van-noi-tieng-nhat-viet-nam-16397.jpg')
SET IDENTITY_INSERT [dbo].[authors] OFF
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (1, N'Vui Vẻ Không Quạu Nha', 80817, 70817, 2014, N'images/product/image_195509_1_33312.jpg', 620, 8516, N'', 3, 3, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (2, N'Kính Vạn Hoa Chết Chóc (Tập 4)', 62719, 52719, 2010, N'images/product/bia-1_kinhvanhoa_tap-4_mem.jpg', 302, 6599, N'', 7, 5, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (3, N'Thiên Hạ Chi Vương (Tái Bản 2019)', 64644, 54644, 2009, N'images/product/image_187843.jpg', 418, 5302, N'', 3, 8, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (4, N'Người Chết Thuê', 67034, 57034, 2009, N'images/product/image_182041.jpg', 488, 3234, N'', 7, 8, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (5, N'Gam Lam Không Thực', 185403, 175403, 2011, N'images/product/image_174210.jpg', 489, 961, N'', 3, 3, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (6, N'Những Ngày Buồn Chóng Qua', 174515, 164515, 2016, N'images/product/nhungngaybuonchongqua.jpg', 102, 6342, N'', 9, 4, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (7, N'Cuối Cùng, Người Vẫn Đi', 107381, 97381, 2009, N'images/product/cuoicungnguoivandi_1.jpg', 280, 4422, N'', 9, 2, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (8, N'Có Nhiều Người Trong Một Người', 44788, 34788, 2017, N'images/product/image_195509_1_23062.jpg', 525, 4645, N'', 2, 8, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (9, N'Nhà Gỉa Kim( Tái Bản 2017)', 226774, 216774, 2007, N'images/product/8935235213746.jpg', 122, 2447, N'', 3, 9, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (10, N'Hảo Hán Nơi Trảng Cát', 63035, 53035, 2018, N'images/product/8936071673800.jpg', 317, 4692, N'', 7, 10, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (11, N'Bên Bờ Sông Piedra Tôi Ngồi Khóc', 83017, 73017, 2008, N'images/product/image_130113.jpg', 246, 7624, N'', 2, 8, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (12, N'Ông Gìa Và Biển Cả', 173774, 163774, 2007, N'images/product/8936067597936.jpg', 566, 6202, N'', 1, 1, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (13, N'Tiếng Chim Hót Trong Bụi Mận Gai (Tái Bản)', 218928, 208928, 2014, N'images/product/image_58819.jpg', 133, 1873, N'', 6, 5, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (14, N'Tôi Thấy Hoa Vàng Trên Cỏ Xanh (Bản Mới - 2018)', 196109, 186109, 2006, N'images/product/image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_2199.jpg', 413, 6755, N'', 9, 6, 7, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (15, N'Không Gia Đình', 143531, 133531, 2012, N'images/product/image_140322.jpg', 536, 5656, N'', 9, 7, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (16, N'Những Tấm Lòng Cao Cả', 171672, 161672, 2004, N'images/product/8936067595758.jpg', 437, 6925, N'', 1, 7, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (17, N'Chuyện Con Mèo Và Con Chuột Bạn Thân Của Nó (Tái Bản 2019)', 121163, 111163, 2018, N'images/product/image_181813.jpg', 291, 5364, N'', 8, 5, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (18, N'999 Lá Thư Gửi Cho Chính Mình - Mong Bạn Trở Thành Phiên Bản Hoàn Hảo Nhất (Tái Bản 2019)', 75579, 65579, 2004, N'images/product/image_187195.jpg', 618, 5694, N'', 1, 7, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (19, N'Cấu Tạo Một Gái Lệch Chuẩn', 119261, 109261, 2000, N'images/product/image_136963.jpg', 610, 49, N'', 4, 1, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (20, N'Nguồn Cội', 77407, 67407, 2017, N'images/product/nguoncoi.jpg', 673, 3304, N'', 1, 5, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (21, N'Combo Nguồn Cội + Biểu Tượng Thất Truyền (Bộ 2 Cuốn) (Tái Bản 2020)', 112912, 102912, 2017, N'images/product/bieutuongthattruyen.jpg', 187, 790, N'', 3, 8, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (22, N'Mắt Biếc - Tặng Kèm Postcard + 1 Số Tay Phiên Bản Phim (Mẫu Sổ Giao Ngẫu Nhiên)', 79108, 69108, 2014, N'images/product/91727.jpg', 693, 4522, N'', 5, 10, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (23, N'Bữa Cơm Ngày Mai Chúng Ta Cùng Chờ Đợi', 194006, 184006, 2007, N'images/product/8936186544125.jpg', 216, 1193, N'', 4, 10, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (24, N'Làm Bạn Với Bầu Trời - Tặng Kèm Khung Hình Xinh Xắn (Số Lượng Có Hạn)', 215867, 205867, 2016, N'images/product/8934974164135-qt.jpg', 516, 6821, N'', 9, 10, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (25, N'Lặng Thương Đến Hoàng Hôn (Tái Bản 2019)', 117934, 107934, 1999, N'images/product/image_195509_1_21580.jpg', 150, 557, N'', 8, 8, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (26, N'Hay Là Hạnh Phúc Trừ Mình Ra', 105708, 95708, 2002, N'images/product/187.jpg', 477, 470, N'', 5, 3, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (27, N'Lớn Đi Thôi Cho Kịp Cuộc Đời', 209852, 199852, 2018, N'images/product/bialondithoi.jpg', 309, 1761, N'', 8, 1, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (28, N'Chiến Thuật Loại Bỏ Lo Lắng - Dành Cho Người Lười: Đọc Ít, Nghĩ Nhiều', 212621, 202621, 1999, N'images/product/cover-chi_n-thu_t-lo_i-b_-lo-l_ng.jpg', 171, 4964, N'', 5, 9, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (29, N'Chiến Thuật Quản Lý Thời Gian - Dành Cho Người Lười: Đọc Ít, Nghĩ Nhiều', 152205, 142205, 2003, N'images/product/cover-chi_n-thu_t-qu_n-l_-th_i-gian.jpg', 535, 1452, N'', 7, 6, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (30, N'Ở Lại Thành Phố Hay Về Quê?', 84314, 74314, 2001, N'images/product/bia_olaithanhphohayveque-01_1.jpg', 455, 5542, N'', 2, 8, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (31, N'Khi Tài Năng Không Theo Kịp Giấc Mơ (Tái Bản 2019)', 215234, 205234, 1999, N'images/product/image_186710.jpg', 376, 4726, N'', 6, 9, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (32, N'Giới Hạn Của Bạn Chỉ Là Xuất Phát Điểm Của Tôi (Tái Bản 2019)', 244938, 234938, 2002, N'images/product/6e076a9087583e35575486c5cbc45ffa.jpg', 277, 5339, N'', 8, 9, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (33, N'Hạt Giống Tâm Hồn - Khi Bạn Mất Niềm Tin', 38270, 28270, 2016, N'images/product/image_134016.jpg', 589, 8104, N'', 1, 4, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (34, N'Những Khoảng Lặng Cuộc Sống (Tái Bản 2016)', 220363, 210363, 2012, N'images/product/image_35.gif', 328, 6613, N'', 2, 9, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (35, N'Hạt Giống Tâm Hồn - Tập 11 - Những Trải Nghiệm Cuộc Sống (Tái Bản 2016)', 155377, 145377, 2004, N'images/product/image_86237.jpg', 642, 5033, N'', 1, 1, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (36, N'Chicken Soup For The Soul - Tin Vào Ngày Mai', 109225, 99225, 2006, N'images/product/cs-19-tinvaongaymai.u84.d20161126.t011006.704696.jpg', 582, 6596, N'', 8, 4, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (37, N'Chicken Soup For The Soul - Cảm Hứng Cuộc Sống (Tái Bản 2016)', 297813, 287813, 2019, N'images/product/8935086838808.jpg', 216, 9028, N'', 7, 3, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (38, N'Chicken Soup For The Soul 1 - Chia Sẻ Tâm Hồn Và Quà Tặng Cuộc Sống (Tái Bản 2017)', 77905, 67905, 2004, N'images/product/image_127127.jpg', 218, 3485, N'', 7, 8, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (39, N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ - Bản Mới', 288946, 278946, 2018, N'images/product/bia_26_8.jpg', 388, 3338, N'', 9, 5, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (40, N'Cân Bằng Cảm Xúc, Cả Lúc Bão Giông', 152698, 142698, 2014, N'images/product/bia_can-bang-cam-xuc.jpg', 554, 1134, N'', 3, 1, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (41, N'Cứ Sống Tạm Bợ Mãi Được Sao?', 105331, 95331, 2012, N'images/product/bia_cu-song-tam-bo-mai-duoc-sao-final-1.jpg', 425, 750, N'', 3, 10, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (42, N'Thử Thách 52 Nghề - Mỗi Tuần 1 Nghề Bạn Có Dám Không', 201007, 191007, 1999, N'images/product/image_195509_1_990.jpg', 650, 139, N'', 8, 1, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (43, N'Nóng Giận Là Bản Năng, Tĩnh Lặng Là Bản Lĩnh', 267459, 257459, 2009, N'images/product/nong-gian-la-ban-nang-1.jpg', 147, 7004, N'', 1, 5, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (44, N'Muốn An được An (Tái Bản 2018)', 93386, 83386, 2020, N'images/product/muon-an-thi-duoc-an.jpg', 529, 5894, N'', 4, 10, 3, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (45, N'Combo Muốn An Được An + Tĩnh Lặng - Sức Mạnh Tĩnh Lặng Trong Thế Giới Huyền Ảo (Bộ 2 Cuốn)', 180231, 170231, 2005, N'images/product/combo-8936037711331-8936037799834.jpg', 407, 1363, N'', 5, 5, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (46, N'Sống Đơn Giản Cho Mình Thanh Thản', 197505, 187505, 2009, N'images/product/bia_song-don-gian-cho-minh-thanh-than.jpg', 232, 5629, N'', 6, 8, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (47, N'Hạnh Phúc Không Nằm Trong Ví', 100385, 90385, 2018, N'images/product/hanh_phuc_khong_nam_trong_vi_bia_1.jpg', 616, 8374, N'', 6, 1, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (48, N'Huyền Thuật Và Các Đạo Sĩ Tây Tạng', 282150, 272150, 2004, N'images/product/huyen-thuat-va-cac-dao-sy-tay-tang.jpg', 636, 3329, N'', 3, 1, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (49, N'Nhân Sinh Muôn Vẻ, Đừng Vội So Đo', 127632, 117632, 2005, N'images/product/resize_w500_hauto_nhan-sinh-muon-ve-dung-voi-so-do-bia-1-5e5f68d009a2f.jpg', 345, 8879, N'', 5, 3, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (50, N'Nâng Lên Được, Đặt Xuống Được', 234000, 224000, 2007, N'images/product/bia_nang_len_duoc_dat_xuong_duoc-1.jpg', 320, 5100, N'', 9, 3, 9, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (51, N'Dám Bị Ghét', 228021, 218021, 2010, N'images/product/8935235215283.jpg', 324, 5574, N'', 8, 6, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (52, N'Tôi Tài Giỏi, Bạn Cũng Thế! (Tái Bản 2019)', 102464, 92464, 2009, N'images/product/9789822288988.jpg', 567, 3079, N'', 3, 3, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (53, N'Dạy Con Dùng Tiền (Tái Bản 2019)', 223894, 213894, 2003, N'images/product/image_195509_1_4953.jpg', 103, 590, N'', 2, 7, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (54, N'Con Có Thể Tự Bảo Vệ Mình - Cơ Thể Con Là Của Con', 224837, 214837, 2016, N'images/product/9786047736041_2.jpg', 194, 6425, N'', 5, 3, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (55, N'Con Có Thể Tự Bảo Vệ Mình - Con Không Bao Giờ Đi Lạc', 77732, 67732, 2015, N'images/product/9786047736058.jpg', 218, 1872, N'', 6, 1, 3, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (56, N'Vô Cùng Tàn Nhẫn, Vô Cùng Yêu Thương (Tái Bản 2017)', 97457, 87457, 2004, N'images/product/8935251405873.jpg', 603, 7542, N'', 2, 5, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (57, N'Cách Trò Chuyện Với Con Trước 10 Tuổi Quyết Định Tương Lai Của Con', 147928, 137928, 2018, N'images/product/image_195509_1_17267.jpg', 335, 9689, N'', 3, 2, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (58, N'Nghệ Thuật Tinh Tế Của Việc \"Đếch\" Quan Tâm', 147444, 137444, 1999, N'images/product/14_1.png', 564, 3045, N'', 7, 2, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (59, N'Bạn Đắt Giá Bao Nhiêu? (Tái Bản 2019)', 291896, 281896, 2003, N'images/product/image_189157_1.jpg', 249, 6001, N'', 1, 6, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (60, N'Khí Chất Bao Nhiêu, Hạnh Phúc Bấy Nhiêu (Tái Bản 2019 - Lần 2)', 257534, 247534, 2004, N'images/product/image_188733_1.jpg', 698, 1657, N'', 9, 6, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (61, N'Tìm Mình Trong Thế Giới Hậu Tuổi Thơ', 232556, 222556, 2017, N'images/product/tim-minh-trong-the-gioi-hau-tuoi-tho-01-_2_.jpg', 124, 6754, N'', 9, 2, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (62, N'Dăm Ba Cái Tuổi Trẻ (Tái Bản 2020)', 299468, 289468, 2004, N'images/product/image_195509_1_29509_1.jpg', 586, 7843, N'', 6, 9, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (63, N'Vòng Quanh Nỗi Buồn', 278999, 268999, 1999, N'images/product/bia_vongquanhnoibuon.jpg', 630, 2420, N'', 5, 2, 7, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (64, N'Đàn Ông Sao Hỏa Đàn Bà Sao Kim', 205213, 195213, 2009, N'images/product/image_183259.jpg', 560, 6355, N'', 4, 3, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (65, N'Gắn Bó Yêu Thương', 142585, 132585, 2006, N'images/product/image_195509_1_31590.jpg', 333, 7337, N'', 1, 10, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (66, N'Sự Thật Tàn Nhẫn Về Gia Đình, Con Cái Và Tiền Bạc', 164563, 154563, 2019, N'images/product/image_195509_1_16482.jpg', 449, 7303, N'', 2, 10, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (67, N'Đọc Nhanh, Hiểu Sâu, Nhớ Lâu Trọn Đời', 28046, 18046, 2001, N'images/product/8936037710358.png', 348, 7246, N'', 5, 7, 8, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (68, N'Đường Mây Qua Xứ Tuyết - Tái Bản 2018', 189099, 179099, 2020, N'images/product/duongmayxutuyetnew.u5762.d20171011.t095442.6383_1.jpg', 546, 4646, N'', 7, 10, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (69, N'Mỉm Cười Dù Cuộc Đời Là Thế (Tái Bản 2019)', 27467, 17467, 2010, N'images/product/image_188014.jpg', 183, 5524, N'', 1, 8, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (70, N'Combo Fahasa (Cà Phê Cùng Tony + Trên Đường Băng) (2018)', 111920, 101920, 2006, N'images/product/untitled-1_122_1.jpg', 585, 2899, N'', 9, 5, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (71, N'Yêu Mình Trước Đã, Yêu Đời Để Sau', 64643, 54643, 2000, N'images/product/b_a-trc-y_u-m_nh-trc-_-01.jpg', 597, 9, N'', 8, 7, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (72, N'Dám Thay Đổi - 52 Bài Thực Hành Sống Bằng Cả Trái Tim', 295910, 285910, 2003, N'images/product/bia---dam-thay-doi.jpg', 648, 4527, N'', 9, 10, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (73, N'Sống Trọn Vẹn Mỗi Ngày', 76155, 66155, 1999, N'images/product/image_123079.jpg', 116, 8962, N'', 6, 2, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (74, N'Siêu Trí Nhớ', 88172, 78172, 2002, N'images/product/image_179061.jpg', 256, 7763, N'', 3, 7, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (75, N'Tư Duy Nhanh Và Chậm (Tái Bản)', 98048, 88048, 2012, N'images/product/8935251405972_1.jpg', 303, 9712, N'', 2, 8, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (76, N'Hiểu Về Trái Tim (Tái Bản 2019)', 26589, 16589, 2008, N'images/product/image_195509_1_14922.jpg', 193, 9792, N'', 9, 9, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (77, N'Ta Vui Đời Sẽ Vui', 250985, 240985, 2001, N'images/product/image_184792.jpg', 265, 4927, N'', 1, 6, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (78, N'Tôi Thích Bản Thân Nỗ Lực Hơn (Tái bản 2019)', 208079, 198079, 2015, N'images/product/untitled-1_9_25_1.jpg', 193, 2752, N'', 7, 2, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (79, N'Nghệ Thuật Tư Duy Rành Mạch (Tái Bản 2018)', 263639, 253639, 2007, N'images/product/nghe_thuat_tu_duy_ranh_mach_u2487_d20161129_t103616_398639_550x550.jpg', 389, 8218, N'', 3, 5, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (80, N'Combo Kỹ Năng Tư Duy (Bộ 5 Cuốn)', 50412, 40412, 2000, N'images/product/5555555555555555555555555.jpg', 593, 8900, N'', 6, 1, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (81, N'Kỹ Năng Làm Việc Nhóm Của Người Nhật', 123651, 113651, 2016, N'images/product/kynanglamviecnhomcuanguoinhat_bia1.jpg', 244, 2047, N'', 7, 4, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (82, N'Mặc Kệ Thiên Hạ Sống Như Người Nhật (Tái Bản 2018)', 197782, 187782, 2018, N'images/product/image_177780.jpg', 338, 4294, N'', 7, 1, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (83, N'Những Bài Học Không Có Nơi Giảng Đường', 51780, 41780, 2001, N'images/product/8936067598643.jpg', 144, 4404, N'', 5, 10, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (84, N'Hành Trang Vào Đời', 214690, 204690, 2017, N'images/product/image_182745.jpg', 158, 5213, N'', 9, 5, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (85, N'Sống Với Niềm Vui Mỗi Ngày (Tái Bản 2019)', 201988, 191988, 1999, N'images/product/image_192656.jpg', 378, 7747, N'', 8, 2, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (86, N'Thái Độ Sống Tạo Nên Tất Cả (Tái Bản)', 253018, 243018, 2012, N'images/product/image_189591.jpg', 318, 8178, N'', 1, 4, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (87, N'Cảm Xúc Là Kẻ Thù Số Một Của Thành Công 2 - Tặng Kèm Chữ Ký Tác Giả + 2 Bưu Thiếp Lịch Năm Canh Tý 2020 Có Chữ Ký Tặng Của TS Lê Thẩm Dương', 74416, 64416, 2012, N'images/product/fffffffffffffff_1_3_2.jpg', 413, 9050, N'', 1, 2, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (88, N'Kinh Nghiệm Thành Công Của Ông Chủ Nhỏ', 153422, 143422, 2012, N'images/product/image_195509_1_25998.jpg', 355, 5923, N'', 3, 8, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (89, N'Những Đòn Tâm Lý Trong Thuyết Phục (Tái Bản 2019)', 163240, 153240, 2008, N'images/product/8935251414585.jpg', 664, 6798, N'', 6, 3, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (90, N'The Small Big - Tuyệt Chiêu Thuyết Phục, Hạ Gục Khách Hàng', 57305, 47305, 2011, N'images/product/the-small-big.jpg', 549, 9737, N'', 2, 3, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (91, N'Chiến Thắng Con Quỷ Trong Bạn (Tái Bản 2018)', 216353, 206353, 2018, N'images/product/8936037710761_1.jpg', 527, 3038, N'', 9, 2, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (92, N'Tốt Như Vàng - Bí Quyết Làm Giàu Và Sống Hạnh Phúc', 279667, 269667, 2019, N'images/product/9786047740277.jpg', 185, 817, N'', 4, 10, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (93, N'Làm Thế Nào Để Tăng Lương?', 74365, 64365, 2007, N'images/product/image_195509_1_23994.jpg', 655, 6247, N'', 1, 7, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (94, N'Những Nguyên Tắc Vàng Của Napoleon Hill', 269217, 259217, 2020, N'images/product/image_191588.jpg', 591, 3921, N'', 1, 10, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (95, N'79 Quy Tắc Hay Trong Giao Tiếp (Tái Bản 2019)', 104093, 94093, 2011, N'images/product/image_195509_1_37937.jpg', 303, 2522, N'', 8, 8, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (96, N'Sức Mạnh Của Ngôn Từ (Tái Bản 2019)', 174952, 164952, 1999, N'images/product/image_190115.jpg', 494, 1042, N'', 6, 9, 9, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (97, N'Hiệu Ứng Đèn Gas', 184193, 174193, 1999, N'images/product/untitled-ssssssssss1.jpg', 147, 8186, N'', 4, 6, 3, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (98, N'Gia Đình Mình Hòa Hợp Là Được', 115730, 105730, 2014, N'images/product/untitled-1_33_7.jpg', 252, 804, N'', 1, 3, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (99, N'Hoàn Hảo Cũng Được, Không Hoàn Hảo Cũng Được (Trọn Bộ 3 Cuốn)', 196060, 186060, 2001, N'images/product/untitled-1_42.jpg', 329, 9112, N'', 2, 5, 9, 0)
GO
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (100, N'Đặc Quyền Của Gái Hư', 207403, 197403, 2009, N'images/product/bia_final.jpg', 484, 9035, N'', 4, 2, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (101, N'Nghìn Lẻ Một Đêm - Tập 2', 40650, 30650, 2020, N'images/product/8935212330305.jpg', 382, 2261, N'', 4, 3, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (102, N'Chuyện Con Mèo Dạy Hải Âu Bay (Tái Bản 2019)', 60983, 50983, 2012, N'images/product/image_188285.jpg', 340, 8941, N'', 1, 4, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (103, N'Nhật Ký Chú Bé Nhút Nhát - Tập 1', 67492, 57492, 2004, N'images/product/image_195509_1_20355.jpg', 654, 3395, N'', 5, 1, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (104, N'Hoàng Tử Bé (Tái Bản 2019)', 68891, 58891, 2011, N'images/product/image_187010.jpg', 510, 1601, N'', 9, 1, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (105, N'Ehon - Cây Sồi', 107269, 97269, 2016, N'images/product/8936037799797.jpg', 512, 8298, N'', 4, 4, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (106, N'Yêu Không Bến Bờ', 189880, 179880, 2000, N'images/product/image_138366.jpg', 227, 4887, N'', 1, 4, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (107, N'Nếu Ốc Sên Có Tình Yêu (Tái Bản 2017)', 36032, 26032, 2017, N'images/product/neuocsencotinhyeu-1.jpg', 283, 9492, N'', 8, 7, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (108, N'Nhật Ký Săn Đuổi Tội Ác', 220440, 210440, 2002, N'images/product/9786049573569_1.jpg', 324, 8098, N'', 9, 3, 4, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (109, N'Ám Dạ Hành', 259608, 249608, 1999, N'images/product/bia-am-da-hanh-01.jpg', 441, 4904, N'', 7, 3, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (110, N'Harry Potter Và Hòn Đá Phù Thuỷ - Tập 1 (Tái Bản 2017)', 65998, 55998, 2005, N'images/product/nxbtre_thumb_21542017_035423.jpg', 407, 8783, N'', 7, 9, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (111, N'Bước Chậm Lại Giữa Thế Gian Vội Vã (Tái Bản 2018)', 194270, 184270, 1999, N'images/product/buoc_cham_lai_giua_the_gian_voi_va.u335.d20160817.t102115.612356.jpg', 683, 6609, N'', 8, 6, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (112, N'Vừa Buông Tay Đã Thành Xa Lạ', 146906, 136906, 2007, N'images/product/image_187012.jpg', 463, 1404, N'', 2, 7, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (113, N'Sự Im Lặng Của Bầy Cừu (Tái Bản 2019)', 289944, 279944, 2008, N'images/product/image_180812.jpg', 538, 4719, N'', 1, 10, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (114, N'Tôi Nợ Tương Lai Một Ngày Hạnh Phúc', 238370, 228370, 2012, N'images/product/bia-toi_no_tuong_lai_mot_ngay_hanh_phuc.jpg', 369, 6908, N'', 4, 3, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (115, N'Con Chó Nhỏ Mang Giỏ Hoa Hồng (Bìa Mềm)', 74592, 64592, 2006, N'images/product/conchonhobiathuong.jpg', 594, 6966, N'', 1, 5, 8, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (116, N'Chuyện Con Ốc Sên Muốn Biết Tại Sao Nó Chậm Chạp (Tái Bản 2018)', 233427, 223427, 2020, N'images/product/8935235216884.jpg', 353, 8782, N'', 3, 8, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (117, N'Rơi Trong Chơi Vơi', 227860, 217860, 2008, N'images/product/roi_trong_choi_voi_full_final_1.jpg', 570, 8647, N'', 1, 10, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (118, N'Chuyện Con Chó Tên Là Trung Thành', 141563, 131563, 2009, N'images/product/image_190512.jpg', 499, 7419, N'', 7, 2, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (119, N'Ngàn Cánh Hạc - Bản Bìa Cứng - Tặng Kèm Bookmark', 227199, 217199, 2000, N'images/product/ngancanhhac_bia1_2.jpg', 470, 3987, N'', 4, 8, 7, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (120, N'Sống Đời Bình An', 197742, 187742, 2000, N'images/product/unnamed_2_6.jpg', 216, 7182, N'', 5, 10, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (121, N'Điều Bí Mật', 116807, 106807, 2020, N'images/product/161.jpg', 534, 7163, N'', 3, 2, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (122, N'Quái Vật Trong Đêm', 123500, 113500, 2000, N'images/product/image_188807.jpg', 283, 1458, N'', 9, 6, 8, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (123, N'5 Centimet Trên Giây', 33303, 23303, 2014, N'images/product/8936049524905.jpg', 555, 6176, N'', 2, 5, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (124, N'Nhật Ký Son Môi (Tái Bản 2016)', 287261, 277261, 2000, N'images/product/8935251403862.jpg', 545, 1123, N'', 9, 7, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (125, N'Không Còn Thời Gian Để Buồn', 242621, 232621, 2014, N'images/product/khongconthoigiandebuon.jpg', 625, 8838, N'', 2, 8, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (126, N'Phía Sau Nghi Can X (Tái Bản 2019)', 47057, 37057, 2007, N'images/product/image_187738.jpg', 560, 2790, N'', 2, 4, 3, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (127, N'Mộ Đom Đóm', 99039, 89039, 2013, N'images/product/cover-1---m_-_om-_m.jpg', 286, 3604, N'', 7, 6, 7, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (128, N'Tình Và Rác', 281951, 271951, 2011, N'images/product/image_195509_1_28975.jpg', 517, 9595, N'', 5, 9, 7, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (129, N'Cho Tôi Xin Một Vé Đi Tuổi Thơ (Bìa Mềm) (Tái Bản 2018)', 91487, 81487, 2004, N'images/product/image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_1233.jpg', 509, 6579, N'', 2, 7, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (130, N'Mắt Biếc', 106167, 96167, 2000, N'images/product/91727.jpg', 148, 7873, N'', 7, 1, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (131, N'Dấu Chân Trên Cát', 201250, 191250, 2010, N'images/product/image_195509_1_12629.jpg', 149, 7203, N'', 8, 10, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (132, N'Người Thắp Sao Trời', 251461, 241461, 2015, N'images/product/8935250712002.jpg', 563, 7770, N'', 4, 4, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (133, N'Hồ Dương - Tập 2 - Nam Bắc Đại Thống', 142011, 132011, 2012, N'images/product/9786045641040.jpg', 335, 4392, N'', 9, 4, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (134, N'Hào Khí Đông A - Nhân Huệ Vương Trần Khánh Dư', 233854, 223854, 2010, N'images/product/image_195509_1_23371.jpg', 370, 950, N'', 3, 5, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (135, N'Đại Việt Sử Ký Toàn Thư', 244015, 234015, 2017, N'images/product/8936040589583.jpg', 176, 7967, N'', 5, 9, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (136, N'Sapiens: Lược Sử Loài Người (Tái Bản)', 109558, 99558, 2007, N'images/product/8935270700058-1_1_1.jpg', 170, 7512, N'', 1, 8, 2, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (137, N'Các Nền Văn Minh Thế Giới - Trung Quốc Cổ Đại', 141327, 131327, 2018, N'images/product/8936071674579.jpg', 279, 9690, N'', 3, 7, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (138, N'Súng, Vi Trùng Và Thép (Tái Bản 2020)', 55285, 45285, 2005, N'images/product/image_195509_1_29802.jpg', 489, 9882, N'', 1, 2, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (139, N'Thế Giới Cho Đến Ngày Hôm Qua (Tái Bản 2018)', 198240, 188240, 2016, N'images/product/ww_1.jpg', 0, 2897, N'', 2, 7, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (140, N'Tâm Lý Dân Tộc An Nam', 34941, 24941, 2020, N'images/product/image_188104.jpg', 0, 4121, N'', 7, 1, 3, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (141, N'Non Nước Việt Nam 63 Tỉnh Thành', 282140, 272140, 2008, N'images/product/nnn_2.jpg', 0, 18, N'', 2, 10, 7, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (142, N'Hào Kiệt Nước Nam - Tường Quân Hoàng Hoa Thám', 255360, 245360, 2013, N'images/product/image_195135.jpg', 0, 9673, N'', 3, 5, 6, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (143, N'Phong Trào Chấn Hưng Phật Giáo Miền Trung Việt Nam (1932-1951)', 41067, 31067, 2020, N'images/product/9786048434052.jpg', 0, 1586, N'', 8, 7, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (144, N'Một Góc Nhìn Thời Cuộc', 86654, 76654, 2002, N'images/product/image_195509_1_26631.jpg', 0, 515, N'', 6, 4, 9, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (145, N'Donald Trump - Lựa Chọn Lịch Sử Của Nước Mỹ', 160518, 150518, 2006, N'images/product/8935211187269.jpg', 0, 8858, N'', 5, 10, 3, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (146, N'Hoảng Loạn, Hỗn Loạn Và Cuồng Loạn', 44891, 34891, 2002, N'images/product/hoang-loan-hon-loan-va-cuong-loan--01.jpg', 0, 4778, N'', 7, 6, 7, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (147, N'Lee Kun Hee - Những Lựa Chọn Chiến Lược Và Kỳ Tích SamSung', 150083, 140083, 2008, N'images/product/image_195509_1_22722.jpg', 0, 5327, N'', 4, 10, 9, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (148, N'Nhớ Nghĩ Chiều Hôm', 173488, 163488, 2017, N'images/product/image_195509_1_38858.jpg', 0, 171, N'', 6, 4, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (149, N'Hồi Ức Tuổi Tám Mươi - Hành Trình Từ Điện Tử Đến Vi Mạch', 128143, 118143, 2002, N'images/product/image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_2662.jpg', 0, 9742, N'', 3, 3, 3, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (150, N'Khi Hơi Thở Hóa Thinh Không (Tái Bản 2020)', 137753, 127753, 2000, N'images/product/image_195509_1_34396.jpg', 0, 1277, N'', 4, 10, 8, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (151, N'Thời Khắc Tươi Đẹp (Bìa Cứng)', 110712, 100712, 2004, N'images/product/image_195509_1_37347.jpg', 0, 6010, N'', 7, 5, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (152, N'Bước Vào Cửa Hiệu Nhiệm Màu - Câu Chuyện Kỳ Diệu Về Cuộc Đời Của Một Bác Sĩ Phẫu Thuật Thần Kinh', 41900, 31900, 2012, N'images/product/image_195509_1_37353.jpg', 0, 820, N'', 1, 7, 3, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (153, N'BTS - Ở Đâu Có Hy Vọng Ở Đó Có Khó Khăn', 56601, 46601, 1999, N'images/product/8936062804527-qt.jpg', 0, 3894, N'', 7, 2, 1, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (154, N'Becoming - Chất Michelle', 244061, 234061, 2001, N'images/product/sach.jpg', 0, 6767, N'', 2, 4, 9, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (155, N'Nhà Ngoại Cảm Phan Thị Bích Hằng', 111289, 101289, 2005, N'images/product/nhangoaicamphanthibichhang.jpg', 0, 1355, N'', 6, 5, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (156, N'Đường Ngược Chiều - Từ Bản Người Dao Đến Học Bổng Erasmus', 250839, 240839, 2020, N'images/product/image_195509_1_30721.jpg', 0, 8634, N'', 7, 8, 3, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (157, N'Chạy Bộ Cùng Người Kenya', 209859, 199859, 2006, N'images/product/image_195509_1_37348.jpg', 0, 9450, N'', 4, 4, 8, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (158, N'Tự Truyện Lê Công Vinh – Phút 89', 290409, 280409, 2012, N'images/product/tu_truyen_le_cong_vinh-phut_89.jpg', 0, 5087, N'', 3, 1, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (159, N'Cuộc Đua Trở Thành Cầu Thủ Vĩ Đại Nhất: Cristiano Và Leo - Khổ Luyện Và Thiên Tài', 259921, 249921, 2020, N'images/product/cristiano-_-leo---bia-1.jpg', 0, 3515, N'', 9, 7, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (160, N'Mike Tyson - Sự Thật Trần Trụi (Sách Dành Cho Độc Giả Trên 18 Tuổi)', 296390, 286390, 2011, N'images/product/8936071674173.jpg', 0, 2084, N'', 4, 9, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (161, N'Tỷ Phú Bán Giày (Tái Bản 2018)', 104730, 94730, 2018, N'images/product/8936066702621_1_2.jpg', 0, 7348, N'', 7, 6, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (162, N'Trước Bình Minh Luôn Là Đêm Tối', 75824, 65824, 2012, N'images/product/8935251407655.jpg', 0, 1589, N'', 5, 7, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (163, N'Thế Giới Alibaba Của Jack Ma', 142156, 132156, 2011, N'images/product/8934974150879.jpg', 0, 2561, N'', 3, 2, 5, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (164, N'[Bản Đặc Biệt] Huyền Thoại Marvel - Stan Lee', 117408, 107408, 2005, N'images/product/8936186544071_1_1.jpg', 0, 3741, N'', 8, 1, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (165, N'Lý Tiểu Long - Một Cuộc Đời Phi Thường', 81948, 71948, 2018, N'images/product/l_-ti_u-long---m_t-cu_c-_i-phi-th_ng.jpg', 0, 4729, N'', 2, 9, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (166, N'Stephen Hawking: Một Trí Tuệ Không Giới Hạn', 76354, 66354, 2018, N'images/product/b_a-chu_n-_1_.jpg', 0, 4835, N'', 2, 4, 3, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (167, N'Không Gục Ngã - Tự Truyện Nguyễn Bích Lan (Tái Bản)', 297218, 287218, 2016, N'images/product/image_192661.jpg', 0, 921, N'', 2, 10, 8, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (168, N'Làm Dâu Nước Anh', 103356, 93356, 2019, N'images/product/image_195509_1_22978.jpg', 0, 7189, N'', 4, 5, 1, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (169, N'Tôi Học Đại Học - Nguyễn Ngọc Ký', 149699, 139699, 2020, N'images/product/image_134014.jpg', 0, 1058, N'', 4, 7, 5, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (170, N'Tâm Huyết Trao Đời - Tự Truyện Nguyễn Ngọc Ký', 115951, 105951, 2013, N'images/product/8935086843611.jpg', 0, 6077, N'', 7, 1, 2, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (171, N'Bùi Kiến Thành - Người Mở Khóa Lãng Du', 145146, 135146, 2005, N'images/product/hoi-ky-bui-kien-thanh-b_a-1.jpg', 0, 5286, N'', 3, 10, 4, 1)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (172, N'Thành Đoàn Cùng Quân Và Dân Sài Gòn - Gia Định Tham Gia Chiến Dịch Hồ Chí Minh', 84957, 74957, 2014, N'images/product/image_195509_1_27262.jpg', 0, 6959, N'', 5, 3, 6, 0)
INSERT [dbo].[books] ([id], [title], [price], [sale_price], [publish_year], [picture], [page_number], [quantity], [quotes_about], [author_id], [publisher_id], [category_id], [new]) VALUES (173, N'Tổng Tập Hồi Ký Của Đại Tướng Võ Nguyên Giáp', 275674, 265674, 2001, N'images/product/image_195509_1_7222.jpg', 0, 5332, N'', 5, 5, 8, 0)
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Văn học')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Thiếu nhi')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Tiểu sử Hồi ký')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Giáo khoa - Sách tham khảo')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Ngoại ngữ')
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'Kinh tế')
INSERT [dbo].[categories] ([id], [name]) VALUES (7, N'Tâm Lí - Kĩ năng sống')
INSERT [dbo].[categories] ([id], [name]) VALUES (8, N'Nuôi dạy con')
INSERT [dbo].[categories] ([id], [name]) VALUES (9, N'Văn phòng phẩm')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [order_date], [required_date], [shipped_date], [status], [comment], [total], [user_id], [coupon_code]) VALUES (1, CAST(N'2020-12-19T00:00:00.000' AS DateTime), NULL, NULL, N'Hello', N'không có gì', 500000, 1, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[publishers] ON 

INSERT [dbo].[publishers] ([id], [name]) VALUES (1, N'Nhà xuất bản Chính trị Quốc gia
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (2, N'Nhà xuất bản Hồng Đức
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (3, N'Nhà xuất bản Kim Đồng
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (4, N'Nhà xuất bản Quân đội
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (5, N'Nhà xuất bản Thanh niên
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (6, N'Nhà xuất bản Phụ nữ
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (7, N'Nhà xuất bản Lao động xã hội
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (8, N'Nhà xuất bản Tài chính
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (9, N'Nhà xuất bản Lao động xã hội
')
INSERT [dbo].[publishers] ([id], [name]) VALUES (10, N'Nhà xuất bản Tri thức
')
SET IDENTITY_INSERT [dbo].[publishers] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [username], [password], [address], [phone], [email], [picture], [province_code], [district_code], [ward_code], [is_admin]) VALUES (1, N'Dinh Van Luc', N'admin', N'admin', N'HN', N'0962002316', N'dvl@gmail.com', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[users] ([id], [name], [username], [password], [address], [phone], [email], [picture], [province_code], [district_code], [ward_code], [is_admin]) VALUES (2, N'Pham Cho', N'user', N'1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__coupons__357D4CF991CF02A9]    Script Date: 12/20/2020 10:33:13 AM ******/
ALTER TABLE [dbo].[coupons] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[authors] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([publisher_id])
REFERENCES [dbo].[publishers] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[districts]  WITH CHECK ADD FOREIGN KEY([province_code])
REFERENCES [dbo].[provinces] ([province_code])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([coupon_code])
REFERENCES [dbo].[coupons] ([code])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([district_code])
REFERENCES [dbo].[districts] ([district_code])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([province_code])
REFERENCES [dbo].[provinces] ([province_code])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([ward_code])
REFERENCES [dbo].[wards] ([ward_code])
GO
ALTER TABLE [dbo].[wards]  WITH CHECK ADD FOREIGN KEY([district_code])
REFERENCES [dbo].[districts] ([district_code])
GO
USE [master]
GO
ALTER DATABASE [online_bookstore] SET  READ_WRITE 
GO
