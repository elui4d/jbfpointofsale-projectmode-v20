Case of 
	: (Form event code:C388=On Load:K2:1)
		ORDER BY:C49([Sales:2]; [Sales:2]Entered Date Stamp:7; <; [Sales:2]Entered Time Stamp:8; <)
		
	: (Form event code:C388=On Display Detail:K2:22)
		If ((Displayed line number:C897%2)=0)
			OBJECT SET RGB COLORS:C628(*; "RowBackground"; "Black"; "White")
		Else 
			OBJECT SET RGB COLORS:C628(*; "RowBackground"; "Black"; "#f6cee8")
		End if 
		
End case 

//OutputMethod
