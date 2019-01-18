<%@ page contentType="application/javascript; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<web:taskContentType defaultCharset="UTF-8" />

(function(){
    var dt = {
        status: <web:taskStatusCode />,
        errorCode: <web:taskErrorCode defaultValue="0"/>,
        errorMsg: '<web:taskErrorMessage encode="json"/>'
    };
    
    try{
        <web:taskJSONP data="dt" />;
    }catch(e){}
})();