//%attributes = {}
//<<  PM:  CLND_Hour_Select


C_TEXT:C284($varName)
C_POINTER:C301($1; $ButtonPtr)
C_LONGINT:C283($Color; $tableNum; $fieldNum)

$ButtonPtr:=$1

OBJECT SET FONT STYLE:C166(*; "Min@"; Plain:K14:1)  //reset the font style"
$Color:=-(Blue:K11:7+(256*745))

OBJECT SET RGB COLORS:C628(*; "Min@"; "Blue")

RESOLVE POINTER:C394($ButtonPtr; $varName; $tableNum; $fieldNum)  //get the name for the selected button
$objectNumber:=Num:C11(Substring:C12($varName; Length:C16($varName)-1))-1
Clnd_SelectedHour:=Time:C179(clnd_Hour{clnd_Hour})+Time:C179(Time string:C180($objectNumber*5*60))


ACCEPT:C269

