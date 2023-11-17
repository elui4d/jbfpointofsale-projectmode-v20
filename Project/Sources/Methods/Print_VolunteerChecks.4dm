//%attributes = {}

QUERY:C277([Consignors:1]; [Consignors:1]EmployeeCheck:28=True:C214)

If (Records in selection:C76([Consignors:1])>0)
	
	SET PRINT OPTION:C733(2; 1)  //Port
	PRINT SETTINGS:C106
	
	If (ok=1)
		
		vReportTitle:="Employee Check Register"
		vNumberOfRecordsLabel:="Number of Records:  "+String:C10(Records in selection:C76([Consignors:1]))
		vPageNo:=1
		vPageNoLabel:="Page:  "+String:C10(vPageNo)
		vDate:=Current date:C33
		vCheckTotalTotal:=0
		
		Print form:C5([Consignors:1]; "Print_EmployeeCheckRegister"; 200)
		FIRST RECORD:C50([Consignors:1])
		For ($vlRecord; 1; Records in selection:C76([Consignors:1]))
			
			vCheckTotal:=Round:C94([Consignors:1]EmployeeCheck_Total:29; 2)
			
			vCheckTotalTotal:=Round:C94(vCheckTotalTotal+vCheckTotal; 2)
			
			
			
			
			
			If (Get printed height:C702>700)
				Print form:C5([Consignors:1]; "Print_EmployeeCheckRegister"; 100)
				//added this on 2/14 after v13 allowed new print server
				PAGE BREAK:C6(>)
				Print form:C5([Consignors:1]; "Print_EmployeeCheckRegister"; 200)
				vPageNo:=vPageNo+1
				vPageNoLabel:="Page:  "+String:C10(vPageNo)
			End if 
			
			Print form:C5([Consignors:1]; "Print_EmployeeCheckRegister"; 0)
			
			NEXT RECORD:C51([Consignors:1])
		End for 
		
		Print form:C5([Consignors:1]; "Print_EmployeeCheckRegister"; 300)
		Print form:C5([Consignors:1]; "Print_EmployeeCheckRegister"; 100)
		PAGE BREAK:C6
	End if 
	
Else 
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox(""; "You have not printed any employee checks.  You must print the checks before you c"+"an print the register."; "OKBox"; "red")
End if 