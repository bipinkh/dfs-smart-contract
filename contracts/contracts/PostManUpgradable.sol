pragma solidity^0.4.19;
import "./Upgradable.sol";
import "./ExternalStorage.sol";
contract PostManUpgradable is Upgradable{
	function initialize(){
	}
	function subscribeClient(address storageAddress,address clientAddress)public  returns(bool){
		ExternalStorage externalStorage=ExternalStorage(storageAddress);
		if(!externalStorage.checkSubscriber(clientAddress)){
			externalStorage.addSubscriber(clientAddress);
			return true;
		}
		return false;
	}
	function UnSubscribeClient(address storageAddress,address clientAddress)public  returns(bool){
		ExternalStorage externalStorage=ExternalStorage(storageAddress);
		if(externalStorage.checkSubscriber(clientAddress)){
			externalStorage.deleteSubscriber(clientAddress);
			return true;
		}
		return false;
	}
}
