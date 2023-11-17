


Case of 
	: (<>TablePointer=(->[Consignors:1]))
		ALL RECORDS:C47([Consignors:1])
		//removed for UCN
		ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Consignor Number:1); >)
		
	: (<>TablePointer=(->[Point of Sale:5]))
		ALL RECORDS:C47([Point of Sale:5])
		ORDER BY:C49([Point of Sale:5]; [Point of Sale:5]Entered Date Stamp:4; <; [Point of Sale:5]Entered Time Stamp:3; <)
		
		
	: (<>TablePointer=(->[Sales:2]))
		ALL RECORDS:C47([Sales:2])
		ORDER BY:C49([Sales:2]; [Sales:2]Entered Date Stamp:7; <; [Sales:2]Entered Time Stamp:8; <)
		
	Else 
		ALL RECORDS:C47(<>TablePointer->)
End case 

ACCEPT:C269