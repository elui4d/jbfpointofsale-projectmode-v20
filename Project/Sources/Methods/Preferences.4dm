//%attributes = {}

QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")

If (Records in selection:C76([Preferences:3])=0)
	CREATE RECORD:C68([Preferences:3])
	[Preferences:3]ID:1:="ME"
	SAVE RECORD:C53([Preferences:3])
End if 

If ([Preferences:3]ePNJPOS_Path:21="")
	[Preferences:3]ePNJPOS_Path:21:="c:\\eProcessingNetwork\\ePNJPOS\\jposcmd.exe"
End if 

If ([Preferences:3]FTPPath:30="")
	[Preferences:3]FTPPath:30:="173.192.120.227"
End if 

If ([Preferences:3]FTPPath:30="184.173.90.187")
	[Preferences:3]FTPPath:30:="173.192.120.227"
End if 


vConsignorFee:=[Preferences:3]DefaultConsignorFee:2
vConsignorPercent:=[Preferences:3]DefaultConsignorPercent:3
vTenDollar:=[Preferences:3]TenDollar:4
vTaxRate:=[Preferences:3]TaxRate:5
vAltTaxRate:=[Preferences:3]AltTaxRate:19
vEntryMode:=[Preferences:3]EntryMode:7
vReceiptNotes:=[Preferences:3]ReceiptNotes:8
vReceiptCopies:=[Preferences:3]ReceiptCopies:9
vReceiptType:=[Preferences:3]ReceiptType:11
vPayRate:=[Preferences:3]DefaultPayRate:12
vVolunteerFee:=[Preferences:3]DefaultVolunteerFee:13
vVolunteerPercent:=[Preferences:3]DefaultVolunteerPercent:14
vePNJPOS_Path:=[Preferences:3]ePNJPOS_Path:21
vePNJPOS_Clerk:=[Preferences:3]ePNJPOS_Clerk:22
vePNJPOS_Password:=[Preferences:3]ePNJPOS_Password:23
vCCLicense:=[Preferences:3]ccLicense:29
vFTPPath:=[Preferences:3]FTPPath:30
vCenterName:=[Preferences:3]CenterName:31
vTransaxAccountNumber:=[Preferences:3]Transax_AccountNumber:32

Case of 
	: ([Preferences:3]ePNJPOS_Enabled:20=True:C214)
		cbPNJPOS_Enabled:=1
		
	Else 
		cbPNJPOS_Enabled:=0
End case 

Case of 
	: ([Preferences:3]Transax_Enabled:28=True:C214)
		cbTransax_Enabled:=1
		
	Else 
		cbTransax_Enabled:=0
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

Open Centered window(810; 552; Movable dialog box:K34:7; " ")


DIALOG:C40([Preferences:3]; "Preferences")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

If (ok=1)
	[Preferences:3]DefaultConsignorFee:2:=vConsignorFee
	[Preferences:3]DefaultConsignorPercent:3:=vConsignorPercent
	[Preferences:3]TenDollar:4:=vTenDollar
	[Preferences:3]TaxRate:5:=vTaxRate
	[Preferences:3]AltTaxRate:19:=vAltTaxRate
	[Preferences:3]EntryMode:7:=vEntryMode
	[Preferences:3]ReceiptNotes:8:=vReceiptNotes
	[Preferences:3]ReceiptCopies:9:=vReceiptCopies
	[Preferences:3]ReceiptType:11:=vReceiptType
	[Preferences:3]DefaultPayRate:12:=vPayRate
	[Preferences:3]DefaultVolunteerFee:13:=vVolunteerFee
	[Preferences:3]DefaultVolunteerPercent:14:=vVolunteerPercent
	[Preferences:3]ePNJPOS_Path:21:=vePNJPOS_Path
	[Preferences:3]ePNJPOS_Clerk:22:=vePNJPOS_Clerk
	[Preferences:3]ePNJPOS_Password:23:=vePNJPOS_Password
	[Preferences:3]FTPPath:30:=vFTPPath
	[Preferences:3]CenterName:31:=vCenterName
	[Preferences:3]Transax_AccountNumber:32:=vTransaxAccountNumber
	
	Case of 
		: (cbPNJPOS_Enabled=1)
			[Preferences:3]ePNJPOS_Enabled:20:=True:C214
		Else 
			[Preferences:3]ePNJPOS_Enabled:20:=False:C215
	End case 
	Case of 
		: (cbNEW_ePNJPOS_Enabled=1)
			[Preferences:3]NEW_ePNJPOS_Enabled:26:=True:C214
		Else 
			[Preferences:3]NEW_ePNJPOS_Enabled:26:=False:C215
	End case 
	Case of 
		: (cbTransax_Enabled=1)
			[Preferences:3]Transax_Enabled:28:=True:C214
		Else 
			[Preferences:3]Transax_Enabled:28:=False:C215
	End case 
	
	
	
	Case of 
		: (cbVerifyInventory=1)
			[Preferences:3]VerifyInventory:24:=True:C214
		Else 
			[Preferences:3]VerifyInventory:24:=False:C215
	End case 
	
	
	Case of 
		: (cbVerifytag=1)
			[Preferences:3]VerifyTag:27:=True:C214
		Else 
			[Preferences:3]VerifyTag:27:=False:C215
	End case 
	
	Case of 
		: (cbAutoUploadSales=1)
			[Preferences:3]AutoUploadSales:25:=True:C214
		Else 
			[Preferences:3]AutoUploadSales:25:=False:C215
	End case 
	
	Case of 
		: (cbTaxPrompt=1)
			[Preferences:3]Tax Prompt:6:=True:C214
		Else 
			[Preferences:3]Tax Prompt:6:=False:C215
	End case 
	Case of 
		: (cbPrintDialog=1)
			[Preferences:3]PrintDialog:10:=True:C214
		Else 
			[Preferences:3]PrintDialog:10:=False:C215
	End case 
	
	[Preferences:3]ccLicense:29:=vCCLicense
	
	
	SAVE RECORD:C53([Preferences:3])
	<>Computer:=[Preferences:3]Computer:34
End if 

UNLOAD RECORD:C212([Preferences:3])