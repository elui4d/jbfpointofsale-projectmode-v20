Case of 
	: (Form event code:C388=On Load:K2:1)
		SET WINDOW TITLE:C213(WindowTitle)
		
	: (Form event code:C388=On Display Detail:K2:22)
		If ((Displayed line number:C897%2)=0)
			OBJECT SET RGB COLORS:C628(*; "RowBackground"; "Black"; "White")
		Else 
			OBJECT SET RGB COLORS:C628(*; "RowBackground"; "Black"; "#f6cee8")
		End if 
		
		QUERY:C277([Sales:2]; [Sales:2]Item Number:13=[Inventory:4]Barcode Item Number:1)
		If (Records in selection:C76([Sales:2])>0)
			vInventorySold:=1
		Else 
			vInventorySold:=0
		End if 
		
End case 

//OutputMethod