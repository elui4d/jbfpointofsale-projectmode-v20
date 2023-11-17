//%attributes = {}
//PM:  CLND_Calendar_Set


ARRAY INTEGER:C220(clnd_Year; 7)


C_DATE:C307($FirstDayDate)
C_LONGINT:C283($DateDayNum; $DayNum; $NumDays; $StartOffset; $WkDayNum; $MonthNum; $YearNum; $Color)

C_LONGINT:C283($NbYear)
C_LONGINT:C283($StartOffset)

$DateDayNum:=Day of:C23(clnd_SelectDate)  //get the day number for the selected date
$FirstDayDate:=Add to date:C393(clnd_SelectDate; 0; 0; (1-$DateDayNum))  //get the date of the first day
$NumDays:=Day of:C23(Add to date:C393(clnd_SelectDate; 0; 1; -1))  //get the number of days in the month


$MonthNum:=Month of:C24(clnd_SelectDate)  //get the month
$YearNum:=Year of:C25(clnd_SelectDate)  //get the year
// Determines the first and last boxes used to display this month.
If (<>clnd_DayMonthYr)
	$DayNum:=Day number:C114(Date:C102("1"+"/"+String:C10($MonthNum)+"/"+String:C10($YearNum)))
	$NumDays:=Day of:C23(Date:C102("1/"+String:C10($MonthNum+1)+"/"+String:C10($YearNum))-1)  //get the number of days in the month
Else 
	$DayNum:=Day number:C114(Date:C102(String:C10($MonthNum)+"/"+"1"+"/"+String:C10($YearNum)))
	$NumDays:=Day of:C23(Date:C102(String:C10(<>clnd_aMonths+1)+"/1/"+String:C10(<>clnd_Year))-1)  //get the number of days in the month
End if 


//determines the offset
$StartOffset:=8-clnd_StartWeekOn

If ($StartOffset=7)
	$StartOffset:=0
End if 

clnd_Offset:=$DayNum+$StartOffset-1

If (clnd_Offset>=7)
	clnd_Offset:=clnd_Offset-7
End if 


//fill the week day labels based on cwStartWeekOn
ARRAY TEXT:C222($Labels; 7)
LIST TO ARRAY:C288("Jours_Abrégés"; $Labels)

$WkDayNum:=clnd_StartWeekOn

For ($Loop; 1; 7)
	$LabelPtr:=Get pointer:C304("clnd_WeekDay"+String:C10($Loop))
	$LabelPtr->:=$Labels{$WkDayNum}
	$WkDayNum:=$WkDayNum+1
	If ($WkDayNum>7)
		$WkDayNum:=1
	End if 
End for 

//hide/show the correct calendar squares
For ($Loop; 1; 42)
	$ButtonPtr:=Get pointer:C304("btn_Day"+String:C10($Loop))
	$DayTextPtr:=Get pointer:C304("clnd_DayText"+String:C10($Loop))
	$DayNum:=$Loop-clnd_Offset
	If (($DayNum<=0) | ($DayNum>$NumDays))
		$DayText:=""
	Else 
		$DayText:=String:C10($DayNum)
	End if 
	$DayTextPtr->:=$DayText
	If ($DayText="")
		OBJECT SET VISIBLE:C603($ButtonPtr->; False:C215)
	Else 
		OBJECT SET VISIBLE:C603($ButtonPtr->; True:C214)
	End if 
End for 

//Selected the current month in the popup
clnd_Month:=Month of:C24(clnd_SelectDate)
clnd_Month{0}:=clnd_Month{clnd_Month}

//fill the year popup 3 years before and after the current year
$Year:=Year of:C25(clnd_SelectDate)
For ($Loop; 1; 7)
	clnd_Year{$Loop}:=$Year-4+$Loop
End for 

clnd_Year:=4
clnd_Year{0}:=clnd_Year{clnd_Year}

//select the current date
clnd_LastIndex:=Day of:C23(clnd_SelectDate)+clnd_Offset
$Object:=Get pointer:C304("clnd_DayText"+String:C10(clnd_LastIndex))
$Button:=Get pointer:C304("btn_Day"+String:C10(clnd_LastIndex))
$Button->:=1
OBJECT SET FONT STYLE:C166($Object->; clnd_SelectStyle)
$Color:=-(clnd_SelectColor+(256*745))

OBJECT SET RGB COLORS:C628($Object->; "Grey")
//OBJECT SET RGB COLORS($Object->; UTIL_4DColorToHex($Color))

