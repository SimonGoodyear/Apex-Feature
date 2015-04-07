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
	* Example: returns NA2 if your instance points to https://na2.salesforce.com
	*/
	public static String InstanceName {
		get {
			if (InstanceName == null) {
				InstanceName = [SELECT InstanceName FROM Organization].InstanceName;
			}
			return InstanceName;
		}
		private set;
	}


}
