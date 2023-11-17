//%attributes = {}


vAppPath:=aa_FindPathName(Application file:C491)
//vFinancialFile1:=vAppPath+"Files\\FinancialModuleFile.txt"
//vFinancialFile2:=vAppPath+"Files\\CustomerModuleFile.txt"
vFinancialFile1:=vFilename1
vFinancialFile2:=vFilename2
$OK:=False:C215

C_OBJECT:C1216($err)
$err:=New object:C1471
$err.login:=FTP_Login("kansas.franconnect.net"; "jbffinsales"; "jbfs4l3s!@#"; vFTP_ID; vFTP_Msg)
$err.send:=FTP_Send(vFTP_ID; vFinancialFile1; "")
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

//: (FTP_Login("kansas.franconnect.net"; "jbffinsales"; "jbfs4l3s!@#"; vFTP_ID; vFTP_Msg)#0)
////(FTP_Login ("209.133.73.150";"jbffinsales";"jbfs4l3s!@#";vFTP_ID;vFTP_Msg)#0)
////(FTP_Login ("23.29.54.4";"jbfsftp";"jb7s7tp!@#";vFTP_ID;vFTP_Msg)#0)

//: (FTP_Progress(-1; -1; "JBF Point of Sale"; "Sending Financial Module…"; "*")#0)
//: (FTP_Send(vFTP_ID; vFinancialFile1; ""; 1)#0)
//// Hold for Customer File
////:(FTP_Send (vFTP_ID;vFinancialFile2;"";1)#0)
//: (FTP_Logout(vFTP_ID)#0)
//Else 
//$OK:=True  //all commands executed without error
//End case 

















//  //Live Update
//
//vLUPath:=<>EXERptPath+"LiveUpdate\\"
//vLUVersionFile:="Version.txt"
//vLUInstallerFile:="LiveUpdate.exe"
//
//If (Test path name(vLUPath+vLUVersionFile)=Is a document)
//DELETE DOCUMENT(vLUPath+vLUVersionFile)
//End if 
//
//If (Test path name(vLUPath+vLUInstallerFile)=Is a document)
//DELETE DOCUMENT(vLUPath+vLUInstallerFile)
//End if 
//  //*****************************Delete files
//
//
//  //***************************Download Version File
//$OK:=False
//Case of 
//
//: (FTP_Login ("www.aeisitonline.com";"newhouse";"gsp111";vFTP_ID)#0)
//: (FTP_Progress (-1;-1;"AEIS IT Live Update";"Checking for program updates…";"*")#0)
//: (FTP_Receive (vFTP_ID;vLUVersionFile;vLUPath+vLUVersionFile;1)#0)
//: (FTP_Logout (vFTP_ID)#0)
//Else 
//$OK:=True  //all commands executed without error
//End case 
//
//
//  //***************************Get Version from file
//C_TEXT(vUpdateVersion)
//vUpdateVersion:=""
//If ($OK=True)
//gDocRef:=Open document(vLUPath+vLUVersionFile;"TXT")
//RECEIVE PACKET(gDocRef;vUpdateVersion;5)
//CLOSE DOCUMENT(gDocRef)
//Else 
//$Msg:="You were unable to connect with the AEIS IT server to check for a new version.  G"+"o to aeisitonline.com to check for program updates."
//gCenterWind:=True
//gUpperWind:=True
//$Stop:=True
//Alert2($Msg;<>Stop_Icon)
//
//vUpdateVersion:=""
//End if 
//
//If (vUpdateVersion#"") & (vUpdateVersion#<>DB_Version)
//
//  //*****************************Display Prompt
//C_TEXT($Msg)
//
//MESSAGES OFF
//gCenterwind:=False
//gUpperWind:=True
//CenterWindow(346;171;-1986;"")
//DIALOG([Constants];"LiveUpdateDlog")
//CLOSE WINDOW
//
//If (OK=1)
//  //***************************Download LiveUpdate Installer File
//$OK:=False
//Case of 
//
//: (FTP_Login ("www.aeisitonline.com";"newhouse";"gsp111";vFTP_ID)#0)
//: (FTP_Progress (-1;-1;"AEIS IT Live Update";"Downloading updates...";"*")#0)
//: (FTP_Receive (vFTP_ID;vLUInstallerFile;vLUPath+vLUInstallerFile;1)#0)
//: (FTP_Logout (vFTP_ID)#0)
//Else 
//$OK:=True
//End case 
//
//
//End if 
//
//End if 