<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:beanValue name="smartBanner" property="Output"/>

<%-- Home Page main css --%>
    <web:resource type="js-style" name="mojo/css/cge.css" />
    <web:resource type="js-style" name="mojo/css/home.css" />

<%-- additional page-specific styles --%>
<web:resource type="js-style" name="mojo/css/pageHome.css"/>

    <%-- Slick-Carousel --%>
    <web:resource type="style" name="../javascript/libraries/slick/slick.css" />
    <web:resource type="style" name="../javascript/libraries/slick/slick-theme.css" />