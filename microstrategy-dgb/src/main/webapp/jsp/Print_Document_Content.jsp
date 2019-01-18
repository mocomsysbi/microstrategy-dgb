<%
/*
* Print_Document_Content.jsp
* Copyright 2002 MicroStrategy Incorporated. All rights reserved.
*/
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<style type="text/css">
    BODY {
        font-family: <web:beanValue property="fontName"/>;
        font-size: <web:beanValue property="fontSize"/>pt;
        color: #000000;
      }
    INPUT {
        font-family: <web:beanValue property="fontName"/>;
        font-size:<web:beanValue property="fontSize"/>pt;
        color: #000000;
      }
    SELECT {
        font-family: <web:beanValue property="fontName"/>;
        font-size: <web:beanValue property="fontSize"/>pt;
        color: #000000;
    }
    TABLE {
        font-family: <web:beanValue property="fontName"/>;
        font-size: <web:beanValue property="fontSize"/>pt;
        color: #000000;
    }
    TD {
        font-family: <web:beanValue property="fontName"/>;
        font-size: <web:beanValue property="fontSize"/>pt;
        color: #000000;
    }
</style>
<%-- Render the 'Document Bean' --%>
<web:displayBean bean="db" />