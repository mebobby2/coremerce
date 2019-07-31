DROP DATABASE Coremerce;

/****** Object:  Database [Coremerce]    Script Date: 3/2/2016 4:42:01 PM ******/
CREATE DATABASE Coremerce;

USE Coremerce;

/****** Object:  Table AddressBook    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE AddressBook(
	id Char(36) NOT NULL,
	customerid Char(36) NULL,
	company nvarchar(50) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	lastname nvarchar(50) NOT NULL,
	streetaddress nvarchar(65) NOT NULL,
	postalcode nvarchar(10) NOT NULL,
	city nvarchar(50) NOT NULL,
	state nvarchar(50) NOT NULL,
	countryid Char(36) NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Cart    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Cart(
	id Char(36) NOT NULL,
	customerid Char(36) NULL,
	productid Char(36) NULL,
	qty int NOT NULL,
	finalprice decimal(10, 2) NOT NULL,
	addedon datetime(3) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table CartAttributes    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE CartAttributes(
	id Char(36) NOT NULL,
	customerid Char(36) NULL,
	productid Char(36) NULL,
	productoptionid Char(36) NULL,
	productoptionvalueid Char(36) NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Categories    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Categories(
	id Char(36) NOT NULL,
	name nvarchar(50) NOT NULL,
	image nvarchar(50) NOT NULL,
	parentcatid Char(36) NULL,
	`order` int NOT NULL,
	addedon datetime(3) NOT NULL,
	modifiedon datetime(3) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Configuration    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Configuration(
	id Char(36) NOT NULL,
	title nvarchar(65) NOT NULL,
	`key` nvarchar(65) NOT NULL,
	value nvarchar(255) NOT NULL,
	description nvarchar(255) NOT NULL,
	configurationgroupid Char(36) NULL,
	`order` int NOT NULL,
	modifiedOn datetime(3) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table ConfigurationGroup    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE ConfigurationGroup(
	id Char(36) NOT NULL,
	title nvarchar(65) NOT NULL,
	description nvarchar(255) NOT NULL,
	`order` int NOT NULL,
	active Tinyint NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Countries    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Countries(
	id Char(36) NOT NULL,
	name nvarchar(65) NOT NULL,
	ISOCode nvarchar(5) NOT NULL,
	Currencyid Char(36) NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Currencies    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Currencies(
	id Char(36) NOT NULL,
	title nvarchar(50) NOT NULL,
	code nchar(5) NOT NULL,
	symboleleft nvarchar(15) NULL,
	symbolright nvarchar(15) NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table CustomerInfo    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE CustomerInfo(
	id Char(36) NOT NULL,
	customerid Char(36) NULL,
	lastlogon datetime(3) NOT NULL,
	logoncount int NOT NULL,
	accountcreatedon datetime(3) NOT NULL,
	lastmodifiedon datetime(3) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Customers    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

/* SET ANSI_PADDING ON */

CREATE TABLE Customers(
	id Char(36) NOT NULL,
	gender char(1) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	lastname nvarchar(50) NOT NULL,
	dob datetime(3) NOT NULL,
	email nvarchar(110) NOT NULL,
	mainaddressid Char(36) NULL,
	telephone nvarchar(50) NOT NULL,
	fax nvarchar(50) NOT NULL,
	password nvarchar(50) NOT NULL,
	newsletteropted Tinyint NOT NULL,
  PRIMARY KEY (id)
);

/* SET ANSI_PADDING OFF */

/****** Object:  Table Manufacturers    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Manufacturers(
	id Char(36) NOT NULL,
	name nvarchar(50) NOT NULL,
	image nvarchar(65) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table ManufacturersInfo    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE ManufacturersInfo(
	id Char(36) NOT NULL,
	manufacturerid Char(36) NULL,
	url nvarchar(255) NOT NULL,
	addedon datetime(3) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table OrderProductAttributes    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

/* SET ANSI_PADDING ON */

CREATE TABLE OrderProductAttributes(
	id Char(36) NOT NULL,
	orderid Char(36) NULL,
	orderproductid Char(36) NULL,
	productoptions nvarchar(50) NOT NULL,
	productoptiobvalue nvarchar(50) NOT NULL,
	optionvalueprice decimal(10, 2) NOT NULL,
	price_prefix char(1) NOT NULL,
  PRIMARY KEY (id)
);

/* SET ANSI_PADDING OFF */

/****** Object:  Table Orders    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Orders(
	id Char(36) NOT NULL,
	customerid Char(36) NULL,
	customername nvarchar(65) NOT NULL,
	customerStreetaddress nvarchar(65) NOT NULL,
	customercity nvarchar(50) NOT NULL,
	customerstate nvarchar(50) NOT NULL,
	customerpostalcode nvarchar(50) NOT NULL,
	customercountry nvarchar(50) NOT NULL,
	customertelephone nvarchar(50) NOT NULL,
	customeremail nvarchar(110) NOT NULL,
	deliveryname nvarchar(65) NOT NULL,
	deliverystreetaddress nvarchar(65) NOT NULL,
	deliverycity nvarchar(50) NOT NULL,
	deliverystate nvarchar(50) NOT NULL,
	deliverypostalcode nvarchar(50) NOT NULL,
	deliverycountry nvarchar(50) NOT NULL,
	paymentmethodid Char(36) NULL,
	latsmodified datetime(3) NOT NULL,
	datepurcahsed datetime(3) NOT NULL,
	shippingcost decimal(10, 2) NULL,
	shipingmethodid Char(36) NULL,
	orderstatus nvarchar(10) NOT NULL,
	orderdatefinished datetime(3) NOT NULL,
	comments Longtext NULL,
	currency nvarchar(5) NOT NULL,
	currency_value decimal(16, 6) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table OrdersProducts    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE OrdersProducts(
	id Char(36) NOT NULL,
	orderid Char(36) NULL,
	productid Char(36) NOT NULL,
	productname nvarchar(65) NOT NULL,
	productprice decimal(10, 2) NOT NULL,
	finalprice decimal(10, 2) NOT NULL,
	productstax decimal(9, 4) NOT NULL,
	productqty int NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table OrdersStatus    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE OrdersStatus(
	id Char(36) NOT NULL,
	name nvarchar(50) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Products    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Products(
	id Char(36) NOT NULL,
	qty int NOT NULL,
	model nvarchar(50) NOT NULL,
	image nvarchar(65) NOT NULL,
	price decimal(10, 2) NOT NULL,
	addedon datetime(3) NOT NULL,
	modifiedon datetime(3) NOT NULL,
	weight decimal(7, 2) NOT NULL,
	status tinyint Unsigned NOT NULL,
	manufactureId Char(36) NULL,
	taxclassid Char(36) NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table ProductsAttributes    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

/* SET ANSI_PADDING ON */

CREATE TABLE ProductsAttributes(
	id Char(36) NOT NULL,
	productsid Char(36) NULL,
	optionsid Char(36) NULL,
	optionvaluesid Char(36) NULL,
	price decimal(10, 2) NOT NULL,
	price_prefix char(1) NOT NULL,
  PRIMARY KEY (id)
);

/* SET ANSI_PADDING OFF */

/****** Object:  Table productsdetail    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE productsdetail(
	id Char(36) NOT NULL,
	productid Char(36) NULL,
	name nvarchar(65) NOT NULL,
	description Longtext NOT NULL,
	url nvarchar(255) NOT NULL,
	views int NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table ProductsOptions    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE ProductsOptions(
	id Char(36) NOT NULL,
	name nvarchar(50) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table ProductsOptionsValues    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE ProductsOptionsValues(
	id Char(36) NOT NULL,
	name nvarchar(65) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table ProductsOptionsValuesMappings    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE ProductsOptionsValuesMappings(
	id Char(36) NOT NULL,
	optionsid Char(36) NULL,
	valuesid Char(36) NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table Reviews    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE Reviews(
	id Char(36) NOT NULL,
	productid Char(36) NULL,
	customerid Char(36) NULL,
	customername nvarchar(65) NOT NULL,
	rating int NOT NULL,
	addedon datetime(3) NOT NULL,
	modifiedon datetime(3) NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table ReviewsDetail    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE ReviewsDetail(
	id Char(36) NOT NULL,
	reviewid Char(36) NULL,
	text Longtext NOT NULL,
  PRIMARY KEY (id)
);

/****** Object:  Table WhoIsOnline    Script Date: 3/2/2016 4:42:01 PM ******/
/* SET ANSI_NULLS ON */

/* SET QUOTED_IDENTIFIER ON */

CREATE TABLE WhoIsOnline(
	id Char(36) NOT NULL,
	fullname nvarchar(65) NOT NULL,
	sessionid nvarchar(255) NOT NULL,
	ipaddress nvarchar(18) NOT NULL,
	timeentry datetime(3) NOT NULL,
	lastpageurl nvarchar(65) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE AddressBook ADD CONSTRAINT FK_AddressBook_Customers FOREIGN KEY(customerid) REFERENCES Customers (id);
ALTER TABLE Cart ADD  CONSTRAINT FK_Cart_Customers FOREIGN KEY(customerid) REFERENCES Customers (id);
ALTER TABLE Cart ADD  CONSTRAINT FK_Cart_Products FOREIGN KEY(productid) REFERENCES Products (id);
ALTER TABLE CartAttributes ADD  CONSTRAINT FK_CartAttributes_Customers FOREIGN KEY(customerid) REFERENCES Customers (id);
ALTER TABLE CartAttributes ADD  CONSTRAINT FK_CartAttributes_Products FOREIGN KEY(productid) REFERENCES Products (id);
ALTER TABLE CartAttributes ADD  CONSTRAINT FK_CartAttributes_ProductsOptions FOREIGN KEY(productoptionid) REFERENCES ProductsOptions (id);
ALTER TABLE CartAttributes ADD  CONSTRAINT FK_CartAttributes_ProductsOptionsValues FOREIGN KEY(productoptionvalueid) REFERENCES ProductsOptionsValues (id);
ALTER TABLE Configuration ADD  CONSTRAINT FK_Configuration_ConfigurationGroup FOREIGN KEY(configurationgroupid) REFERENCES ConfigurationGroup (id);
ALTER TABLE Countries ADD  CONSTRAINT FK_Countries_Currencies FOREIGN KEY(Currencyid) REFERENCES Currencies (id);
ALTER TABLE CustomerInfo ADD  CONSTRAINT FK_CustomerInfo_Customers FOREIGN KEY(customerid) REFERENCES Customers (id);
ALTER TABLE ManufacturersInfo ADD  CONSTRAINT FK_ManufacturersInfo_Manufacturers FOREIGN KEY(manufacturerid) REFERENCES Manufacturers (id);
ALTER TABLE OrderProductAttributes ADD  CONSTRAINT FK_OrderProductAttributes_OrderProductAttributes FOREIGN KEY(orderproductid) REFERENCES OrdersProducts (id);
ALTER TABLE OrderProductAttributes ADD  CONSTRAINT FK_OrderProductAttributes_Orders FOREIGN KEY(orderid) REFERENCES Orders (id);
ALTER TABLE Orders ADD  CONSTRAINT FK_Orders_Customers FOREIGN KEY(customerid) REFERENCES Customers (id);
ALTER TABLE OrdersProducts ADD  CONSTRAINT FK_OrdersProducts_Orders FOREIGN KEY(orderid) REFERENCES Orders (id);
ALTER TABLE OrdersProducts ADD  CONSTRAINT FK_OrdersProducts_Products FOREIGN KEY(productid) REFERENCES Products (id);
ALTER TABLE ProductsAttributes ADD  CONSTRAINT FK_ProductsAttributes_Products FOREIGN KEY(productsid) REFERENCES Products (id);
ALTER TABLE ProductsAttributes ADD  CONSTRAINT FK_ProductsAttributes_ProductsOptions FOREIGN KEY(optionsid) REFERENCES ProductsOptions (id);
ALTER TABLE ProductsAttributes ADD  CONSTRAINT FK_ProductsAttributes_ProductsOptionsValues FOREIGN KEY(optionvaluesid) REFERENCES ProductsOptionsValues (id);
ALTER TABLE productsdetail ADD  CONSTRAINT FK_productsdetail_Products FOREIGN KEY(productid) REFERENCES Products (id);
ALTER TABLE ProductsOptionsValuesMappings ADD  CONSTRAINT FK_ProductsOptionsValuesMappings_productsdetail FOREIGN KEY(optionsid) REFERENCES ProductsOptions (id);
ALTER TABLE ProductsOptionsValuesMappings ADD  CONSTRAINT FK_ProductsOptionsValuesMappings_ProductsOptionsValues FOREIGN KEY(valuesid) REFERENCES ProductsOptionsValues (id);
ALTER TABLE Reviews ADD  CONSTRAINT FK_Reviews_Products FOREIGN KEY(productid) REFERENCES Products (id);
ALTER TABLE ReviewsDetail ADD  CONSTRAINT FK_ReviewsDetail_Reviews FOREIGN KEY(reviewid) REFERENCES Reviews (id);
