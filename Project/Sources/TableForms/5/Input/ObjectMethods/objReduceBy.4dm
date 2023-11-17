

Case of 
		
	: (Form event code:C388=On Getting Focus:K2:7)
		vReduceByTemp:=[Point of Sale:5]ReduceBy:8
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		If (Records in selection:C76([Sales:2])>1)
			
			BEEP:C151
			MessageBox(" "; "You can not modify this transaction because it already has sold items."; "OKBox"; "red")
			[Point of Sale:5]ReduceBy:8:=vReduceByTemp
			
		End if 
End case 