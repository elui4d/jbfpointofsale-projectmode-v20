
//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";), 4=TextColor
MessageBox("Start Cash Management"; "This will re-start your cash drawer tracking and erase all previous data.  Are you sure you want to continue?"; "YesNoBox"; "Red")

If (ok=1)
	
	
	//clear all records
	ALL RECORDS:C47([Cash:10])
	DELETE SELECTION:C66([Cash:10])
	
	//add new record with starting cash
	CREATE RECORD:C68([Cash:10])
	[Cash:10]Cash:3:=vStartingCash
	[Cash:10]Reason:4:="Starting Cash"
	[Cash:10]Date:1:=Current date:C33
	[Cash:10]Time:2:=Current time:C178
	SAVE RECORD:C53([Cash:10])
	
	Print_CashManager
	
End if 
