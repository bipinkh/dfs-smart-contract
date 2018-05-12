pragma solidity ^0.4.19;

/**
 * @title EternalStorage
 * @dev This contract holds all the necessary state variables to carry out the storage of any contract.
 */
contract EternalStorage {
	struct clientsInfo{
	    address clientAddress;
	}
	//look specific clients if address is known
	 mapping  (address=>clientsInfo[])public postManToClientsMap;

	//chunk info of each client
	struct chunkInfo{
		bytes32 chunkHash;
		bytes32 GMHash;
	}
	//consider 1 address has single chunkInfo for now
	mapping(address=>chunkInfo) chunkInfoMap;
	
	function addPostManToClientMap(address postManAddress,address clientAddress)public{
	  postManToClientsMap[postManAddress].push(clientsInfo(clientAddress));
	}
	
	
	function deletePostManToClientMap(address postManAddress,address clientAddress)public {
	clientsInfo[] memory totalClients=postManToClientsMap[postManAddress];
		uint totalClientsLength=totalClients.length;
		for(uint i=0;i<totalClientsLength;i++){
			if(totalClients[i].clientAddress==clientAddress){
				//there is client in subscriber list
				delete postManToClientsMap[postManAddress][i];
				delete totalClients[i];		
			}
		}
	}
	function getClientStatus(address postManAddress,address clientAddress)public returns(bool){
	clientsInfo[] memory totalClients=postManToClientsMap[postManAddress];
		uint totalClientsLength=totalClients.length;
		for(uint i=0;i<totalClientsLength;i++){
			if(totalClients[i].clientAddress==clientAddress){
				//there is client in subscriber list
				return true;
			}
		}
		return false;
	}
	function getClientList(address postManAddress)public returns(address[]){
	  uint lengthOfSubscriber=postManToClientsMap[postManAddress].length;
        address[]    memory cAddress = new address[](lengthOfSubscriber);
        
        for (uint i = 0; i < lengthOfSubscriber; i++) {
            clientsInfo storage clientsinfo = postManToClientsMap[postManAddress][i];
            cAddress[i] = clientsinfo.clientAddress;
        }
        return cAddress;
	
	}
	function getTotalClient(address postManAddress)public returns(uint){
		return postManToClientsMap[postManAddress].length;
	}
	
	
	//for chunk data
	
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