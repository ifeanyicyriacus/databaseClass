-- A
use mdc_ch02;

SELECT * FROM mdc_ch02.CUSTOMER;
SELECT * FROM mdc_ch02.INVOICE;
SELECT * FROM mdc_ch02.INVOICE_ITEM;

-- B
SELECT LastName, FirstName, Phone From mdc_ch02.CUSTOMER;

-- C 
Select LastName, FirstName, Phone from mdc_ch02.CUSTOMER
where FirstName = "Nikki";

-- D
Select LastName, FirstName, Phone, DateIn, DateOut from mdc_ch02.CUSTOMER, mdc_ch02.INVOICE
where mdc_ch02.INVOICE.TotalAmount > 100;

-- E
select LastName, FirstName, Phone from mdc_ch02.CUSTOMER
where mdc_ch02.CUSTOMER.FirstName like 'B%';

-- F
select LastName, FirstName, Phone from mdc_ch02.CUSTOMER
where LastName like "%cat%";

-- G
select LastName, FirstName, Phone from mdc_ch02.CUSTOMER
where Phone like "_23%";

-- H
select max(TotalAmount) as Max, min(TotalAmount) as Min from mdc_ch02.INVOICE;

-- I
select avg(TotalAmount) as Aversge from mdc_ch02.INVOICE;

-- J
select count(*) from mdc_ch02.CUSTOMER;

-- K
select LastName, FirstName from mdc_ch02.CUSTOMER
group by LastName, FirstName;

-- L
select LastName, FirstName, count(*) from mdc_ch02.CUSTOMER
group by LastName, FirstName;

-- M
select LastName, FirstName, Phone from mdc_ch02.CUSTOMER
where CUSTOMER.CustomerID in (
	select INVOICE.CustomerID from INVOICE
    where INVOICE.TotalAmount > 100.00
)
order by LastName asc, FirstName desc;


-- N
select LastName, FirstName, Phone from mdc_ch02.CUSTOMER join mdc_ch02.INVOICE
where mdc_ch02.CUSTOMER.CustomerID = mdc_ch02.INVOICE.CustomerID
and mdc_ch02.INVOICE.TotalAmount > 100.00
order by LastName asc, FirstName desc;

-- O
select LastName, FirstName, Phone from mdc_ch02.CUSTOMER join mdc_ch02.INVOICE
on mdc_ch02.CUSTOMER.CustomerID = mdc_ch02.INVOICE.CustomerID
where mdc_ch02.INVOICE.TotalAmount > 100.00
order by LastName asc, FirstName desc;

-- P
select LastName, FirstName, Phone from CUSTOMER
where CUSTOMER.CustomerID in (
	select INVOICE.CustomerID from INVOICE
    where INVOICE.InvoiceNumber in (
		select INVOICE_ITEM.InvoiceNumber from INVOICE_ITEM
        where Item = "Dress Shirt"
    )
) order by LastName asc, Firstname desc;

-- Q
select LastName, FirstName, Phone from CUSTOMER join INVOICE join INVOICE_ITEM
where CUSTOMER.CustomerID = INVOICE.CustomerID 
and INVOICE.InvoiceNumber = INVOICE_ITEM.InvoiceNumber
and INVOICE_ITEM.item = "Dress Shirt"
order by LastName asc, Firstname desc;

-- R
select LastName, FirstName, Phone from CUSTOMER join INVOICE join INVOICE_ITEM
on CUSTOMER.CustomerID = INVOICE.CustomerID 
and INVOICE.InvoiceNumber = INVOICE_ITEM.InvoiceNumber
where INVOICE_ITEM.item = "Dress Shirt"
order by LastName asc, Firstname desc;


-- S
select 	LastName as CustomerLastName, FirstName as CustomerFirstName, 
		ReferredByLastName, ReferredByFirstName from CUSTOMER
        









