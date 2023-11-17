C_LONGINT:C283(vPOSPrint)
C_LONGINT:C283(vPOSLaunchCC)
C_BOOLEAN:C305(vSwiped)

If (vPOSPrint=1)
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	If (Records in selection:C76([Preferences:3])>0)
		vReceiptCopies:=[Preferences:3]ReceiptCopies:9
		vPrintDialog:=[Preferences:3]PrintDialog:10
		vAutoUploadSales:=[Preferences:3]AutoUploadSales:25
		vTransax_Enabled:=[Preferences:3]Transax_Enabled:28
		vePNJPOS_Enabled:=[Preferences:3]ePNJPOS_Enabled:20
	End if 
	UNLOAD RECORD:C212([Preferences:3])
	
	//1/17/2017 - Transax Code
	vResult2:=""
	
	/////////////////////////////////////////////////////
	//POS Receipt
	/////////////////////////////////////////////////////
	
	For ($j; 1; vReceiptCopies)
		
		Print_POSReceipt
		
	End for 
	vResult2:=""
	
	
	/////////////////////////////////////////////////////
	//Transax
	/////////////////////////////////////////////////////
	
	If (vPOSLaunchCC=1)  ///  LET"S CHANGE THIS TO A NUMBER, SO IT CAN LOOP FOR MULTIPLE PAYMENTS
		Case of 
			: (vTransax_Enabled=True:C214)
				
				POS_CCFireTransax
				
				/////////////////////////////////////////////////////
				//EPNJPOS for Eprocessing Network
				/////////////////////////////////////////////////////
				
			: (vePNJPOS_Enabled=True:C214)
				
				POS_CCFire
				
		End case 
		
	Else 
		
		//added to reprint Transax receipt
		If ([Point of Sale:5]CCTrans:30="")
			//do nothing
		Else 
			
			QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
			If (Records in selection:C76([Preferences:3])>0)
				vePNJPOS_Clerk:=[Preferences:3]ePNJPOS_Clerk:22
				vePNJPOS_Password:=[Preferences:3]ePNJPOS_Password:23
				vePNJPOS_Path:=[Preferences:3]ePNJPOS_Path:21
				vTransaxAccountNumber:=[Preferences:3]Transax_AccountNumber:32
				
			End if 
			UNLOAD RECORD:C212([Preferences:3])
			
			vTransID:=[Point of Sale:5]CCTrans:30
			
			If ([Point of Sale:5]Shopper Last Name:10="")
				vSwiped:=False:C215
			Else 
				vSwiped:=True:C214
			End if 
			
			
			CCTransactionRequest
			For ($k; 1; vReceiptCopies)
				
				Print_TransaxReceipt
				
			End for 
			
			If (vTRANSamount="")
				
				MessageBox(""; "There was a problem retrieving credit card receipt information.  Please verify that credit card transaction was successful."; "OKBox"; "red")
				
			End if 
			
			
			
		End if 
		
		
	End if 
	
	
	
	//v12 ---Was losing batch on reprint, so we are storing it to relate sales
	vBID:=""
	vPOSPrint:=0
	vPOSLaunchCC:=0
	
	//AutoUpload Sold items
	//New for 6/2015
	
	If (vAutoUploadSales=True:C214)
		AutoUploadOfSalesPOS
	End if 
	
	
	//For some reason the record count wasn't updating from this form
	ALL RECORDS:C47([Point of Sale:5])
	ORDER BY:C49([Point of Sale:5]; [Point of Sale:5]Entered Date Stamp:4; <; [Point of Sale:5]Entered Time Stamp:3; <)
	
	gTableName:=Table name:C256(<>TablePointer)
	gTableRecordCount:=String:C10(Records in selection:C76(<>TablePointer->))+"  of  "+String:C10(Records in table:C83(<>TablePointer->))
	gTableRecordCount2:=gTableName+" : "+gTableRecordCount
	
End if 

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		
		ALL RECORDS:C47([Point of Sale:5])
		ORDER BY:C49([Point of Sale:5]; [Point of Sale:5]Entered Date Stamp:4; <; [Point of Sale:5]Entered Time Stamp:3; <)
		
		
End case 

OutputMethod

