create database QLPKPV
USE [QLPKPV]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 6/12/2022 9:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/12/2022 9:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/12/2022 9:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/12/2022 9:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/12/2022 9:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDesciption] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/12/2022 9:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (1, N'Apple', N'apple.jpg', N'apple', 1, 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (2, N'SamSung', N'samsung', N'samsung', 1, 2, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (3, N'Xiaomi', N'xiaomi', N'xiaomi', 1, 3, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (2, N'Máy tính ', N'Laptop.jpg                                                                                          ', N'may-tinh', 1, 2, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (3, N'Máy Tính bảng', N'Ipad.jpg                                                                                            ', N'may-tinh', 1, 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (4, N'Phụ kiên', N'Phukien.jpg                                                                                         ', N'phu-kien', 1, 4, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (5, N'Đồng Hồ Thông Minh', N'Dongho.jpg                                                                                          ', N'dong-ho', 1, 5, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (6, N'Đồng Hồ Thời Trang', N'DonghoTT.jpg                                                                                        ', N'dong-ho', 1, 6, 0, NULL, NULL)
UPDATE [dbo].[Category] SET Name=N'Card Đồ Họa', Avatar='gpu.jpg',Slug=N'card-do-hoa',ShowOnHomePage=1,DisplayOrder=2,Deleted=0,CreatedOnUtc=NULL,UpdateOnUtc=Null Where Id=2;
UPDATE [dbo].[Category] SET Name=N'CPU', Avatar='cpu.jpg',Slug=N'cpu',ShowOnHomePage=1,DisplayOrder=3,Deleted=0,CreatedOnUtc=NULL,UpdateOnUtc=Null Where Id=3;
UPDATE [dbo].[Category] SET Name=N'Mainboard', Avatar='mainboard.jpg',Slug=N'mainboard',ShowOnHomePage=1,DisplayOrder=4,Deleted=0,CreatedOnUtc=NULL,UpdateOnUtc=Null Where Id=4;
UPDATE [dbo].[Category] SET Name=N'Laptop Gaming', Avatar='laptopgaming.png',Slug=N'laptop-gaming',ShowOnHomePage=1,DisplayOrder=5,Deleted=0,CreatedOnUtc=NULL,UpdateOnUtc=Null Where Id=5;
UPDATE [dbo].[Category] SET Name=N'Màn Hình Gaming', Avatar='manhinh.jpg',Slug=N'man-hinh',ShowOnHomePage=1,DisplayOrder=6,Deleted=0,CreatedOnUtc=NULL,UpdateOnUtc=Null Where Id=6;


SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'Đơn hàng-20220612202346', 1, 1, CAST(N'2022-06-12 20:23:46.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (0, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (1, N'Iphone 6 64GB ', NULL, 2, N'Mô tả ngắn', N'Mô tả chi tiết', 600000000, 500000000, 1, N'Iphone6', 1, 0, 1, 1, NULL, CAST(N'2022-06-07 13:08:11.970' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (2, N'Iphone7', N'Iphone7.jpg                                                                                         ', 2, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 1, N'Iphone6', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (3, N'Iphone8', N'Iphone7.jpg                                                                                         ', 1, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 1, N'Iphone6', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (4, N' Sam Sung A3', N'Iphone7.jpg                                                                                         ', 1, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 2, N'Iphone6', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (5, N'Sam Sung A2', N'Iphone7.jpg                                                                                         ', 1, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 2, N'Iphone6', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (6, N'MSI', N'Laptop1.jpg                                                                                         ', 2, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 2, N'Iphone6', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (7, N'Asus', N'Laptop2.jpg                                                                                         ', 2, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 2, N'Iphone6', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (8, N'Xiaomi A3', N'Iphone6.jpg                                                                                         ', 1, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 2, N'Iphone6', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (9, N'Xiaomi A4', N'Iphone7.jpg                                                                                         ', 1, N'Mô tả ngắn ', N'Mô tả chi tiết', 700000000, 600000000, 1, N'Iphone6', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (10, N'LAPTOP', NULL, 1, N'1', N'DSAD', 1321, 1, 1, N'1', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (11, N'hung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (12, N'3hung', N'Iphone6.jpg_20220530120005                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (13, N'hung2k1', N'Iphone6.jpg_20220530120045                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (14, N'hung1111', N'Iphone6.jpg_20220530121442                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (15, N'3hungSAD', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-30 12:19:37.117' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (16, N'3hung', N'ip5.jpg                                                                                             ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-30 12:22:33.983' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (17, N'Dien thoai Sum sung A2', N'ip7.jpg                                                                                             ', 1, N'Dien thoai A2 mat ngon', N'<p>Provip</p>
', 700000000, 50000000, 1, N'1', 1, NULL, NULL, NULL, CAST(N'2022-05-30 16:22:15.517' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (18, N'3hung', N'mi4.jpg                                                                                             ', 1, N'sai ngon', N'<p>bvgjhgkjhkjh</p>
', 700000000, 1, 2, N'1', 2, NULL, NULL, NULL, CAST(N'2022-05-30 16:36:43.817' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (19, N'LAPTOP dell', N'spnb1.png                                                                                           ', 1, N'test dell', N'delll ', 50000000, 1, 1, N'1', 1, NULL, NULL, NULL, CAST(N'2022-05-30 16:39:05.000' AS DateTime), CAST(N'2022-06-07 12:26:26.467' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (20, N'LAPTOPhehe1221321', NULL, 2, N'sai ngon', N'111', 700000000, 50000000, 1, N'1', 1, NULL, NULL, NULL, CAST(N'2022-05-30 16:42:42.000' AS DateTime), CAST(N'2022-05-30 16:42:42.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (23, N'hung1', N'ss2.jpg                                                                                             ', 2, N'sai ngon', N'<p>dsadasd</p>
', 700000000, 1111, 1, N'1', 1, NULL, NULL, NULL, CAST(N'2022-06-02 20:32:35.570' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (24, N'321344', NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, CAST(N'2022-06-02 20:56:49.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (25, N'3212313213', NULL, 2, NULL, N'saaaaaaaaa', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, CAST(N'2022-06-02 20:58:06.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (26, N'Laptop', NULL, 3, NULL, N'<p>aaaaa</p>
', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, CAST(N'2022-06-02 21:01:18.327' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (27, N'3hungaaaaa', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-02 21:52:44.637' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (30, N'LAPTOP msi', N'unnamed.webp                                                                                        ', 1, N'Thương hiệu MSI SKU: 211105063', NULL, 11111, 11111, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-07 19:50:18.913' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (31, N'Laptop MSI Modern 15 A5M 238VN ( 15.6" AMD Ryzen 5 5500U/8GB/512GB SSD/Windows 11 Home/1.6kg)', NULL, 2, N'Thương hiệu MSI SKU: 211105063', NULL, 14190000, 14190000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-07 19:52:41.013' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (32, N'- CPU: Intel Core i5-1135G7', NULL, 2, N'sai ngonaaa', NULL, 700000000, 111111111, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-07 19:56:19.000' AS DateTime), CAST(N'2022-06-12 15:28:07.690' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDesciption], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (33, N'Laptop HP 15s-fq2561TU 46M29PAAA', NULL, 2, NULL, NULL, 700000000, 50000000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-07 19:57:44.000' AS DateTime), CAST(N'2022-06-12 07:08:11.750' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'hung', N'huynh', N'admin@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'ngochung', N'hung', N'hungAdmin@gmail.com', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'hung', N'ngo', N'hungAdmin1@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'phat', N'ngo', N'adminPhat@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (5, N'hung', N'huynh', N'hungAdmin123@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (6, N'hung111', N'huynh', N'admin1111@gmail.com', N'b59c67bf196a4758191e42f76670ceba', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Giảm giá sốc,2:Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
