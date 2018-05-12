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