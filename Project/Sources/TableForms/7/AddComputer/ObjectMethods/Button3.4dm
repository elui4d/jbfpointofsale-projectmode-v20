C_COLLECTION:C1488($errors)
C_OBJECT:C1216($computerSelection)
C_TEXT:C284($computerName)
C_TEXT:C284($errorMessage)

$computerName:=Uppercase:C13(Form:C1466.computerName)
$errors:=New collection:C1472

// Check for blank name
If (Form:C1466.computerName="")
	$errors.push("Computer name cannot be blank.")
End if 

// Check whether name already exists
$computerSelection:=ds:C1482.Computer.query("Name = :1"; $computerName)
If ($computerSelection.length>0)
	$errors.push("Computer name already exists.")
End if 

// If errors, display alert
If ($errors.length>0)
	For each ($message; $errors)
		$errorMessage:=$errorMessage+$message+"\n"
	End for each 
	ALERT:C41($errorMessage)
Else 
	// Save computer name to [Computer] table
	$newComputer:=ds:C1482.Computer.new()
	$newComputer.Name:=$computerName
	$saveStatus:=$newComputer.save()
	
	If ($saveStatus.success=False:C215)
		ALERT:C41("Failed to save computer record: "+$saveStatus.statusText)
	Else 
		ACCEPT:C269
	End if 
	
End if 