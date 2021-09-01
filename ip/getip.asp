<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="cgi/Config.asp"-->
<%
on error resume next
Response.Charset="GB2312"
Response.Buffer   =   True    
Response.ExpiresAbsolute   =   Now() -  1    
Response.Expires   =   0    
Response.CacheControl   =   "no-cache"    
Response.AddHeader   "Pragma",   "No-Cache"

Dim ip:ip=trim(request("ip"))
Dim errorNum:errorNum=0
if mobj.testreg(ip,regip) or mobj.testreg(ip,regdomain) then 
	if mobj.testreg(ip,regip) then 
		errorStr=GetAddress(ip)
		errorNum=1
	end if
	
	if mobj.testreg(ip,regdomain) then
		Set DNS = CreateObject("TCPIP.DNS")
		'On Error Resume Next
		ip = DNS.GetIPByHost(ip)		
		errorStr=GetAddress(ip)
		errorNum=1
	end if
	
else
	errorStr="IP或域名格式不正确"
end if
%>{"s":<%=errorNum%>,"m":<%=toJSON(errorStr)%>,"ip":"<%=ip%>"}