<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>
<%
Set DNS = CreateObject("TCPIP.DNS")
'On Error Resume Next
ip = DNS.GetIPByHost("ip.yokoer.com")

response.write IP




%>
</BODY>
</HTML>
