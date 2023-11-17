Case of 
	: (Form event code:C388=On Load:K2:1)
		
		vConsignorNumber:=""
		vCheckInConsignorNumber:=""
		vCheckInFirstName:=""
		vCheckInLastName:=""
		vconsignorcomments:=""
		
		OBJECT SET ENABLED:C1123(btnClockIn; False:C215)
		OBJECT SET ENABLED:C1123(btnClockOut; False:C215)
		OBJECT SET ENABLED:C1123(btnCompleted; False:C215)
		
		//DISABLE BUTTON(btnNewShift)
		
		ARRAY TEXT:C222(aTimeIn; 0)
		ARRAY TEXT:C222(aTimeOut; 0)
		ARRAY DATE:C224(aShiftDate; 0)
		ARRAY TEXT:C222(aShiftTime; 0)
		ARRAY TEXT:C222(aShift; 0)
		ARRAY BOOLEAN:C223(aCompleted; 0)
		
		
End case 