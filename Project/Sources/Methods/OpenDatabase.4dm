//%attributes = {}
C_TEXT:C284($vDatabase)
C_LONGINT:C283($i; $i2; $vPosition)
C_TEXT:C284($element)

//$vDatabase:=Select folder("Please locate the Folder that contains your AEIS It databases.")
vAppPath:=aa_FindPathName(Application file:C491)
vDBPath:=vAppPath+"Database\\"

//***** Arrays to process teachers files *****
ARRAY TEXT:C222(aDatabases; 0)
ARRAY TEXT:C222(<>aDatabases2; 0)

DOCUMENT LIST:C474(vDBPath; aDatabases)

For ($i; 1; Size of array:C274(aDatabases))
	$vPosition:=Position:C15(".4dd"; aDatabases{$i})
	If ($vPosition>0)
		$i2:=Size of array:C274(<>aDatabases2)+1
		INSERT IN ARRAY:C227(<>aDatabases2; $i2)
		<>aDatabases2{$i2}:=aDatabases{$i}
	End if 
End for 

SORT ARRAY:C229(<>aDatabases2; >)

$element:=DatabaseList2("Open Database..."; -><>aDatabases2; "Database Windows"; Open table icon picture)

$element:=vDBPath+$element

If (ok=1)
	OPEN DATA FILE:C312($element)
End if 
