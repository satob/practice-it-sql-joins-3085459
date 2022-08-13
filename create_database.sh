sqlite3 AdventureWorks.db

CREATE TABLE [DimCurrency](
	[CurrencyKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[CurrencyAlternateKey] [nchar](3) NOT NULL,
	[CurrencyName] [nvarchar](50) NOT NULL
);

CREATE TABLE [DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[GeographyKey] [int] NULL,
	[CustomerAlternateKey] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NameStyle] [bit] NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Suffix] [nvarchar](10) NULL,
	[Gender] [nvarchar](1) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[YearlyIncome] [money] NULL,
	[TotalChildren] [tinyint] NULL,
	[NumberChildrenAtHome] [tinyint] NULL,
	[EnglishEducation] [nvarchar](40) NULL,
	[SpanishEducation] [nvarchar](40) NULL,
	[FrenchEducation] [nvarchar](40) NULL,
	[EnglishOccupation] [nvarchar](100) NULL,
	[SpanishOccupation] [nvarchar](100) NULL,
	[FrenchOccupation] [nvarchar](100) NULL,
	[HouseOwnerFlag] [nchar](1) NULL,
	[NumberCarsOwned] [tinyint] NULL,
	[AddressLine1] [nvarchar](120) NULL,
	[AddressLine2] [nvarchar](120) NULL,
	[Phone] [nvarchar](20) NULL,
	[DateFirstPurchase] [date] NULL,
	[CommuteDistance] [nvarchar](15) NULL,
	FOREIGN KEY (GeographyKey) REFERENCES DimGeography(GeographyKey)
);

CREATE TABLE [DimDate](
	[DateKey] [int] NOT NULL PRIMARY KEY,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[EnglishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[SpanishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[FrenchDayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[EnglishMonthName] [nvarchar](10) NOT NULL,
	[SpanishMonthName] [nvarchar](10) NOT NULL,
	[FrenchMonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL
);

CREATE TABLE [DimDepartmentGroup](
	[DepartmentGroupKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ParentDepartmentGroupKey] [int] NULL,
	[DepartmentGroupName] [nvarchar](50) NULL
);

CREATE TABLE [DimSalesTerritory](
	[SalesTerritoryKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[SalesTerritoryAlternateKey] [int] NULL,
	[SalesTerritoryRegion] [nvarchar](50) NOT NULL,
	[SalesTerritoryCountry] [nvarchar](50) NOT NULL,
	[SalesTerritoryGroup] [nvarchar](50) NULL,
	[SalesTerritoryImage] [varbinary](255) NULL
);

CREATE TABLE [DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ParentEmployeeKey] [int] NULL,
	[EmployeeNationalIDAlternateKey] [nvarchar](15) NULL,
	[ParentEmployeeNationalIDAlternateKey] [nvarchar](15) NULL,
	[SalesTerritoryKey] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[NameStyle] [bit] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [date] NULL,
	[BirthDate] [date] NULL,
	[LoginID] [nvarchar](256) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Phone] [nvarchar](25) NULL,
	[MaritalStatus] [nchar](1) NULL,
	[EmergencyContactName] [nvarchar](50) NULL,
	[EmergencyContactPhone] [nvarchar](25) NULL,
	[SalariedFlag] [bit] NULL,
	[Gender] [nchar](1) NULL,
	[PayFrequency] [tinyint] NULL,
	[BaseRate] [money] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SalesPersonFlag] [bit] NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[EmployeePhoto] [varbinary] NULL,
	FOREIGN KEY (SalesTerritoryKey) REFERENCES DimSalesTerritory(SalesTerritoryKey)
);

CREATE TABLE [DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[EnglishCountryRegionName] [nvarchar](50) NULL,
	[SpanishCountryRegionName] [nvarchar](50) NULL,
	[FrenchCountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[SalesTerritoryKey] [int] NULL,
	[IpAddressLocator] [nvarchar](15) NULL,
	FOREIGN KEY (SalesTerritoryKey) REFERENCES DimSalesTerritory(SalesTerritoryKey)
);

CREATE TABLE [DimOrganization](
	[OrganizationKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ParentOrganizationKey] [int] NULL,
	[PercentageOfOwnership] [nvarchar](16) NULL,
	[OrganizationName] [nvarchar](50) NULL,
	[CurrencyKey] [int] NULL,
	FOREIGN KEY (CurrencyKey) REFERENCES DimCurrency(CurrencyKey)
);

CREATE TABLE [DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProductCategoryAlternateKey] [int] NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductCategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductCategoryName] [nvarchar](50) NOT NULL
);

CREATE TABLE [DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProductSubcategoryAlternateKey] [int] NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryKey] [int] NULL,
	FOREIGN KEY (ProductCategoryKey) REFERENCES DimProductCategory(ProductCategoryKey)
);

CREATE TABLE [DimProduct](
	[ProductKey] [int] IDENTITY(1,1) PRIMARY KEY,
	[ProductAlternateKey] [nvarchar](25) NULL,
	[ProductSubcategoryKey] [int] NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[EnglishProductName] [nvarchar](50) NOT NULL,
	[SpanishProductName] [nvarchar](50) NOT NULL,
	[FrenchProductName] [nvarchar](50) NOT NULL,
	[StandardCost] [money] NULL,
	[FinishedGoodsFlag] [bit] NOT NULL,
	[Color] [nvarchar](15) NOT NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](50) NULL,
	[SizeRange] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nchar](2) NULL,
	[DealerPrice] [money] NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ModelName] [nvarchar](50) NULL,
	[LargePhoto] [varbinary]  NULL,
	[EnglishDescription] [nvarchar](400) NULL,
	[FrenchDescription] [nvarchar](400) NULL,
	[ChineseDescription] [nvarchar](400) NULL,
	[ArabicDescription] [nvarchar](400) NULL,
	[HebrewDescription] [nvarchar](400) NULL,
	[ThaiDescription] [nvarchar](400) NULL,
	[GermanDescription] [nvarchar](400) NULL,
	[JapaneseDescription] [nvarchar](400) NULL,
	[TurkishDescription] [nvarchar](400) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](7) NULL,
	FOREIGN KEY (ProductSubCategoryKey) REFERENCES DimProductSubCategory(ProductSubCategoryKey)
);

CREATE TABLE [DimSalesReason](
	[SalesReasonKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[SalesReasonAlternateKey] [int] NOT NULL,
	[SalesReasonName] [nvarchar](50) NOT NULL,
	[SalesReasonReasonType] [nvarchar](50) NOT NULL
);

CREATE TABLE [FactCurrencyRate](
	[CurrencyKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[AverageRate] [float] NOT NULL,
	[EndOfDayRate] [float] NOT NULL,
	[Date] [datetime] NULL,
	PRIMARY KEY (CurrencyKey,DateKey),
	FOREIGN KEY(DateKey) REFERENCES DimDate(DateKey),
	FOREIGN KEY(CurrencyKey) REFERENCES DimCurrency(CurrencyKey)
);

CREATE TABLE [FactInternetSales](
	[ProductKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[DueDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[ExtendedAmount] [money] NOT NULL,
	[UnitPriceDiscountPct] [float] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[ProductStandardCost] [money] NOT NULL,
	[TotalProductCost] [money] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[CustomerPONumber] [nvarchar](25) NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	PRIMARY KEY(SalesOrderNumber,SalesOrderLineNumber),
	FOREIGN KEY(CurrencyKey) REFERENCES DimCurrency(CurrencyKey),
	FOREIGN KEY(CustomerKey) REFERENCES DimCustomer(CustomerKey),
	FOREIGN KEY(OrderDateKey) REFERENCES DimDate(DateKey),
	FOREIGN KEY(DueDateKey) REFERENCES DimDate(DateKey),
	FOREIGN KEY(ShipDateKey) REFERENCES DimDate(DateKey),
	--FOREIGN KEY(ProductKey) REFERENCES DimProduct(ProductKey)
	FOREIGN KEY(PromotionKey) REFERENCES DimPromotion(PromotionKey),
	FOREIGN KEY(SalesTerritoryKey) REFERENCES DimSalesTerritory(SalesTerritoryKey)
);

CREATE TABLE [FactInternetSalesReason](
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[SalesReasonKey] [int] NOT NULL,
	PRIMARY KEY (SalesOrderNumber,SalesOrderLineNumber,SalesReasonKey),
	FOREIGN KEY(SalesOrderNumber,SalesOrderLineNumber) REFERENCES FactInternetSales(SalesOrderNumber, SalesOrderLineNumber),
	FOREIGN KEY(SalesReasonKey) REFERENCES DimSalesReason(SalesReasonKey)
);


CREATE TABLE [FactSurveyResponse](
	[SurveyResponseKey] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[ProductCategoryKey] [int] NOT NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[ProductSubcategoryKey] [int] NOT NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[Date] [datetime] NULL,
	FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
	FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey)
	
);


.mode csv
.separator |
.import csv/DimCurrency.csv DimCurrency
.import csv/DimCustomer.csv DimCustomer
.import csv/DimDate.csv DimDate
.import csv/DimDepartmentGroup.csv DimDeparmtmentGroup
.import csv/DimEmployee.csv DimEmployee
.import csv/DimGeography.csv DimGeography
.import csv/DimOrganization.csv DimOrganization
.import csv/DimProduct.csv DimProduct
.import csv/DimProductCategory.csv DimProductCategory
.import csv/DimProductSubcatory.csv DimProductSubcategory
.import csv/DimPromotion.csv DimPromotion
.import csv/DimSalesReason.csv DimSalesReason
.import csv/DimSalesTerritory.csv DimsSalesTerritory
.import csv/FactCurrencyRate.csv FactCurrencyRate
.import csv/FactInternetSales.csv FactInternetSales
.import csv/FactInternetSalesReason.csv FactInternetSalesReason
.import csv/FactSurveyResponse.csv FactSurveyResponse
