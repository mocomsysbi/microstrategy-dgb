<%
    /*
     * Filter_Content.jsp
     * Copyright 2001 MicroStrategy Incorporated. All rights reserved.
     */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<web:ifFeature name="dhtml">
    <web:then>
        <web:updateManager scope="com.microstrategy.web.app.beans.EnumExecutionScope.FILTER_SCOPE" bean="fltb" />
        <jsp:include page='/jsp/CommonDescriptors.jsp' flush="true"/>
        <web:clientSideDescriptor IDs ="218,219,2020,2052,2175,2519,2699,2946,2947,2948,3037,3038,3039,3040,3041,3042,3380,3434,3544,3583,3625,3642,3643,3878,4506,5224,5225,5228,5238,5239,5244,5245,5260,5261,5271,5286,5297,5308,5309,5310,5325,5326,5327,5328,5329,5330,5331,5332,5333,5334,5335,5336,5337,5338,5339,5340,5341,5342,5447,5448,5449,5450,5451,5452,5453,5454,5455,5456,5457,5458,5459,5460,5461,5462,5463,5464,5465,5466,5467,5468,5469,5470,5471,5472,5473,5474,5475,5476,5477,5478,5479,5480,5481,5482,5483,5484,5485,5486,5487,5488,5489,5490,5491,5674,5720,5721,5728,5778,5970,5971,5973,6117,7743,7744,7745,7746,7747,8122,11754"/>
    </web:then>
</web:ifFeature>

<table border="0" cellpadding="0" cellspacing="5" class="filterLayout" width="100%" >
  <tr>
    <td class="filterLayoutLeft" colspan="1" rowspan="1">
      <web:displayGuiComponent name="allObjectBrowser"/>
    </td>
    <td class="filterLayoutRight" colspan="1" rowspan="1">
      <web:displayGuiComponent name="filter_area"/>
    </td>
  </tr>
</table>


<web:displayGuiComponent name="save_as"/>
<web:displayGuiComponent name="confirm_overwrite"/>
<web:displayGuiComponent name="create_folder"/>
<web:displayGuiComponent name="promptTabMgr"/>
<web:displayGuiComponent name="promptsContainer"/>
<web:displayGuiComponent name="objSelector"/>

