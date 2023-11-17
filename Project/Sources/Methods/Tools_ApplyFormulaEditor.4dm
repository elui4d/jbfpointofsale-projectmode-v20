//%attributes = {}

$myFormula:=""
EDIT FORMULA:C806(<>TablePointer->; $myFormula)
If (OK=1)
	APPLY TO SELECTION:C70(<>TablePointer->; EXECUTE FORMULA:C63($myFormula))
End if 
