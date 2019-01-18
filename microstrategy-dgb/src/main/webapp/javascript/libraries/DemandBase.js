 /*Start Demandbase Form Connector Microstrategy Implementation*/
window.dbAsyncInit = function() {
    /*Form Connector Configuration*/
    var dbf = Demandbase.Connectors.WebForm;
    dbf.connect({
        emailID: 'email', /* These can be name or ID */
        companyID: 'com',
        key: 'd19aa917fb833999a86f93c20a4ef216e884273c',
        autocompletePlaceholder: '',
        priorityMap: { //3 is highest
            'domain': 2,
            'ip': 1,
            'company': 3
        }
    });
};

function db_hook_after_parse(data, source) {
    
    mstrApp.demandBaseData = data; // set the data to be accessible elsewhere
    
    var selElement = document.getElementById('cty'),
    	options = selElement.options,
    	length = options.length,
    	countryName = data.country_name,
    	stateName = data.state,
    	i,
    	option;
    	
    	if(selElement.selectedIndex <= 0 ) {
    	    for(i = 0; i < length; i++) {
    		option = options[i];
    		if(option.text === countryName) {
    		    selElement.selectedIndex = i;
    		    selElement.onchange({target: selElement});
    		    break;
    		}
    	    }
    	    
    	    //prepopulate the company name.
    	    var companyElem = document.getElementById("com");
    	    companyElem.value = data.company_name;
    	    companyElem.onfocus({target: companyElem});
	}
}


(function()  {
    /*Retrieve Form Connector core file from the cloud*/
    var dbt = document.createElement('script');
    dbt.type = 'text/javascript';
    dbt.async = true;
    dbt.id = 'demandbase-form';
    dbt.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'scripts.demandbase.com/formWidget.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(dbt, s);
})();

/*End Demandbase Form Connector Implementation*/