//%attributes = {}

If (Records in selection:C76([Volunteers:9])=0)
	ALL RECORDS:C47([Volunteers:9])
End if 

SET PRINT OPTION:C733(2; 2)  //Landscape
PRINT SETTINGS:C106

If (ok=1)
	vReportTitle:="Volunteer List"
	vNumberOfRecordsLabel:="Number of Records:  "+String:C10(Records in selection:C76([Volunteers:9]))
	vPageNo:=1
	vPageNoLabel:="Page:  "+String:C10(vPageNo)
	vDate:=Current date:C33
	Print form:C5([Volunteers:9]; "Print_VolunteerList"; 200)
	FIRST RECORD:C50([Volunteers:9])
	
	
	
	
	
	
	For ($vlRecord; 1; Records in selection:C76([Volunteers:9]))
		
		
		If (Get printed height:C702>550)
			Print form:C5([Volunteers:9]; "Print_VolunteerList"; 100)
			//added this on 2/14 after v13 allowed new print server
			PAGE BREAK:C6(>)
			Print form:C5([Volunteers:9]; "Print_VolunteerList"; 200)
			vPageNo:=vPageNo+1
			vPageNoLabel:="Page:  "+String:C10(vPageNo)
		End if 
		
		Print form:C5([Volunteers:9]; "Print_VolunteerList"; 0)
		
		NEXT RECORD:C51([Volunteers:9])
		
		
		
	End for 
	Print form:C5([Volunteers:9]; "Print_VolunteerList"; 100)
	PAGE BREAK:C6
	
	
	
End if 