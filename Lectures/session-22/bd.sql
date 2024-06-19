Table SalesFact {
    SaleID int [pk, increment]
    TimeID int [ref: > TimeDim.TimeID]
    ProductID int [ref: > ProductDim.ProductID]
    StoreID int [ref: > StoreDim.StoreID]
    CustomerID int [ref: > CustomerDim.CustomerID]
    QuantitySold int [not null]
    SalesAmount decimal(10, 2) [not null]
}

Table TimeDim {
    TimeID int [pk, increment]
    Date date
    Day int
    Month int
    Quarter varchar(2)
    Year int
    DayOfWeek varchar(10)
    HolidayFlag boolean
}

Table ProductDim {
    ProductID int [pk, increment]
    ProductName varchar(100)
    Category varchar(50)
    SubCategory varchar(50)
    Brand varchar(50)
    Price decimal(10, 2)
}

Table StoreDim {
    StoreID int [pk, increment]
    StoreName varchar(100)
    Location varchar(100)
    StoreManager varchar(100)
    OpeningDate date
    StoreType varchar(50)
}

Table CustomerDim {
    CustomerID int [pk, increment]
    FirstName varchar(50)
    LastName varchar(50)
    Gender varchar(10)
    DateOfBirth date
    Email varchar(100) [unique]
    PhoneNumber varchar(20)
    Address varchar(100)
    City varchar(50)
    State varchar(50)
    PostalCode varchar(10)
    Country varchar(50)
    LoyaltyProgramID int
}
