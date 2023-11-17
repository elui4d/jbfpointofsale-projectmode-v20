//%attributes = {}

Open Centered window(680; 560; Movable dialog box:K34:7; " ")

DIALOG:C40([Dialogs:7]; "Toolbar_Print")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

If (ok=1)
	Case of 
		: (cbRep1=1)  //ConsignorList
			
			Print_ConsignorList
			
		: (cbRep2=1)  //ConsignorSalesList
			
			Print_ConsignorSalesList
			
		: (cbRep3=1)  //ConsignorSalesDetail
			
			Print_ConsignorSalesDetail
			
		: (cbRep4=1)  //PrintConsignorChecks
			
			Print_Checks
			
		: (cbRep5=1)  //Batch Summary
			
			Print_BatchSummary
			
		: (cbRep6=1)  //Sales Report By Date
			
			Print_SalesReport
			
		: (cbRep20=1)  //Sales Report By Computer
			
			Print_SalesReportbyComputer
			
		: (cbRep7=1)  //Consignor Comment
			
			Print_ConsignorComments
			
		: (cbRep8=1)  //Address Changes
			
			Print_ConsignorChanges
			
		: (cbRep9=1)  //Franchise Royalties
			
			Print_FranchiseReport
			
		: (cbRep10=1)  //PrintWorkerChecks
			
			Print_ChecksEmployee
			
		: (cbRep11=1)  //Employee Check Register
			
			Print_VolunteerChecks
			
		: (cbRep12=1)  //Volunteer Badges
			
			Print_VolunteerBadges
			
		: (cbRep19=1)  //Volunteer BadgesLand
			
			Print_VolunteerBadges2
			
		: (cbRep13=1)  //'Tax Report
			
			Print_TaxReport
			
		: (cbRep14=1)  //Print Tags
			
			Print_Tags
			
		: (cbRep78=1)  //Print Barcode Labels
			
			Print_BarcodeLabels
			
		: (cbRep21=1)  //
			
			Print_VolunteerReport
			
		: (cbRep22=1)  //Donation Report
			
			Print_CloseOutRegister
			
		: (cbRep15=1)  //Donation Report
			
			Print_DontationReport
			
		: (cbRep97=1)  //Label Editor
			
			PRINT LABEL:C39(<>TablePointer->; Char:C90(1))
			
			
		: (cbRep99=1)  //Report Editor
			
			QR REPORT:C197(<>TablePointer->; Char:C90(1); True:C214; True:C214; True:C214)
			
	End case 
End if 