<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web" %>

<script language="javascript" type="text/javascript">
(function(){
    var dt = {
        status: <web:taskStatusCode />,
        content: <web:taskContent defaultValue="{}" />
    };
    
    try{
        <web:taskJSONP data="dt" />;
    }catch(e){}
})();
</script> 