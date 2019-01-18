<%
 /****
  * version: 0.1
  * xhtml: true
  ****/
%><%@ page errorPage="Error_Links.jsp"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ page import="com.microstrategy.web.app.beans.PageComponent"
%><%PageComponent mstrPage = (PageComponent)request.getAttribute("mstrPage");%>
<%
 /****
 * Display the "links" section of the template as specified in pageConfig.xml (i.e. Admin_Links.jsp)
 * <jsp:include page="[a page section]" />
  ****/
%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
<meta name="msapplication-tap-highlight" content="no" />

<jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>

<web:ifFeature type="requestKey" name="dev">
  <web:else>
    <link rel="stylesheet" type="text/css" href="../app-schema-assets/dist/app.fb46c60fde200c74113590a105320c78.css" />
  </web:else>
</web:ifFeature>
<link rel="shortcut icon" href="style/mstr/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/core.css" />
<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/cge.css"/>
<link rel="stylesheet" type="text/css" href="../style/mstr/fsm.css" />

<link rel="stylesheet" type="text/css" href="../javascript/mojo/css/data-import.css" />

<style>

html{
  overflow: hidden;
}

    .mstrmojo-di-popup *, .mstrmojo-Editor-wrapper * {
  -webkit-box-sizing: content-box;
     -moz-box-sizing: content-box;
          box-sizing: content-box;
}
.mstrmojo-di-popup *:before, .mstrmojo-Editor-wrapper *:before,
.mstrmojo-di-popup *:after, .mstrmojo-Editor-wrapper *:after {
  -webkit-box-sizing: content-box;
     -moz-box-sizing: content-box;
          box-sizing: content-box;
}

.mstrmojo-Editor.modal{
  right: auto;
  bottom: auto;
  display: block;
}
  
  </style>
