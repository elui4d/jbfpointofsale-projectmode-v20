
Case of 
	: ([Sales:2]Taxed:16="T")
		//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		
		//12/2009 removed message box for faster tax removal.
		//MessageBox (" ";"Do you want to remove the Tax on this item?";"YesNoBox";"red")
		
		//If (ok=1)
		[Sales:2]TaxAmount:17:=0
		[Sales:2]Taxed:16:=""
		SAVE RECORD:C53([Sales:2])
		//End if 
		
		
	: ([Sales:2]Taxed:16="")
		//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		//MessageBox (" ";"Do you want to charge Tax on this item?";"YesNoBox";"red")
		
		//If (ok=1)
		[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
		[Sales:2]Taxed:16:="T"
		SAVE RECORD:C53([Sales:2])
		//End if 
		
End case 

Sales_RecalculateTotals