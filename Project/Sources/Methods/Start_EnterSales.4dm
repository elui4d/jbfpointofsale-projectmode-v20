//%attributes = {}


//$windowNumber:=Open form window([Batch];"Input";Standard form window ;On the Left ;At the Top )
FORM SET INPUT:C55([Point of Sale:5]; "Input")
Open window:C153(On the left:K39:2; At the top:K39:5; -1; -1; 8; "Enter Sales")
ADD RECORD:C56([Point of Sale:5]; *)


CLOSE WINDOW:C154



//Open window(Screen width-149;33;Screen width-4;178;8;"Enter Sales")
//
//DIALOG([Sales];"EnterSales")
//
//CLOSE WINDOW