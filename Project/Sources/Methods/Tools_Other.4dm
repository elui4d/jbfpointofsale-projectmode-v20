//%attributes = {}


Open Centered window(795; 475; Movable dialog box:K34:7; " ")

DIALOG:C40([Dialogs:7]; "Tools_Other")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

Case of 
	: (rbOther1=1)
		Find_DuplicateBarcodes
		
	: (rbOther2=1)
		Find_SalesNoConsignor
		
	: (rbOther3=1)
		Find_ConsignorNoSales
		
	: (rbOther4=1)
		Find_ConsignorsNotCheckedIn
		
	: (rbOther5=1)
		Find_SalesNoBatch
		
	: (rbOther6=1)
		// Moved to Data Wizard
		Find_ChangeConsignorNumber
		
	: (rbOther7=1)
		Find_MatchSaletoInventory
		
		//: (rbOther7=1)
		//Tools_TempQuery 
		
End case 