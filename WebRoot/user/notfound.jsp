<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>Not Found Page</title>
		<STYLE type=text/css>
INPUT {
	FONT-SIZE: 12px
}

TD {
	FONT-SIZE: 12px
}

.p2 {
	FONT-SIZE: 12px
}

.p6 {
	FONT-SIZE: 12px;
	COLOR: #1b6ad8
}

A {
	COLOR: #1b6ad8;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: red
}
</STYLE>
	</head>
	<jsp:include page="header.jsp"></jsp:include>
	<body>

<P align=center>　</P>
<P align=center>　</P>
<TABLE cellSpacing=0 cellPadding=0 width=540 align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top height=270>
      <DIV align=center><BR><IMG height=211 src="error.gif" 
      width=329><BR><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
        <TBODY>
        <TR>
          <TD><FONT class=p2>&nbsp;&nbsp;&nbsp; <FONT color=#ff0000><IMG 
            height=13 src="emessage.gif" 
            width=12>&nbsp;无法访问本页的原因是：</FONT></FONT></TD></TR>
        <TR>
          <TD height=8></TD>
        <TR>
          <TD>
            <P><FONT color=#000000><BR>　　您所请求的页面不存在</FONT>! 
      　</P></TD></TR></TBODY></TABLE></DIV></TD></TR>
  <TR>
    <TD height=5></TD>
  <TR>
    <TD align='middle'>
      <CENTER>
      <TABLE cellSpacing=0 cellPadding=0 width=480 border=0>
        <TBODY>
        <TR>
          <TD width=6><IMG height=26 src="left.gif" 
width=7></TD>
          <TD background=bg.gif>
            <DIV align=center><FONT class=p6><A 
            href="">返回首页</A>　 　|　　 <A 
            href="javascript:history.go(-1)">返回出错页</A>　 　|　　 <A 
            href="">关闭本页</A></FONT> </DIV></TD>
          <TD width=7><IMG 
      src="right.gif"></TD></TR></TBODY></TABLE></CENTER></TD></TR></TBODY></TABLE>
<P align=center>　</P>
<P align=center>　</P>



	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</html>

