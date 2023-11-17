//%attributes = {}
//Method: CLND_Init

// Figures out the date system for the Calendar routines.
//   US System (mm/jj/aa) : !02/01/02! = 1st Feb 02
//   Euro System  (jj/mm/aa) :  !02/01/02! = 2nd Jan 02

<>clnd_DayMonthYr:=(Day of:C23(Date:C102("02/01/02"))=2)

// Set up an array of month names.
ARRAY TEXT:C222(clnd_Month; 12)
LIST TO ARRAY:C288("mois"; clnd_Month)


<>clnd_aMonths:=Month of:C24(Current date:C33)  // Set the current month.

<>clnd_DateClicked:=Current date:C33
<>clnd_Day:=Day of:C23(<>clnd_DateClicked)
<>clnd_aMonths:=Month of:C24(<>clnd_DateClicked)
<>clnd_Year:=Year of:C25(<>clnd_DateClicked)

<>clnd_SelectedObjectPtr:=<>clnd_NilPtr

$Size:=24
ARRAY TEXT:C222(clnd_Hour; $Size)
For ($i; 1; $Size)
	clnd_Hour{$i}:=String:C10($i-1; "00")+":00"
End for 
