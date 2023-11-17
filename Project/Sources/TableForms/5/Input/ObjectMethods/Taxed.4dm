Case of 
	: ([Point of Sale:5]Taxed:16=True:C214)
		//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		MessageBox(" "; "Do you want to charge Tax on all of the items in this transaction?"; "YesNoBox"; "red")
		
		If (ok=1)
			
			APPLY TO SELECTION:C70([Sales:2]; [Sales:2]Taxed:16:="T")
			
			FIRST RECORD:C50([Sales:2])
			For ($i; 1; Records in selection:C76([Sales:2]))
				[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
				
				SAVE RECORD:C53([Sales:2])
				NEXT RECORD:C51([Sales:2])
			End for 
			
			Sales_RecalculateTotals
		Else 
			[Point of Sale:5]Taxed:16:=False:C215
		End if 
		
	: ([Point of Sale:5]Taxed:16=False:C215)
		//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		MessageBox(" "; "Do you want to remove the Tax on all of the items in this transaction?"; "YesNoBox"; "red")
		
		If (ok=1)
			APPLY TO SELECTION:C70([Sales:2]; [Sales:2]Taxed:16:="")
			APPLY TO SELECTION:C70([Sales:2]; [Sales:2]TaxAmount:17:=0)
			
			Sales_RecalculateTotals
			
		Else 
			[Point of Sale:5]Taxed:16:=True:C214
		End if 
End case 
