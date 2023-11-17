//%attributes = {}
//************************************************************************
//                            Message Box
//************************************************************************

//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";), 4=TextColor
MessageBox("Delete Selection"; "Are you sure you want to delete "+String:C10(Records in set:C195("UserSet"))+" records?"; "YesNoBox"; "Red")




//2.4 Features
//Change Consigor Number on Inventory and Sales (based on lookup doc)