//%attributes = {}
ALL RECORDS:C47([Point of Sale:5])
DISTINCT VALUES:C339([Point of Sale:5]Batch ID:1; aBatchID)



ALL RECORDS:C47([Sales:2])
CREATE SET:C116([Sales:2]; "AllSales")

QUERY WITH ARRAY:C644([Sales:2]Batch ID:12; aBatchID)

CREATE SET:C116([Sales:2]; "SalesWithNumber")

DIFFERENCE:C122("AllSales"; "SalesWithNumber"; "SalesWithNoNumber")

USE SET:C118("SalesWithNoNumber")

CLEAR SET:C117("SalesWithNoNumber")
CLEAR SET:C117("SalesWithNumber")
CLEAR SET:C117("AllSales")