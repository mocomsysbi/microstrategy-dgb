<%@ page%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="description" content="SAML Config" />
    <link rel="stylesheet" type="text/css" href="../../style/SAML/SamlConfig.css" media="screen" />
<title>SAML configuration</title>
</head>
<body>
	<div id="site-wrapper">
		<%--     <jsp:include page="/WEB-INF/templates/navigation.jsp"/> --%>
		<div class="main" id="main-two-columns">
			<div class="left" id="main-content">
				<div class="section">
					<div class="section-content">
						<div class="post">
							<div class="post-title">
								<h2 class="label label-green">SAML configuration generation</h2>
							</div>
							<p class="quiet large">Generates new configuration files for SAML
								security.</p>
							<div class="post-body">
								<form:form modelAttribute="samlConfig" action="save">
									<table>
                                        <tr>
                                            <td colspan="2" style="border-top: thin solid;"><label>General:</label></td>
                                        </tr>
                                        <%--   SP Entity ID --%>
										<tr>
											<td><label for="entityId">Entity ID:</label></td>
											<td>
												<form:errors cssClass="error" element="div" path="entityId" />
	                                            <form:input cssClass="text" id="entityId" path="entityId" value="${samlConfig.entityId}"/>
											</td>
										</tr>
										<tr>
											<td></td>
											<td><small>The ID under which your application will be registered with IDP. </small></td>
										</tr>

                                        <%--   SP Base URL --%>
										<tr>
                                            <td><label for="baseURL">Entity base URL:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="baseURL" />
                                                <form:input cssClass="text" id="baseURL" path="baseURL" value="${samlConfig.baseURL}"/>
                                            </td>
										</tr>
										<tr>
											<td></td>
											<td><small>Base to generate URLs for this server. 
											        The public address your server will be accessed from should be
													used here. </small></td>
										</tr>

                                        <%--   Behind the proxy --%>
                                        <tr>
                                            <td><label for="behindProxy">Behind the proxy:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="behindProxy"/>
                                                <form:select id="behindProxy" path="behindProxy" multiple="false">
                                                    <form:option value="true">Yes</form:option>
                                                    <form:option value="false">No</form:option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Yes means that application runs behind a reversed proxy or load balancer.
                                                       <nl>(In this case the baseURL field shall be set to front-end URL)
                                                </small>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="border-top: thin solid;"><label>Encryption:</label></td>
                                        </tr>
                                        
                                        <%--   Signature algorithm --%>
                                        <tr>
                                            <td><label for="signatureAlgorithm">Signature algorithm:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="keyStore.signatureAlgorithm"/>
                                                <form:select id="signatureAlgorithm" path="keyStore.signatureAlgorithm" multiple="false">
                                                    <form:option value="SHA1WITHRSA">SHA1 with RSA</form:option>
                                                    <form:option value="SHA256WITHRSA">SHA256 with RSA</form:option>
                                                    <form:option value="SHA512WITHRSA">SHA512 with RSA</form:option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Signature algorithm for assertion requests.
                                                </small>
                                            </td>
                                        </tr>
										
                                        <%--   Encrypt Assertions --%>
                                        <tr>
                                            <td><label for="encryptAssertions">Generate Encryption Key:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="keyStore.encryptAssertions"/>
                                                <form:select id="encryptAssertions" path="keyStore.encryptAssertions" multiple="false">
                                                    <form:option value="true">Yes</form:option>
                                                    <form:option value="false">No</form:option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>When set to true an encryption key will be generated in key store and included in
                                                       SP metadata XML. This will inform IDP that SP wants assertions to be encrypted.
                                                </small>
                                            </td>
                                        </tr>
                                        
                                        <%--   Assertion Attribute Mapping ------------------------------------------------ --%>
                                        <tr>
                                            <td colspan="2" style="border-top: thin solid;"><label>Assertion Attribute mapping:</label></td>                                        </tr>
                                        <tr>
                                            <td  colspan="2" style="vertical-align: top;">
                                                Defines names of SAML Assertion attribute containing information about user. 
                                            </td>
                                        </tr>
                                        <%--   Display name --%>
                                        <tr>
                                            <td><label for="displayNameAttributeName">Display Name Attribute:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="userInfo.displayNameAttributeName"/>
                                                <form:input cssClass="text" id="displayNameAttributeName" path="userInfo.displayNameAttributeName" value="${samlConfig.userInfo.displayNameAttributeName}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Name of assertion attribute containing user display name.
                                                </small>
                                            </td>
                                        </tr>

                                        <%--   Email --%>
                                        <tr>
                                            <td><label for="emailAttributeName">Email Attribute:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="userInfo.emailAttributeName"/>
                                                <form:input cssClass="text" id="emailAttributeName" path="userInfo.emailAttributeName" value="${samlConfig.userInfo.emailAttributeName}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Name of assertion attribute containing user email.
                                                </small>
                                            </td>
                                        </tr>

                                        <%--   Distinguished name --%>
                                        <tr>
                                            <td><label for="dnAttributeName">Distinguished name attribute:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="userInfo.dnAttributeName"/>
                                                <form:input cssClass="text" id="dnAttributeName" path="userInfo.dnAttributeName" value="${samlConfig.userInfo.dnAttributeName}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Name of assertion attribute containing user distinguished name.
                                                </small>
                                            </td>
                                        </tr>

                                        <%--   Groups --%>
                                        <tr>
                                            <td><label for="groupAttributeName">Group Attribute:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="userInfo.groupAttributeName"/>
                                                <form:input cssClass="text" id="groupAttributeName" path="userInfo.groupAttributeName" value="${samlConfig.userInfo.groupAttributeName}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Name of assertion attribute containing user groups.
                                                </small>
                                            </td>
                                        </tr>

                                        <%--   Group Format --%>
                                        <tr>
                                            <td><label for="groupFormat">Group format:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="userInfo.groupFormat"/>
                                                <form:select id="groupFormat" path="userInfo.groupFormat" multiple="false">
                                                    <form:option value="Simple">Simple</form:option>
                                                    <form:option value="DistinguishedName">Distinguished name</form:option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Format of group names in the assertion.
                                                </small>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" style="border-top: thin solid;"><label>Access Control:</label></td>
                                        </tr>
                                        <%--   Groups --%>
                                        <tr>
                                            <td><label for="Admin groups">Admin Groups:</label></td>
                                            <td>
                                                <form:errors cssClass="error" element="div" path="userInfo.adminGroups"/>
                                                <form:input cssClass="text" id="adminGroups" path="userInfo.adminGroups" value="${samlConfig.userInfo.adminGroups}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <small>Comma-separated list of IDP group names for MicroStrategy Web administrators.
                                                       Only users belonging to those groups will be allowed to access administrator pages.
                                                </small>
                                            </td>
                                        </tr>

                                        <%--   Submit ------------------------------------------------ --%>
										<tr>
											<td><br /> <input type="submit" class="button"
												value="Generate config" /></td>
										</tr>
									</table>
								</form:form>
							</div>
						</div>
						<div class="clearer">&nbsp;</div>
					</div>
				</div>
				<div class="clearer">&nbsp;</div>
			</div>
			<%--         <jsp:include page="/WEB-INF/templates/sidebar.jsp"/> --%>
		</div>
	</div>
</body>
</html>