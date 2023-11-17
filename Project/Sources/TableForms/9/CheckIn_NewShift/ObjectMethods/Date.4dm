Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		
		
		ARRAY TEXT:C222(clnd_Month; 12)
		LIST TO ARRAY:C288("mois"; clnd_Month)
		
		CLND_DlgDay_Open(->[Volunteers:9]Date:6)
		
		vDate:=clnd_SelectDate
		
		
		//POST KEY(Tab Key )
		
		
End case 

