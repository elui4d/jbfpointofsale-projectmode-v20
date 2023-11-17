If (ok=1)
	
	SET PRINT OPTION:C733(2; 1)  //Port
	PRINT SETTINGS:C106
	vDate:=Current date:C33
	vReportTitle:="Breakdown Section Summary"
	Print form:C5([Dialogs:7]; "Print_BreakdownGroupSummar"; 200)
	
	vFirstNum:=""
	$count:=0
	vGroupNumber:=0
	
	
	SORT ARRAY:C229(aConsignorNumberCounts; >)
	
	//ORDER BY([Consignors];[Consignors]Consignor Number;>)
	
	//FIRST RECORD([Consignors])
	For ($i; 1; Size of array:C274(aConsignorNumberCounts))
		$count:=$count+1
		If ($count=1)
			vFirstNum:=aConsignorNumberCounts{$i}
		End if 
		
		
		If ($count=vGroups)
			vLastNum:=aConsignorNumberCounts{$i}
			vGroupNumber:=vGroupNumber+1
			vNumofConsignors:=$count
			Print form:C5([Dialogs:7]; "Print_BreakdownGroupSummar"; 0)
			
			
			$count:=0
			vFirstNum:=""
			vLastNum:=""
			
			
		End if 
		
		If ($i=Size of array:C274(aConsignorNumberCounts))
			If ($count>0)
				vLastNum:=aConsignorNumberCounts{$i}
				vGroupNumber:=vGroupNumber+1
				vNumofConsignors:=$count
				Print form:C5([Dialogs:7]; "Print_BreakdownGroupSummar"; 0)
				
			End if 
			
		End if 
		
		//NEXT RECORD([Consignors])
		
		
	End for 
	PAGE BREAK:C6
	
	
	
	ok:=1
End if 