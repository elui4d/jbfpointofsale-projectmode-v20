Case of 
	: (Form event code:C388=On Load:K2:1)
		rbUpload1:=1
		ALL RECORDS:C47([Sales:2])
		ARRAY DATE:C224(aUploadSoldDate; 0)
		
		DISTINCT VALUES:C339([Sales:2]Sold Date:11; aUploadSoldDate)
		SORT ARRAY:C229(aUploadSoldDate; >)
		OBJECT SET VISIBLE:C603(aUploadSoldDate; False:C215)
		
End case 