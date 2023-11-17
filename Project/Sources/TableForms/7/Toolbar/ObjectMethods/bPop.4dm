//Pop Register Drawer

SET PRINT OPTION:C733(2; 1)  //Port


//SET PRINT OPTION(4;vReceiptCopies)  `Port
//
//If (vPrintDialog=False)
//PRINT SETTINGS
//End if 

Print form:C5([Dialogs:7]; "PopDrawer"; 200)

PAGE BREAK:C6

