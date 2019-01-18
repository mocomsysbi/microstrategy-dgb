<%
 /*
  * SearchSuggest_Content.jsp
  * SearchBox basically HTML structure and bone to support QuickSearch, and also SQL Search in DHTML mode.
  *
  * Copyright 2010 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:ifFeature name="object-search">
<web:then>

    <div id="mstrSearchSuggest"><span id="searchbutton-placeholder"></span></div>

    <web:ifConnectionValue><web:then>
        <web:scriptlet>

            <%-- Features need to be checked by Search Editor action --%>
            mstrApp.searchAppFeatures = {<web:value type="features" name="create-analysis,run-vi-flash,run-vi-smart,IE9Pre"/>};

            <%--//Render SearchButton--%>
            microstrategy.mojoLoader.loadWidget({
                bundle: 'mojo-starburst.js',
                callback: function() {
                    //Unclear why sometimes the SearchButton is undefined when reaching this point,
                    // so use timeout to avoid it.
                    window.setTimeout(function() {
                        new mstrmojo.mstr.search.SearchButton({
                            placeholder: 'searchbutton-placeholder',
                            preclick: function () {
                                this.searchProps = mstrConfig.searchProps;

                                this.searchProps.rootFolderType = {my: 20, shared: 7}[microstrategy.pageName] || 39;

                                // Set up sub-folder info if currently in a sub-folder
                                var folderBone = microstrategy.bones.folderAllModes;
                                if (folderBone) {
                                    if (folderBone.folderName) {
                                        this.searchProps.rootFolderName = mstr.utils.String.escape4HTMLText(folderBone.folderName);
                                    }

                                    if (folderBone.sysFolder != undefined) {
                                        this.searchProps.rootFolderType = folderBone.sysFolder;
                                    }

                                    //In case a sub-folder, pass on folderId
                                    if (folderBone.sysFolder === 0 && folderBone.folderId) {
                                        this.searchProps.rootFolderID = folderBone.folderId;
                                    } else {
                                        this.searchProps.rootFolderID = null;
                                    }
                                }
                            }
                        }).render();

                    }, 10);
                }
            });

        </web:scriptlet>
    </web:then></web:ifConnectionValue>

</web:then>
</web:ifFeature>
