
QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=vConsignorNumber; *)
QUERY:C277([Volunteers:9];  & ; [Volunteers:9]Shift Name:4=aShift{aShift}; *)
QUERY:C277([Volunteers:9];  & ; [Volunteers:9]Date:6=aShiftDate{aShiftDate}; *)
QUERY:C277([Volunteers:9];  & ; [Volunteers:9]Scheduled Time:7=aShiftTime{aShiftTime})


If (Records in selection:C76([Volunteers:9])=1)
	OBJECT SET ENABLED:C1123(btnClockIn; True:C214)
	OBJECT SET ENABLED:C1123(btnClockOut; False:C215)
	OBJECT SET ENABLED:C1123(btnCompleted; True:C214)
	
	vConsignorComments:=[Volunteers:9]Comments:11
	
	If ([Volunteers:9]In Time:8#"")
		OBJECT SET ENABLED:C1123(btnClockIn; False:C215)
		OBJECT SET ENABLED:C1123(btnClockOut; True:C214)
		OBJECT SET ENABLED:C1123(btnCompleted; True:C214)
	End if 
	If ([Volunteers:9]Out Time:9#"")
		OBJECT SET ENABLED:C1123(btnClockIn; False:C215)
		OBJECT SET ENABLED:C1123(btnClockOut; False:C215)
		OBJECT SET ENABLED:C1123(btnCompleted; False:C215)
	End if 
	
	If ([Volunteers:9]Complete:10=True:C214)
		OBJECT SET ENABLED:C1123(btnClockIn; False:C215)
		OBJECT SET ENABLED:C1123(btnClockOut; False:C215)
		OBJECT SET ENABLED:C1123(btnCompleted; False:C215)
	End if 
	
Else 
	OBJECT SET ENABLED:C1123(btnClockIn; False:C215)
	OBJECT SET ENABLED:C1123(btnClockOut; False:C215)
	OBJECT SET ENABLED:C1123(btnCompleted; False:C215)
	
End if 

