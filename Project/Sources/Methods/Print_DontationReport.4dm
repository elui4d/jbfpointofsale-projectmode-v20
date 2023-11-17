//%attributes = {}


Open Centered window(675; 400; Movable dialog box:K34:7; " ")

DIALOG:C40([Inventory:4]; "DonationRpt_dlog")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

If (ok=1)
	
	SET PRINT OPTION:C733(2; 1)  //Port
	PRINT SETTINGS:C106
	DonationMeat
	
	vReportTitle:="Donation Report"
	vDate:=Current date:C33
	
	
	
	Print form:C5([Inventory:4]; "Print_DonationReport")
	PAGE BREAK:C6
	
	
	
	//vReportTitle:="Royalty Report"
	//
	//vTotalItemsSold:=String(Records in selection([Sales]))
	//vDate:=Current date
	//
	//
	//DISTINCT VALUES([Sales]Consignor Number;aConsignors)
	//
	//
	//vNumberofConsignors:=Size of array(aConsignors)
	//vGrossSalesTotal:=Sum([Sales]Sold Price)
	//vConsignorAVG:=vGrossSalesTotal/vNumberofConsignors
	//
	//DISTINCT VALUES([Sales]Sold Date;aSoldDate)
	//DISTINCT VALUES([Sales]Batch ID;aTotalbatches)
	//vTotalBatches:=String(Size of array(aTotalBatches))
	//
	//
	//Print form([Sales];"Print_FranchiseReport";200)
	//
	//For ($i;1;Size of array(aSoldDate))
	//
	//QUERY([Sales];[Sales]Sold Date=aSoldDate{$i})
	//
	//vSoldDate:=aSoldDate{$i}
	//vItemsSold:=Records in selection([Sales])
	//vGrossSales:=Sum([Sales]Sold Price)
	//DISTINCT VALUES([Sales]Batch ID;abatches)
	//vBatches:=String(Size of array(aBatches))
	//
	//Print form([Sales];"Print_FranchiseReport";0)
	//End for 
	//
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
	//
	//ALL RECORDS([Sales])
	//QUERY([Sales];[Sales]Item Number#0)
	//If (Records in selection([Sales])>0)
	//DISTINCT VALUES([Sales]Consignor Number;aConsignors2)
	//
	//vNumberBarcodeUsers:=String(Size of array(aConsignors2))
	//
	//Case of 
	//: (Size of array(aConsignors2)<150)
	//vUsageFee:=0.49
	//: (Size of array(aConsignors2)>299)
	//vUsageFee:=0.39
	//Else 
	//  `150-299
	//vUsageFee:=0.44
	//End case 
	//
	//vMyjbftagsUsage:=(Size of array(aConsignors2))*vUsageFee
	//Else 
	//vNumberBarcodeUsers:="0"
	//vMyjbftagsUsage:=0
	//End if 
	//
	//
	//QUERY([Preferences];[Preferences]ID="ME")
	//vTotalsForFranchise:="00000"+[Preferences]Totals_Consignors+"00000"+[Preferences]Totals_Volunteers+"00000"+[Preferences]Totals_GrossSales+"00000"+[Preferences]Totals_NetSales
	//
	//
	//
	//UNLOAD RECORD([Preferences])
	//
	//
	//Print form([Sales];"Print_FranchiseReport";300)
	//PAGE BREAK
	
End if 