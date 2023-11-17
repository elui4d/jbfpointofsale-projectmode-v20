//%attributes = {}

$OK:=False:C215

QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vFTPPath:=[Preferences:3]FTPPath:30
End if 
UNLOAD RECORD:C212([Preferences:3])

C_OBJECT:C1216($err)
$err:=New object:C1471
$err.login:=FTP_Login(vFTPPath; "POSUser"; "POSUser"; vFTP_ID; vFTP_Msg)
$err.send:=FTP_Send(vFTP_ID; vUploadFilename; "")
$err.logout:=FTP_Logout(vFTP_ID)

Case of 
	: ($err.login#0)
		ALERT:C41("Failed to login to FTP: "+String:C10($err.login))
		
	: ($err.send#0)
		ALERT:C41("Failed to send to FTP: "+String:C10($err.send))
		
	: ($err.logout#0)
		ALERT:C41("Failed to logout from FTP: "+String:C10($err.logout))
		
End case 


//Case of 
//: (FTP_Login(vFTPPath; "POSUser"; "POSUser"; vFTP_ID; vFTP_Msg)#0)
////: (FTP_Login ("209.133.73.150";"jbffinsales";"jbfs4l3s!@#";vFTP_ID;vFTP_Msg)#0)
////hid for version 9.4 on returns only so Tools Dlog wouldn't come forward
//: (FTP_Progress(-1; -1; "JBF Point of Sale"; "Uploading Sold Items…"; "*")#0)
//: (FTP_Send(vFTP_ID; vUploadFilename; ""; 1)#0)
//// Hold for Customer File
////: (FTP_Send (vFTP_ID;vFinancialFile2;"";1)#0)
//: (FTP_Logout(vFTP_ID)#0)
//Else 
//$OK:=True  //all commands executed without error
//End case 