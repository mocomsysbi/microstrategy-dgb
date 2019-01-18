<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
    <web:beanValue name="smartBanner" property="Output"/>
<%-- TEMPORARY until we have a way to dynamically load css files --%>
<web:resource type="js-style" name="mojo/css/oivm.css" />
<web:resource type="js-style" name="mojo/css/express.css" />
<web:resource type="js-style" name="mojo/css/cge.css"/>
<web:resource type="js-style" name="mojo/css/font/fr/css/web_fr_iconfont.css" />

<%-- Add a loading icon for OIVM page --%>
<div id="pageLoadingWaitBox" class="mstrmojo-Editor-wrapper mojo-theme-light" style="width:252px; margin: auto;">
    <div class="mstrmojo-Editor mstrWaitBox modal" style="z-index: 99999; top: 50%; margin-top:-12px; display: block;">
        <div class="mstrmojo-Editor-content">
            <div class="mstrmojo-Box mstrIcon-wait" style="display: block;"></div>
            <div class="mstrmojo-Label mstrWaitMsg" style="display: block;" title="">Loading Data...</div>
        </div>
    </div>
    <div class="mstrmojo-Editor-curtain" style="z-index: 99998; width: 706px; height: 919px; display: block;"></div>
</div>
