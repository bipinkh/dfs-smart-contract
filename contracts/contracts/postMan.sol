pragma solidity ^0.4.19;
contract postMan{
	address postManAddress;
	//data to represent the suscriber of the each postMan
	mapping(address => bool) subcribersMap;
	
	function postMan(){
		//saving the postMan address
		postManAddress=msg.sender;
	}
	function subscribeClient(address clientAddress)public view returns(bool){
		if(!subcribersMap[clientAddress]){
		//already subscribed
		subcribersMap[clientAddress]=true;
		return true;
		}	
		return false;
	}
	function unSubscribeClient(address clientAddress)public view returns(bool){
		if(subcribersMap[clientAddress]){
		subcribersMap[clientAddress]=false;
		return true;
		}
		return false;
	}
}
