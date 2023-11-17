//%attributes = {}

ALL RECORDS:C47([Sales:2])
QUERY:C277([Sales:2]; [Sales:2]Consignor Number:6="3159")

DISTINCT VALUES:C339([Sales:2]Item Number:13; aItemNumber)

QUERY WITH ARRAY:C644([Inventory:4]Barcode Item Number:1; aItemNumber)

CREATE SET:C116([Inventory:4]; "SoldSet")

QUERY:C277([Inventory:4]; [Inventory:4]Consignor Number:3="3159")

CREATE SET:C116([Inventory:4]; "ALLSet")

DIFFERENCE:C122("ALLSet"; "SoldSet"; "AllSet")

USE SET:C118("AllSet")