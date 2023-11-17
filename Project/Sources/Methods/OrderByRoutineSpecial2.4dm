//%attributes = {}

//This special order by routine is for sorting Alpha values numericlly

// Declare parameters
C_POINTER:C301($1; $pTable)
C_POINTER:C301($2; $pObject)
C_LONGINT:C283($3; $LFormEvent)
C_POINTER:C301($4; $pField)
C_POINTER:C301($5)  // Pointer to additional field
C_POINTER:C301($6)  // Pointer to additional field

// Declare local variables
C_BOOLEAN:C305($fAscending)
C_LONGINT:C283($LItem)
C_LONGINT:C283($LNumberOfParameters)

$LNumberOfParameters:=Count parameters:C259

// Reassign for readability
If ($LNumberOfParameters>0)
	$pTable:=$1
Else 
	$pTable:=Current form table:C627
End if 

OBJECT SET FONT STYLE:C166(*; "OrderBy@"; Plain:K14:1)  // Set labels to default to plain

If ($LNumberOfParameters>1)  // More than 1 parameter, we are coming from a column header button
	$fAscending:=True:C214
	$pObject:=$2
	$LFormEvent:=$3
	$pField:=$4
	If ($LFormEvent=On Long Click:K2:37)
		$LItem:=Pop up menu:C542("Ascending;Descending")
		If ($LItem=2)
			$fAscending:=False:C215
		End if 
	End if 
	If ($fAscending)
		Case of 
			: ($LNumberOfParameters=4)
				//ORDER BY($pTable->;$pField->)
				
				ORDER BY FORMULA:C300([Volunteers:9]; ([Volunteers:9]Consignor Number:1); >)
			: ($LNumberOfParameters=5)
				ORDER BY:C49($pTable->; $pField->; $5->)
			: ($LNumberOfParameters=6)
				ORDER BY:C49($pTable->; $pField->; $5->; $6->)
		End case 
	Else 
		Case of 
			: ($LNumberOfParameters=4)
				//ORDER BY($pTable->;$pField->;<)
				ORDER BY FORMULA:C300([Volunteers:9]; ([Volunteers:9]Consignor Number:1); <)
			: ($LNumberOfParameters=5)
				ORDER BY:C49($pTable->; $pField->; <; $5->; <)
			: ($LNumberOfParameters=6)
				ORDER BY:C49($pTable->; $pField->; <; $5->; <; $6->; <)
		End case 
	End if 
	OBJECT SET FONT STYLE:C166($pObject->; Bold:K14:2)  // Set column bold for column clicked
Else 
	ORDER BY:C49($pTable->)
End if 
CLEAR SET:C117("UserSet")
