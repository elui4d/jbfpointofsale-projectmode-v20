//%attributes = {}
ALL RECORDS:C47([Consignors:1])
DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; aConsignorNumber)



ALL RECORDS:C47([Sales:2])
CREATE SET:C116([Sales:2]; "AllSales")

QUERY WITH ARRAY:C644([Sales:2]Consignor Number:6; aConsignorNumber)

CREATE SET:C116([Sales:2]; "SalesWithNumber")

DIFFERENCE:C122("AllSales"; "SalesWithNumber"; "SalesWithNoNumber")

USE SET:C118("SalesWithNoNumber")

CLEAR SET:C117("SalesWithNoNumber")
CLEAR SET:C117("SalesWithNumber")
CLEAR SET:C117("AllSales")