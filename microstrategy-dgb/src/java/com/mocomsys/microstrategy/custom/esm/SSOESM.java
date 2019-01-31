package com.mocomsys.microstrategy.custom.esm;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.microstrategy.utils.MSTRUncheckedException;
import com.microstrategy.utils.StringUtils;
import com.microstrategy.utils.localization.LocaleInfo;
import com.microstrategy.utils.serialization.EnumWebPersistableState;
import com.microstrategy.web.app.AbstractExternalSecurity;
import com.microstrategy.web.beans.RequestKeys;
import com.microstrategy.web.objects.WebCluster;
import com.microstrategy.web.objects.WebClusterAdmin;
import com.microstrategy.web.objects.WebIServerSession;
import com.microstrategy.web.objects.WebObjectsException;
import com.microstrategy.web.objects.WebObjectsFactory;
import com.microstrategy.web.platform.ContainerServices;
import com.microstrategy.webapi.EnumDSSXMLAuthModes;

public class SSOESM extends AbstractExternalSecurity {
	private static final Logger logger = LoggerFactory.getLogger(SSOESM.class);
	private static final Properties prop;

	static {
		final InputStream stream = SSOESM.class.getResourceAsStream("/mstr.properties");
		prop = new Properties();
		
		try {
			prop.load(stream);
		} catch (IOException e) {
			logger.error("!!! error", e);
		}
	}
	
	// MSTR 인증 필요 시 이 클래스에서 최초로 호출되는 메서드로 인증가능한지 여부를 고려하여 앞으로 호출될 메서드를 결정.
	@Override
    public int handlesAuthenticationRequest(final RequestKeys reqKeys, final ContainerServices cntSvcs, final int reason) {
		logger.debug("=> reqKeys:[{}]", reqKeys);
		logger.debug("=> reason:[{}]", reason);
		
    	String mstrUserId = (String)cntSvcs.getSessionAttribute("mstrUserId");
    	String mstrUserPwd = (String)cntSvcs.getSessionAttribute("mstrUserPwd");
    	
    	logger.debug("=> mstrUserId:[{}]", mstrUserId);
    	if (StringUtils.isEmpty(mstrUserId)) {
    		return USE_CUSTOM_LOGIN_PAGE; // 오류 페이지로 이동
    	}
    	
    	String server = _getServer();
    	String project = _getProject();
    	int port = _getPort();
    	logger.debug("=> server:[{}], project:[{}]", server, project);
    	
    	// 서버가 지정되어 있지 않다면 오류 페이지(USE_CUSTOM_LOGIN_PAGE)로 이동
    	if (StringUtils.isEmpty(server)) {
    		return USE_CUSTOM_LOGIN_PAGE;
    	}
    	
    	boolean connected = reconnectISession(cntSvcs, project, mstrUserId);
    	
    	if (!connected) {
    		connected = connectISession(cntSvcs, server, project, port, mstrUserId, mstrUserPwd); 
    	}
    	
    	if (!connected) {
    		// 재접속/접속이 성공하지 않았다면 로그인 페이지로 이동
    		return USE_MSTR_DEFAULT_LOGIN;
    	} else {
    		// 성공 시 세션 생성 단계로 이동
    		return COLLECT_SESSION_NOW;
    	}
    }
    
    @Override
    public String getCustomLoginURL(final String originalURL, final String desiredServer, final int desiredPort, final String desiredProject) {
    	return _getEsmFailUrl();
    }
    
	@Override
    public WebIServerSession getWebIServerSession(final RequestKeys reqKeys, final ContainerServices cntSvcs) {

		// handlesAuthenticationRequest에서 이미 생성된 세션을 재활용
    	String project = _getProject();
        try {
            String sessionState = getSessionState(cntSvcs, project);

            if (StringUtils.isEmpty(sessionState)) {	
                throw new MSTRUncheckedException("WebIServerSession.getWebIServerSession(): Unable to restore session");
            }
            
            final WebIServerSession session = WebObjectsFactory.getInstance().getIServerSession();

            session.restoreState(sessionState);
            if (!session.isAlive()) {
                session.reconnect();
                
                setSessionState(cntSvcs, project, session.saveState(EnumWebPersistableState.MAXIMAL_STATE_INFO));
            }
            return session;
        } catch (WebObjectsException e) {
        	logger.error("!!! error", e);
        	
        	setSessionState(cntSvcs, project, null);
            throw new MSTRUncheckedException(e);
        }        
    }
	
	// 클러스터로 구성된 서버 중 사용가능한 서버를 조회
	public static String getLiveServer() throws WebObjectsException {
		WebClusterAdmin admin = WebObjectsFactory.getInstance().getClusterAdmin();
		admin.refreshAllClusters();
		
		String serverName = "";
		Enumeration<WebCluster> clusters = admin.getClusters().elements();
		if (clusters.hasMoreElements()){
			WebCluster cluster = clusters.nextElement();
			serverName = cluster.get(0).getNodeName();
		}
		return serverName;
	}    
    	
	// 세션의 생성
	private boolean connectISession(ContainerServices cntSvcs, String server, String project, int port, String mstrUserId, String mstrUserPwd) {

		try {
        	
            final WebIServerSession session = WebObjectsFactory.getInstance().getIServerSession();

            String liveServer = getLiveServer();
            if (StringUtils.isEmpty(liveServer)) { liveServer = server; }
            
            session.setServerName(server);
            if (StringUtils.isNotEmpty(project)) { session.setProjectName(project); }
            session.setServerPort(port);
            
            session.setLogin(mstrUserId);
            session.setDisplayLocale(LocaleInfo.getInstance(1042).getLocale()); // 한국어로 지정, 영어일 경우 1033
            session.setLocale(LocaleInfo.getInstance(1042).getLocale()); // 한국어로 지정, 영어일 경우 1033
            session.setClientID(cntSvcs.getRemoteAddress());
            session.setAuthMode(EnumDSSXMLAuthModes.DssXmlAuthSimpleSecurityPlugIn); // 트러스트 인증을 이용하여 세션을 생성할 경우
            session.setTrustToken(_getSsoToken()); // 트러스트 인증을 이용하여 세션을 생성할 경우
            //session.setAuthMode(EnumDSSXMLAuthModes.DssXmlAuthStandard); // 표준인증을 세션을 생성할 경우
            //session.setPassword(mstrUserPwd); // 표준인증을 세션을 생성할 경우
            
            session.getSessionID();
            setSessionState(cntSvcs, project, session.saveState(EnumWebPersistableState.MAXIMAL_STATE_INFO));
            
            cntSvcs.setSessionAttribute("mstrISession", session);
        } catch (Exception e) {
        	logger.error("!!! error", e);
        	
            return false;
        }
        
        return true;
	}	

	// 접속 서버,프로젝트,포트,트러스트토큰 조회
	private String _getServer() { return prop.getProperty("mstr.server.name"); }
	private int _getPort() { return Integer.parseInt(prop.getProperty("mstr.server.port")); }
	private String _getProject() { return prop.getProperty("mstr.default.project.name"); }
	private String _getSsoToken() { return prop.getProperty("mstr.trust.token"); }
	private String _getEsmFailUrl() { return prop.getProperty("mstr.esm.fail.url"); }

	// 각 프로젝트의 세션상태를 포함한 맵을 조회 
	private Map<String, String> getSessionStateMap(ContainerServices cntSvcs) {
		return (Map<String, String>)cntSvcs.getSessionAttribute("mstrSessionStateMap");
	}
	
	// 각 프로젝트의 세션상태를 포함한 맵에서 프로젝트에 해당하는 세션상태를 조회 
	private String getSessionState(ContainerServices cntSvcs, String project) {
		Map<String, String> mstrSessionStateMap = (Map<String, String>)cntSvcs.getSessionAttribute("mstrSessionStateMap"); 
		return mstrSessionStateMap == null ? null : mstrSessionStateMap.get(StringUtils.isEmpty(project) ? "-" : project);
	}

	// 각 프로젝트의 세션상태를 포함한 맵에 프로젝트의 세션상태를 지정 
	private void setSessionState(ContainerServices cntSvcs, String project, String sessionState) {
		Map<String, String> mstrSessionStateMap = (Map<String, String>)cntSvcs.getSessionAttribute("mstrSessionStateMap");
		
		if (mstrSessionStateMap == null) {
			mstrSessionStateMap = new HashMap<String, String>();
			cntSvcs.setSessionAttribute("mstrSessionStateMap", mstrSessionStateMap);
		}
		
		mstrSessionStateMap.put(StringUtils.isEmpty(project) ? "-" : project, sessionState);
	}
	
	// 사용자 인증을 수행, 세션으로 부터 전달된 파라미터의 경우는 인증을 수행.
	// !!! 별도의 인증이 필요한 경우 구현 
	private boolean customUserAuth(String userId, String pwd) {
		return true;
	}
	
	// 세션의 종료
	private void closeISession(String sessionState) {
    	try {
    		final WebIServerSession session = WebObjectsFactory.getInstance().getIServerSession();
    		session.restoreState(sessionState);
    		
    		if (session.isAlive()) {
    			session.closeSession();
    		}
    	} catch (WebObjectsException e) {
        	logger.error("!!! error", e);
    	}			
	}
	
	// 관리되고 있던 모든 세션의 종료
	private void closeAllISession(Map<String, String> sessionStateMap) {
		if (sessionStateMap != null) {
			for (String project : sessionStateMap.keySet()) {
				String sessionState = sessionStateMap.get(project);
				
				closeISession(sessionState);
				sessionStateMap.put(project, null);
			}
		}
	}

	// 세션의 재활용을 위해 과거에 생성되고 이용되고 있던 모든 프로젝트의 세션 중 조회
	private boolean reconnectISession(ContainerServices cntSvcs, String project, String mstrUserId) {
		String sessionState = getSessionState(cntSvcs, project);
		
		// 파라미터로 전달된 프로젝트에 해당하는 세션상태가 있다면, 재활용 시도
		if (StringUtils.isNotEmpty(sessionState)) {
			final WebIServerSession session = WebObjectsFactory.getInstance().getIServerSession();
			session.restoreState(sessionState);
			
			// 사용자가 변경되었다면 기존 세션상태 모두 삭제
			if (!StringUtils.isEqual(mstrUserId, session.getLogin())) {
				closeAllISession(getSessionStateMap(cntSvcs));
				return false;
			}
			
			// 프로젝트와 세션의 프로젝트가 같지 않을 경우 (접근될 수 없는 부분으로 다음 로그는 부적절 상태)
			if (!StringUtils.isEqual(project, session.getProjectName())) {
				logger.debug("=> invalide project, project session: [{}] [{}]", project, session.getProjectName());
				return false;
			}
			
	    	try {
	    		if (!session.isAlive()) {
	    			session.setTrustToken(_getSsoToken());
	    			session.reconnect();
	    			String newSessionState = session.saveState(EnumWebPersistableState.MAXIMAL_STATE_INFO);
	    			setSessionState(cntSvcs, project, newSessionState);
	    		}
	    	} catch (WebObjectsException e) {
	        	logger.error("!!! error", e);
	    		
	    		return false;
	    	}
	    	
	    	cntSvcs.setSessionAttribute("mstrISession", session);
	    	return true;
		}
			
		return false;
	}
}
