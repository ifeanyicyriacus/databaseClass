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























