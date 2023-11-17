//%attributes = {}
//commented because it wouldn't work for all users 
//UploadSaleStats 

vCheckSort:="By Last Name"
Open Centered window(600; 400; Movable dialog box:K34:7; " ")

DIALOG:C40([Consignors:1]; "Print_ChecksDlog")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

If (ok=1)
	
	//Build check data to ensure it is up to date before printing
	BuildCheckData
	
	Case of 
			//Last Name
		: (vCheckSort="By Last Name")
			ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Last Name:3); >; ([Consignors:1]First Name:2); >)
			
			//Universal Consignor Number - if not explicitly done by lastname sort by consignor
			
		Else 
			ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Consignor Number:1); >)
	End case 
	
	
	
	PRINT LABEL:C39(<>TablePointer->; Char:C90(1))
	
	
	//*************Build After Sale Totals for Franchise Verification****************
	
	ALL RECORDS:C47([Sales:2])
	vGrossSalesTotal:=Sum:C1([Sales:2]Sold Price:2)
	
	ALL RECORDS:C47([Consignors:1])
	QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
	vNumberofConsignors:=Records in selection:C76([Consignors:1])
	
	ALL RECORDS:C47([Consignors:1])
	vNetSalesTotal:=Sum:C1([Consignors:1]Check_Total:19)
	
	ALL RECORDS:C47([Volunteers:9])
	DISTINCT VALUES:C339([Volunteers:9]Consignor Number:1; aVolunteers)
	vVolunteersTotal:=Size of array:C274(aVolunteers)
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	[Preferences:3]Totals_Consignors:15:=String:C10(vNumberofConsignors)
	[Preferences:3]Totals_GrossSales:17:=String:C10(Round:C94(vGrossSalesTotal; 0))
	[Preferences:3]Totals_NetSales:18:=String:C10(Round:C94(vNetSalesTotal; 0))
	[Preferences:3]Totals_Volunteers:16:=String:C10(vVolunteersTotal)
	SAVE RECORD:C53([Preferences:3])
	UNLOAD RECORD:C212([Preferences:3])
	
Else 
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox(""; "You have no consignors that are marked Consigning in you selection."; "OKBox"; "red")
End if 

