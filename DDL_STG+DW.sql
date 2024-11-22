--IN_COUNTRY:
--IN_COUNTRY: Tabla de staging con la información de los países
IF OBJECT_ID(N'dbo.STG_COUNTRY', N'U') IS NOT NULL DROP TABLE dbo.STG_COUNTRY;
CREATE TABLE dbo.STG_COUNTRY(
	name nvarchar(100),
code nvarchar(10) not null
)

--IN_HICP:
--IN_HCIP: Tabla de staging con los datos relativos al indicador HICP
IF OBJECT_ID(N'dbo.STG_HICP', N'U') IS NOT NULL DROP TABLE dbo.STG_HICP;
CREATE TABLE dbo.STG_HICP(
	freq nvarchar(50)  not null,
unit nvarchar(100) not null,
	coicop varchar(50) not null,
	geo nvarchar(50) not null,
	period int not null,
	HICP numeric(12,2) null
)

--IN_PGAS:
--IN_PGAS: Tabla de staging con los datos relativos al precio del gas
IF OBJECT_ID(N'dbo.STG_PGAS', N'U') IS NOT NULL DROP TABLE dbo.STG_PGAS;
CREATE TABLE dbo.STG_PGAS(
	freq nvarchar(10) not null,
product int not null,
	consom int not null,
	unit nvarchar(10) not null,
	tax nvarchar(10) not null,
currency nvarchar(10) not null,
	geo nvarchar(10) not null,
period nvarchar(10) not null,
pgas numeric(12,4) null
)

--IN_PELEC:
--IN_PELEC: Tabla de staging con los datos relativos al precio de la electricidad
IF OBJECT_ID(N'dbo.STG_PELEC', N'U') IS NOT NULL DROP TABLE dbo.STG_PELEC;
CREATE TABLE dbo.STG_PELEC(
	freq nvarchar(10) not null,
product int not null,
	consom int not null,
	unit nvarchar(10) not null,
	tax nvarchar(10) not null,
currency nvarchar(10) not null,
	geo nvarchar(10) not null,
period nvarchar(10) not null,
pelec numeric(12,4) null
)

--IN_COICOP:
--IN_COICOP: Tabla de staging con información de finalidad de consumo
IF OBJECT_ID(N'dbo.STG_COICOP', N'U') IS NOT NULL DROP TABLE dbo.STG_COICOP;
CREATE TABLE dbo.STG_COICOP(
	code nvarchar(25) not null,
description nvarchar(300) null
)

--IN_CONSUMPTION:
--IN_CONSUMPTION: Tabla de staging con información de la franja de consumo de la energía
IF OBJECT_ID(N'dbo.STG_CONSUMPTION', N'U') IS NOT NULL DROP TABLE dbo.STG_CONSUMPTION;
CREATE TABLE dbo.STG_CONSUMPTION(
	code nvarchar(25) not null,
description nvarchar(250) null
)

--DIM_DATE

CREATE TABLE [dbo].[DIM_DATE](
	[pk_date] Int NOT NULL,
[Year] Int,
[Mo] Int,
[Quarter] Int,
 CONSTRAINT [PK_DIM_DATE] PRIMARY KEY CLUSTERED
(
	[pk_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
	
--DIM_DATE_SEMESTER

CREATE TABLE [dbo].[DIM_DATE_SEMESTER](
	[pk_date_semester] nvarchar(10) NOT NULL,
[Year] Int,
[Semester] nvarchar(5),
 CONSTRAINT [PK_DIM_DATE_SEMESTER] PRIMARY KEY CLUSTERED
(
	[pk_date_semester] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--DIM_COUNTRY

CREATE TABLE [dbo].[DIM_COUNTRY] (
[pk_country] int NOT NULL,
[code] nvarchar(10),
[country_name] nvarchar(100),
 CONSTRAINT [PK_DIM_COUNTRY] PRIMARY KEY CLUSTERED
(
	[pk_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--DIM_COICOP

CREATE TABLE [dbo].[DIM_COICOP](
	[pk_coicop] int NOT NULL,
	[code] nvarchar(25),
[coicop_name] nvarchar(300),
CONSTRAINT [PK_DIM_COICOP] PRIMARY KEY CLUSTERED
(
	[pk_coicop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--DIM_CURRENCY

CREATE TABLE [dbo].[DIM_CURRENCY](
	[pk_currency] int NOT NULL,
[currency_name] nvarchar(10),
 CONSTRAINT [PK_DIM_CURRENCY] PRIMARY KEY CLUSTERED
(
	[pk_currency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--DIM_TAX

CREATE TABLE [dbo].[DIM_TAX](
	[pk_tax] int NOT NULL,
[tax_name] nvarchar(50),
 CONSTRAINT [PK_DIM_TAX] PRIMARY KEY CLUSTERED
(
	[pk_tax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


--DIM_UNIT

CREATE TABLE [dbo].[DIM_UNIT](
	[pk_unit] int NOT NULL,
[unit_name] nvarchar(25),
 CONSTRAINT [PK_DIM_UNIT] PRIMARY KEY CLUSTERED
(
	[pk_unit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--DIM_PRODUCT
CREATE TABLE [dbo].[DIM_PRODUCT](
	[pk_product] int NOT NULL,
[product_code] int,
 CONSTRAINT [PK_DIM_PRODUCT] PRIMARY KEY CLUSTERED
(
	[pk_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--DIM_CONSUMTION

CREATE TABLE [dbo].[DIM_CONSUMPTION](
	[pk_consumption] int NOT NULL,
[code] nvarchar(25),
[consumption_name] nvarchar(250),
 CONSTRAINT [PK_DIM_CONSUMPTION] PRIMARY KEY CLUSTERED
(
	[pk_consumption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--FACT_EUROZONE_INDICATORS
CREATE TABLE [dbo].[FACT_EUROZONE_INDICATORS] (
	[pk_id] int NOT NULL,
[fk_date] int,
[fk_country] int,
[fk_coicop] int,
[HICP] numeric(12,2),
 CONSTRAINT [PK_FACT_EUROZONE_INDICATORS] PRIMARY KEY CLUSTERED
(
	[pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--FACT_ENERGY_PRICE
CREATE TABLE [dbo].[FACT_ENERGY_PRICE] (
	[pk_id] int NOT NULL,
[fk_date_semester] nvarchar(10),
[fk_country] int,
[fk_currency] int,
[fk_tax] int,
[fk_consumption] int,
[fk_unit] int,
[fk_product] int,
[price] numeric(12,4)
 CONSTRAINT [PK_FACT_ENERGY_PRICE] PRIMARY KEY CLUSTERED
(
	[pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Claves foráneas

ALTER TABLE FACT_EUROZONE_INDICATORS ADD FOREIGN KEY (fk_date) REFERENCES DIM_DATE(pk_date);
ALTER TABLE FACT_EUROZONE_INDICATORS ADD FOREIGN KEY (fk_country) REFERENCES DIM_COUNTRY(pk_country);
ALTER TABLE FACT_EUROZONE_INDICATORS ADD FOREIGN KEY (fk_coicop) REFERENCES DIM_COICOP(pk_coicop);
ALTER TABLE FACT_ENERGY_PRICE ADD FOREIGN KEY (fk_date_semester) REFERENCES DIM_DATE_SEMESTER(pk_date_semester);
ALTER TABLE FACT_ENERGY_PRICE ADD FOREIGN KEY (fk_country) REFERENCES DIM_COUNTRY(pk_country);
ALTER TABLE FACT_ENERGY_PRICE ADD FOREIGN KEY (fk_currency) REFERENCES DIM_CURRENCY(pk_currency);
ALTER TABLE FACT_ENERGY_PRICE ADD FOREIGN KEY (fk_tax) REFERENCES DIM_TAX(pk_tax);
ALTER TABLE FACT_ENERGY_PRICE ADD FOREIGN KEY (fk_consumption) REFERENCES DIM_CONSUMPTION(pk_consumption);
ALTER TABLE FACT_ENERGY_PRICE ADD FOREIGN KEY (fk_unit) REFERENCES DIM_UNIT(pk_unit);
ALTER TABLE FACT_ENERGY_PRICE ADD FOREIGN KEY (fk_product) REFERENCES DIM_PRODUCT(pk_product);

