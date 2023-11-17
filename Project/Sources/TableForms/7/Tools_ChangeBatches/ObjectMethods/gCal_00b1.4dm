$date:=Add to date:C393(gCal_FirstInMonth_d; 0; 1; 7)
gCal_Monthof_l:=Month of:C24($date)
gCal_Yearof_l:=Year of:C25($date)
gCal_MonthYear_t:=gCal_MonthName_at{gCal_Monthof_l}+" "+String:C10(gCal_Yearof_l)
gCal_FirstInMonth_d:=Add to date:C393(!00-00-00!; gCal_Yearof_l; gCal_Monthof_l; 1)
While (Day number:C114(gCal_FirstInMonth_d)#Sunday:K10:19)
	gCal_FirstInMonth_d:=gCal_FirstInMonth_d-1
End while 

$date:=gCal_FirstInMonth_d
For ($lig; 1; 5)
	For ($col; 1; 7)
		$ptr:=Get pointer:C304("gCal_"+String:C10($lig)+String:C10($col))
		OBJECT SET TITLE:C194($ptr->; String:C10(Day of:C23($date)))
		If (Month of:C24($date)#gCal_Monthof_l)
			OBJECT SET ENABLED:C1123($ptr->; False:C215)
		Else 
			OBJECT SET ENABLED:C1123($ptr->; True:C214)
		End if 
		$date:=$date+1
	End for 
End for 