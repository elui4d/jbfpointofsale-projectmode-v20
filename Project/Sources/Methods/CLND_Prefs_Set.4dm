//%attributes = {}
//PM:  CLND_Prefs_Set


$StartWeekDay:=$1
$SelectColor:=$2
$SelectStyle:=$3

If ($StartWeekDay#-1)
	clnd_StartWeekOn:=$StartWeekDay
End if 
If ($SelectColor#-1)
	clnd_SelectColor:=$SelectColor
End if 
If ($SelectStyle#-1)
	clnd_SelectStyle:=$SelectStyle
End if 
