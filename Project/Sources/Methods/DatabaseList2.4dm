//%attributes = {}
// Project Method: ChoiceList 2(dialog title; ->string or text array; ...
//                      ... {help topic}; {ICON/cicn number}) -> selected element

C_TEXT:C284($1; $3; $windowTitle)
C_POINTER:C301($2)

//C_LONGINT($0;$4;$position;$i)
C_LONGINT:C283($4; $position; $i)

C_PICTURE:C286(vDlogIcon)
C_TEXT:C284($0)

vDlogTitle:=$1

$position:=Position:C15("|"; vDlogTitle)


//ARRAY TEXT(aChoices;Size of array(<>aUserTables))
//ARRAY STRING(80;aOptions;Size of array(<>aUserTables))  ` You can use aOptions a
//For ($i;1;Size of array(<>aUserTables))
//aChoices{$i}:=Table name(<>aUserTables{$i})
//End for 
ARRAY TEXT:C222(aChoices; Size of array:C274(<>aDatabases2))
COPY ARRAY:C226(<>aDatabases2; aChoices)

vDlogHelp:=""
If (Count parameters:C259>=3)
	vDlogHelp:=$3
End if 

vDlogIcon:=vDlogIcon*0  // So we can check the size after the next call and On Load.
If (Count parameters:C259=4)
	GET PICTURE FROM LIBRARY:C565($4; vDlogIcon)
End if 

//CenterFormWindow (->[Constants];"ChoiceList";Movable dialog box ;$windowTitle)
//SetMenuBar (Modal on )  ` Turn off all menus.
Open Centered window(400; 350; Movable dialog box:K34:7; "")
DIALOG:C40([Dialogs:7]; "databaselist")
CLOSE WINDOW:C154
//SetMenuBar (Modal off )  ` Restore the menus.

If (OK=1)
	$0:=aChoices{aChoices}
Else 
	$0:=""
End if 

ARRAY TEXT:C222(aChoices; 0)  // Clear the array.