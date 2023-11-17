//%attributes = {}


//Load consignor numbers with sales
ALL RECORDS:C47([Sales:2])
DISTINCT VALUES:C339([Sales:2]Consignor Number:6; aConsignors)

//Query inventory of all participating consignors
ALL RECORDS:C47([Inventory:4])
QUERY WITH ARRAY:C644([Inventory:4]Consignor Number:3; aConsignors)

//Find sold inventory
//Added to query only items less than $1000 so one big item doesn't inflate the numbers. 3/10/17
QUERY SELECTION:C341([Inventory:4]; [Inventory:4]Donate:9=True:C214; *)
QUERY SELECTION:C341([Inventory:4];  & ; [Inventory:4]Created Date:10>=vCal_Date1; *)
QUERY SELECTION:C341([Inventory:4];  & ; [Inventory:4]Price:6<1000)

ARRAY LONGINT:C221(aInventory; 0)
DISTINCT VALUES:C339([Inventory:4]Barcode Item Number:1; aItemNumber)
For ($i; 1; Size of array:C274(aItemNumber))
	
	QUERY:C277([Sales:2]; [Sales:2]Item Number:13=aItemNumber{$i})
	If (Records in selection:C76([Sales:2])=0)
		
		$vlElem:=Size of array:C274(aInventory)+1
		INSERT IN ARRAY:C227(aInventory; $vlElem)
		aInventory{$vlElem}:=aItemNumber{$i}
		
	End if 
	
End for 

QUERY WITH ARRAY:C644([Inventory:4]Barcode Item Number:1; aInventory)


DISTINCT VALUES:C339([Inventory:4]Consignor Number:3; aDonateConsignors)
vNumberofConsignors:=Size of array:C274(aDonateConsignors)
vTotalItemsDonated:=String:C10(Records in selection:C76([Inventory:4]))
vPriceofDonated:=Sum:C1([Inventory:4]Price:6)