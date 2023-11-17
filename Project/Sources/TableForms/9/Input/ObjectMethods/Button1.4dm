C_LONGINT:C283(vTempTime)



vTempTime:=Time:C179([Volunteers:9]Out Time:9)-Time:C179([Volunteers:9]In Time:8)
vPayRatePerMinute:=([Volunteers:9]Pay Rate:13/60)  //Pay per minute
vTimeWorkedinMinutes:=vTempTime/60  //Minutes worked

vMoneyEarned:=vTimeWorkedinMinutes*vPayRatePerMinute
[Volunteers:9]Money Earned:15:=Round:C94(vMoneyEarned; 2)
//SAVE RECORD([Volunteers])