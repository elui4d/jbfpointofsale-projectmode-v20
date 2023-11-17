//%attributes = {}
//Méthode :  CLND_DlgDay_open



C_POINTER:C301($1)
C_DATE:C307($2)

C_LONGINT:C283($mouseX; $mouseY; $mouseButton; $left; $top; $right; $bottom)
C_LONGINT:C283($DialogW; $DialogH; $DialogL; $DialogR; $DialogT; $DialogB)


clnd_SelectDate:=$1->

GET MOUSE:C468($mouseX; $mouseY; $mouseButton; *)
SCREEN COORDINATES:C438($left; $top; $right; $bottom)

$DialogW:=176
$DialogH:=206

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

If (clnd_SelectDate=!00-00-00!)
	
	If (Count parameters:C259=2)
		clnd_SelectDate:=$2
	Else 
		clnd_SelectDate:=Current date:C33(*)
	End if 
End if 

DIALOG:C40([INTERFACE:8]; "CLND_CalendarSet")

If (OK=1)
	$1->:=clnd_SelectDate
End if 