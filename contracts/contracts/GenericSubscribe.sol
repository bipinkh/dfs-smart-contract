pragma solidity^0.4.19;
import "./Upgradable.sol";
import "./ExternalStorage.sol";
import "./DatabaseAccessControl.sol";

contract GenericSubscribe is DatabaseAccessControl{
	
	//consider 1 postman can have no of subscribed clients
	mapping(address=>address[])postmanToClientsMap;
	function addSubscriber(address postManAddress,address clientAddress) internal returns(bool) {
		uint arrayLength=postmanToClientsMap[postManAddress].length;
		for (uint i=0; i<arrayLength; i++) {
			//if already present client
			if(postmanToClientsMap[postManAddress][i]==clientAddress){
			return false;
			}
		}
		postmanToClientsMap[postManAddress].push(clientAddress);
		return true;
	}
	function deleteSubscriber(address postManAddress,address clientAddress) internal returns(bool){
		uint arrayLength=postmanToClientsMap[postManAddress].length;
		for (uint i=0; i<arrayLength; i++) {
			if(postmanToClientsMap[postManAddress][i]==clientAddress){
				//client address is found in that postman subscriber list
				delete postmanToClientsMap[postManAddress][i];
				return true;
			}
		}
		return false;
	}
	function getSubscribedClients(address postManAddress)internal returns(address[]){
		address[] subscribedClients=postmanToClientsMap[postManAddress];
		return subscribedClients;
	}
	/*
	function subscribeClient(address postManAddress,address storageAddress,address clientAddress)onlyPostMan(postManAddress)public  returns(bool){
		ExternalStorage externalStorage=ExternalStorage(storageAddress);
		return externalStorage.addSubscriber(postManAddress,clientAddress);
	}
	function UnSubscribeClient(address postManAddress,address storageAddress,address clientAddress)onlyPostMan(postManAddress)public  returns(bool){
		ExternalStorage externalStorage=ExternalStorage(storageAddress);
		externalStorage.deleteSubscriber(postManAddress,clientAddress);
	}
		function seeMyClients(address postManAddress,address storageAddress)public view onlyPostMan(postManAddress) returns(address[]){
		ExternalStorage externalStorage=ExternalStorage(storageAddress);
		return externalStorage.getSubscribedClients(postManAddress);
	}*/
	function subscribeClient(address postManAddress,address clientAddress)onlyPostMan(postManAddress)public  returns(bool){
		addSubscriber(postManAddress,clientAddress);
	}
	function UnSubscribeClient(address postManAddress,address clientAddress)onlyPostMan(postManAddress)public  returns(bool){
		deleteSubscriber(postManAddress,clientAddress);
	}
	function seeMyClients(address postManAddress)public view onlyPostMan(postManAddress) returns(address[]){
		getSubscribedClients(postManAddress);
	}

}