//%attributes = {}
//PM:  CLND_Select

C_TEXT:C284($varName)
C_POINTER:C301($1; $ButtonPtr; $Object)
C_LONGINT:C283($Color; $tableNum; $fieldNum; $OldLastIndex; $AddDays)

$ButtonPtr:=$1
$Object:=Get pointer:C304("clnd_DayText"+String:C10(clnd_LastIndex))  //get a pointer to the previous selected day
OBJECT SET FONT STYLE:C166($Object->; Plain:K14:1)  //reset the font style
$Color:=-(Blue:K11:7+(256*745))

OBJECT SET RGB COLORS:C628($Object->; "Blue")
//OBJECT SET RGB COLORS($Object->; UTIL_4DColorToHex($Color))

RESOLVE POINTER:C394($ButtonPtr; $varName; $tableNum; $fieldNum)  //get the name for the selected button
$OldLastIndex:=clnd_LastIndex  //index for previous selected
clnd_LastIndex:=Num:C11($varName)  //index for selcted day
$AddDays:=clnd_LastIndex-$OldLastIndex  //days between old and new
clnd_SelectDate:=Add to date:C393(clnd_SelectDate; 0; 0; $AddDays)  //set the selected date
$Object:=Get pointer:C304("clnd_DayText"+String:C10(clnd_LastIndex))  //get a pointer to new day text object
OBJECT SET FONT STYLE:C166($Object->; clnd_SelectStyle)  //set selected font style
$Color:=-(clnd_SelectColor+(256*745))

OBJECT SET RGB COLORS:C628($Object->; "White")
//OBJECT SET RGB COLORS($Object->; UTIL_4DColorToHex($Color))

ACCEPT:C269