<%@ taglib uri="/webUtilTL.tld" prefix="web" %>
<%@ page import="com.microstrategy.web.app.beans.PageComponent" %>
 
<span id="pagePlaceholder"></span>  

<script type="text/javascript">
   
	mstrmojo.App = mstrConfig;


	
	/**
     * Checks the browser version to see if it meets the requirement
     * 
     */
    function checkBrowser() {
    	
		if (navigator && navigator.userAgent) {
			 var getInternetExplorerVersion = function getInternetExplorerVersion() {
			    // Returns the version of Internet Explorer or a -1
			    // (indicating the use of another browser).
			    var rv = -1, // Return value assumes failure.
			    ua = navigator.userAgent,
			    re; 
			    if (navigator.appName == 'Microsoft Internet Explorer') {			        
				re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
				if (re.exec(ua) != null){
				  rv = parseFloat( RegExp.$1 );
				}		        
			    } else { //IE11+
				re  = new RegExp("Trident\/7.0;(.)*rv:([0-9]{1,}[\.0-9]{0,})");			    	
				if (re.exec(ua) != null){
			    		rv = parseFloat( RegExp.$2 );
				}
			    }			    
			    return rv;
			};

		  	var ua = navigator.userAgent,
	          	ver = parseFloat(ua.replace(/.*?(Firefox|Chrome|MSIE\s|Version)\/?(\d+\.\d).*/, '$2')),
		        isIE8plus = getInternetExplorerVersion() >= 8.0, 
	        	isFF = ua.indexOf('Firefox') > -1,
		        isChrome = ua.indexOf('Chrome') > -1,
		        isSafari = ua.indexOf('Safari') > -1,
		        isMac = ua.indexOf('Macintosh') > -1 || !!ua.match(/iPad/),		       
		        isWin = ua.indexOf('Windows') > -1;
        
      		var  supported = (isWin && (isIE8plus || (isFF && ver >= 13) || (bIsChrome && ver >= 20)))
                      || (isMac && ((bIsSafari && ver >= 5.1) || (isFF && ver >= 13) || (bIsChrome && ver >= 20)));
					    	      
		    if (!supported) {
        	          	          
   	          	//show message to replace main page content
   	          	function showWarning() {
    	          
    	              var elContent = document.getElementById('mstrWeb_content'),
    	                  elHeader = document.getElementById('mstrWeb_shortcutsBar'),
    	                  elBottom = document.getElementById('mstrWeb_dockBottom'),
    	                  elFooter = document.getElementById('mstrWeb_footer');
    	                  
    	              
    	              if (elContent && elHeader && elFooter) {
    	                  //clear timer
    	                  if (timer) {
    	                      window.clearInterval(timer);
    	                  }

    	                  //replace content with this message:
    	                  if (navigator.appName == 'Microsoft Internet Explorer' && document.documentMode) { // IE8 or later with compatible mode turned on
    	                	  elContent.innerHTML = '<div class="compatibility-info">' +
    	                		  '<div class="ie"></div>' +
    	                		  '</div>';
    	                  }else {
    		                  elContent.innerHTML = '<div class="browser-info">' +
    		                             '<div class="title">' + mstrmojo.desc(10116)+ '</div>' + 
    		                             '<div>'+ 'Please use one of the browsers below' +'</div>' +
    		                             '<table class="os" border=0 cellpadding=0 cellspacing=0><tr>' + 
    		                             '<td class="w">' + 
    		                                '<div class="logo win"></div>' +
    		                                '<div class="bold">'+ mstrmojo.desc(10118)+':</div>' +
    		                                '<div class="bl">' + 
    		                                    '<div><a href="http://windows.microsoft.com/en-US/internet-explorer/downloads/ie-9/worldwide-languages" target=_blank>Internet Explorer 8+</a></div>' +
    		                                    '<div><a href="http://www.mozilla.org/en-US/firefox/new/" target=_blank>Firefox 13+</a></div>' +
    		                                    '<div><a href="http://www.google.com/chrome" target=_blank>Chrome 20+</a></div>' +
    		                                '</div>' +
    		                             '</td>' +
    		                             '<td class="m">' + 
    		                                 '<div class="logo mac"></div>' +
    		                                 '<div class="bold">Apple users:</div>' +
    		                                 '<div class="bl">' + 
    		                                     '<div><a href="http://www.apple.com/safari" target=_blank>Safari 5.1+</a></div>' +
    		                                     '<div><a href="http://www.mozilla.org/en-US/firefox/new/" target=_blank>Firefox 13+</a></div>' +
    		                                     '<div><a href="http://www.google.com/chrome" target=_blank>Chrome 20+</a></div>' +
    		                                 '</div>' +
    		                              '</td>' +
    		                             '</tr></table>' +
    		                           '</div>';
    	                  }

    	                  var h = elContent.offsetHeight + elBottom.offsetHeight;

    	                  elBottom.innerHTML = '';
    	                  elBottom.style.display = 'none';
    	                  elContent.style.height = h + 'px'; 
    	                  if (elContent.firstChild && elContent.firstChild.firstChild) {
    	                	  elContent.firstChild.firstChild.style.paddingTop = Math.max((h - elContent.firstChild.offsetHeight ) / 2, 0) + 'px';
    	                	  elContent.firstChild.style.height =  '100%';
    	                  }
    	              }
   	          	}
    	          
    	        // keep checking until the required HTML Element is rendered, then replace it with this message.
   	       		var timer = window.setInterval(function() {        	          
    	            showWarning();
    	        }, 100);
    	        return false;
    	    }
    	}

    	return true; 
    }
	
	if (checkBrowser()) {
        // Create and start the app.
        mstrApp = new mstrmojo.qb.QBApp(mstrmojo.hash.copy(mstrApp));       
        mstrApp.start(mstrApp.type);
    }
	
	

</script>








