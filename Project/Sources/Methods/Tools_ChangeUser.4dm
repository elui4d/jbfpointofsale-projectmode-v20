//%attributes = {}
vSelectedUser:=<>User
vSelectedComputer:=<>Computer
vSelectedDiscount:=<>Discount

Open Centered window(370; 170; Movable dialog box:K34:7; "Sign In")
DIALOG:C40([Preferences:3]; "LogIn_Test2")
CLOSE WINDOW:C154
MAXIMIZE WINDOW:C453

If (ok=1)
	
	<>User:=vSelectedUser
	<>Computer:=vSelectedComputer
	<>Discount:=vSelectedDiscount
	
	SET WINDOW TITLE:C213(WindowTitle)
	Start_Dialogs
	MAXIMIZE WINDOW:C453
	SET WINDOW TITLE:C213(WindowTitle)
	
	Start_Batches
	
End if 