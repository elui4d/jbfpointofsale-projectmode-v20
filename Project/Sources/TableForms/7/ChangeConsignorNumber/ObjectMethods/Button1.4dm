If (OK=1)
	
	If (vConsignorNumber#"") & (vConsignorNumber#" ")
		
		C_LONGINT:C283($i)
		C_TEXT:C284($Message)
		C_TIME:C306(gDocRef)
		C_TEXT:C284($Pathname; vFileType; vBar_ItemNumber; vBar_NoData; vBar_Price)
		gDocRef:=?00:00:00?
		
		
		MESSAGES OFF:C175
		//READ WRITE([Inventory])
		gCenterWind:=True:C214
		
		gDocRef:=Open document:C264($Pathname; "")
		
		If (OK=1)  //open doc?
			
			
			
			vWhileVar:=1
			While (vWhileVar=1)
				
				RECEIVE PACKET:C104(gDocRef; vBar_ItemNumber; Char:C90(13)+Char:C90(10))
				
				vWhileVar:=OK
				
				If (Num:C11(vBar_ItemNumber)>0)
					
					QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=Num:C11(vBar_ItemNumber))
					If (Records in selection:C76([Inventory:4])>0)
						APPLY TO SELECTION:C70([Inventory:4]; [Inventory:4]Consignor Number:3:=vConsignorNumber)
						SAVE RECORD:C53([Inventory:4])
					End if 
					
					QUERY:C277([Sales:2]; [Sales:2]Item Number:13=Num:C11(vBar_ItemNumber))
					If (Records in selection:C76([Sales:2])>0)
						APPLY TO SELECTION:C70([Sales:2]; [Sales:2]Consignor Number:6:=vConsignorNumber)
						SAVE RECORD:C53([Sales:2])
					End if 
					
				End if 
				
			End while 
			
			FLUSH CACHE:C297
			
			CLOSE DOCUMENT:C267(gDocRef)
			CLOSE WINDOW:C154
			
			UNLOAD RECORD:C212([Sales:2])
			UNLOAD RECORD:C212([Inventory:4])
		End if   //open doc
	End if 
End if 