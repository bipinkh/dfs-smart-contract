pragma solidity ^0.4.19;
contract postMan{
	address postManAddress;
	//data to represent the suscriber of the each postMan
	mapping(address => bool) subcribersMap;
	//chunk info of each client
	struct chunkInfo{
		bytes32 chunkHash;
		bytes32 GMHash;
	}
	mapping(address=>chunkInfo) chunkInfoMap;
	function postMan(){
		//saving the postMan address
		postManAddress=msg.sender;
	}
	function subscribeClient(address clientAddress)public  returns(bool){
		if(!subcribersMap[clientAddress]){
		//already subscribed
		subcribersMap[clientAddress]=true;
		return true;
		}	
		return false;
	}
	function unSubscribeClient(address clientAddress)public  returns(bool){
		if(subcribersMap[clientAddress]){
		subcribersMap[clientAddress]=false;
		return true;
		}
		return false;
	}
	function initiateContractWithClient(address clientAddress,bytes32 _chunkHash,bytes32 _GMHash) public returns(bool){
		//check if client is subscriber or not
		if(subcribersMap[clientAddress]){
			chunkInfoMap[clientAddress].chunkHash=_chunkHash;
			chunkInfoMap[clientAddress].GMHash=_GMHash;
			return true;
		}
		return false;
	}
	
}