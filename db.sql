USE [master]
GO
/****** Object:  Database [FlixOneStore]    Script Date: 3/2/2016 4:42:01 PM ******/
CREATE DATABASE [FlixOneStore]
GO
USE [FlixOneStore]
GO
/****** Object:  Table [dbo].[AddressBook]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressBook](
	[id] [uniqueidentifier] NOT NULL,
	[customerid] [uniqueidentifier] NULL,
	[company] [nvarchar](50) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[streetaddress] [nvarchar](65) NOT NULL,
	[postalcode] [nvarchar](10) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[countryid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AddressBook] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [uniqueidentifier] NOT NULL,
	[customerid] [uniqueidentifier] NULL,
	[productid] [uniqueidentifier] NULL,
	[qty] [int] NOT NULL,
	[finalprice] [decimal](10, 2) NOT NULL,
	[addedon] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartAttributes]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartAttributes](
	[id] [uniqueidentifier] NOT NULL,
	[customerid] [uniqueidentifier] NULL,
	[productid] [uniqueidentifier] NULL,
	[productoptionid] [uniqueidentifier] NULL,
	[productoptionvalueid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CartAttributes] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[parentcatid] [uniqueidentifier] NULL,
	[order] [int] NOT NULL,
	[addedon] [datetime] NOT NULL,
	[modifiedon] [datetime] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[id] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](65) NOT NULL,
	[key] [nvarchar](65) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[configurationgroupid] [uniqueidentifier] NULL,
	[order] [int] NOT NULL,
	[modifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConfigurationGroup]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigurationGroup](
	[id] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](65) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[order] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ConfigurationGroup] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](65) NOT NULL,
	[ISOCode] [nvarchar](5) NOT NULL,
	[Currencyid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[id] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[code] [nchar](5) NOT NULL,
	[symboleleft] [nvarchar](15) NULL,
	[symbolright] [nvarchar](15) NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerInfo]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInfo](
	[id] [uniqueidentifier] NOT NULL,
	[customerid] [uniqueidentifier] NULL,
	[lastlogon] [datetime] NOT NULL,
	[logoncount] [int] NOT NULL,
	[accountcreatedon] [datetime] NOT NULL,
	[lastmodifiedon] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerInfo] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [uniqueidentifier] NOT NULL,
	[gender] [char](1) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[dob] [datetime] NOT NULL,
	[email] [nvarchar](110) NOT NULL,
	[mainaddressid] [uniqueidentifier] NULL,
	[telephone] [nvarchar](50) NOT NULL,
	[fax] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[newsletteropted] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[image] [nvarchar](65) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ManufacturersInfo]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufacturersInfo](
	[id] [uniqueidentifier] NOT NULL,
	[manufacturerid] [uniqueidentifier] NULL,
	[url] [nvarchar](255) NOT NULL,
	[addedon] [datetime] NOT NULL,
 CONSTRAINT [PK_ManufacturersInfo] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderProductAttributes]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderProductAttributes](
	[id] [uniqueidentifier] NOT NULL,
	[orderid] [uniqueidentifier] NULL,
	[orderproductid] [uniqueidentifier] NULL,
	[productoptions] [nvarchar](50) NOT NULL,
	[productoptiobvalue] [nvarchar](50) NOT NULL,
	[optionvalueprice] [decimal](10, 2) NOT NULL,
	[price_prefix] [char](1) NOT NULL,
 CONSTRAINT [PK_OrderProductAttributes] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [uniqueidentifier] NOT NULL,
	[customerid] [uniqueidentifier] NULL,
	[customername] [nvarchar](65) NOT NULL,
	[customerStreetaddress] [nvarchar](65) NOT NULL,
	[customercity] [nvarchar](50) NOT NULL,
	[customerstate] [nvarchar](50) NOT NULL,
	[customerpostalcode] [nvarchar](50) NOT NULL,
	[customercountry] [nvarchar](50) NOT NULL,
	[customertelephone] [nvarchar](50) NOT NULL,
	[customeremail] [nvarchar](110) NOT NULL,
	[deliveryname] [nvarchar](65) NOT NULL,
	[deliverystreetaddress] [nvarchar](65) NOT NULL,
	[deliverycity] [nvarchar](50) NOT NULL,
	[deliverystate] [nvarchar](50) NOT NULL,
	[deliverypostalcode] [nvarchar](50) NOT NULL,
	[deliverycountry] [nvarchar](50) NOT NULL,
	[paymentmethodid] [uniqueidentifier] NULL,
	[latsmodified] [datetime] NOT NULL,
	[datepurcahsed] [datetime] NOT NULL,
	[shippingcost] [decimal](10, 2) NULL,
	[shipingmethodid] [uniqueidentifier] NULL,
	[orderstatus] [nvarchar](10) NOT NULL,
	[orderdatefinished] [datetime] NOT NULL,
	[comments] [nvarchar](max) NULL,
	[currency] [nvarchar](5) NOT NULL,
	[currency_value] [decimal](16, 6) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdersProducts]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersProducts](
	[id] [uniqueidentifier] NOT NULL,
	[orderid] [uniqueidentifier] NULL,
	[productid] [uniqueidentifier] NOT NULL,
	[productname] [nvarchar](65) NOT NULL,
	[productprice] [decimal](10, 2) NOT NULL,
	[finalprice] [decimal](10, 2) NOT NULL,
	[productstax] [decimal](9, 4) NOT NULL,
	[productqty] [int] NOT NULL,
 CONSTRAINT [PK_OrdersProducts] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdersStatus]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersStatus](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrdersStatus] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [uniqueidentifier] NOT NULL,
	[qty] [int] NOT NULL,
	[model] [nvarchar](50) NOT NULL,
	[image] [nvarchar](65) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[addedon] [datetime] NOT NULL,
	[modifiedon] [datetime] NOT NULL,
	[weight] [decimal](7, 2) NOT NULL,
	[status] [tinyint] NOT NULL,
	[manufactureId] [uniqueidentifier] NULL,
	[taxclassid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductsAttributes]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductsAttributes](
	[id] [uniqueidentifier] NOT NULL,
	[productsid] [uniqueidentifier] NULL,
	[optionsid] [uniqueidentifier] NULL,
	[optionvaluesid] [uniqueidentifier] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[price_prefix] [char](1) NOT NULL,
 CONSTRAINT [PK_ProductsAttributes] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productsdetail]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productsdetail](
	[id] [uniqueidentifier] NOT NULL,
	[productid] [uniqueidentifier] NULL,
	[name] [nvarchar](65) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[views] [int] NOT NULL,
 CONSTRAINT [PK_productsdetail] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductsOptions]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsOptions](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductsOptions] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductsOptionsValues]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsOptionsValues](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](65) NOT NULL,
 CONSTRAINT [PK_ProductsOptionsValues] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductsOptionsValuesMappings]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsOptionsValuesMappings](
	[id] [uniqueidentifier] NOT NULL,
	[optionsid] [uniqueidentifier] NULL,
	[valuesid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ProductsOptionsValuesMappings] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[id] [uniqueidentifier] NOT NULL,
	[productid] [uniqueidentifier] NULL,
	[customerid] [uniqueidentifier] NULL,
	[customername] [nvarchar](65) NOT NULL,
	[rating] [int] NOT NULL,
	[addedon] [datetime] NOT NULL,
	[modifiedon] [datetime] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReviewsDetail]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewsDetail](
	[id] [uniqueidentifier] NOT NULL,
	[reviewid] [uniqueidentifier] NULL,
	[text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ReviewsDetail] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WhoIsOnline]    Script Date: 3/2/2016 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WhoIsOnline](
	[id] [uniqueidentifier] NOT NULL,
	[fullname] [nvarchar](65) NOT NULL,
	[sessionid] [nvarchar](255) NOT NULL,
	[ipaddress] [nvarchar](18) NOT NULL,
	[timeentry] [datetime] NOT NULL,
	[lastpageurl] [nvarchar](65) NOT NULL,
 CONSTRAINT [PK_WhoIsOnline] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AddressBook]  WITH CHECK ADD  CONSTRAINT [FK_AddressBook_Customers] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[AddressBook] CHECK CONSTRAINT [FK_AddressBook_Customers]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customers] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customers]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[CartAttributes]  WITH CHECK ADD  CONSTRAINT [FK_CartAttributes_Customers] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[CartAttributes] CHECK CONSTRAINT [FK_CartAttributes_Customers]
GO
ALTER TABLE [dbo].[CartAttributes]  WITH CHECK ADD  CONSTRAINT [FK_CartAttributes_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[CartAttributes] CHECK CONSTRAINT [FK_CartAttributes_Products]
GO
ALTER TABLE [dbo].[CartAttributes]  WITH CHECK ADD  CONSTRAINT [FK_CartAttributes_ProductsOptions] FOREIGN KEY([productoptionid])
REFERENCES [dbo].[ProductsOptions] ([id])
GO
ALTER TABLE [dbo].[CartAttributes] CHECK CONSTRAINT [FK_CartAttributes_ProductsOptions]
GO
ALTER TABLE [dbo].[CartAttributes]  WITH CHECK ADD  CONSTRAINT [FK_CartAttributes_ProductsOptionsValues] FOREIGN KEY([productoptionvalueid])
REFERENCES [dbo].[ProductsOptionsValues] ([id])
GO
ALTER TABLE [dbo].[CartAttributes] CHECK CONSTRAINT [FK_CartAttributes_ProductsOptionsValues]
GO
ALTER TABLE [dbo].[Configuration]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_ConfigurationGroup] FOREIGN KEY([configurationgroupid])
REFERENCES [dbo].[ConfigurationGroup] ([id])
GO
ALTER TABLE [dbo].[Configuration] CHECK CONSTRAINT [FK_Configuration_ConfigurationGroup]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Currencies] FOREIGN KEY([Currencyid])
REFERENCES [dbo].[Currencies] ([id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Currencies]
GO
ALTER TABLE [dbo].[CustomerInfo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerInfo_Customers] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[CustomerInfo] CHECK CONSTRAINT [FK_CustomerInfo_Customers]
GO
ALTER TABLE [dbo].[ManufacturersInfo]  WITH CHECK ADD  CONSTRAINT [FK_ManufacturersInfo_Manufacturers] FOREIGN KEY([manufacturerid])
REFERENCES [dbo].[Manufacturers] ([id])
GO
ALTER TABLE [dbo].[ManufacturersInfo] CHECK CONSTRAINT [FK_ManufacturersInfo_Manufacturers]
GO
ALTER TABLE [dbo].[OrderProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductAttributes_OrderProductAttributes] FOREIGN KEY([orderproductid])
REFERENCES [dbo].[OrdersProducts] ([id])
GO
ALTER TABLE [dbo].[OrderProductAttributes] CHECK CONSTRAINT [FK_OrderProductAttributes_OrderProductAttributes]
GO
ALTER TABLE [dbo].[OrderProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductAttributes_Orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderProductAttributes] CHECK CONSTRAINT [FK_OrderProductAttributes_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[OrdersProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersProducts_Orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrdersProducts] CHECK CONSTRAINT [FK_OrdersProducts_Orders]
GO
ALTER TABLE [dbo].[OrdersProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersProducts_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrdersProducts] CHECK CONSTRAINT [FK_OrdersProducts_Products]
GO
ALTER TABLE [dbo].[ProductsAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductsAttributes_Products] FOREIGN KEY([productsid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductsAttributes] CHECK CONSTRAINT [FK_ProductsAttributes_Products]
GO
ALTER TABLE [dbo].[ProductsAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductsAttributes_ProductsOptions] FOREIGN KEY([optionsid])
REFERENCES [dbo].[ProductsOptions] ([id])
GO
ALTER TABLE [dbo].[ProductsAttributes] CHECK CONSTRAINT [FK_ProductsAttributes_ProductsOptions]
GO
ALTER TABLE [dbo].[ProductsAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductsAttributes_ProductsOptionsValues] FOREIGN KEY([optionvaluesid])
REFERENCES [dbo].[ProductsOptionsValues] ([id])
GO
ALTER TABLE [dbo].[ProductsAttributes] CHECK CONSTRAINT [FK_ProductsAttributes_ProductsOptionsValues]
GO
ALTER TABLE [dbo].[productsdetail]  WITH CHECK ADD  CONSTRAINT [FK_productsdetail_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[productsdetail] CHECK CONSTRAINT [FK_productsdetail_Products]
GO
ALTER TABLE [dbo].[ProductsOptionsValuesMappings]  WITH CHECK ADD  CONSTRAINT [FK_ProductsOptionsValuesMappings_productsdetail] FOREIGN KEY([optionsid])
REFERENCES [dbo].[ProductsOptions] ([id])
GO
ALTER TABLE [dbo].[ProductsOptionsValuesMappings] CHECK CONSTRAINT [FK_ProductsOptionsValuesMappings_productsdetail]
GO
ALTER TABLE [dbo].[ProductsOptionsValuesMappings]  WITH CHECK ADD  CONSTRAINT [FK_ProductsOptionsValuesMappings_ProductsOptionsValues] FOREIGN KEY([valuesid])
REFERENCES [dbo].[ProductsOptionsValues] ([id])
GO
ALTER TABLE [dbo].[ProductsOptionsValuesMappings] CHECK CONSTRAINT [FK_ProductsOptionsValuesMappings_ProductsOptionsValues]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products]
GO
ALTER TABLE [dbo].[ReviewsDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReviewsDetail_Reviews] FOREIGN KEY([reviewid])
REFERENCES [dbo].[Reviews] ([id])
GO
ALTER TABLE [dbo].[ReviewsDetail] CHECK CONSTRAINT [FK_ReviewsDetail_Reviews]
GO
USE [master]
GO
ALTER DATABASE [FlixOneStore] SET  READ_WRITE
GO
