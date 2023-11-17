//v12
//TMPL_Assistant (2004)
If (Shift down:C543)
	TRACE:C157
End if 

CLND_Init

C_TEXT:C284(vSelectedUser; vSelectedComputer)
C_REAL:C285(vSelectedDiscount)

<>vDataBaseName:=Get_DatabaseName(Data file:C490)

Open Centered window(370; 170; Movable dialog box:K34:7; "Sign In")
DIALOG:C40([Preferences:3]; "LogIn_Test2")
CLOSE WINDOW:C154
MAXIMIZE WINDOW:C453

<>User:=vSelectedUser
<>Discount:=vSelectedDiscount
<>Version:="v10.0p-060123"
<>vDataBaseName:=Get_DatabaseName(Data file:C490)

If (OK=0)
	QUIT 4D:C291
End if 

Case of 
	: (<>User="Jason Miller")
		//show for devepment
		SHOW MENU BAR:C431
		
	Else 
		//Hide for user
		HIDE MENU BAR:C432
End case 

ALL RECORDS:C47([Dialogs:7])
If (Records in selection:C76([Dialogs:7])=0)
	CREATE RECORD:C68([Dialogs:7])
	SAVE RECORD:C53([Dialogs:7])
	UNLOAD RECORD:C212([Dialogs:7])
End if 

QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])=0)
	Preferences
Else 
	<>Computer:=[Preferences:3]Computer:34
End if 

UNLOAD RECORD:C212([Preferences:3])

Start_Dialogs
MAXIMIZE WINDOW:C453