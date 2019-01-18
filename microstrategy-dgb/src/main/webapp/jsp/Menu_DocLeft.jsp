<%
    /*
     * Folder_Content.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:ifFeature name="dhtml">
    <web:then>
<web:resource type="javascript" name="leftToolbar.js"/>
<web:resource type="javascript" name="mstrLeftPaneImpl.js"/>
<web:resource type="javascript" name="mstrMenuTabsImpl.js"/>
    </web:then>
</web:ifFeature>

<STYLE TYPE="text/css">
        #leftToolbar,
        .mstrVerticalDocks .tdDockLeft {
            width: <web:ifFeature type="browserSetting" name="lTbar" value="0"><web:then>34px</web:then><web:else><web:value type="browserSetting" name="ltW"/>px</web:else></web:ifFeature>;
        }
        #dhtml_statistics {
            margin-left: <web:ifFeature type="browserSetting" name="lTbar" value="0"><web:then>34px</web:then><web:else><web:value type="browserSetting" name="ltW"/>px</web:else></web:ifFeature>;
        }
</STYLE>

<div id="leftToolbar" scriptclass="mstrLeftPaneImpl" rsz="2" >
  <div class="mstrMenuTabs <web:ifFeature type="browserSetting" name="lTbar" value="0"><web:then>collapsed</web:then></web:ifFeature> " id="menuTabs" scriptclass="mstrMenuTabsImpl">
      <div id="menuToggler" class="mstrMenuTab toggler" ty='btn'><div class="icon-toggle">&nbsp;</div></div>
    <web:ifFeature name="dhtml;create-objects">
      <web:then>
                <div id="mscld-create" class="mscld-create analysis" <web:descriptor attribute="title" key="mstrWeb.3291" desc="Create" />>
                <span class="mstrMenuItemcreate"><span id="mscld-create-menu" class="mscld-create-menu">
                <web:descriptor key="mstrWeb.3291" desc="Create" />
                </span></span>
                </div>
      </web:then>
      <web:else>
          <web:ifFeature name="create-view-reports">
              <web:then>
                  <div id="mscld-create" class="mscld-create report" <web:descriptor attribute="title" key="mstrWeb.3291" desc="Create" />>
                    <span class="mstrMenuItemcreate">
                      <span id="mscld-create-menu" class="mscld-create-menu">
                      <web:descriptor key="mstrWeb.3291" desc="Create" />
                      </span>
                    </span>
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenCreate" linkAttributes ="class='mscld-create-lnk'"> </web:urlEvent>
                  </div>
              </web:then>
          </web:ifFeature>
      </web:else>
    </web:ifFeature>
    <%-- Browse tab --%>
    <div class="mstrMenuSection">
      <div class="mstrMenuContent" ty="content">
        <web:ifFeature name="dhtml"><web:then>
            <web:ifFeature name="recent-objects"><web:then>
                <span id ="mstrRecentObjects" class="mstrMenuItemRecents mstrMenuItem" <web:descriptor attribute="title" key="mstrWeb.14354" desc="Recents" />>
                    <span id="mscld-recents-menu" class="mscld-recents-menu">
                        <web:descriptor key="mstrWeb.14354" desc="Recents" />
                    </span>
                </span>
            </web:then></web:ifFeature>
        </web:then></web:ifFeature>

    <web:ifBeanValue property="getName" value="search">
      <web:else>
        <web:ifFeature name="dhtml">
          <web:else>
                <web:ifFeature name="object-search"><web:then>
                  <span class="mstrMenuItemsearch mstrMenuItem">
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenSearch">
                      <web:descriptor key="mstrWeb.10" desc="Search" />
                    </web:urlEvent>
                  </span>
                </web:then></web:ifFeature>
          </web:else>
        </web:ifFeature>
      </web:else>
    </web:ifBeanValue>

    <web:ifFeature name="dhtml">
        <web:then>
            <web:ifBeanValue property="getName" value="my">
               <web:then>
                 <web:displayGuiComponent name="folder_tree"/>
               </web:then>
            <web:else>
              <web:ifBeanValue property="getName" value="shared">
               <web:then>
                 <web:displayGuiComponent name="folder_tree"/>
               </web:then>
              </web:ifBeanValue>
            </web:else>
            </web:ifBeanValue>
        </web:then>
    </web:ifFeature>

    <web:shortcutOptions type="toolbar" shortcutClass="mstrMenuItem" shortcutSelectedClass="mstrMenuItemSelected">
        <web:shortcutElement />
    </web:shortcutOptions>
    <web:ifFeature name="show-dossier-library-link"><web:then>
    	<span class="mstrMenuItemNLinkTodossierLibrary mstrMenuItem">
            <a target="_blank" onclick="openInLibrary(); return false;" oncontextmenu="return false;" onauxclick="return false;" href="<web:value type="systemPreferenceSessionEncoded" name="consumerWebBaseURL"/>"><web:descriptor key="mstrWeb.15355" desc="MicroStrategy Library" /></a>
        </span>
    </web:then></web:ifFeature>
      
    <web:ifFeature name="preferences"><web:then>
        <web:shortcutOptions type="tools" shortcutClass="mstrMenuItem" shortcutSelectedClass="mstrMenuItem">
            <web:shortcutElement />
        </web:shortcutOptions>
    </web:then></web:ifFeature>
</div>
<web:ifBeanValue bean="leftTbExtraOpt">
  <web:then>
     <div class="mstrMenuExtra" ty="extraOpt">
         <web:displayBean bean="leftTbExtraOpt" />
     </div>
  </web:then>
</web:ifBeanValue>
</div>
</div>
</div>

<STYLE TYPE="text/css">
.mstrDHTML .mstrVerticalDocks {table-layout:fixed;}
.mstrDHTML .mstrDockLeft {position: fixed;}
.mstrDHTML .mstrDockLeft {
    border-right: 1px solid #f0f0f0;
    box-shadow: 5px 0px 5px -8px rgba(0,0,0,0.45);
    height: 100%;
}
.mstrContent {
margin-right: 15px;
}
div[id="mstrWeb_content"] {
margin-right: 0px;
}
.mstrVerticalDocks .tdDockLeft {
padding:0px;
}
#leftToolbar {
overflow:hidden;
}
.tdDockLeft {
 background-color:#f5f5f5;
}
<web:ifFeature name="dhtml">
<web:then>
.mstrMenuExtra {
  display:none;
}
</web:then>
<web:else>
body.mstrHTML {
  overflow: visible;
}
</web:else>
</web:ifFeature>
<web:ifFeature name="IE">
<web:then>
#folderAllModes .mstrListView {position:static;}
</web:then>
</web:ifFeature>
<web:ifFeature name="IE7">
<web:then>
.mstrContent {position: relative;}
</web:then>
</web:ifFeature>
.mstrDockLeft {
display:block !important;
} <%-- dispaly the tree --%>
        .mstrProjectHeader {
            margin: 5px;
        }
        </STYLE>

<script language="javascript">
if (typeof(microstrategy) != 'undefined') {
    microstrategy.registerBone("menuTabs", (true), {});
    microstrategy.registerBone("leftToolbar", (true), { 'ltW' : '<web:value type="browserSettingJSEncoded" name="ltW"/>'});
}

window.mstrApp.features = {
    <web:value type="features" name="create-folder,web-import-data,web-use-sharing-editor,modify-report-list,design-mode,modify-report-list,create-view-report,define-query-report-builder,template-reports,web-define-view-report,dhtml,upload-mstr,create-folder,save-report-privilege;web-import-mstr"/>
};
window.mstrApp.uploadMstrFileFn = {
  'upload' : microstrategy.uploadDashboardFile,
  'callback' : microstrategy.uploadCallback
}
</script>

<%-- Get descriptors for Import Dashboard confirm dialog. --%>
<web:clientSideDescriptor IDs = "1442,5811,8118,11221,11222,11223,15467,11225,11226,11227" />




