<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>


<meta name="viewport" id="viewportTag" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no">

<!--Hide the Safari UI components-->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />

<web:resource type="style" name="../javascript/mojo/css/android.css" />
<web:resource type="style" name="../javascript/mojo/css/android-large.css" />

<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script> 

<style type="text/css">
.hostedBackBtn {
    background: transparent url(../javascript/mojo/css/images/iphone/btnBack.png) 50% 50% no-repeat;
    cursor: pointer;
    height: 50px;
    left: 0;
    position: absolute;
    top: 0;
    width: 46px;
}

.hostedMenuBtn {
    background: transparent url(../javascript/mojo/css/images/iphone/logo.png) 50% 50% no-repeat;
    cursor: pointer;
    height: 50px;
    right: 0;
    position: absolute;
    top: 0;
    width: 46px;
}

.loadFireBugBtn {
    background: transparent url(../javascript/mojo/css/images/Android/debug.png) 50% 50% no-repeat;
    cursor: pointer;
    height: 30px;
    position: absolute;
    right: 93px;
    width: 30px;
    top: 10px;
    z-index: 10;
}

.hostedElemSearchBtn {
    background: #000;
    border-radius: 4px;
    color: #fff;
    float: right;
    font-size: 2em;
    padding: 7px;
    margin: -70px 10px 0 0;
}
</style>