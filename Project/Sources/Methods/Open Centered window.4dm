//%attributes = {}
// OPEN CENTERED WINDOW project method
// $1 – Window width 
// $2 – Window height 
// $3 – Window type (optional) 
// $4 – Window title (optional) 
$SW:=Screen width:C187\2
$SH:=(Screen height:C188\2)
$WW:=$1\2
$WH:=$2\2
Case of 
	: (Count parameters:C259=2)
		Open window:C153($SW-$WW; $SH-$WH; $SW+$WW; $SH+$WH)
		
	: (Count parameters:C259=3)
		Open window:C153($SW-$WW; $SH-$WH; $SW+$WW; $SH+$WH; $3)
	: (Count parameters:C259=4)
		Open window:C153($SW-$WW; $SH-$WH; $SW+$WW; $SH+$WH; $3; $4)
End case 