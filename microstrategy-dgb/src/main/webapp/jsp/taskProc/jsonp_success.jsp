<%@ page contentType="application/javascript; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:taskContentType defaultCharset="UTF-8" />

(function(){
    var dt = {
        status: <web:taskStatusCode />,
        content: <web:taskContent defaultValue="{}" />
    };
    
    try{
        <web:taskJSONP data="dt" />;
    }catch(e){}
})();
