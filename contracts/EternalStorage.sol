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
		string chunkData;
		uint chunkIndex;
		
	}
	//consider 1 address has single chunkInfo for now
	//mapping(address=>chunkInfo) chunkInfoMap;
	
	//consider 1 postman has many chunks 
	mapping(address=>chunkInfo[]) chunkInfoMapWithPostMan;
	
	
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
	function compareStrings (string a, string b) view returns (bool){
       return keccak256(a) == keccak256(b);
   }
	
	//for chunk data
	function getTotalChunkPerPostman(address postManAddress)public returns(uint){
		uint totalChunks=chunkInfoMapWithPostMan[postManAddress].length;
		return totalChunks;
	}
	function getChunkInfo(address postManAddress,string chunkHash)public returns(uint){
		uint totalLength=chunkInfoMapWithPostMan[postManAddress].length;
		  chunkInfo[]    memory chunkData = new chunkInfo[](totalLength);
		uint index;
		for(uint i=0;i<totalLength;i++){
			if(compareStrings(chunkHash,chunkData[i].chunkData)){
			index=chunkData[i].chunkIndex;
			}
		}
		return totalLength;
	}
	function setChunkInfo(address postManAddress,string data,uint _index)public{
		chunkInfoMapWithPostMan[postManAddress].push(chunkInfo(data,_index));
	}
	/*function deleteChunkInfo(address postManAddress,bytes32 _fileHash,bytes32 _chunkHash)public{
		chunkInfo[] memory totalChunks=chunkInfoMapWithPostMan[postManAddress];
		uint totalChunksLength=totalChunks.length;
		for(uint i=0;i<totalChunksLength;i++){
			if(totalChunks[i].fileHash==_fileHash&&totalChunks[i].chunkHash==_chunkHash){
				//there is client in subscriber list
				delete chunkInfoMapWithPostMan[postManAddress][i];
					
			}
		}
	}*/
	//function checkChunkStatus(address postManAddress,address clientAddress,bytes32 
}