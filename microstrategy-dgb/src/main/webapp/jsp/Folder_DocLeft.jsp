<%
    /*
     * Folder_Content.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<web:ifFeature name="lTbar" type="browserSetting" value="1">
  <web:then>
    <web:ifFeature name="i-frame">
      <web:then>
      	<web:clientSideDescriptor IDs = "5695" />
		<web:clientSideDescriptor IDs = "5696" />
        <web:resource type="javascript" name="leftToolbar.js"/>
        <web:resource type="javascript" name="updateManager.js"/>
        <div id="leftToolbar" scriptclass="mstrLeftToolBarImpl" rsz="2" >
        <div class="mstrPanelTitleBar"> 
           <span class="mstrPanelTitle">
                <web:descriptor key="mstrWeb.5709" desc="FOLDERS" />
            </span>                
           <span class="mstrPanelTitleButtonBar">
	           <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumPageEvents.WebEventSetPermanentBrowserSetting">
	               <img <web:resource attribute="SRC" name="1ptrans.gif"/> id="btnDockLeft" class="mstrIcon-btn mstrIcon-btnClose" <web:descriptor attribute="title" key="mstrWeb.2102" desc="Close" /> />
	               <web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingName" value="lTbar" />
	               <web:eventArgument name="com.microstrategy.web.app.beans.EnumPageEvents.WebEventArgumentBrowserSettingValue" value="0" />
	           </web:urlEvent>
	       </span>
        </div>           
            <%-- Render the folder contents. --%>
            <web:displayGuiComponent name="folder_tree"/>
        </div>
        <script language="javascript">if (typeof(microstrategy) != 'undefined') microstrategy.registerBone("leftToolbar", (true), { 'ltW' : '<web:value type="browserSettingJSEncoded" name="ltW"/>'});</script>
        <STYLE TYPE="text/css">
        .mstrContent {
          margin-right: 15px;
          overflow: auto;
        }
        div[id="mstrWeb_content"] {
          margin-right: 0px;
        }
        .mstrVerticalDocks .tdDockLeft {
        	width: <web:value type="browserSetting" name="ltW"/>px;
        }
        <web:ifFeature name="IE">
          <web:then>
            html {overflow-y: hidden; overflow-x: auto;}
            #folderAllModes .mstrListView {position:static;}            
          </web:then>
        </web:ifFeature>
         <web:ifFeature name="IE6">
          <web:then>
            #folderAllModes .mstrListView {width: 98%;}
            .mstrVerticalDocks {table-layout: auto;}
          </web:then>
        </web:ifFeature>
        <web:ifFeature name="IE7">
          <web:then>
            .mstrContent {position: relative;}
          </web:then>
        </web:ifFeature>
        .mstrDockLeft {display:block !important;} <%-- dispaly the tree --%>
        
        <%-- // #334048- add border on folder list / icon view area in tree view mode --%>
        #mstrWeb_content {border-width: 1px 0 1px 1px; border-style:solid; border-color: #ccc;}
        </STYLE>    
        
      </web:then>
      <web:else>
        <STYLE TYPE="text/css">
        .tdDockLeft {
          display:none;
        }
        </STYLE>    
      </web:else>
    </web:ifFeature>
  </web:then> 
    
  <web:else>
    <STYLE TYPE="text/css">
    .tdDockLeft {
      display:none;
    }
    </STYLE>    
  </web:else>
</web:ifFeature>




