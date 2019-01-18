    <%@ taglib uri="/webUtilTL.tld" prefix="web" %>
        <%@ page import="java.util.regex.*" %>

        <div id="root" style="height: 100%" ></div>
        <div id="mainDIApp"></div>

        <jsp:include page='/jsp/Mojo_Config.jsp' flush="true"/>

        <script type="text/javascript">
            mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-as"/>;
        </script>

        <web:resource type="jsbundle" bundleName="mojo-as"/>

        <script type="text/javascript">

        //mstrConfig.mstrDescs = <web:bundleDescriptor name="mojo-as"/>;
        //Set up the config object first.
        mstrConfig.hasProfileReports = 1;
        //Set application object.
        window.mstrApp = new mstrmojo.DI.DIApp({
            name: '<web:value type="config" name="servletDeploymentName"/>',
            pageName: '<web:beanValue property="name"/>',
            persistTaskParams: <web:value type="persistParameters" name=""/>,
            helpUrl: '<web:value type="systemPreference" name="helpUrl" />',
            localeId: '<web:connectionValue property="locale"/>',
            servletState: '<web:connectionValue property="servletState"/>',
            disabledSources: <web:beanValue bean="asb" property="disabledSources"/>,
            onSessionExpired: function(){
                mstrmojo.alert('The user session has timed out and any unsaved work has been lost. Please start again.', function(){
                    window.onbeforeunload = function(){} // remove the 'beforeunload' listener
                    var config = mstrConfig;
                    mstrmojo.form.send({
                        evt: 5005,            // PAGE_REFRESH
                        src: config.name + "." + config.pageName + ".5005"
                    });
                });
            }
        });
        mstrConfig.name = '<web:value type="config" name="servletDeploymentName"/>';
        mstrConfig.pageName = '<web:beanValue property="name"/>';
        mstrConfig.features = {
            <web:value type="features" name="is-two-step-verification-required,create-object"/>
        };
        mstrConfig.servletState = '<web:connectionValue property="servletState"/>';
        document.body.oncontextmenu = function() { return false;}

        window.mstrAppSchema = {
            onSessionExpired: mstrApp.onSessionExpired,
            dataServerURL: "<web:beanValue bean="asb" property="dataServerURL" jsEncode="true"/>",
            taskURL: '<web:taskProcessorName/>',
            cubeId: '<web:beanValue bean="asb" property="cubeID"/>',
            cubeName: "<web:beanValue bean="asb" property="cubeName" jsEncode="true"/>",
            cubeDesc: "<web:beanValue bean="asb" property="cubeDesc" jsEncode="true"/>",
            extendedType: '<web:beanValue bean="asb" property="extendedType"/>',    
            workspaceId: '<web:beanValue bean="asb" property="workSpaceID"/>',
            modelInstanceId: '<web:beanValue bean="asb" property="modelInstanceID"/>',
            sessionState: '<web:connectionValue property="sessionState"/>',
            idToken: '<web:beanValue bean="asb" property="identityToken"/>',
            close: function() {
                window.onbeforeunload = function(){};
                mstrmojo.form.send({
                    evt: '3124', 
                    src: mstrConfig.name + '.' + mstrConfig.pageName + '.3124', 
                    relativePageNumber: '-1'
                }, mstrConfig.name, 'POST', null, null, false);
            },
            onFatalError: function(msg){
                mstrmojo.alert(msg, function(){
                    mstrAppSchema.close();
                });
            }
        };


        </script>
            <%!
                     // Checks whether the parameter is a valid IP address
                boolean isIpAddress(String ipAddr) {
                    // Compile the pattern...
                    Pattern p = Pattern.compile("(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])(?:\\.(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])){3}");

                    // Match the pattern against the IP address
                    Matcher m = p.matcher(ipAddr);

                    return m.matches();
                }

            %>
                   
            <%
            String ipAddr = request.getParameter("dev");
            if (ipAddr != null && ipAddr.length() > 0) {
               if (isIpAddress(ipAddr)) { %>
                    <script>
                            var devIp='<%= ipAddr %>';
                            var script = document.createElement("script");
                            script.async = false;
                            script.src = "//" + devIp + ":8888/main.js";
                            document.head.appendChild(script);
                    </script>

            <%  } else { %>
                        <script>console.error('Only IPv4 addresses are allowed for dev parameter.');</script>
            <%  } %>
            <% } else { %>
                <script src="../app-schema-assets/dist/vendor.bab3a35cf412610997b9.js"></script>
                <script src="../app-schema-assets/dist/app.d5a5f7cb10114a415946.js"></script>
            <% } %>

        
