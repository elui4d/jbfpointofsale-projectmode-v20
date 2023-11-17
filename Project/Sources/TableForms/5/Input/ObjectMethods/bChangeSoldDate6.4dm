

//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
MessageBox(""; "Are you sure you want to delete this item?"; "YesNoBox"; "red")
If (ok=1)
	
	
	
	DELETE RECORD:C58([Sales:2])
	REDRAW:C174([Sales:2])
	ALL RECORDS:C47([Sales:2])
	RELATE MANY:C262([Point of Sale:5]Batch ID:1)
	//vItemsInBatch:=Records in selection([Sales])
	DISTINCT VALUES:C339([Sales:2]Item Number:13; asItemsInBatch)
	//v12
	//messes up batch save
	//QUERY SELECTION([Sales];[Sales]Sold Price>0;*)
	//QUERY SELECTION([Sales]; & ;[Sales]Batch ID=[Point of Sale]Batch ID)
	SELECTION TO ARRAY:C260([Sales:2]Sold Price:2; asPrices)
	
	Repeat 
		$vlElem:=Find in array:C230(asPrices; 0)
		If ($vlElem>0)
			DELETE FROM ARRAY:C228(asPrices; $vlElem)
		End if 
	Until ($vlElem<0)
	
	vCountIt:=Size of array:C274(asPrices)
	
	
	Sales_RecalculateTotals
End if 

