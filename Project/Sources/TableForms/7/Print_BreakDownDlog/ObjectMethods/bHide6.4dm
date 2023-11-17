
If (ok=1)
	vRange:=""
	SET PRINT OPTION:C733(2; 1)  //Port
	PRINT SETTINGS:C106
	
	
	SORT ARRAY:C229(aConsignorNumberCounts; >)
	For ($i3; 1; Size of array:C274(aConsignorNumberCounts))
		//
		//If (ok=0)
		//$i3:=Records in selection([Consignors])
		//Else 
		QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=aConsignorNumberCounts{$i3})
		vPrintLabel:=[Consignors:1]Consignor Number:1
		vConsignorName:=[Consignors:1]First Name:2+" "+[Consignors:1]Last Name:3
		vConsignorPhone:="H-"+[Consignors:1]Home Phone:9+"   C-"+[Consignors:1]Cell Phone:10
		
		Print form:C5([Dialogs:7]; "Print_BreakdownConsignors")
		If ($i3=Size of array:C274(aConsignorNumberCounts))
			PAGE BREAK:C6
		Else 
			PAGE BREAK:C6(>)
		End if 
		NEXT RECORD:C51([Consignors:1])
		
	End for 
	
	ok:=1
End if 