//Méthode formulaire:  CLND_CalendarSet

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		CLND_Prefs_Set(Sunday:K10:19; Black:K11:16; Bold:K14:2)
		CLND_Calendar_Set
End case 