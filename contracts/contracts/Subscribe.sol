pragma solidity^0.4.19;
import "./Upgradable.sol";
import "./ExternalStorage.sol";
import "./DatabaseAccessControl.sol";

contract Subscribe is DatabaseAccessControl{

	function subscribeClient(address postManAddress,address storageAddress,address clientAddress)onlyPostMan(postManAddress)public  returns(bool){
		ExternalStorage externalStorage=ExternalStorage(storageAddress);
		if(!externalStorage.checkSubscriber(clientAddress)){
			externalStorage.addSubscriber(clientAddress);
			return true;
		}
		return false;
	}
	function UnSubscribeClient(address postManAddress,address storageAddress,address clientAddress)onlyPostMan(postManAddress)public  returns(bool){
		ExternalStorage externalStorage=ExternalStorage(storageAddress);
		if(externalStorage.checkSubscriber(clientAddress)){
			externalStorage.deleteSubscriber(clientAddress);
			return true;
		}
		return false;
	}



}