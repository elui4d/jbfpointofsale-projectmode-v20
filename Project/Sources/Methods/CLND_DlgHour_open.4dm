//%attributes = {}
//<<  PM:  CLND_OpenDlg

//<<  Created  : 7/26/99 for ACI US by Steve Hussey,

C_POINTER:C301($1)
C_TIME:C306($2)

C_LONGINT:C283($mouseX; $mouseY; $mouseButton; $left; $top; $right; $bottom)
C_LONGINT:C283($DialogW; $DialogH; $DialogL; $DialogR; $DialogT; $DialogB)

Clnd_SelectedHour:=$1->

GET MOUSE:C468($mouseX; $mouseY; $mouseButton; *)
SCREEN COORDINATES:C438($left; $top; $right; $bottom)

$DialogW:=105
$DialogH:=125

If (($mouseX+$DialogW)>$right)
	$DialogL:=$right-$DialogW
	$DialogR:=$right
Else 
	$DialogL:=$mouseX
	$DialogR:=$mouseX+$DialogW
End if 
If (($mouseY+$DialogH)>$bottom)
	$DialogT:=$bottom-$DialogH
	$DialogB:=$bottom
Else 
	$DialogT:=$mouseY
	$DialogB:=$mouseY+$DialogH
End if 

$WinID:=Open window:C153($DialogL; $DialogT; $DialogR; $DialogB; 1; ""; "CLND_Close")

If (Clnd_SelectedHour=?00:00:00?)
	If (Count parameters:C259=2)
		Clnd_SelectedHour:=$2
	Else 
		Clnd_SelectedHour:=Current time:C178(*)
	End if 
End if 

DIALOG:C40([INTERFACE:8]; "CLND_HourSet")


$1->:=Clnd_SelectedHour