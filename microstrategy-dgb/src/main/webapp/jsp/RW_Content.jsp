<%
/****
* RW_Content.jsp
* This page displays the content of the Report Writing Documents.
*
* Copyright 2004 MicroStrategy Incorporated. All rights reserved.
* version: 1.2
* xhtml: true
****/
%><%@ page errorPage="JSP_Error.jsp"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<% // this map is used for drag and drop mapping // %>
<map id="useMap" name="useMap" mapfor="1"></map>

<%-- DHTML mode: --%>
<web:ifFeature name="dhtml">
    <web:then>
        <jsp:include page='/jsp/CommonDescriptors.jsp' flush="true"/>          
        <web:clientSideDescriptor IDs="0,20,21,23,115,118,137,138,139,141,142,143,181,190,211,221,218,219,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,358,359,360,361,362,363,364,368,369,370,371,372,375,379,380,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,407,408,512,517,518,519,521,522,523,524,527,529,530,587,614,629,637,701,898,945,959,1005,1012,1013,1022,1053,1158,1877,1885,1886,1895,1918,2020,2033,2034,2035,2056,2057,2059,2102,2120,2122,2131,2132,2133,2142,2146,2175,2184,2185,2202,2203,2204,2210,2211,2214,2215,2394,2403,2453,2460,2461,2519,2550,2559,2647,2789,2790,2795,2796,2789,2790,2827,2890,2901,2919,2922,2944,2945,2946,2947,2948,2949,2950,2951,2961,2972,2975,2983,2985,3033,3037,3038,3039,3041,3042,3043,3044,3045,3046,3047,3048,3049,3050,3051,3052,3053,3054,3153,3154,3155,3156,3157,3196,3200,3264,3274,3275,3279,3297,3298,3299,3300,3301,3302,3303,3304,3305,3306,3307,3313,3316,3321,3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3371,3436,3437,3478,3479,3520,3533,3547,3548,3574,3575,3576,3577,3578,3579,3580,3621,3622,3623,3624,3625,3626,3631,3632,3633,3634,3635,3636,3637,3638,3639,3678,3702,3728,3729,3764,3765,3766,3767,3768,3769,3770,3779,3798,3807,3809,3811,3849,3850,3851,3865,3866,3877,3878,3899,3900,3901,3902,3903,3904,3905,3906,3907,3908,3909,3910,3911,3913,3914,3915,3916,3917,3918,3919,3920,3921,3922,3923,3926,3927,3928,3930,3931,3932,3941,3957,3958,4024,4161,4360,4388,4389,4400,4402,4405,4406,4407,4410,4420,4500,4501,4502,4538,4539,4540,4541,4546,4560,4579,4582,4583,4585,4637,4638,4717,4718,4719,4720,4721,4722,4723,4724,4725,4727,4728,4750,4752,4753,4754,4755,4756,4758,4778,4780,4795,4808,4809,4813,4814,4815,4862,4875,4883,4884,4885,4886,4888,4889,4891,4921,4923,4943,4944,4947,4954,4955,4964,4965,4966,4969,4970,4992,4993,5024,5025,5026,5028,5051,5052,5140,5141,5142,5155,5156,5157,5158,5159,5171,5207,5366,5369,5414,5415,5416,5417,5421,5422,5425,5426,5434,5553,5554,5567,5576,5577,5578,5579,5580,5581,5582,5583,5604,5607,5644,5645,5674,5678,5686,5702,5720,5728,5729,5749,5773,5776,5865,5873,5884,5901,5950,5958,5959,5969,5976,5977,5978,5979,5980,5981,5982,6036,6048,6064,6065,6072,6088,6103,6117,6118,6119,6143,6144,6151,6152,6154,6174,6177,6195,6196,6197,6457,7482,7483,7484,7485,7495,7565,7567,7575,7576,7622,7623,7624,7625,7670,7678,7732,7733,7755,7759,7760,7761,7762,7763,7821,7839,8040,15450,8145,8153,8154,8155,8156,8157,8158,8159,8160,8161,8162,8163,8164,8165,8166,8167,8168,8169,8170,8232,8233,8326,8327,8328,8498,8563,8636,8966,9061,9071,9241,9512,9741,9747,9749,9751,9752,9829,9830,9832,9833,9834,9835,9836,9837,9887,9888,9889,9932,9934,10037,10624,11030,11157,11165,11167,11174,11175,11176,11177,11178,11179,11959,12187,13185,13398,13964,14121,11228,1146,14513,560,11897,13355,13356,14652,14653"/>
        
        <%-- GUID AS NODE IDENTIFIER --%>
        <web:ifFeature name="guid-as-node-identifier">
            <web:then>
                <web:scriptlet>
                    if (typeof(microstrategy) != 'undefined') {
                        microstrategy.GUID_AS_NODE_IDENTIFIER = true;
                    }
                </web:scriptlet>
            </web:then>
        </web:ifFeature>
        
        
        <web:scriptlet>
            if (typeof(microstrategy) != 'undefined') {
            microstrategy.EXECUTION_SCOPE = microstrategy.RWD_EXECUTION;
            microstrategy.RESIZE_SUBSECTIONS = microstrategy.RESIZE_EACH_SUBSECTION;
			microstrategy.FlashExportFileFormat = '<web:value type="misc" name="FlashExportFileFormat"/>';
            }
            self.SORT_ASCENDING = '<web:value type="enum" name="com.microstrategy.web.beans.EnumViewBeanEvents.SORT_ORDER_ASCENDING"/>';
            self.SORT_DESCENDING = '<web:value type="enum" name="com.microstrategy.web.beans.EnumViewBeanEvents.SORT_ORDER_DESCENDING"/>';
        </web:scriptlet>

        <%-- View mode: --%>
        <web:ifBeanValue bean="rwframe" property="getDesignMode" value="0">
            <web:then>
                <web:scriptlet>
                    if (typeof(microstrategy) != 'undefined') {
                    microstrategy.DISPLAY_MODE = microstrategy.VIEW_MODE;
                    }
                </web:scriptlet>
                <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.REPORT_WRITER_SCOPE" bean="rwframe.rwb" />

                <web:displayGuiComponent name="rw_view_area"/>



            </web:then>
            <web:else>
                <%-- Design mode: --%>
                <web:scriptlet>
                    if (typeof(microstrategy) != 'undefined') {
                    microstrategy.DISPLAY_MODE = microstrategy.DESIGN_MODE;
                    }
                </web:scriptlet>
                <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.REPORT_WRITER_SCOPE" bean="rwframe.rwb" />
                <web:displayGuiComponent name="rw_design_area"/>
            </web:else>
        </web:ifBeanValue>

        <web:ifBeanValue name="rwframe.rwb" property="getXMLStatus" value="6">
            <web:then>
                <web:displayGuiComponent name="attFormsQual"/>
                <web:displayGuiComponent name="metricQualLevel"/>
                <web:displayGuiComponent name="elementPicker"/>
                <web:scriptlet>
                	mstrApp.messageID = '<web:beanValue bean="rwb" property="messageID"/>';
                </web:scriptlet>
            </web:then>
            <web:else>
                <%-- Beans alway available: --%>
                <web:displayGuiComponent name="docFmt"/>
                <web:displayGuiComponent name="exportOptionsEditorRW"/>
                <web:displayGuiComponent name="attFormsQual"/>
                <web:displayGuiComponent name="contactsBrowser"/> 
			    <web:displayGuiComponent name="historyListSubscriptionEditor" />
				<web:displayGuiComponent name="emailSubscriptionEditor" />
				<web:displayGuiComponent name="fileSubscriptionEditor" />
				<web:displayGuiComponent name="printSubscriptionEditor" />
				<web:displayGuiComponent name="cacheSubscriptionEditor" />
				<web:displayGuiComponent name="ftpSubscriptionEditor" />
				<web:displayGuiComponent name="sendNowSubscriptionEditor" />
				<web:displayGuiComponent name="mobileSubscriptionEditor" />

				<%-- Beans only enabled in "interactive" View mode: --%>
                <web:ifFeature type="bean" value="rwframe" name="rw-interactive-view-mode-eplus">
                    <web:then>
                        <web:ifFeature name="floatingApplySelectorButton" type="preference" value="1">
                            <web:then>
                                <web:displayGuiComponent type="controlSubmitButton"/>
                            </web:then>
                        </web:ifFeature>
                        <web:displayGuiComponent name="ftMgr"/>
                        <web:displayGuiComponent name="ghftMgr"/>
                        <web:displayGuiComponent name="formulaRW"/>
   						<web:displayGuiComponent name="sortRWGrid"/>
                        <web:displayGuiComponent name="sortRWDoc"/>
                        <web:displayGuiComponent name="subtotalsDHTMLRW"/>
                        <web:displayGuiComponent name="subtotalsDHTMLRW_OlderIServer"/>
                        <web:displayGuiComponent name="resizeRW"/>
                        <web:displayGuiComponent name="deFormatEditor"/>
                        <web:displayGuiComponent name="deSaveAs"/>
                        <web:displayGuiComponent name="deConfirmOverwrite"/>
                        <web:displayGuiComponent name="deCreateFolder"/>
                        <web:displayGuiComponent name="deImport"/>  
                        <web:displayGuiComponent name="deed"/>
                        <web:displayGuiComponent name="viewFilterRWGrid"/>
                        <web:displayGuiComponent name="edtAdvancedThresholdsEditor"/>
                        <web:displayGuiComponent name="thresholdsFormatEditor"/>
                        <web:displayGuiComponent name="edtSimpleThresholds"/>
                        <web:displayGuiComponent name="rw_functionWizard"/>
                        <web:displayGuiComponent name="colorPickerEditor"/>
                        <web:displayGuiComponent name="colorGradientEditor"/>
                    </web:then>
                </web:ifFeature>

                <%-- Beans only enabled in "editable" View mode: --%>
                <web:ifFeature type="bean" value="rwframe" name="rw-editable-view-mode-eplus">
                    <web:then>
                        <web:displayGuiComponent name="visualizationsEditor"/>
                        <web:displayGuiComponent name="secondaryDataSourcesEditor"/>
                        <web:displayGuiComponent name="filterDetailsFmtEditor"/>
                        <web:displayGuiComponent name="gbeb"/>
                        <web:displayGuiComponent name="rwaceb"/>
                        <web:displayGuiComponent name="dsExplorer"/>
                        <web:displayGuiComponent type="controlTargetsRecorder"/>
                        <web:displayGuiComponent name="tocFtMgr"/>
                        <web:displayGuiComponent name="watermarkFtMgr"/>
                        <web:displayGuiComponent name="webHyperLinkEditor"/>
                        <web:displayGuiComponent name="webHyperLinkObjSelector"/>   

                        <web:displayGuiComponent name="rwdColorGradientEditor"/>
                    </web:then>
                </web:ifFeature>
            </web:else>
        </web:ifBeanValue>



    </web:then>
    <web:else>
        <%-- HTML mode: --%>
            <web:displayBean bean="rwframe" styleName="RWFrameHtmlOnlyStyle" />
    </web:else>
</web:ifFeature>



