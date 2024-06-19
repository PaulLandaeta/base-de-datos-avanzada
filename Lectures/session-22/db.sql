Table Products {
    ProductID int [pk, increment]
    ProductName varchar(100) [not null]
    CategoryID int [ref: > Categories.CategoryID]
    SubCategoryID int [ref: > SubCategories.SubCategoryID]
    BrandID int [ref: > Brands.BrandID]
    Price decimal(10, 2) [not null]
}

Table Categories {
    CategoryID int [pk, increment]
    CategoryName varchar(50) [not null]
}

Table SubCategories {
    SubCategoryID int [pk, increment]
    SubCategoryName varchar(50) [not null]
    CategoryID int [ref: > Categories.CategoryID]
}

Table Brands {
    BrandID int [pk, increment]
    BrandName varchar(50) [not null]
}

Table Customers {
    CustomerID int [pk, increment]
    FirstName varchar(50) [not null]
    LastName varchar(50) [not null]
    Gender varchar(10)
    DateOfBirth date
    Email varchar(100) [unique]
    PhoneNumber varchar(20)
    Address varchar(100)
    City varchar(50)
    State varchar(50)
    PostalCode varchar(10)
    Country varchar(50)
}

Table Stores {
    StoreID int [pk, increment]
    StoreName varchar(100) [not null]
    Location varchar(100)
    StoreManager varchar(100)
    OpeningDate date
    StoreType varchar(50)
}

Table Sales {
    SaleID int [pk, increment]
    SaleDate date [not null]
    ProductID int [ref: > Products.ProductID]
    StoreID int [ref: > Stores.StoreID]
    CustomerID int [ref: > Customers.CustomerID]
    Quantity int [not null]
    TotalAmount decimal(10, 2) [not null]
}
