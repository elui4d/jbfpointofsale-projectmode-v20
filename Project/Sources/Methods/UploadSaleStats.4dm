//%attributes = {}
//  `C_LONGINT(vFTP_ID)
//vAppPath:=aa_FindPathName (Application file)
//vLUPath:=vAppPath+"Database\\"
//vLUVersionFile:="Statistics.txt"
//
//  `If (Test path name(vLUPath+vLUVersionFile)=Is a document )
//  `DELETE DOCUMENT(vLUPath+vLUVersionFile)
//  `End if 
//
//  `Create File
//
//
//  `***************************Download Version File
//
//$OK:=False
//Case of 
//
//: (FTP_Login ("208.70.184.89/httpdocs/";"newhouse1";"gsp111";vFTP_ID)#0)
//  `: (FTP_Login("ftp.4d.com";"anonymous";"dbody@aol.com";vFTP_ID;vFTP_Msg)#0)
//: (FTP_Progress (-1;-1;"Progress window";"Getting requested file…";"Cancel")#0)
//  `: (FTP_Receive (vFTP_ID;vLUVersionFile;vLUPath+vLUVersionFile;1)#0)
//: (FTP_Send (vFTP_ID;vLUPath+vLUVersionFile;"/httpdocs/Stats/";1)#0)
//
//: (FTP_Logout (vFTP_ID)#0)
//Else 
//$OK:=True  `all commands executed without error
//End case 

//$OK:=False
//Case of 
//: (FTP_Login ("ftp.4d.com";"anonymous";vEmailID;vFTP_ID;vFTP_Msg)#0)
//: (FTP_Progress (-1;-1;"Progress window";"Getting requested file…";"Cancel")#0)
//: (FTP_Send (vFTP_ID;"My Hard Drive:Documents:July Sales Report";"/pub/reports/";1)#0)
//: (FTP_Logout (vFTP_ID)#0)
//Else 
//$OK:=True  `all commands executed without error
//End case




//***************************Get Version from file
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
