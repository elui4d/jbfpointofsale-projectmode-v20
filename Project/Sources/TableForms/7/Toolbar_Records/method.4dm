
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		Case of 
			: (<>TablePointer=(->[Sales:2]))
				OBJECT SET ENABLED:C1123(bNew; False:C215)
			: (<>TablePointer=(->[Inventory:4]))
				OBJECT SET ENABLED:C1123(bNew; False:C215)
			Else 
				OBJECT SET ENABLED:C1123(bNew; True:C214)
		End case 
		
		
		QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
		If (Records in selection:C76([Preferences:3])>0)
			vEntryMode:=[Preferences:3]EntryMode:7
		End if 
		UNLOAD RECORD:C212([Preferences:3])
		
		If (vEntryMode="POS Mode")
			OBJECT SET ENABLED:C1123(bDelete; False:C215)
			
		End if 
		
End case 