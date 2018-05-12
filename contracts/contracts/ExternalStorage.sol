pragma solidity ^0.4.19;

/**
 * @title EternalStorage
 * @dev This contract holds all the necessary state variables to carry out the storage of any contract.
 */
contract ExternalStorage {
	//data to represent the suscriber of the each postMan
	mapping(address => bool) subscribersMap;
	
	//consider 1 postman can have no of subscribed clients
	mapping(address=>address[])postmanToClientsMap;
	
	

	//chunk info of each client
	struct chunkInfo{
		bytes32 chunkHash;
		bytes32 GMHash;
	}
	//consider 1 address has single chunkInfo for now
	mapping(address=>chunkInfo) chunkInfoMap;
	
	
	
	
	function checkSubscriber(address clientAddress) public returns(bool){
		return subscribersMap[clientAddress];
	}
	function addSubscriber(address clientAddress) public {
		subscribersMap[clientAddress]=true;
	}
	function deleteSubscriber(address clientAddress) public {
		delete subscribersMap[clientAddress];
	}
	
	function addSubscriber(address postManAddress,address clientAddress) public returns(bool) {
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
	function deleteSubscriber(address postManAddress,address clientAddress) public returns(bool){
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
	function getSubscribedClients(address postManAddress)public returns(address[]){
		address[] subscribedClients=postmanToClientsMap[postManAddress];
		return subscribedClients;
	}
	
	
	
	function getChunkInfo(address clientAddress)public returns(bytes32,bytes32){
		return (chunkInfoMap[clientAddress].chunkHash,chunkInfoMap[clientAddress].GMHash);
	}
	function setChunkInfo(address clientAddress,bytes32 _chunkHash,bytes32 _GMHash)public{
		chunkInfoMap[clientAddress].chunkHash=_chunkHash;
		chunkInfoMap[clientAddress].GMHash=_GMHash;
	}
	function deleteChunkInfo(address clientAddress)public{
		delete chunkInfoMap[clientAddress];
	}
}