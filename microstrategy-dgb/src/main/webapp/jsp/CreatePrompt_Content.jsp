<%
/*
 * CreatePrompt_Content.jsp
 * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
 */
%>

<%@ page errorPage="Error_Content.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div class="mstrPanelPortrait" id="create_prompt">
<div class="mstrPanelBody">
    <div class="mstrLargeIconRadioView">
        
        <!-- Hierarchy Qualification Prompt -->
        <div class="mstrCreateItem mstrBandOn">
            <span>
                <label for="value">
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" enabledCssClass="" extraURL="promptType=3&promptExpressionType=16"> <!-- WebPromptTypeExpression -->
                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                            <img class="mstrIcon-lv mstrIcon-lv-pr" <web:descriptor attribute="alt" key="mstrWeb.5547" desc="Hierarchy Qualification prompt"/> <web:descriptor attribute="title" key="mstrWeb.5547" desc="Hierarchi Qualification prompt"/> src="../images/1ptrans.gif" border="0"/></web:urlEvent>
                </label>
            </span>
            <span class="mstrHighlighted">
                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" extraURL="promptType=3&promptExpressionType=16"> <!-- WebPromptTypeExpression -->
                    <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                    <web:descriptor key="mstrWeb.5547" desc="Hierarchy Qualification Prompt" />
                </web:urlEvent>
            </span>
            <div class="mstrDescription">
                <label for="attQ">
                    <web:descriptor key="mstrWeb.5790" desc="This type of prompt allows users to qualify on attributes and elements from a specific hierarchy." />
                </label>
            </div>
        </div>
        
        <!-- Attribute Qualification Prompt -->
        <div class="mstrCreateItem">
            <span>
                <label for="value">
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" enabledCssClass="" extraURL="promptType=3&promptExpressionType=17"> <!-- WebPromptTypeExpression -->
                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                            <img class="mstrIcon-lv mstrIcon-lv-pr" <web:descriptor attribute="alt" key="mstrWeb.5217" desc="Attribute Qualification prompt"/> <web:descriptor attribute="title" key="mstrWeb.5217" desc="Attribute Qualification prompt"/> src="../images/1ptrans.gif" border="0"/></web:urlEvent>
                </label>
            </span>
            <span class="mstrHighlighted">
                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" extraURL="promptType=3&promptExpressionType=17"> <!-- WebPromptTypeExpression -->
                    <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                    <web:descriptor key="mstrWeb.5217" desc="Attribute Qualification Prompt" />
                </web:urlEvent>
            </span>
            <div class="mstrDescription">
                <label for="attQ">
                    <web:descriptor key="mstrWeb.5791" desc="This type of prompt allows you to qualify on an attribute's ID, description or other form." />
                </label>
            </div>
        </div>
        
        <!-- Att Element list -->
        <div class="mstrCreateItem mstrBandOn">
            <span>
                <label for="attElem">
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='attElem'" enabledCssClass="" extraURL="promptType=2"> <!-- WebPromptTypeElements-->
                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                            <img class="mstrIcon-lv mstrIcon-lv-pr" <web:descriptor attribute="alt" key="mstrWeb.5218" desc="Attribute Element List prompt"/> <web:descriptor attribute="title" key="mstrWeb.5218" desc="Attribute Element List prompt"/> src="../images/1ptrans.gif" border="0"/></web:urlEvent>
                </label>
            </span>
            <span class="mstrHighlighted">
                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='attElem'" extraURL="promptType=2"> <!-- WebPromptTypeElements-->
                    <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                    <web:descriptor key="mstrWeb.5218" desc="Attribute Element List" />
                </web:urlEvent>
            </span>
            <div class="mstrDescription">
                <label for="attQ">
                    <web:descriptor key="mstrWeb.5792" desc="This type of prompt allows users to choose from a list of elements." />
                </label>
            </div>
        </div>
        
                <!-- Metric Qualification Prompt -->
        <div class="mstrCreateItem">
            <span>
                <label for="value">
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" enabledCssClass="" extraURL="promptType=3&promptExpressionType=10"> <!-- WebPromptTypeExpression -->
                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                            <img class="mstrIcon-lv mstrIcon-lv-pr" <web:descriptor attribute="alt" key="mstrWeb.5219" desc="Metric Qualification prompt"/> <web:descriptor attribute="title" key="mstrWeb.5219" desc="Metric Qualification prompt"/> src="../images/1ptrans.gif" border="0"/></web:urlEvent>
                </label>
            </span>
            <span class="mstrHighlighted">
                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" extraURL="promptType=3&promptExpressionType=10"> <!-- WebPromptTypeExpression -->
                    <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                    <web:descriptor key="mstrWeb.5219" desc="Metric Qualification Prompt" />
                </web:urlEvent>
            </span>
            <div class="mstrDescription">
                <label for="attQ">
                    <web:descriptor key="mstrWeb.5793" desc="CThis type of prompt allows users to qualify on one or more metrics." />
                </label>
            </div>
        </div>
        
        <!-- Object -->
        <div class="mstrCreateItem mstrBandOn">
            <span>
                <label for="object">
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='object'" enabledCssClass="" extraURL="promptType=4"> <!-- WebPromptTypeObjects-->
                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                            <img class="mstrIcon-lv mstrIcon-lv-pr" <web:descriptor attribute="alt" key="mstrWeb.5220" desc="Object"/> <web:descriptor attribute="title" key="mstrWeb.5220" desc="Object"/> src="../images/1ptrans.gif" border="0"/></web:urlEvent>
                </label>
            </span>
            <span class="mstrHighlighted">
                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='object'" extraURL="promptType=4"> <!-- WebPromptTypeObjects-->
                    <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                    <web:descriptor key="mstrWeb.5220" desc="Object" />
                </web:urlEvent>
            </span>
            <div class="mstrDescription">
                <label for="object">
                    <web:descriptor key="mstrWeb.5794" desc="This type of prompt allows users to choose one or more objects." />
                </label>
            </div>
        </div>
        
        <!-- Value -->
        <div class="mstrCreateItem">
            <span>
                <label for="value">
                    <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" enabledCssClass="" extraURL="promptType=1&constDataType=14"> <!-- WebPromptTypeConstant Date-->
                        <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                            <img class="mstrIcon-lv mstrIcon-lv-pr" <web:descriptor attribute="alt" key="mstrWeb.5221" desc="Value"/> <web:descriptor attribute="title" key="mstrWeb.5221" desc="Value"/> src="../images/1ptrans.gif" border="0"/></web:urlEvent>
                </label>
            </span>
            <span class="mstrHighlighted">
                <web:urlEvent eventID="com.microstrategy.web.app.beans.EnumServletEvents.WebEventOpenPage" linkAttributes="id='value'" extraURL="promptType=1&constDataType=14"> <!-- WebPromptTypeConstant Date-->
                    <web:eventArgument name="com.microstrategy.web.app.beans.EnumServletEvents.WebEventArgumentTarget" value="editPrompt" />
                    <web:descriptor key="mstrWeb.5221" desc="Value" />
                </web:urlEvent>
            </span>
            <div class="mstrDescription">
                <label for="attQ">
                    <web:descriptor key="mstrWeb.5795" desc="This type of prompt allows users to enter a text, date, number or other value type." />
                </label>
            </div>
        </div>

</div>
</div>
