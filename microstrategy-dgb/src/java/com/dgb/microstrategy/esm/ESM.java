package com.dgb.microstrategy.esm;

import com.microstrategy.web.app.AbstractExternalSecurity;
import com.microstrategy.web.beans.RequestKeys;
import com.microstrategy.web.objects.WebIServerSession;
import com.microstrategy.web.platform.ContainerServices;

/**
 * ESM 예시 - 이 소스를 ESM으로 적용하면, 사용자 식별이 필요한 페이지 접근 시 호출되며, 
 * 무조건 'Administrator' 계정으로, 'MicroStrategy Tutorial' 프로젝트 기준 MSTR 세션 생성 수행하므로, 각 Override 메서드에 적절한 비지니스 로직 추가 
 * @author Administrator
 *
 */
public class ESM extends AbstractExternalSecurity {
	/*
	 * MSTR ESM(External Security Module)에 대한 설명
	 * https://lw.microstrategy.com/msdz/MSDL/GARelease_Current/docs/projects/WebSDK/Content/topics/esm/Creating_a_Custom_External_Security_Module_ESM.htm
	 * ESM 소스 설명
	 * https://lw.microstrategy.com/msdz/MSDL/GARelease_Current/docs/projects/WebSDK/Content/topics/sso/SSO_SSOSample_ESMCodeExpl.htm
	 */
	
	/* 
	 * 사용자 인증정보를 알 수 있는 상황(MSTR 세션을 생성할 수 있는 정상적이 상황이면) MSTR 세션 생성을 위해 USE_CUSTOM_LOGIN_PAGE 반환,
	 * 사용자 식별 불가하면 USE_CUSTOM_LOGIN_PAGE 반환  
	 */
	@Override
    public int handlesAuthenticationRequest(final RequestKeys reqKeys, final ContainerServices cntSvcs, final int reason) {
		return COLLECT_SESSION_NOW;
    	//return USE_CUSTOM_LOGIN_PAGE;
    }

	/*
	 * USE_CUSTOM_LOGIN_PAGE일 경우에 로그인 경로를 반환받기 위해서 호출됨
	 */
	@Override
    public String getCustomLoginURL(final String originalURL, final String desiredServer, final int desiredPort, final String desiredProject) {
    	return "";
    }
	
	/* 
	 * MSTR 사용자 세션을 생성 - 실제 비지니스 로직 적용 필요
	 * 
	 */
	@Override
    public WebIServerSession getWebIServerSession(final RequestKeys reqKeys, final ContainerServices cntSvcs) {
		WebIServerSession session = null;
		
		System.out.println("===> Create MSTR Session.");
		
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return session; 
    }
    
}
