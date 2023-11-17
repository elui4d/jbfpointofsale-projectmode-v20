//%attributes = {}



Open Centered window(620; 630; Movable dialog box:K34:7; " ")

DIALOG:C40([Consignors:1]; "checkin")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 
//removed for UCN
ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Consignor Number:1); >)
