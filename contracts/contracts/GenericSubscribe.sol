pragma solidity^0.4.19;
import "./Upgradable.sol";
import "./EternalStorage.sol";
import "./DatabaseAccessControl.sol";

contract GenericSubscribe is DatabaseAccessControl{
	
	 
	function subscribeClient(address storageAddress,address postManAddress,address clientAddress)onlyPostMan(postManAddress){
		EternalStorage eternalStorage=EternalStorage(storageAddress);
		eternalStorage.addPostManToClientMap(postManAddress,clientAddress);
	    //postManToClientsMap[postManAddress].push(clientsInfo(clientAddress));
	    
	}
	function unSubscribeClient(address storageAddress,address postManAddress,address clientAddress)onlyPostMan(postManAddress){
		EternalStorage eternalStorage=EternalStorage(storageAddress);
		eternalStorage.deletePostManToClientMap(postManAddress,clientAddress);
	  
		/*clientsInfo[] memory totalClients=postManToClientsMap[postManAddress];
		uint totalClientsLength=totalClients.length;
		for(uint i=0;i<totalClientsLength;i++){
			if(totalClients[i].clientAddress==clientAddress){
				//there is client in subscriber list
				delete postManToClientsMap[postManAddress][i];
				delete totalClients[i];		
			}
		}*/
	}
	function getClientStatus(address storageAddress,address postManAddress,address clientAddress)public view returns(bool){
		EternalStorage eternalStorage=EternalStorage(storageAddress);
		return eternalStorage.getClientStatus(postManAddress,clientAddress);
	  
		/*clientsInfo[] memory totalClients=postManToClientsMap[postManAddress];
		uint totalClientsLength=totalClients.length;
		for(uint i=0;i<totalClientsLength;i++){
			if(totalClients[i].clientAddress==clientAddress){
				//there is client in subscriber list
				return true;
			}
		}
		return false;*/
	}
    /*function getClientsList(address storageAddress,address postManAddress)public view onlyPostMan(postManAddress)returns (address[]){
        EternalStorage eternalStorage=EternalStorage(storageAddress);
		address[] listOfAdd= eternalStorage.getClientList(postManAddress);
		return listOfAdd;
	  
		/*uint lengthOfSubscriber=postManToClientsMap[postManAddress].length;
        address[]    memory cAddress = new address[](lengthOfSubscriber);
        
        for (uint i = 0; i < lengthOfSubscriber; i++) {
            clientsInfo storage clientsinfo = postManToClientsMap[postManAddress][i];
            cAddress[i] = clientsinfo.clientAddress;
        }
        
        return (cAddress);
    }*/
	function getTotalClientsPerPostMan(address storageAddress,address postManAddress)public view onlyPostMan(postManAddress)returns(uint){
		EternalStorage eternalStorage=EternalStorage(storageAddress);
		return eternalStorage.getTotalClient(postManAddress);
	}
}
	