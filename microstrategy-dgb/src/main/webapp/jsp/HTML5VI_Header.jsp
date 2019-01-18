<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:beanValue name="smartBanner" property="Output"/>
<web:resource type="js-style" name="mojo/css/font/fonts.css" />
<web:resource type="js-style" name="mojo/css/cge.css"/>
<web:resource type="js-style" name="mojo/css/vi-data-import.css"/>
<web:resource type="js-style" name="mojo/css/vi-heatmap.css" />
<web:resource type="js-style" name="mojo/css/vi-network.css" />
<web:resource type="js-style" name="mojo/css/font/vi/css/vi_icons.css" />
<web:resource type="js-style" name="mojo/css/vi-kpi.css" />
<web:resource type="js-style" name="mojo/css/font/fr/css/web_fr_iconfont.css" />

<web:ifFeature name="IE10Pre"><web:then>
       <web:resource type="js-style" name="mojo/css/vi-ie.css"/>
   </web:then>
   <web:else>
       <web:resource type="js-style" name="mojo/css/vi.css"/>
   </web:else>
</web:ifFeature>
<web:resource type="js-style" name="mojo/css/vi-base-themes.css" />
<web:resource type="js-style" name="../VisFramework/ngm/dist/css/ngm.css" />

