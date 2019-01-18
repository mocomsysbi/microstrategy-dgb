<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<script language="javascript" type="text/javascript">

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

</script> 