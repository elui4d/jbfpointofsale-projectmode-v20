//%attributes = {}

Open Centered window(520; 400; Movable dialog box:K34:7; " ")

DIALOG:C40([Cash:10]; "CashManagement")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 
ALL RECORDS:C47([Point of Sale:5])