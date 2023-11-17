//%attributes = {}
Open Centered window(370; 175; Movable dialog box:K34:7; " ")  // Open a modal window 
DIALOG:C40([Dialogs:7]; "Print_DLog")  // Display a custom search dialog 
CLOSE WINDOW:C154

Case of 
	: (vDateSort=1)
		
		
		
		ALL RECORDS:C47([Sales:2])
		
		
		SET PRINT OPTION:C733(2; 1)  //Port
		PRINT SETTINGS:C106
		
		ALL RECORDS:C47([Point of Sale:5])
		DISTINCT VALUES:C339([Point of Sale:5]Computer Number:7; aComputer)
		
		vReportTitle:="Sales Report by Computer"
		vTotalItemsSold:=String:C10(Records in selection:C76([Sales:2]))
		vDate:=Current date:C33
		DISTINCT VALUES:C339([Sales:2]Consignor Number:6; aConsignors)
		vGrossSalesTotal:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionTaxTotal:=Sum:C1([Sales:2]TaxAmount:17)
		vTransactionTaxTotal:=Round:C94(vTransactionTaxTotal; 2)
		vTransactionTax2Total:=Sum:C1([Sales:2]AltTaxAmount:20)
		vTransactionTax2Total:=Round:C94(vTransactionTax2Total; 2)
		vTransactionTotalTotal:=vTransactionTaxTotal+vTransactionTax2Total+vGrossSalesTotal
		
		
		
		DISTINCT VALUES:C339([Sales:2]Sold Date:11; aSoldDate)
		
		
		Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 200)
		
		For ($i; 1; Size of array:C274(aSoldDate))
			QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i})
			//sub-total
			vGrossSalesTotal2:=Sum:C1([Sales:2]Sold Price:2)
			vTransactionTaxTotal2:=Sum:C1([Sales:2]TaxAmount:17)
			vTransactionTaxTotal2:=Round:C94(vTransactionTaxTotal2; 2)
			vTransactionTax2Total2:=Sum:C1([Sales:2]AltTaxAmount:20)
			vTransactionTax2Total2:=Round:C94(vTransactionTax2Total2; 2)
			vTransactionTotalTotal2:=vTransactionTaxTotal2+vTransactionTax2Total2+vGrossSalesTotal2
			For ($j; 1; Size of array:C274(aComputer))
				QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i}; *)
				QUERY:C277([Sales:2];  & ; [Sales:2]Batch ID:12=aComputer{$j}+"-@")
				vComputer:=aComputer{$j}
				vSoldDate:=aSoldDate{$i}
				vItemsSold:=Records in selection:C76([Sales:2])
				vGrossSales:=Sum:C1([Sales:2]Sold Price:2)
				vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
				vTransactionTax:=Round:C94(vTransactionTax; 2)
				vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
				vTransactionTax2:=Round:C94(vTransactionTax2; 2)
				vTransactionTotal:=vTransactionTax+vTransactionTax2+vGrossSales
				
				Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 0)
			End for 
			Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 301)
		End for 
		
		Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 300)
		PAGE BREAK:C6
		
		
		
	: (vCompSort=1)
		
		
		
		ALL RECORDS:C47([Sales:2])
		
		
		SET PRINT OPTION:C733(2; 1)  //Port
		PRINT SETTINGS:C106
		
		ALL RECORDS:C47([Point of Sale:5])
		DISTINCT VALUES:C339([Point of Sale:5]Computer Number:7; aComputer)
		
		vReportTitle:="Sales Report by Computer"
		vTotalItemsSold:=String:C10(Records in selection:C76([Sales:2]))
		vDate:=Current date:C33
		DISTINCT VALUES:C339([Sales:2]Consignor Number:6; aConsignors)
		vGrossSalesTotal:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionTaxTotal:=Sum:C1([Sales:2]TaxAmount:17)
		vTransactionTaxTotal:=Round:C94(vTransactionTaxTotal; 2)
		vTransactionTax2Total:=Sum:C1([Sales:2]AltTaxAmount:20)
		vTransactionTax2Total:=Round:C94(vTransactionTax2Total; 2)
		vTransactionTotalTotal:=vTransactionTaxTotal+vTransactionTax2Total+vGrossSalesTotal
		
		
		
		DISTINCT VALUES:C339([Sales:2]Sold Date:11; aSoldDate)
		
		
		Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 200)
		
		For ($j; 1; Size of array:C274(aComputer))
			QUERY:C277([Sales:2]; [Sales:2]Batch ID:12=aComputer{$j}+"-@")
			//sub-total
			vGrossSalesTotal2:=Sum:C1([Sales:2]Sold Price:2)
			vTransactionTaxTotal2:=Sum:C1([Sales:2]TaxAmount:17)
			vTransactionTaxTotal2:=Round:C94(vTransactionTaxTotal2; 2)
			vTransactionTax2Total2:=Sum:C1([Sales:2]AltTaxAmount:20)
			vTransactionTax2Total2:=Round:C94(vTransactionTax2Total2; 2)
			vTransactionTotalTotal2:=vTransactionTaxTotal2+vTransactionTax2Total2+vGrossSalesTotal2
			For ($i; 1; Size of array:C274(aSoldDate))
				QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i}; *)
				QUERY:C277([Sales:2];  & ; [Sales:2]Batch ID:12=aComputer{$j}+"-@")
				vComputer:=aComputer{$j}
				vSoldDate:=aSoldDate{$i}
				vItemsSold:=Records in selection:C76([Sales:2])
				vGrossSales:=Sum:C1([Sales:2]Sold Price:2)
				vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
				vTransactionTax:=Round:C94(vTransactionTax; 2)
				vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
				vTransactionTax2:=Round:C94(vTransactionTax2; 2)
				vTransactionTotal:=vTransactionTax+vTransactionTax2+vGrossSales
				
				Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 0)
			End for 
			Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 301)
		End for 
		
		Print form:C5([Sales:2]; "Print_SalesReportbyComputer"; 300)
		PAGE BREAK:C6
		
		
		
		
		
		
	: (vCancel=1)
End case 