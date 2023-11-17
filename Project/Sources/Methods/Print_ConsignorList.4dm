//%attributes = {}

If (Records in selection:C76([Consignors:1])=0)
	ALL RECORDS:C47([Consignors:1])
End if 

SET PRINT OPTION:C733(2; 2)  //Landscape
PRINT SETTINGS:C106

If (ok=1)
	vReportTitle:="Consignor List"
	vNumberOfRecordsLabel:="Number of Records:  "+String:C10(Records in selection:C76([Consignors:1]))
	vPageNo:=1
	vPageNoLabel:="Page:  "+String:C10(vPageNo)
	vDate:=Current date:C33
	Print form:C5([Consignors:1]; "PrintConsignorList"; 200)
	FIRST RECORD:C50([Consignors:1])
	
	
	
	
	
	
	For ($vlRecord; 1; Records in selection:C76([Consignors:1]))
		
		
		If (Get printed height:C702>550)
			Print form:C5([Consignors:1]; "PrintConsignorList"; 100)
			//added this on 2/14 after v13 allowed new print server
			PAGE BREAK:C6(>)
			Print form:C5([Consignors:1]; "PrintConsignorList"; 200)
			vPageNo:=vPageNo+1
			vPageNoLabel:="Page:  "+String:C10(vPageNo)
		End if 
		
		Print form:C5([Consignors:1]; "PrintConsignorList"; 0)
		
		NEXT RECORD:C51([Consignors:1])
		
		
		
	End for 
	Print form:C5([Consignors:1]; "PrintConsignorList"; 100)
	PAGE BREAK:C6
	
	
	
End if 