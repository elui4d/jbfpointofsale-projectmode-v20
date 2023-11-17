If (OK=1)
	
	If (vConsignorNumberFrom#"") & (vConsignorNumberFrom#" ") & (vConsignorNumberTo#"") & (vConsignorNumberTo#" ")
		
		
		
		QUERY:C277([Inventory:4]; [Inventory:4]Consignor Number:3=vConsignorNumberFrom)
		If (Records in selection:C76([Inventory:4])>0)
			APPLY TO SELECTION:C70([Inventory:4]; [Inventory:4]Consignor Number:3:=vConsignorNumberTo)
			SAVE RECORD:C53([Inventory:4])
		End if 
		
		QUERY:C277([Sales:2]; [Sales:2]Consignor Number:6=vConsignorNumberFrom)
		If (Records in selection:C76([Sales:2])>0)
			APPLY TO SELECTION:C70([Sales:2]; [Sales:2]Consignor Number:6:=vConsignorNumberTo)
			SAVE RECORD:C53([Sales:2])
		End if 
		
		QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=vConsignorNumberFrom)
		If (Records in selection:C76([Consignors:1])>0)
			APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Consignor Number:1:=vConsignorNumberTo)
			SAVE RECORD:C53([Consignors:1])
		End if 
		
		
		CLOSE WINDOW:C154
		
		UNLOAD RECORD:C212([Sales:2])
		UNLOAD RECORD:C212([Inventory:4])
		UNLOAD RECORD:C212([Consignors:1])
	End if   //open doc
	
End if 