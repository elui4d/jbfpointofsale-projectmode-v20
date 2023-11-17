If (ok=1)
	C_TEXT:C284(vRange)
	C_LONGINT:C283(vPageRange)
	SET PRINT OPTION:C733(2; 1)  //Port
	PRINT SETTINGS:C106
	
	vFirstNum:=""
	$count:=0
	vConsignorName:=""
	vConsignorPhone:=""
	vRange:=""
	vPageRange:=1
	//ORDER BY([Consignors];[Consignors]Consignor Number;>)
	
	//FIRST RECORD([Consignors])
	
	SORT ARRAY:C229(aConsignorNumberCounts; >)
	For ($i; 1; Size of array:C274(aConsignorNumberCounts))
		QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=aConsignorNumberCounts{$i})
		$count:=$count+1
		If ($count=1)
			vFirstNum:=[Consignors:1]Consignor Number:1
		End if 
		
		
		If ($count=vGroups)
			vLastNum:=[Consignors:1]Consignor Number:1
			vPrintLabel:=vFirstNum+" - "+vLastNum
			vRange:="Range "+String:C10(vPageRange)
			Print form:C5([Dialogs:7]; "Print_BreakdownConsignors"; 0)
			PAGE BREAK:C6(>)
			vPageRange:=vPageRange+1
			$count:=0
			vFirstNum:=""
			vLastNum:=""
			
			
		End if 
		
		If ($i=Size of array:C274(aConsignorNumberCounts))
			If ($count>0)
				
				vLastNum:=[Consignors:1]Consignor Number:1
				vPrintLabel:=vFirstNum+" - "+vLastNum
				vRange:="Range "+String:C10(vPageRange)
				
				
				Print form:C5([Dialogs:7]; "Print_BreakdownConsignors"; 0)
				PAGE BREAK:C6(>)
				vPageRange:=vPageRange+1
			End if 
			
		End if 
		
		//NEXT RECORD([Consignors])
		
		
		
	End for 
	PAGE BREAK:C6
	
	
	
	ok:=1
End if 