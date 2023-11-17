//%attributes = {}
vCons:=0
vSales:=0



If (Records in selection:C76([Consignors:1])=0)
	ALL RECORDS:C47([Consignors:1])
End if 

Open Centered window(600; 400; Movable dialog box:K34:7; " ")
DIALOG:C40([Consignors:1]; "Print_ConsignorSalesDlog")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

SET PRINT OPTION:C733(2; 1)  //Port
PRINT SETTINGS:C106

//v12 - Working PDF using PDFCreator
//SET CURRENT PRINTER(PDFCreator Printer name)
//SET PRINT OPTION("PDFOptions:UseAutosave";1)
//SET PRINT OPTION("PDFOptions:AutosaveDirectory";Get 4D folder(Database Folder))
//SET PRINT OPTION("PDFOptions:AutosaveFilename";"My Report")


If (ok=1)
	
	
	If (vCons=1)
		QUERY SELECTION:C341([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
	End if 
	
	vReportTitle:="Consignor Sales List"
	vNumberOfRecordsLabel:="Number of Records:  "+String:C10(Records in selection:C76([Consignors:1]))
	vPageNo:=1
	vPageNoLabel:="Page:  "+String:C10(vPageNo)
	vDate:=Current date:C33
	vItemsSoldTotal:=0
	vGrossSalesTotal:=0
	vNetSalesTotal:=0
	vCheckTotalTotal:=0
	
	Print form:C5([Consignors:1]; "Print_ConsignorSalesList"; 200)
	ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Last Name:3); >; ([Consignors:1]First Name:2); >)
	
	FIRST RECORD:C50([Consignors:1])
	For ($vlRecord; 1; Records in selection:C76([Consignors:1]))
		
		RELATE MANY:C262([Consignors:1]Consignor Number:1)
		
		vItemsSold:=Records in selection:C76([Sales:2])
		
		If (vSales=0) | (vItemsSold>0)
			
			//vGrossSales:=Sum([Sales]Sold Price)
			//vNetSales:=vGrossSales*([Consignors]Percent*0.01)
			//vCheckTotal:=vNetSales-[Consignors]Consignor Fee
			
			vGrossSales:=Round:C94(Sum:C1([Sales:2]Sold Price:2); 2)
			vNetSales:=Round:C94(vGrossSales*([Consignors:1]Percent:14*0.01); 2)
			vCheckTotal:=Round:C94(vNetSales-[Consignors:1]Consignor Fee:17; 2)
			
			vItemsSoldTotal:=vItemsSoldTotal+vItemsSold
			vGrossSalesTotal:=Round:C94(vGrossSalesTotal+vGrossSales; 2)
			vNetSalesTotal:=Round:C94(vNetSalesTotal+vNetSales; 2)
			vCheckTotalTotal:=Round:C94(vCheckTotalTotal+vCheckTotal; 2)
			
			
			
			If (Get printed height:C702>700)
				Print form:C5([Consignors:1]; "Print_ConsignorSalesList"; 100)
				//new for v12
				PAGE BREAK:C6(>)
				Print form:C5([Consignors:1]; "Print_ConsignorSalesList"; 200)
				vPageNo:=vPageNo+1
				vPageNoLabel:="Page:  "+String:C10(vPageNo)
			End if 
			
			Print form:C5([Consignors:1]; "Print_ConsignorSalesList"; 0)
			
		End if 
		
		NEXT RECORD:C51([Consignors:1])
	End for 
	
	Print form:C5([Consignors:1]; "Print_ConsignorSalesList"; 300)
	Print form:C5([Consignors:1]; "Print_ConsignorSalesList"; 100)
	PAGE BREAK:C6
End if 