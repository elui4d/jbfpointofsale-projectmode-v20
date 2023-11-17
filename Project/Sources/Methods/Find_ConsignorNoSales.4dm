//%attributes = {}
ARRAY TEXT:C222(aDups1; 0)

ALL RECORDS:C47([Consignors:1])
QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)  //added on 1/28/09
DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; aConsignor)


//v12 - Why was this set to loop by 2's
For ($i; 1; Size of array:C274(aConsignor))
	
	QUERY:C277([Sales:2]; [Sales:2]Consignor Number:6=aConsignor{$i})
	
	If (Records in selection:C76([Sales:2])<2)
		
		$vlElem:=Size of array:C274(aDups1)+1
		INSERT IN ARRAY:C227(aDups1; $vlElem)
		aDups1{$vlElem}:=aConsignor{$i}
		
	End if 
	
	
End for 

QUERY WITH ARRAY:C644([Consignors:1]Consignor Number:1; aDups1)
