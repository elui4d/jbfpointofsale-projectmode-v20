//%attributes = {}

vCCAmount:=0
vCCType:=""

If (Variable3>0)
	vCCAmount:=Variable3
	vCCType:="Visa"
	ccTransax_Code
End if 

If (Variable4>0)
	vCCAmount:=Variable4
	vCCType:="MasterCard"
	ccTransax_Code
End if 


If (Variable5>0)
	vCCAmount:=Variable5
	vCCType:="Discover"
	ccTransax_Code
End if 


If (Variable6>0)
	vCCAmount:=Variable6
	vCCType:="AMEX"
	ccTransax_Code
End if 

If (Variable9>0)
	vCCAmount:=Variable9
	vCCType:="Other"
	ccTransax_Code
End if 