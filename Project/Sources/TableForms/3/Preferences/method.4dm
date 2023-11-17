Case of 
		
		
	: (Form event code:C388=On Load:K2:1)
		
		vCCPathLabel:=""
		vCCLoginLabel:=""
		vCCPasswordLabel:=""
		
		
		Case of 
			: ([Preferences:3]Tax Prompt:6=True:C214)
				cbTaxPrompt:=1
			Else 
				cbTaxPrompt:=0
		End case 
		
		Case of 
			: ([Preferences:3]PrintDialog:10=True:C214)
				cbPrintDialog:=1
			Else 
				cbPrintDialog:=0
		End case 
		
		If ([Preferences:3]ccLicense:29="ABC123")
			
			Case of 
				: ([Preferences:3]Transax_Enabled:28=True:C214)
					cbTransax_Enabled:=1
					vCCPathLabel:="Transax KEY"
					vCCLoginLabel:="Username"
					vCCPasswordLabel:="Password"
				Else 
					cbTransax_Enabled:=0
			End case 
		Else 
			cbTransaxEnabled:=0
			vCCPathLabel:="ePNJPOSPath"
			vCCLoginLabel:="Clerk"
			vCCPasswordLabel:="Password"
			
		End if 
		
		Case of 
			: ([Preferences:3]ePNJPOS_Enabled:20=True:C214)
				cbPNJPOS_Enabled:=1
				vCCPathLabel:="ePNJPOSPath"
				vCCLoginLabel:="Clerk"
				vCCPasswordLabel:="Password"
			Else 
				cbPNJPOS_Enabled:=0
		End case 
		
		Case of 
			: ([Preferences:3]NEW_ePNJPOS_Enabled:26=True:C214)
				cbNEW_ePNJPOS_Enabled:=1
			Else 
				cbNEW_ePNJPOS_Enabled:=0
		End case 
		
		Case of 
			: ([Preferences:3]VerifyInventory:24=True:C214)
				cbVerifyInventory:=1
			Else 
				cbVerifyInventory:=0
		End case 
		
		Case of 
			: ([Preferences:3]VerifyTag:27=True:C214)
				cbVerifyTag:=1
			Else 
				cbVerifyTag:=0
		End case 
		
		Case of 
			: ([Preferences:3]AutoUploadSales:25=True:C214)
				cbAutoUploadSales:=1
			Else 
				cbAutoUploadSales:=0
		End case 
		
End case 