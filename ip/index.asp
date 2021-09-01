<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="cgi/config.asp"-->
<%
Dim uip:uip=mobj.Query()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>IP地址查询_网站IP查询</title>
<meta name="keywords" content="ip,ip地址查询,ip查询,ip地址,网站ip查询"/>
<meta name="description" content="本站提供免费的IP地址查询服务,也可以通过输入网站域名,查询到网站的服务器IP地址。"/>
<script language="javascript" src="/js/jquery-1.7.1.min.js"></script>
<style type="text/css">
h1{ margin:0px; padding:0px;}
body{margin:0;padding:0;background:#FFF;font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#343434;}h1,h2,h3,h5{margin:0;font-weight:normal;color:#585858;}th{text-align:left;}h1{font-size:18px;padding-top:10px;margin-bottom:10px;}h2{font-size:18px;}h5{font-size:18px;}h3{font-weight:bold;}p,ul,ol{margin-top:0;line-height:240%;text-align:justify;}
.main{ margin:0px auto; width:74%; clear:both;}
.clear{ width:100%; clear:both; margin:0px auto;}.mainboerder{
	
	border: 1px solid #C5E2F2;
}.mtop10{ margin-top:10px;}.mainboerder .t{
	width:100%;
	margin:0px auto;
	clear:both;
	height:37px;
	line-height:37px;
	background-image: url(h1-bg.gif);
	background-repeat: repeat-x;
}a.pagetitle{ font-size:18px; float:left; margin-left:10px; color:#0033FF;height:37px; line-height:37px;}a.pagetitle2{
	font-size:18px;
	float:left;
	margin-left:10px;
	color:#006699; height:37px; line-height:37px;
}.height10{ height:10px;}.myip{
	width:94%;
	margin:0px auto;
	clear:both;
	text-align:center;
	
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #E5EFF8; height:30px; line-height:30px;
}.newip{width:94%;
	margin:0px auto;
	clear:both;
	text-align:center; height:45px; line-height:45px;}.inputip{ width:38%; background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #94C6E1;
    color: #22AC38;
    font-weight: bold;
    margin-bottom: 5px;
    padding: 5px;}.but {
    background: url("/but.gif") repeat-x scroll 50% top #CDE4F2;
    border: 1px solid #C5E2F2;
    cursor: pointer;
    height: 30px;
    margin-bottom: 5px;
    margin-left: 5px;
    width: 10%;;
}.ipresult{margin:0px auto;
	clear:both;
	text-align:center; height:50px; line-height:50px; color:#EA5F00; font-weight:bold;}p.intro{
	padding:10px;
	font-size:15px;
	line-height:25px;
	color:#787827;
}
</style>
<script language="javascript">
String.prototype.trim=function(){
　　 return this.replace(/(^\s*)|(\s*$)/g, "");
　　}
　　String.prototype.ltrim=function(){
　　 return this.replace(/(^\s*)/g,"");
　　}
　　String.prototype.rtrim=function(){
　　 return this.replace(/(\s*$)/g,"");
　　}
var regip = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
var dreg=/^[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?$/;
function GetIp(){
	if(regip.exec($("#inputip").val())||dreg.exec($("#inputip").val())){
	$("#ipresult").html("<img src='328.gif' />");
	$.post("getip.asp", { ip: $("#inputip").val()},
	function(data){
	if(data.s==1){
	$("#ipresult").html("查询结果: "+data.ip+" ==>>  "+data.m);
	
	}
	else{ $("#ipresult").html(data.m);}
	
	
	}, "json");
	
	}
	else{
	$("#ipresult").html("请输入正确的IP或者域名格式！！！");
	$("#inputip").focus();
	}

}
$(document).ready(function(){
	////
	$("#inputip").on("postpaste", function() { 
    // do something
	MoveHttp("#inputip");
}).pasteEvents();
	
	////
});
$.fn.pasteEvents = function( delay ) {
    if (delay == undefined) delay = 20;
    return $(this).each(function() {
        var $el = $(this);
        $el.on("paste", function() {
            $el.trigger("prepaste");
            setTimeout(function() { $el.trigger("postpaste"); }, delay);
        });
    });
};
function MoveHttp(id) {
    var val = $(id).val();
    val = val.replace("http://", "");
    var temp = val.split('/');
    if (temp.length <= 2) {
        if (val[val.length - 1] == '/') {
            val = val.substring(0, val.length - 1);
        }
    }
    $(id).val(val);
}
</script>
</head>

<body>
<div class="main" style="margin-top:50px; text-align:center;"><a href="/" title="IP地址查询"><img src="icon_ip.gif" alt="IP地址查询" width="64" height="64" border="0" /></a></div>
<div class="clear"></div>
<div class="main mainboerder mtop10">
<div class="t"><a class="pagetitle">IP地址查询工具</a></div>
<div class="clear height10"></div>
<div class="myip">您的IP地址：<strong style="color:#EA5F00;">[<%=uip%>]</strong>&nbsp;来自：<strong style="color:#343434;"><%=GetAddress(uip)%></strong>
</div>
<div class="newip">
请输入IP或网站域名：
  <input name="" type="text" class="inputip" id="inputip" url="true" autocomplete="off" />
<label>
<input type="submit" class="but" onclick="GetIp();"   value="提交" />
</label>
</div>
<div class="ipresult" id="ipresult"></div>
<div class="clear height10"></div>

</div>
<div class="main mainboerder mtop10">
<div class="t"><a class="pagetitle2">工具简介</a></div>
<p class="intro">通过该工具可以查询指定IP的物理地址或网站域名服务器的IP和物理地址，及所在国家或城市，甚至精确到某个网吧，机房或学校等；查出的结果仅供参考！
  <br />
  数字地址：即IP地址的数字化形式，复制在浏览器中访问就和访问IP一样
  <br /><span style="float:left; width:0px; height:0px; white-space:nowrap; overflow:hidden;"><script src="http://s21.cnzz.com/stat.php?id=4831089&web_id=4831089" language="JavaScript"></script></span></p>
</div>
</body>
</html>
