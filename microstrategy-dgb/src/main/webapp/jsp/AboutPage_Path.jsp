<%
 /****
  * AboutPage_Path.jsp
  * This file includes only the MicroStrategy Logo in the Path section.
  * 
  *
  * Copyright 2015 MicroStrategy Incorporated. All rights reserved.
  * version: 1.0
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<%-- Display only MicroStrategy Logo in the path section --%>

        <table cellpadding="0" cellspacing="0" border="0">            
            <tr>
                <td class="mstrPathTDLeft" style="width:50px"><%-- Display the path section --%>
                   <a class="mstrLink"> 
                       <span class='mstrLogo path'> </span> 
                     
                   </a>
                </td>                
                <td>
                  <div class="mstrPathText" style="max-width: 774px;">
                     <div class="mstrPathTextCurrent">
                        <span class="mstrPathLast"><web:descriptor key="mstrWeb.14348" desc="About MicroStrategy" /></span>
                      </div>
                  </div>
                </td>
            </tr>
        </table>
    

      