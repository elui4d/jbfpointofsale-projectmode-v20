//Object Method:  clnd_Year
//Resets the calendar based on the selected year

If (clnd_Year{clnd_Year}#clnd_Year{0})
	$Object:=Get pointer:C304("clnd_DayText"+String:C10(clnd_LastIndex))
	OBJECT SET FONT STYLE:C166($Object->; Plain:K14:1)
	$Color:=-(Blue:K11:7+(256*745))
	OBJECT SET RGB COLORS:C628($Object->; "Blue")
	
	$LastYear:=Find in array:C230(clnd_Year; clnd_Year{0})
	$AddYears:=clnd_Year-$LastYear
	clnd_SelectDate:=Add to date:C393(clnd_SelectDate; $AddYears; 0; 0)
	CLND_Calendar_Set
End if 