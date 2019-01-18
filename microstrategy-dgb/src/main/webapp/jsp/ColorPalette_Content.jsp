<%
 /*
  * Preferences_Content.jsp
  * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
  */
%><%@ page errorPage="Error_Content.jsp"
%><%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"
%>
<style>
body.mstrWeb {
    background-color: #ffffff;
}
</style>
<web:resource type="js-style" name="mojo/css/core.css"/>
<web:resource type="js-style" name="mojo/css/ColorPalettesPage.css"/>

<div class="mstrPanelPortrait">
    <div class="mstrPanelTitleBar">
        <div class="mstrPanelTitle"><web:descriptor key="mstrWeb.13811" desc="Color Palette"/></div>
    </div>

    <div id="colorPalettePH"></div>
</div>

<script language="javascript">
mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-palette"/>;
</script>

<web:resource type="jsbundle" bundleName="mojo-palette" />

<script language="javascript">
mstrApp = new mstrmojo.prefs.EditColorPalettesApp({
    placeholder: document.getElementById('colorPalettePH')
});

mstrApp.start(<web:value type="misc" name="paletteThemes"/>);
</script>