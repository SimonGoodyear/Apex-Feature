public without sharing class Feature {

	public static Boolean PersonAccounts{
		get{
			if(PersonAccounts == null){
				PersonAccounts = Schema.sObjectType.Account.fields.getMap().containsKey('IsPersonAccount');
			}
			return PersonAccounts;
		}
		private set;
	}

	public static Boolean Chatter{
		get{
			if(Chatter == null){
				Chatter = Schema.getGlobalDescribe().containsKey('FeedItem');
			}
			return Chatter;
		}
		private set;
	}

	public static String Edition{
		get{
			if(Edition == null){
				Edition = [SELECT OrganizationType FROM Organization].OrganizationType;
			}
			return Edition;
		}
		private set;
	}

	public static Boolean IsSandbox{
		get{
			if(IsSandbox == null){
				IsSandbox = [SELECT IsSandbox FROM Organization].IsSandbox;
			}
			return IsSandbox;
		}
		private set;
	}

	/*
	* Returns a pod instance for your org
	* Example: returns na2 if your instance points to https://na2.salesforce.com
	*/
	public static String instancePodName {
		get {
			String baseURL =  URL.getSalesforceBaseUrl().toExternalForm();
            String pod = '';
			// this means a community url
	        if (baseURL.contains('force')) {
	            String[] urlStringArray = baseURL.split('\\.');
	            if(urlStringArray != null && urlStringArray.size() > 1) {
	                   pod = urlStringArray[1];   
	            }
	        } 
	        // this means a standard url
	        else {
	        	String[] urlStringArray = baseURL.split('\\.');
	            
	            if(urlStringArray != null && urlStringArray.size() > 1) {
	                   pod = urlStringArray[1];   
	            }
	        }
	        return pod;
		}
		private set;
	}


}
