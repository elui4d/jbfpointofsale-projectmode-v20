//Object Method:  clnd_Month
//Resets the calendar based on the selected month

If (clnd_Month{clnd_Month}#clnd_Month{0})
	$Object:=Get pointer:C304("clnd_DayText"+String:C10(clnd_LastIndex))
	OBJECT SET FONT STYLE:C166($Object->; Plain:K14:1)
	$Color:=-(Blue:K11:7+(256*745))
	OBJECT SET RGB COLORS:C628($Object->; "Blue")
	
	$LastMonth:=Find in array:C230(clnd_Month; clnd_Month{0})
	$AddMonths:=clnd_Month-$LastMonth
	clnd_SelectDate:=Add to date:C393(clnd_SelectDate; 0; $AddMonths; 0)
	CLND_Calendar_Set
End if 