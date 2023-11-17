
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		Case of 
			: (<>TablePointer=(->[Consignors:1]))
				OBJECT SET ENABLED:C1123(bExportECheck; True:C214)
			Else 
				OBJECT SET ENABLED:C1123(bExportECheck; False:C215)
		End case 
		
		
		
		
		QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
		If (Records in selection:C76([Preferences:3])>0)
			vEntryMode:=[Preferences:3]EntryMode:7
		End if 
		UNLOAD RECORD:C212([Preferences:3])
		
		If (vEntryMode="POS Mode")
			OBJECT SET ENABLED:C1123(bImport; False:C215)
			OBJECT SET ENABLED:C1123(bExport; False:C215)
			OBJECT SET ENABLED:C1123(bUploadSold; False:C215)
			OBJECT SET ENABLED:C1123(bWizard; False:C215)
			OBJECT SET ENABLED:C1123(bOther; False:C215)
			OBJECT SET ENABLED:C1123(bExportEditor; False:C215)
			OBJECT SET ENABLED:C1123(bApply; False:C215)
			OBJECT SET ENABLED:C1123(bBreakdown; False:C215)
			OBJECT SET ENABLED:C1123(bExportECheck; False:C215)
		End if 
		
		
		
		
End case 