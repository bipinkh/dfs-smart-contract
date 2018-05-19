pragma solidity^0.4.19;
//import "./Upgradable.sol";
import "./EternalStorage.sol";
import "./SubNode.sol";

contract GenericSubscribe is SubNode{
	
	 
	function subscribeClient(address storageAddress,address postManAddress,address clientAddress)public onlyPostMan(postManAddress){
		EternalStorage eternalStorage=EternalStorage(storageAddress);
		eternalStorage.addPostManToClientMap(postManAddress,clientAddress);
	    
	}
	function unSubscribeClient(address storageAddress,address postManAddress,address clientAddress)public onlyPostMan(postManAddress){
		EternalStorage eternalStorage=EternalStorage(storageAddress);
		eternalStorage.deletePostManToClientMap(postManAddress,clientAddress);
	}
	function getClientStatus(address storageAddress,address postManAddress,address clientAddress)public view returns(bool){
		EternalStorage eternalStorage=EternalStorage(storageAddress);
		return eternalStorage.getClientStatus(postManAddress,clientAddress);
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
	