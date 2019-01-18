<%
 /****
  * Report_Content.jsp
  * This page displays the guiComponents required in the report page.
  *
  * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
  * version: 1.2
  * xhtml: true
  ****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<% // this map is used for drag and drop mapping // %>
<map id="useMap" name="useMap" mapfor="1"></map>

<web:ifFeature name="dhtml">
    <web:then>
    	<web:scriptlet>
        	if (typeof(microstrategy) != 'undefined') {
        	    microstrategy.EXECUTION_SCOPE = microstrategy.REPORT_EXECUTION;
	            microstrategy.EDIT_MODE = microstrategy.ALLOW_EDIT_MODE;
				microstrategy.FlashExportFileFormat = '<web:value type="misc" name="FlashExportFileFormat"/>';
        	}
        </web:scriptlet>
        <jsp:include page='/jsp/CommonDescriptors.jsp' flush="true"/>
        <web:clientSideDescriptor IDs="118,137,138,139,140,141,142,143,190,211,218,219,221,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,358,359,360,361,362,363,364,368,369,370,371,372,375,379,380,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,407,408,512,527,529,530,545,701,945,1005,1012,1022,1158,1885,1886,1892,1918,2020,2021,2033,2034,2035,2052,2057,2102,2120,2122,2123,2125,2127,2131,2132,2133,2142,2146,2175,2184,2185,2210,2214,2215,2216,2403,2460,2461,2519,2559,2647,2699,2789,2790,2827,2890,2901,2946,2947,2948,2950,2961,2983,2985,3037,3038,3039,3040,3041,3042,3044,3046,3047,3048,3049,3050,3051,3052,3053,3054,3153,3154,3155,3156,3157,3200,3264,3273,3274,3275,3297,3298,3299,3300,3301,3302,3303,3304,3305,3306,3307,3321,3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3377,3434,3478,3479,3484,3533,3544,3583,3623,3624,3625,3626,3631,3632,3633,3634,3635,3636,3637,3638,3639,3642,3643,3702,3728,3729,3779,3798,3807,3811,3849,3850,3851,3878,3899,3900,3901,3902,3903,3904,3905,3906,3907,3908,3909,3910,3911,3913,3914,3915,3916,3917,3918,3919,3920,3921,3922,3923,3926,3927,3928,3930,3931,3932,3941,4388,4389,4400,4402,4405,4406,4407,4410,4500,4501,4502,4506,4546,4579,4582,4583,4585,4637,4752,4754,4862,4875,4883,4884,4885,4886,4888,4889,4891,4947,4954,4965,4969,4970,5140,5141,5142,5158,5160,5174,5175,5207,5224,5225,5228,5238,5239,5244,5245,5260,5261,5271,5282,5286,5297,5283,5308,5309,5310,5325,5326,5327,5328,5329,5330,5331,5332,5333,5334,5335,5336,5337,5338,5339,5340,5341,5342,5365,5414,5415,5416,5417,5421,5422,5425,5426,5434,5447,5448,5449,5450,5451,5452,5453,5454,5455,5456,5457,5458,5459,5460,5461,5462,5463,5464,5465,5466,5467,5468,5469,5470,5471,5472,5473,5474,5475,5476,5477,5478,5479,5480,5481,5482,5483,5484,5485,5486,5487,5488,5489,5490,5491,5553,5554,5576,5577,5578,5579,5580,5581,5582,5583,5607,5674,5686,5720,5721,5728,5729,5776,5778,5858,5865,5867,5873,5884,5901,5921,5922,5923,5924,5925,5950,5956,5958,5959,5969,5970,5971,5973,5976,5977,5978,5979,5980,5981,5982,6003,6036,6064,6065,6072,6117,6118,6119,6163,6174,6177,6181,6195,6196,6197,7484,7485,7495,7498,7565,7567,7578,7579,7580,7668,7669,7670,7678,7732,7733,7743,7744,7745,7746,7747,7762,8122,8326,8327,8328,8946,9061,9071,9509,9741,9751,9752,9829,9830,9832,9833,9834,9835,9836,9837,15462,10624,11030,11165,11754,12187,13372,11897,12201,13355,13356,14120,14333,14652,14653,15521" />

        	<web:scriptlet>
            	self.SORT_ASCENDING = '<web:value type="enum" name="com.microstrategy.web.beans.EnumViewBeanEvents.SORT_ORDER_ASCENDING"/>';
            	self.SORT_DESCENDING = '<web:value type="enum" name="com.microstrategy.web.beans.EnumViewBeanEvents.SORT_ORDER_DESCENDING"/>';
    		</web:scriptlet>
        <%-- Update the updateManager with the appropriate view mode --%>
        <web:ifBeanValue bean="frame" property="getDesignMode" value="0">
            <web:then>
            	<web:scriptlet>
	                    if (typeof(microstrategy) != 'undefined') {
	                        microstrategy.DISPLAY_MODE = microstrategy.VIEW_MODE;
	                    }
                </web:scriptlet>
                <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.REPORT_SCOPE" bean="frame.rb" />
            </web:then>
            <web:else>
            	<web:scriptlet>
                	if (typeof(microstrategy) != 'undefined') {
                    	microstrategy.DISPLAY_MODE = microstrategy.DESIGN_MODE;
                	}
                </web:scriptlet>
                <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.REPORT_SCOPE" bean="frame.rb" />
            </web:else>
        </web:ifBeanValue>
    </web:then>
</web:ifFeature>

<web:ifBeanValue bean="frame" property="getDesignMode" value="0">
    <web:then>
<web:displayGuiComponent name="report_area" isContainer="true"/>
    </web:then>
    <web:else>
        <web:ifBeanValue bean="frame.rb" property="getXMLStatus" value="6">
        <web:then>
            <web:displayGuiComponent name="report_area" isContainer="true"/>
        </web:then>
        <web:else>
            <web:displayGuiComponent name="report_design_area" isContainer="true"/>
        </web:else>
        </web:ifBeanValue>
    </web:else>
</web:ifBeanValue>

<%--If there are prompts to be answered, load the corresponding editors.--%>
<web:ifBeanValue bean="frame.rb" property="getXMLStatus" value="6">
    <web:then>
        <web:displayGuiComponent name="attFormsQual"/>
        <web:displayGuiComponent name="metricQualLevel"/>
        <web:displayGuiComponent name="elementPicker"/>
    </web:then>
<%-- Otherwise, load the report editors.--%>
    <web:else>
    	<%-- Cubes and datamarts (non-viewable reports) can be added to the history list--%>
	    <web:displayGuiComponent name="historyListSubscriptionEditor" />
	    <web:displayGuiComponent name="contactsBrowser"/>
        <web:ifFeature type="bean" value="frame" name="is-viewable-report">
            <web:then>
        <web:displayGuiComponent name="report_grid_format"/>
        <web:displayGuiComponent name="report_graph_format"/>
        <web:displayGuiComponent name="report_grid_options"/>
        <web:displayGuiComponent name="subtotalsEditor"/>
        <web:displayGuiComponent name="edtAdvancedThresholdsEditor"/>
        <web:displayGuiComponent name="alertsEditor"/>
        <web:displayGuiComponent name="mobileAlertsEditor"/>
        <web:displayGuiComponent name="thresholdsFormatEditor"/>
        <web:displayGuiComponent name="colorPickerEditor"/>
        <web:displayGuiComponent name="colorGradientEditor"/>
        <web:displayGuiComponent name="gridColorGradientEditor"/>
        <web:displayGuiComponent name="report_functionWizard"/>
        <web:ifFeature type="bean" value="frame.rb" name="use-metric-filter-editor">
            <web:then>
                <web:displayGuiComponent name="mfed"/>
            </web:then>
        </web:ifFeature>
    <web:displayGuiComponent name="promptTabMgr"/>
    <web:displayGuiComponent name="promptsContainer"/>
    <web:displayGuiComponent name="objSelector"/>
    <web:displayGuiComponent name="emailSubscriptionEditor" />
    <web:displayGuiComponent name="fileSubscriptionEditor" />
    <web:displayGuiComponent name="printSubscriptionEditor" />
    <web:displayGuiComponent name="cacheSubscriptionEditor" />
    <web:displayGuiComponent name="ftpSubscriptionEditor" />
    <web:displayGuiComponent name="sendNowSubscriptionEditor" />
    <web:displayGuiComponent name="mobileSubscriptionEditor" />
    <web:displayGuiComponent name="alertsObjSelector"/>
    <web:displayGuiComponent name="mobileAlertsObjSelector"/>
    <web:displayGuiComponent name="deed"/>
    <web:displayGuiComponent name="webHyperLinkEditor"/>
    <web:displayGuiComponent name="webHyperLinkObjSelector"/>
    <web:displayGuiComponent name="deFormatEditor"/>
    <web:displayGuiComponent name="deSaveAs"/>
    <web:displayGuiComponent name="deConfirmOverwrite"/>
    <web:displayGuiComponent name="deCreateFolder"/>
    <web:displayGuiComponent name="deImport"/>
            </web:then>
        </web:ifFeature>
    </web:else>
</web:ifBeanValue>
