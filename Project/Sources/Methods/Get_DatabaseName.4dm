//%attributes = {}
// Long name to file name Project Method
// Long name to file name ( String ) -> String
// Long name to file name ( Long file name ) -> file name

C_TEXT:C284($1; $0)
C_LONGINT:C283($viLen; $viPos; $viChar)
C_TEXT:C284($viDirSymbol)

$viDirSymbol:="\\"

$viLen:=Length:C16($1)
$viPos:=0
For ($viChar; $viLen; 1; -1)
	If (Substring:C12($1; $viChar; 1)=$viDirSymbol)
		$viPos:=$viChar
		$viChar:=0
	End if 
End for 

If ($viPos>0)
	$0:=Substring:C12($1; $viPos+1)
Else 
	$0:=$1
End if 