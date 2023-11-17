//%attributes = {}

QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Consignor Number:1); >)
vConsignors:=Records in selection:C76([Consignors:1])
vSections:=0
vGroups:=0
vLarge:=1000

Open Centered window(645; 300; Movable dialog box:K34:7; " ")

DIALOG:C40([Dialogs:7]; "Print_BreakdownDlog")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

ACCEPT:C269