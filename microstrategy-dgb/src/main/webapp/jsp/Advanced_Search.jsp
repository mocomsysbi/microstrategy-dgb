<%
 /*
  * Advanced_Search.jsp
  * Copyright 2013 MicroStrategy Incorporated. All rights reserved.
  */
%>

<%@ page errorPage="Error_Content.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>

<div id='search_options' n='search_options' class='SearchBox-Options-Wrapper'><div>
        <div id="nameWildcardsSection" class="SearchBox-Options-Section expanded">
            <div class="SearchBox-Options-TitleBar" ty="stb"><span class="title"><web:descriptor key="mstrWeb.8955" desc="Search type" /></span></div>
            <div class="SearchBox-Options-content wildcards" ty="sc">
                <select id="nameWildcards" name="nameWildcards" size="1">
                    <option value="16"><web:descriptor key="mstrWeb.686" desc="Contains" /></option> <%--QuickSearch Contains --%>
                    <option value="1"><web:descriptor key="mstrWeb.686" desc="Contains" /></option> <%-- SQLSearch contains --%>
                    <option value="2"><web:descriptor key="mstrWeb.520" desc="Exactly" /></option>
                    <option value="4"><web:descriptor key="mstrWeb.687" desc="Begins with" /></option>
                    <%--
                     <option value="32"><web:descriptor key="mstrWeb.8832" desc="Begins with phrase" /></option>
                     --%>
                    <option value="8"><web:descriptor key="mstrWeb.688" desc="Ends with" /></option>
                </select>
            </div>
            <div class="SearchBox-Options-divider"></div>
        </div>

        <div id="locationSection" class="SearchBox-Options-Section expanded" n="location">
            <div class="SearchBox-Options-TitleBar" ty="stb"><span class="title"><web:descriptor key="mstrWeb.1050" desc="Location" /></span></div>
            <div class="SearchBox-Options-content location" ty="sc">
                <input id="rootFolderType_39" name="rootFolderType" value="39" checked="1" type="radio"><label for="rootFolderType_39"><web:descriptor key="mstrWeb.2058" desc="All" /></label>
                <br/>
                <input id="rootFolderType_7" name="rootFolderType" value="7" type="radio"><label for="rootFolderType_7"><web:descriptor key="mstrWeb.8947" desc="Inside" /> <span class="mstrHighlighted"><web:descriptor key="mstrWeb.2" desc="Shared Reports" /></span></label>
                <br>
                <input id="rootFolderType_20" name="rootFolderType" value="20" type="radio"><label for="rootFolderType_20"><web:descriptor key="mstrWeb.8947" desc="Inside" /> <span class="mstrHighlighted"><web:descriptor key="mstrWeb.3" desc="My Reports" /></span></label>
                <br/>
                <!-- placeholder if Folder type is other than Shared, My or all folders -->

                <div style="display:none;" n="rootFolderType_0">
                    <input id="rootFolderType_0" name="rootFolderType" value="0" type="radio" ><label for="rootFolderType_0"><web:descriptor key="mstrWeb.8947" desc="Inside" /> <span n="n" class="mstrHighlighted"></span></label>
                </div>
           </div>
           <div class="SearchBox-Options-divider"></div>
        </div>

        <div id="typesSection" class="SearchBox-Options-Section expanded">
            <div class="SearchBox-Options-TitleBar" ty="stb"><span class="title"><web:descriptor key="mstrWeb.8956" desc="Object type" /></span></div>
            <div class="SearchBox-Options-content types" n="types" ty="sc">

                <%-- Web Search Page --%>
                <div n="types_web"></div>

                <%-- Server Admin Page - Users / SecurityRoles Search --%>
                <div n="types_us" class="SearchBox-Options-content-types-us">
                    <div>
                    <input id="objectType_8704" name="objectType" value="8704" type="checkbox" checked="1"><label class="mstrIcon-lv mstrIcon-lv-u" for="objectType_8704"><web:descriptor key="mstrWeb.5193" desc="Users" /></label>
                    </div>

                    <div>
                    <input id="objectType_8705" name="objectType" value="8705" type="checkbox" checked="1"><label class="mstrIcon-lv mstrIcon-lv-ug" for="objectType_8705"><web:descriptor key="mstrWeb.5194" desc="User Groups" /></label>
                    </div>

                    <div>
                    <input id="objectType_44" name="objectType" value="44" type="checkbox"><label class="mstrIcon-lv mstrIcon-lv-sr" for="objectType_44"><web:descriptor key="mstrWeb.5195" desc="Security Role" /></label>
                    </div>
                </div>

                <div class="SearchBox-Options-content types deRef" n="deRef">
                    <input id="dereferenceshortcut" name="dereferenceshortcut" value="1" type="checkbox" checked="checked"><label for="dereferenceshortcut"><web:descriptor key="mstrWeb.8949" desc="Resolve shortcuts to target" /></label>
                </div>

            </div>
            <div class="SearchBox-Options-divider"></div>
        </div>

        <div id="datesSection" class="SearchBox-Options-Section">
            <div class="SearchBox-Options-TitleBar" ty="stb"><span class="title"><web:descriptor key="mstrWeb.2052" desc="Date" /></span></div>
            <div class="SearchBox-Options-content dates" ty="sc">
                <select id="created" name="created" size="1" onchangex="getObj('createdOptions').style.display = this.value=='0' ? 'none' : ''">
                    <option value="0" selected="1"><web:descriptor key="mstrWeb.2058" desc="All" /></option>
                    <option value="1"><web:descriptor key="mstrWeb.694" desc="Created" /></option>
                    <option value="2"><web:descriptor key="mstrWeb.61" desc="Modified" /></option>
                </select>
                <div id="createdOptions" style="displayx:none;overflow:hidden;height:0;">
                <table cellspacing="0" cellpadding="0">
	                <tr>
	                    <td>
	                     <input id="dateSubType_1" name="dateSubType" value="1" type="radio"><label for="intervalValue"><web:descriptor key="mstrWeb.4049" desc="Last" /></label>
	                    </td>
	                    <td style="white-space:nowrap;">
	                     <input id="intervalValue" maxlength="5" name="intervalValue" value="" onfocus="getObj('dateSubType_1').click()" size="1" type="text" dt="2" />
	                     <select id="intervalUnit" name="intervalUnit" size="1">
	                            <option value="1" selected="1"><web:descriptor key="mstrWeb.708" desc="Hour(s)" /></option>
	                            <option value="2"><web:descriptor key="mstrWeb.707" desc="Day(s)" /></option>
	                            <option value="3"><web:descriptor key="mstrWeb.714" desc="Week(s)" /></option>
	                            <option value="4"><web:descriptor key="mstrWeb.710" desc="Month(s)" /></option>
	                            <option value="5"><web:descriptor key="mstrWeb.709" desc="Year(s)" /></option>
	                     </select>
	                    </td>
	                 </tr>
	                 <tr>
	                    <td>
	                         <input id="dateSubType_2" name="dateSubType" value="2" checked="1" type="radio"><label for="startDate"><web:descriptor key="mstrWeb.294" desc="Between" /></label>
	                    </td>
	                    <td style="white-space:nowrap;">
	                     <input id="startDate" maxlength="50" name="startDate" value="" onclick="getObj('dateSubType_2').click();if(!this.disabled){updateDateFormat(mstr.Settings.Locale.DATEOUTPUTFORMAT.toUpperCase());showCalendar(getMonth('startDate'), getYear('startDate'),'startDate',mstr.utils.BoxModel.position(this).left, (mstr.utils.BoxModel.position(this).top + getObjHeight(this)),'startDate',<web:value type="misc" name="firstDayOfWeek"/>, 'dateMaxRest', 'dateMinRest');}" size="11" type="text" dt="14">
	                     <!--
	                      <img id="Calendar_button1" name="Calendar_button1" src="../images/calendar.gif" style="visibility: visible;" onclick="if(!this.disabled){updateDateFormat('M/D/YYYY');showCalendar(getMonth('startDate'), getYear('startDate'),'startDate',mstr.utils.BoxModel.position(getObj('Calendar_button1')).left, (mstr.utils.BoxModel.position(getObj('Calendar_button1')).top + getObjHeight(getObj('Calendar_button1'))),'Calendar_button1',1, 'dateMaxRest', 'dateMinRest');}" align="top" height="20" width="33">&nbsp;
	                      -->
	                    </td>
	                 </tr>
	                 <tr>
	                    <td  style="padding-left: 20px;">
	                     <label for="endDate"><web:descriptor key="mstrWeb.308" desc="and" /></label>  &nbsp;
	                    </td>
	                    <td>
	                     <input id="endDate" maxlength="50" name="endDate" value="" size="11" type="text" onclick="getObj('dateSubType_2').click();if(!this.disabled){updateDateFormat(mstr.Settings.Locale.DATEOUTPUTFORMAT.toUpperCase());showCalendar(getMonth('endDate'), getYear('endDate'),'endDate',mstr.utils.BoxModel.position(this).left, (mstr.utils.BoxModel.position(this).top + getObjHeight(this)),'endDate',<web:value type="misc" name="firstDayOfWeek"/>, 'dateMaxRest', 'dateMinRest');};" dt="14">
	                    </td>
	                  </tr>
                  </table>
                  </div>

                </div>
                <div class="SearchBox-Options-divider"></div>
            </div>

        <div id="ownerSection" class="SearchBox-Options-Section">
            <div class="SearchBox-Options-TitleBar" ty="stb"><span class="title"><web:descriptor key="mstrWeb.60" desc="Owner" /></span></div>
            <div class="SearchBox-Options-content owner" ty="sc">
                <input id="ownerType_1" name="ownerType" value="1" checked="1" type="radio"><label for="ownerType_1"><web:descriptor key="mstrWeb.698" desc="Created by any user" /></label>
                <br>
                <input id="ownerType_2" name="ownerType" value="2" type="radio"><label for="ownerType_2"><web:descriptor key="mstrWeb.699" desc="Created only by me" /></label>
            </div>
            <div class="SearchBox-Options-divider"></div>
        </div>

        <div id="descriptionSection" class="SearchBox-Options-Section">
            <div class="SearchBox-Options-TitleBar" ty="stb"><label for="description" class="title"><web:descriptor key="mstrWeb.6013" desc="Description" /></label></div>
            <div class="SearchBox-Options-content desc" ty="sc">
                <div><label><web:descriptor key="mstrWeb.8834" desc="Search type:" /><web:descriptor key="mstrWeb.686" desc="Contains" /></label></div>
                <textarea id="description" cols="8" name="description" rows="2"></textarea>
            </div>
            <div class="SearchBox-Options-divider"></div>
        </div>
    </div>
</div>
