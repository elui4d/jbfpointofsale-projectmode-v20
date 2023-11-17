//%attributes = {}


If (Records in selection:C76([Consignors:1])=0)
	ALL RECORDS:C47([Consignors:1])
End if 

SET PRINT OPTION:C733(2; 1)  //Port
PRINT SETTINGS:C106

If (ok=1)
	
	vReportTitle:="Consignor Sales Detail"
	
	vDate:=Current date:C33
	
	FIRST RECORD:C50([Consignors:1])
	
	
	For ($vlRecord; 1; Records in selection:C76([Consignors:1]))
		vPageNo:=1
		vPageNoLabel:="Page:  "+String:C10(vPageNo)
		RELATE MANY:C262([Consignors:1]Consignor Number:1)
		
		ORDER BY:C49([Sales:2]; [Sales:2]Sold Date:11; >; [Sales:2]Barcode:9; >)
		
		vItemsSold:=Records in selection:C76([Sales:2])
		//vGrossSales:=Sum([Sales]Sold Price)
		//vNetSales:=vGrossSales*([Consignors]Percent*0.01)
		//vCheckTotal:=vNetSales-[Consignors]Consignor Fee
		
		
		
		vGrossSales:=Round:C94(Sum:C1([Sales:2]Sold Price:2); 2)
		vNetSales:=Round:C94(vGrossSales*([Consignors:1]Percent:14*0.01); 2)
		vCheckTotal:=Round:C94(vNetSales-[Consignors:1]Consignor Fee:17; 2)
		Print form:C5([Consignors:1]; "Print_ConsignorSalesDetail"; 200)
		
		
		For ($vlRecord1; 1; Records in selection:C76([Sales:2]))
			Print form:C5([Consignors:1]; "Print_ConsignorSalesDetail"; 0)
			NEXT RECORD:C51([Sales:2])
			If (Get printed height:C702>700)
				Print form:C5([Consignors:1]; "Print_ConsignorSalesDetail"; 100)
				PAGE BREAK:C6(>)
				Print form:C5([Consignors:1]; "Print_ConsignorSalesDetail"; 200)
				vPageNo:=vPageNo+1
				vPageNoLabel:="Page:  "+String:C10(vPageNo)
			End if 
		End for 
		
		Print form:C5([Consignors:1]; "Print_ConsignorSalesDetail"; 100)
		PAGE BREAK:C6
		NEXT RECORD:C51([Consignors:1])
	End for 
	PAGE BREAK:C6
	
	
End if 