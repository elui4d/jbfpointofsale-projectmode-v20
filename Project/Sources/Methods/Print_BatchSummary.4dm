//%attributes = {}
If (Records in selection:C76([Point of Sale:5])=0)
	ALL RECORDS:C47([Point of Sale:5])
End if 

SET PRINT OPTION:C733(2; 2)  //LAND
PRINT SETTINGS:C106

If (ok=1)
	
	vReportTitle:="POS Transaction Summary"
	vNumberOfRecordsLabel:="Number of Records:  "+String:C10(Records in selection:C76([Point of Sale:5]))
	vPageNo:=1
	vPageNoLabel:="Page:  "+String:C10(vPageNo)
	vDate:=Current date:C33
	vSalesCountNumTotal:=0
	vBatchTotalNumTotal:=0
	vBatchTaxTotal:=0
	vTransactionTotalTotal:=0
	vPriorCompNumber:=""
	vPriorBatchID:=""
	
	ORDER BY:C49([Point of Sale:5]; [Point of Sale:5]Batch ID:1; >)
	
	Print form:C5([Point of Sale:5]; "Print_BatchSummary"; 200)
	FIRST RECORD:C50([Point of Sale:5])
	For ($vlRecord; 1; Records in selection:C76([Point of Sale:5]))
		
		If (vPriorCompNumber=[Point of Sale:5]Computer Number:7)
			
			vDash:=Position:C15("-"; vPriorBatchID)
			vDash:=vDash+1
			vConvertPrior:=Substring:C12(vPriorBatchID; vDash)
			vConvertCurrent:=Substring:C12([Point of Sale:5]Batch ID:1; vDash)
			
			If (Num:C11(vConvertCurrent)=(Num:C11(vConvertPrior)+1))
				//SET COLOR(*;"RowBackground";-(3+(256*(0))))  `white
				vGap:=""
				
			Else 
				vGap:="*"
				
			End if 
			
		End if 
		
		
		QUERY:C277([Sales:2]; [Sales:2]Batch ID:12=[Point of Sale:5]Batch ID:1)
		vSalesCountNum:=Records in selection:C76([Sales:2])
		vBatchTotalNum:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
		vBatchTax:=Round:C94(vTransactionTax; 2)
		vTransactionTotal:=vBatchTax+vBatchTotalNum
		
		vSalesCountNumTotal:=vSalesCountNumTotal+vSalesCountNum
		vBatchTotalNumTotal:=vBatchTotalNumTotal+vBatchTotalNum
		vBatchTaxTotal:=vBatchTaxTotal+vBatchTax
		vTransactionTotalTotal:=vTransactionTotalTotal+vTransactionTotal
		
		
		
		
		If (Get printed height:C702>550)
			Print form:C5([Point of Sale:5]; "Print_BatchSummary"; 100)
			PAGE BREAK:C6(>)
			Print form:C5([Point of Sale:5]; "Print_BatchSummary"; 200)
			vPageNo:=vPageNo+1
			vPageNoLabel:="Page:  "+String:C10(vPageNo)
		End if 
		
		Print form:C5([Point of Sale:5]; "Print_BatchSummary"; 0)
		//save for comparison
		vPriorCompNumber:=[Point of Sale:5]Computer Number:7
		vPriorBatchID:=[Point of Sale:5]Batch ID:1
		NEXT RECORD:C51([Point of Sale:5])
	End for 
	
	Print form:C5([Point of Sale:5]; "Print_BatchSummary"; 300)
	Print form:C5([Point of Sale:5]; "Print_BatchSummary"; 100)
	PAGE BREAK:C6
	
End if 