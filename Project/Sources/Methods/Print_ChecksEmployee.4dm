//%attributes = {}
ALL RECORDS:C47([Consignors:1])
APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]EmployeeCheck_Total:29:=0)
APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]EmployeeCheck:28:=False:C215)
APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]EmployeeCheck_TotalText:30:="")


SELECTION TO ARRAY:C260([Consignors:1]Consignor Number:1; asTempNums)
QUERY WITH ARRAY:C644([Volunteers:9]Consignor Number:1; asTempNums)


QUERY SELECTION:C341([Volunteers:9]; [Volunteers:9]Paid Job:12=True:C214)


If (Records in selection:C76([Volunteers:9])>0)
	
	ORDER BY FORMULA:C300([Volunteers:9]; ([Volunteers:9]Consignor Number:1); >)
	
	DISTINCT VALUES:C339([Volunteers:9]Consignor Number:1; asCNum)
	
	For ($vlRecord; 1; Size of array:C274(asCNum))
		
		QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=asCNum{$vlRecord}; *)
		QUERY:C277([Volunteers:9];  & ; [Volunteers:9]Paid Job:12=True:C214)
		
		vTotalMoneyEarned:=Sum:C1([Volunteers:9]Money Earned:15)
		
		QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=asCNum{$vlRecord})
		
		//vItemsSold:=Records in selection([Sales])
		//vGrossSales:=Sum([Sales]Sold Price)
		//vNetSales:=vTotalMoneyEarned*([Consignors]Percent*0.01)
		vCheckTotal:=vTotalMoneyEarned
		vCheckTotal:=Round:C94(vCheckTotal; 2)
		[Consignors:1]EmployeeCheck_Total:29:=vCheckTotal
		
		//Get CheckTotal Text for check
		vCheckTotalString:=String:C10(vCheckTotal)
		vDecimal:=Position:C15("."; vCheckTotalString)
		
		Case of 
			: (vDecimal=0)
				vCheckTotalString:=vCheckTotalString+".00"
				vDecimal:=Position:C15("."; vCheckTotalString)
			: (vDecimal=2)
				vCheckTotalString:=vCheckTotalString+"0"
				vDecimal:=Position:C15("."; vCheckTotalString)
		End case 
		
		vCents:=""
		vOne:=""
		vTen:=""
		vTen2:=""
		vHundred:=""
		vThousand:=""
		
		vCents:=Substring:C12(vCheckTotalString; vDecimal+1; 2)
		If (vDecimal-1>0)
			vOne:=Substring:C12(vCheckTotalString; vDecimal-1; 1)
		End if 
		If (vDecimal-2>0)
			vTen:=Substring:C12(vCheckTotalString; vDecimal-2; 1)
			vTen2:=Substring:C12(vCheckTotalString; vDecimal-2; 1)
		End if 
		If (vDecimal-3>0)
			vHundred:=Substring:C12(vCheckTotalString; vDecimal-3; 1)
		End if 
		If (vDecimal-4>0)
			vThousand:=Substring:C12(vCheckTotalString; vDecimal-4; 1)
		End if 
		
		Case of 
			: (vThousand="0")
				vThousand:=""
			: (vThousand="1")
				vThousand:="One Thousand "
			: (vThousand="2")
				vThousand:="Two Thousand "
			: (vThousand="3")
				vThousand:="Three Thousand "
			: (vThousand="4")
				vThousand:="Four Thousand "
			: (vThousand="5")
				vThousand:="Five Thousand "
			: (vThousand="6")
				vThousand:="Six Thousand "
			: (vThousand="7")
				vThousand:="Seven Thousand "
			: (vThousand="8")
				vThousand:="Eight Thousand "
			: (vThousand="9")
				vThousand:="Nine Thousand "
		End case 
		
		Case of 
			: (vHundred="0")
				vHundred:=""
			: (vHundred="1")
				vHundred:="One Hundred"
			: (vHundred="2")
				vHundred:="Two Hundred"
			: (vHundred="3")
				vHundred:="Three Hundred"
			: (vHundred="4")
				vHundred:="Four Hundred"
			: (vHundred="5")
				vHundred:="Five Hundred"
			: (vHundred="6")
				vHundred:="Six Hundred"
			: (vHundred="7")
				vHundred:="Seven Hundred"
			: (vHundred="8")
				vHundred:="Eight Hundred"
			: (vHundred="9")
				vHundred:="Nine Hundred"
		End case 
		
		Case of 
			: (vTen="0")
				vTen:=""
			: (vTen="1") & (vOne="0")
				vTen:=" Ten"
				vOne:=""
			: (vTen="1") & (vOne="1")
				vTen:=" Eleven"
				vOne:=""
			: (vTen="1") & (vOne="2")
				vTen:=" Twelve"
				vOne:=""
			: (vTen="1") & (vOne="3")
				vTen:=" Thirteen"
				vOne:=""
			: (vTen="1") & (vOne="4")
				vTen:=" Fourteen"
				vOne:=""
			: (vTen="1") & (vOne="5")
				vTen:=" Fifteen"
				vOne:=""
			: (vTen="1") & (vOne="6")
				vTen:=" Sixteen"
				vOne:=""
			: (vTen="1") & (vOne="7")
				vTen:=" Seventeen"
				vOne:=""
			: (vTen="1") & (vOne="8")
				vTen:=" Eighteen"
				vOne:=""
			: (vTen="1") & (vOne="9")
				vTen:=" Nineteen"
				vOne:=""
			: (vTen="2")
				vTen:=" Twenty"
			: (vTen="3")
				vTen:=" Thirty"
			: (vTen="4")
				vTen:=" Forty"
			: (vTen="5")
				vTen:=" Fifty"
			: (vTen="6")
				vTen:=" Sixty"
			: (vTen="7")
				vTen:=" Seventy"
			: (vTen="8")
				vTen:=" Eighty"
			: (vTen="9")
				vTen:=" Ninety"
		End case 
		
		Case of 
			: (vOne="0") & (vTen2#"1")
				vOne:=""
			: (vOne="1") & (vTen2#"1")
				vOne:=" One"
			: (vOne="2") & (vTen2#"1")
				vOne:=" Two"
			: (vOne="3") & (vTen2#"1")
				vOne:=" Three"
			: (vOne="4") & (vTen2#"1")
				vOne:=" Four"
			: (vOne="5") & (vTen2#"1")
				vOne:=" Five"
			: (vOne="6") & (vTen2#"1")
				vOne:=" Six"
			: (vOne="7") & (vTen2#"1")
				vOne:=" Seven"
			: (vOne="8") & (vTen2#"1")
				vOne:=" Eight"
			: (vOne="9") & (vTen2#"1")
				vOne:=" Nine"
				
		End case 
		
		If (vTen="") & (vHundred="") & (vthousand="") & (vOne="")
			vOne:="Zero"
		End if 
		
		vLength:=Length:C16(vCents)
		Case of 
			: (vLength=1)
				vCents:=vCents+"0"
			: (vLength=0)
				vCents:=vCents+"00"
		End case 
		
		[Consignors:1]EmployeeCheck_TotalText:30:=vThousand+vHundred+vTen+vOne+" Dollars and "+vCents+" Cents."
		
		[Consignors:1]EmployeeCheck_FirstLastName:31:=[Consignors:1]First Name:2+" "+[Consignors:1]Last Name:3
		[Consignors:1]EmployeeCheck_Date:32:=String:C10(Current date:C33; Internal date long:K1:5)
		[Consignors:1]Check_CityStateZip:23:=[Consignors:1]City:6+", "+[Consignors:1]State:7+"  "+[Consignors:1]Zip:8
		[Consignors:1]EmployeeCheck:28:=True:C214
		SAVE RECORD:C53([Consignors:1])
		
	End for 
	
	QUERY:C277([Consignors:1]; [Consignors:1]EmployeeCheck_Total:29>0)
	
	PRINT LABEL:C39([Consignors:1]; Char:C90(1))
	
Else 
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox(""; "You have no workers in the Volunteer table who earned money and were marked Paid "+"Job in you selection."; "OKBox"; "red")
End if 

