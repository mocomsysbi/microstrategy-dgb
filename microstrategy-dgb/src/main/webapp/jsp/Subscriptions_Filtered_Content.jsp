<%
 /*
  * Subscriptions_Filtered_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<%--
    Render different subscription sections based on the selected feature.
    1) Regular subscriptions.
    2) Scheduled e-mails
    3) Scheduled file exports
    4) Scheduled print jobs
--%>
<web:ifFeature name="dhtml"><web:then>
        <web:clientSideDescriptor IDs="191,192,1087,1088,1995,3296,6073" />
</web:then></web:ifFeature>  
<div class="mstrReportSubscriptions">
 <web:ifFeature name="scheduling">
  <web:then>
   <web:displayBean bean="objectSubscriptions" getTarget="true" styleName="ObjectInfoStyle"/>
  </web:then>
  <web:else>
   <web:ifFeature name="use-mobile;target-valid-for-subscription-type" type="bean" value="objectSubscriptions">
    <web:then>
     <web:displayBean bean="objectSubscriptions" getTarget="true" styleName="ObjectInfoStyle"/>
    </web:then>
    <web:else>
     <web:ifFeature name="scheduled-email">
      <web:then>
       <web:displayBean bean="objectSubscriptions" getTarget="true" styleName="ObjectInfoStyle"/>
      </web:then>
      <web:else>
       <web:ifFeature name="scheduled-file-export-menu">
        <web:then>
         <web:displayBean bean="objectSubscriptions" getTarget="true" styleName="ObjectInfoStyle"/>
        </web:then>
        <web:else>
         <web:ifFeature name="scheduled-print-menu;web-enable-print-subscriptions" type="bean" value="objectSubscriptions">
          <web:then>
           <web:displayBean bean="objectSubscriptions" getTarget="true" styleName="ObjectInfoStyle"/>
          </web:then>
         </web:ifFeature>
        </web:else>
       </web:ifFeature>
      </web:else>
     </web:ifFeature>
    </web:else>
   </web:ifFeature>
  </web:else>
 </web:ifFeature>
 <web:displayBean bean="objectSubscriptions" styleName="NCObjectSubscriptionsListStyle" />
</div>
