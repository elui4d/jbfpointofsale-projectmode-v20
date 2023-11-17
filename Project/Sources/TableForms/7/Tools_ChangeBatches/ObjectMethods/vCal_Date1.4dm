
Case of 
	: (Form event code:C388=On Unload:K2:2)
		ARRAY TEXT:C222(gCal_MonthName_at; 0)
		
	: (Form event code:C388=On Load:K2:1)
		C_POINTER:C301(gCal_Date_pt)
		
		If ([Point of Sale:5]Sold Date:5=!00-00-00!)
			vCal_Date1:=!00-00-00!
		Else 
			vCal_Date1:=[Point of Sale:5]Sold Date:5
		End if 
		
		If (Undefined:C82(Self:C308->))
			C_DATE:C307(vCal_Date1)
			vCal_Date1:=!00-00-00!
		End if 
		C_LONGINT:C283(gCal_Yearof_l; gCal_Monthof_l)
		ARRAY TEXT:C222(gCal_MonthName_at; 12)
		gCal_MonthName_at{1}:="January"
		gCal_MonthName_at{2}:="February"
		gCal_MonthName_at{3}:="March"
		gCal_MonthName_at{4}:="April"
		gCal_MonthName_at{5}:="May"
		gCal_MonthName_at{6}:="June"
		gCal_MonthName_at{7}:="July"
		gCal_MonthName_at{8}:="August"
		gCal_MonthName_at{9}:="September"
		gCal_MonthName_at{10}:="October"
		gCal_MonthName_at{11}:="November"
		gCal_MonthName_at{12}:="December"
		
		OBJECT SET VISIBLE:C603(*; "gCal_@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "gCal_BtOpen"; True:C214)
		OBJECT SET VISIBLE:C603(*; "gCal_BtClose"; False:C215)
		
	: (Form event code:C388=On Getting Focus:K2:7)
		gCal_Date_pt:=Self:C308
		If (vCal_Date1=!00-00-00!)
			gCal_Monthof_l:=Month of:C24(Current date:C33)
			gCal_Yearof_l:=Year of:C25(Current date:C33)
		Else 
			gCal_Monthof_l:=Month of:C24(gCal_Date_pt->)
			gCal_Yearof_l:=Year of:C25(gCal_Date_pt->)
		End if 
		gCal_MonthYear_t:=gCal_MonthName_at{gCal_Monthof_l}+" "+String:C10(gCal_Yearof_l)
		gCal_FirstInMonth_d:=Add to date:C393(!00-00-00!; gCal_Yearof_l; gCal_Monthof_l; 1)
		While (Day number:C114(gCal_FirstInMonth_d)#Sunday:K10:19)
			gCal_FirstInMonth_d:=gCal_FirstInMonth_d-1
		End while 
		
		$date:=gCal_FirstInMonth_d
		For ($line; 1; 5)
			For ($col; 1; 7)
				$ptr:=Get pointer:C304("gCal_"+String:C10($line)+String:C10($col))
				OBJECT SET TITLE:C194($ptr->; String:C10(Day of:C23($date)))
				If (Month of:C24($date)#gCal_Monthof_l)
					OBJECT SET ENABLED:C1123($ptr->; False:C215)
				Else 
					OBJECT SET ENABLED:C1123($ptr->; True:C214)
				End if 
				
				$date:=$date+1
			End for 
		End for 
		
		//Commented this out so the caledar pops up where positioned on the form
		//GET OBJECT RECT(Self->;$g;$h;$d;$b)
		//GET OBJECT RECT(*;"gCal_@";$g2;$h2;$d2;$b2)
		//MOVE OBJECT(*;"gCal_@";($g-$g2);($h-$h2+20))
		
		OBJECT SET VISIBLE:C603(*; "gCal_@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "gCal_BtOpen"; False:C215)
		OBJECT SET VISIBLE:C603(*; "gCal_BtClose"; True:C214)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		
		OBJECT SET VISIBLE:C603(*; "gCal_@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "gCal_BtOpen"; True:C214)
		OBJECT SET VISIBLE:C603(*; "gCal_BtClose"; False:C215)
		
		
End case 