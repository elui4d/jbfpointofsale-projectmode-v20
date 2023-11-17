//%attributes = {}
QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vFTPPath:=[Preferences:3]FTPPath:30
End if 
UNLOAD RECORD:C212([Preferences:3])

$OK:=False:C215

C_OBJECT:C1216($err)
$err:=New object:C1471
$err.login:=FTP_Login(vFTPPath; "SaleAudits"; "SaleAudits"; vFTP_ID; vFTP_Msg)
$err.send:=FTP_Send(vFTP_ID; vPOSUploadFilename; "")
$err.logout:=FTP_Logout(vFTP_ID)

Case of 
	: ($err.login#0)
		//ALERT("Failed to login to FTP: "+String($err.login))
		
	: ($err.send#0)
		//ALERT("Failed to send to FTP: "+String($err.send))
		
	: ($err.logout#0)
		//ALERT("Failed to logout from FTP: "+String($err.logout))
		
End case 

//Case of 
//: (FTP_Login(vFTPPath; "SaleAudits"; "SaleAudits"; vFTP_ID; vFTP_Msg)#0)
////Hide Dialog
////: (FTP_Progress (-1;-1;"JBF Point of Sale";"Uploading Sold Items…";"*")#0)
//: (FTP_Send(vFTP_ID; vPOSUploadFilename; ""; 0)#0)

//: (FTP_Logout(vFTP_ID)#0)
//Else 
//$OK:=True  //all commands executed without error
//End case 