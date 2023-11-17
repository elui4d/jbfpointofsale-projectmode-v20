Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
		vDefaultPayRate:=[Preferences:3]DefaultPayRate:12
		UNLOAD RECORD:C212([Preferences:3])
		
		C_BOOLEAN:C305(vPaidJob)
		C_REAL:C285(vPayRate)
		C_DATE:C307(vDate)
		
		vPayRate:=vDefaultPayRate
		vShiftName:=""
		vCategory:=""
		//vDate:=""
		vScheduledTime:=""
		vPaidJob:=False:C215
		
		
		
End case 