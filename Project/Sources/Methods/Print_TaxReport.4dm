//%attributes = {}

ALL RECORDS:C47([Sales:2])


SET PRINT OPTION:C733(2; 2)  //Port
PRINT SETTINGS:C106

If (ok=1)
	DISTINCT VALUES:C339([Sales:2]Sold Date:11; aSoldDate)
	
	vReportTitle:="Sales Tax Report"
	vTotalItemsSold:=String:C10(Records in selection:C76([Sales:2]))
	vDate:=Current date:C33
	//DISTINCT VALUES([Sales]Consignor Number;aConsignors)
	//vNumberofConsignors:=Size of array(aConsignors)
	vGrossSalesTotal:=Sum:C1([Sales:2]Sold Price:2)
	vTransactionTaxTotal:=Sum:C1([Sales:2]TaxAmount:17)
	vTransactionTaxTotal:=Round:C94(vTransactionTaxTotal; 2)
	vTransactionTaxTotalPST:=Sum:C1([Sales:2]AltTaxAmount:20)
	vTransactionTaxTotalPST:=Round:C94(vTransactionTaxTotalPST; 2)
	vTransactionTotalTotal:=vTransactionTaxTotal+vTransactionTaxTotalPST+vGrossSalesTotal
	
	QUERY:C277([Sales:2]; [Sales:2]Taxed:16="T")
	vTotalNumTaxed:=Records in selection:C76([Sales:2])
	vTotalSaleWithTax:=Sum:C1([Sales:2]Sold Price:2)
	
	QUERY:C277([Sales:2]; [Sales:2]AltTaxed:19="T")
	vTotalNumTaxedPST:=Records in selection:C76([Sales:2])
	vTotalSaleTaxPST:=Sum:C1([Sales:2]AltTaxAmount:20)
	
	QUERY:C277([Sales:2]; [Sales:2]Taxed:16#"T")
	vTotalNumNotTaxed:=Records in selection:C76([Sales:2])
	vTotalSaleNoTax:=Sum:C1([Sales:2]Sold Price:2)
	
	
	Print form:C5([Sales:2]; "Print_TaxReport"; 200)
	
	For ($i; 1; Size of array:C274(aSoldDate))
		
		QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i})
		
		vSoldDate:=aSoldDate{$i}
		vItemsSold:=Records in selection:C76([Sales:2])
		vGrossSales:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
		vTransactionTax:=Round:C94(vTransactionTax; 2)
		vTransactionTaxPST:=Sum:C1([Sales:2]AltTaxAmount:20)
		vTransactionTaxPST:=Round:C94(vTransactionTaxPST; 2)
		vTransactionTotal:=vTransactionTax+vTransactionTaxPST+vGrossSales
		vTaxedItems:=Sum:C1([Sales:2]TaxAmount:17)
		
		QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i}; *)
		QUERY:C277([Sales:2];  & ; [Sales:2]Taxed:16="T")
		vNumTaxedItems:=Records in selection:C76([Sales:2])
		vGrossSales2:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionTax2:=Sum:C1([Sales:2]TaxAmount:17)
		vTransactionTax2:=Round:C94(vTransactionTax2; 2)
		vTransactionTotal2:=vTransactionTax2+vGrossSales2
		vTaxedItems2:=Sum:C1([Sales:2]TaxAmount:17)
		
		QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i}; *)
		QUERY:C277([Sales:2];  & ; [Sales:2]Taxed:16#"T")
		vNumNotTaxedItems:=Records in selection:C76([Sales:2])
		vGrossSales3:=Sum:C1([Sales:2]Sold Price:2)
		
		QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i}; *)
		QUERY:C277([Sales:2];  & ; [Sales:2]AltTaxed:19="T")
		vNumTaxedItemsPST:=Records in selection:C76([Sales:2])
		vTransactionTaxALT:=Sum:C1([Sales:2]AltTaxAmount:20)
		vTransactionTaxALT:=Round:C94(vTransactionTaxALT; 2)
		
		
		Print form:C5([Sales:2]; "Print_TaxReport"; 0)
		
		
	End for 
	
	Print form:C5([Sales:2]; "Print_TaxReport"; 300)
	PAGE BREAK:C6
	
End if 