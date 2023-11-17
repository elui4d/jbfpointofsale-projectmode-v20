
Case of 
	: ([Sales:2]AltTaxed:19="T")
		//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		//MessageBox (" ";"Do you want to remove the Tax on this item?";"YesNoBox";"red")
		
		//If (ok=1)
		[Sales:2]AltTaxAmount:20:=0
		[Sales:2]AltTaxed:19:=""
		SAVE RECORD:C53([Sales:2])
		//End if 
		
		
	: ([Sales:2]AltTaxed:19="")
		//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		//MessageBox (" ";"Do you want to charge Tax on this item?";"YesNoBox";"red")
		
		//If (ok=1)
		[Sales:2]AltTaxAmount:20:=Round:C94([Sales:2]Sold Price:2*vAltTaxRate2; 2)
		[Sales:2]AltTaxed:19:="T"
		SAVE RECORD:C53([Sales:2])
		//End if 
		
End case 

Sales_RecalculateTotals