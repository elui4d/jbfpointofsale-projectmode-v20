//%attributes = {}


QUERY:C277([KPI:11]; [KPI:11]ID:30="ME")


If (Records in selection:C76([KPI:11])=0)
	CREATE RECORD:C68([KPI:11])
	[KPI:11]ID:30:="ME"
	SAVE RECORD:C53([KPI:11])
End if 



Open Centered window(875; 605; Movable dialog box:K34:7; " ")

//vTerritory:=""
//vSaleSeason:=""
//vSeasonDropDown:=""
//New for 9.1 to provide list of Center Names
ALL RECORDS:C47([Consignors:1])  // Create a selection of records
DISTINCT VALUES:C339([Consignors:1]Center Name:35; asCenterNames)
ARRAY TO LIST:C287(asCenterNames; "CenterNames")

DIALOG:C40([Dialogs:7]; "Print_FranchiseReportDlog")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 


//QUERY([KPI];[KPI]ID="ME")
vTerritory:=[KPI:11]Territory:1
vFranchiseeName:=[KPI:11]FranchiseeName:2
vFranchiseePhone:=[KPI:11]FranchiseePhone:3
vCharity:=[KPI:11]Charity:7
vSaleSeason:=[KPI:11]SaleSeason:6


SAVE RECORD:C53([KPI:11])

If (ok=1)
	Message_Think("Calculating reports, please wait... ")
	//added on 3/10/17 to build check data before financial module
	vCheckSort:=""
	BuildCheckData
	
	
	ALL RECORDS:C47([Sales:2])
	
	If (cbPrint=1)
		SET PRINT OPTION:C733(2; 1)  //Port
		PRINT SETTINGS:C106
	End if 
	
	vReportTitle:="Royalty Report"
	
	vTotalItemsSold:=String:C10(Records in selection:C76([Sales:2]))
	vDate:=Current date:C33
	vCal_Date1:=[KPI:11]PreviousSaleDate:4
	DonationMeat
	
	ALL RECORDS:C47([Sales:2])
	ALL RECORDS:C47([Inventory:4])
	DISTINCT VALUES:C339([Sales:2]Consignor Number:6; aConsignors)
	
	// removed from entry form on 3/15/17 - fields are still being uploaded as blanks so it won't break francon
	// import -vNumberSignUps, vNumberDaysOpen, vNumberofShoppers, vVenueSize
	vNumberofConsignors:=Size of array:C274(aConsignors)
	vGrossSalesTotal:=Sum:C1([Sales:2]Sold Price:2)
	vConsignorAVG:=vGrossSalesTotal/vNumberofConsignors
	
	QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
	vTotalPaidtoConsignors:=Sum:C1([Consignors:1]Check_Total:19)
	vAverageCheck:=Round:C94(vTotalPaidtoConsignors/Records in selection:C76([Consignors:1]); 2)
	
	
	
	
	
	DISTINCT VALUES:C339([Sales:2]Sold Date:11; aSoldDate)
	DISTINCT VALUES:C339([Sales:2]Batch ID:12; aTotalbatches)
	vTotalBatches:=String:C10(Size of array:C274(aTotalBatches))
	//vTotalSaleDays:=String(Size of array(aSoldDate))
	vAvgNumBatchesPerDay:=Size of array:C274(aTotalBatches)/Size of array:C274(aSoldDate)
	vAvgNumBatchesPerDay:=Round:C94(vAvgNumBatchesPerDay; 0)
	If (cbPrint=1)
		Print form:C5([Sales:2]; "Print_FranchiseReport"; 200)
	End if 
	//Sales by Date
	For ($i; 1; Size of array:C274(aSoldDate))
		
		QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i})
		
		vSoldDate:=aSoldDate{$i}
		vItemsSold:=Records in selection:C76([Sales:2])
		vGrossSales:=Sum:C1([Sales:2]Sold Price:2)
		DISTINCT VALUES:C339([Sales:2]Batch ID:12; abatches)
		vBatches:=String:C10(Size of array:C274(aBatches))
		If (cbPrint=1)
			Print form:C5([Sales:2]; "Print_FranchiseReport"; 0)
		End if 
	End for 
	//Royalty Fee
	//Case of 
	//: (vGrossSalesTotal<20001)
	//vPercent:=0.02
	//vRoyaltyPercent:="2.0%"
	//vRoyaltyCheck:=vGrossSalesTotal*vPercent
	//: (vGrossSalesTotal>50001)
	//vPercent:=0.03
	//vRoyaltyPercent:="3.0%"
	//vRoyaltyCheck:=vGrossSalesTotal*vPercent
	//Else 
	//vPercent:=0.025
	//vRoyaltyPercent:="2.5%"
	//vRoyaltyCheck:=vGrossSalesTotal*vPercent
	//End case 
	
	//Updated for flat Royalty Fee on 8/3/19
	vPercent:=0.03
	vRoyaltyPercent:="3.0%"
	vRoyaltyCheck:=(Round:C94(vGrossSalesTotal*vPercent; 2))
	vMarketingFund:=(Round:C94(vGrossSalesTotal*0.01; 2))
	
	
	
	ALL RECORDS:C47([Sales:2])
	QUERY:C277([Sales:2]; [Sales:2]Item Number:13#0)
	If (Records in selection:C76([Sales:2])>0)
		DISTINCT VALUES:C339([Sales:2]Consignor Number:6; aConsignors2)
		
		vNumberBarcodeUsers:=String:C10(Size of array:C274(aConsignors2))
		
		Case of 
			: (Size of array:C274(aConsignors2)<150)
				vUsageFee:=0.49
			: (Size of array:C274(aConsignors2)>299)
				vUsageFee:=0.39
			Else 
				//150-299
				vUsageFee:=0.44
		End case 
		
		vMyjbftagsUsage:=(Size of array:C274(aConsignors2))*vUsageFee
		
		
		
	Else 
		vNumberBarcodeUsers:="0"
		vMyjbftagsUsage:=0
	End if 
	
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	vTotalsForFranchise:="For JBF Corporate use only ------ 00000"+[Preferences:3]Totals_Consignors:15+"00000"+[Preferences:3]Totals_Volunteers:16+"00000"+[Preferences:3]Totals_GrossSales:17+"00000"+[Preferences:3]Totals_NetSales:18
	
	
	
	If (cbPrint=1)
		Print form:C5([Sales:2]; "Print_FranchiseReport"; 300)
		PAGE BREAK:C6(>)
		Print form:C5([Sales:2]; "Print_FranchiseReport2")
		PAGE BREAK:C6
	End if 
	
	//Calculations for Financial Module
	ALL RECORDS:C47([Sales:2])
	vTransactionTaxTotal:=Sum:C1([Sales:2]TaxAmount:17)
	vTransactionTaxTotal:=Round:C94(vTransactionTaxTotal; 2)
	vTransactionTaxTotalPST:=Sum:C1([Sales:2]AltTaxAmount:20)
	vTransactionTaxTotalPST:=Round:C94(vTransactionTaxTotalPST; 2)
	vTransactionTotalTotal:=vTransactionTaxTotal+vTransactionTaxTotalPST
	
	
	vGrossSales:=Sum:C1([Sales:2]Sold Price:2)
	vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
	vTransactionTax:=Round:C94(vTransactionTax; 2)
	vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
	vTransactionTax2:=Round:C94(vTransactionTax2; 2)
	vTransactionTotal:=vTransactionTax+vTransactionTax2+vGrossSales
	
	
	
	QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
	vFMConsignorFee:=Sum:C1([Consignors:1]Consignor Fee:17)
	vAverageConsignorPercent:=Round:C94(Average:C2([Consignors:1]Percent:14); 1)
	QUERY:C277([Consignors:1]; [Consignors:1]Volunteer:26=True:C214)
	VFMVolunteers:=(Records in selection:C76([Consignors:1]))
	
	DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; aFMVol)
	QUERY WITH ARRAY:C644([Sales:2]Consignor Number:6; aFMVol)
	vFMVolTotalSales:=Sum:C1([Sales:2]Sold Price:2)
	//added on 5/16/15 to fix decimal error
	vFMRegPercent:=(vFMVolTotalSales*[Preferences:3]DefaultConsignorPercent:3)*0.01
	vFMVolPercent:=(vFMVolTotalSales*[Preferences:3]DefaultVolunteerPercent:14)*0.01
	vFMVolDiffernce:=vFMVolPercent-vFMRegPercent
	
	vAverageItemPrice:=Round:C94(vGrossSalesTotal/Num:C11(vTotalItemsSold); 2)
	
	ALL RECORDS:C47([Point of Sale:5])
	vTotalTransactions:=(Records in selection:C76([Point of Sale:5]))
	
	If (cbExport=1)
		vSaleSeason:=[KPI:11]SaleSeason:6
		vTerritory:=[KPI:11]Territory:1
		vSeasonDropdown:=[KPI:11]SeasonDropDown:5
		
		
		Export_FModuleSales
		FTP_FinancialModule
		// New for 9.2
		Export_FModuleCustomers
		FTP_CustomerModule
		
	End if 
	
	
	
	
	UNLOAD RECORD:C212([Preferences:3])
	CLOSE WINDOW:C154
End if 