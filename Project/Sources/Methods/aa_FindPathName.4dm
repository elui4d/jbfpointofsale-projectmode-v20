//%attributes = {}
// aa_FindPathName
// Long name to path name Project Name
// Long name to path name ( String ) -> String
// Long name to path name ( Long file name ) -> Path name

C_TEXT:C284($1; $0)
C_TEXT:C284($viDirSymbol)
C_TEXT:C284($vsDirSymbol)
C_LONGINT:C283($viLen; $viPos; $viChar)

$viDirSymbol:="\\"
$viLen:=Length:C16($1)
$viPos:=0
For ($viChar; $viLen; 1; -1)
	If ($1[[$viChar]]=$viDirSymbol)
		
		$viPos:=$viChar
		$viChar:=0
	End if 
End for 
If ($viPos>0)
	$0:=Substring:C12($1; 1; $viPos)
Else 
	$0:=$1
End if 

//If (<>vbDebugOn)  ` Set this variable to True or False in the On Startup database method
//If ($0="")
//TRACE
//End if 
//End if 

