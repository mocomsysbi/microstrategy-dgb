
<%
	/****
	 * Report_Error.jsp
	 * This page is used as the content of the error section for reports.
	 * First it checks whether the page is prompted, if so it just shows a flag
	 * indicating the user to look forward for the prompt errors.
	 * Otherwise, it checks for errors in specific manipulations and displays messages accordingly.
	 * If none of the particular cases is matched, it just renders the error info.
	 *
	 * Copyright 2004 MicroStrategy Incorporated. All rights reserved.
	 * version: 1.2
	 * xhtml: true
	 ****/
%>
<%@ page errorPage="JSP_Error.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/webUtilTL.tld" prefix="web"%>
<web:ifErrorValue>
	<web:then>
		<web:ifBeanValue bean="rb" property="getXMLStatus" value="4">
			<web:else>
				<%-- Only show the alert box if the report bean is not going to render the error message itself: --%>
				<div class="mstrAlert"><%-- If prompted, just show a message with a flag: --%>
				<web:ifBeanValue bean="rb" property="getXMLStatus" value="6">
					<web:then>
						<div class="promptMessage"><web:errorValue
							property="message" default="mstrWeb.980" /></div>
						<%--Descriptor: "Follow the instructions marked below by a red flag." --%>
					</web:then>
					<web:else>
						<%-- Title, drilling is a special case: --%>
						<web:ifFeature type="requestKey" name="evt"
							value="com.microstrategy.web.beans.EnumReportBeanEvents.REPORT_EVENT_GRID_DRILL"
							enum="true">
							<web:then>
								<div class="mstrAlertTitle"><web:descriptor
									key="mstrWeb.811" desc="Error in report results." /></div>
							</web:then>
							<web:else>
								<web:ifFeature type="requestKey" name="evt"
									value="com.microstrategy.web.app.beans.EnumDrillEditorEvents.WebEventDrillEditorProcess"
									enum="true">
									<web:then>
										<div class="mstrAlertTitle"><web:descriptor
											key="mstrWeb.811" desc="Error in report results." /></div>
									</web:then>
									<web:else>
										<web:ifFeature type="requestKey" name="evt"
											value="com.microstrategy.web.app.beans.EnumDrillEditorEvents.WebEventAdvDrillEditorProcess"
											enum="true">
											<web:then>
												<div class="mstrAlertTitle"><web:descriptor
													key="mstrWeb.811" desc="Error in report results." /></div>
											</web:then>
											<web:else>
												<div class="mstrAlertTtitle"><web:errorValue
													property="title" /></div>
											</web:else>
										</web:ifFeature>
									</web:else>
								</web:ifFeature>
							</web:else>
						</web:ifFeature>
						<web:ifErrorValue property="code" value="8">
							<web:then>
							</web:then>
							<%-- Skip it for this error --%>
							<web:else>
								<%-- Skip it for graph drilling error too --%>
								<web:ifErrorValue property="code" value="-2147216861">
									<%-- The info section is the same for all errors: --%>
									<web:else>
										<web:ifErrorValue property="type" value="1">
											<web:then>
												<div class="info"><web:descriptor key="mstrWeb.640"
													desc="Your request could not be processed due to a server error." /><br />
												<web:descriptor key="mstrWeb.641"
													desc="Please try again.  If the error persists, contact the server administrator." />
												</div>
											</web:then>
										</web:ifErrorValue>
									</web:else>
								</web:ifErrorValue>
							</web:else>
						</web:ifErrorValue>
						<%-- Add contact-info if available: --%>
						<web:ifErrorValue property="contactInfo">
							<web:then>
								<div class="mstrContactInfo"><web:descriptor
									key="mstrWeb.99" desc="Contact Info:" /> <web:errorValue
									property="contactInfo" /></div>
							</web:then>
						</web:ifErrorValue>
						<%-- Error messages, again drilling is a special case: --%>
						<web:ifFeature type="requestKey" name="evt"
							value="com.microstrategy.web.beans.EnumReportBeanEvents.REPORT_EVENT_GRID_DRILL"
							enum="true">
							<web:then>
								<web:ifErrorValue property="code" value="-2147214570">
									<web:then>
										<div class="mstrAlertMessage"><web:descriptor
											key="mstrWeb.3761"
											desc="The drilling command could not be carried out. You do not have access to the requested attribute." /></div>
									</web:then>
									<web:else>
										<div class="mstrAlertMessage"><web:errorValue
											property="message" default="mstrWeb.3756;mstrWeb.837" /></div>
									</web:else>
								</web:ifErrorValue>
							</web:then>
							<web:else>
								<web:ifFeature type="requestKey" name="evt"
									value="com.microstrategy.web.app.beans.EnumDrillEditorEvents.WebEventDrillEditorProcess"
									enum="true">
									<web:then>
										<web:ifErrorValue property="code" value="-2147214570">
											<web:then>
												<div class="mstrAlertMessage"><web:descriptor
													key="mstrWeb.3761"
													desc="The drilling command could not be carried out. You do not have access to the requested attribute." /></div>
											</web:then>
											<web:else>
												<div class="mstrAlertMessage"><web:errorValue
													property="message" default="mstrWeb.3756;mstrWeb.837" /></div>
											</web:else>
										</web:ifErrorValue>
									</web:then>
									<web:else>
										<web:ifFeature type="requestKey" name="evt"
											value="com.microstrategy.web.app.beans.EnumDrillEditorEvents.WebEventAdvDrillEditorProcess"
											enum="true">
											<web:then>
												<web:ifErrorValue property="code" value="-2147214570">
													<web:then>
														<div class="mstrAlertMessage"><web:descriptor
															key="mstrWeb.3761"
															desc="The drilling command could not be carried out. You do not have access to the requested attribute." /></div>
													</web:then>
													<web:else>
														<div class="mstrAlertMessage"><web:errorValue
															property="message" default="mstrWeb.3756;mstrWeb.837" /></div>
													</web:else>
												</web:ifErrorValue>
												<%-- Normal errors: --%>
											</web:then>
											<web:else>
												<div class="mstrAlertMessage"><web:errorValue
													property="message" /></div>
											</web:else>
										</web:ifFeature>
									</web:else>
								</web:ifFeature>
							</web:else>
						</web:ifFeature>
					</web:else>
				</web:ifBeanValue></div>
			</web:else>
		</web:ifBeanValue>
		<web:ifFeature type="systemPreference" name="renderExceptionInfo">
			<web:then>
				<!--stackTrace -->
				<div class="mstrStackTraceError"><web:errorValue
					property="stackTrace" /></div>
			</web:then>
		</web:ifFeature>
		<web:ifFeature type="systemPreference" name="renderRequestInfo">
			<web:then>
				<!-- request -->
				<div class="mstrRequestError"><web:requestString /></div>
			</web:then>
		</web:ifFeature>
	</web:then>
</web:ifErrorValue>