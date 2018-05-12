pragma solidity^0.4.19;
import "./Upgradable.sol";
import "./ExternalStorage.sol";
import "./DatabaseAccessControl.sol";

contract GenericSubscribe is DatabaseAccessControl{
	struct clientsInfo{
	    address clientAddress;
	}
	//look specific clients if address is known
	 mapping  (address=>clientsInfo[])public postManToClientsMap;
	 
	function subscribeClient(address postManAddress,address clientAddress)onlyPostMan(postManAddress){
	    postManToClientsMap[postManAddress].push(clientsInfo(clientAddress));
	    
	}
	function unSubscribeClient(address postManAddress,address clientAddress)onlyPostMan(postManAddress){
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
	function getClientStatus(address postManAddress,address clientAddress)public view returns(bool){
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
    function getClientsList(address postManAddress)public view onlyPostMan(postManAddress)returns (address[]){
        uint lengthOfSubscriber=postManToClientsMap[postManAddress].length;
        address[]    memory cAddress = new address[](lengthOfSubscriber);
        
        for (uint i = 0; i < lengthOfSubscriber; i++) {
            clientsInfo storage clientsinfo = postManToClientsMap[postManAddress][i];
            cAddress[i] = clientsinfo.clientAddress;
        }
        
        return (cAddress);
    }
	function getTotalClientsPerPostMan(address postManAddress)public view onlyPostMan(postManAddress)returns(uint){
		uint totalClients=postManToClientsMap[postManAddress].length;
		return totalClients;
	}
}
	