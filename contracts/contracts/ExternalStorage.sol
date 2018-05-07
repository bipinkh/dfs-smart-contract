pragma solidity ^0.4.19;

/**
 * @title EternalStorage
 * @dev This contract holds all the necessary state variables to carry out the storage of any contract.
 */
contract ExternalStorage {
	mapping(bytes32 => uint256) internal uintStorage;
	mapping(bytes32 => string) internal stringStorage;
	mapping(bytes32 => address) internal addressStorage;
	mapping(bytes32 => bytes) internal bytesStorage;
	mapping(bytes32 => bool) internal boolStorage;
	mapping(bytes32 => int256) internal intStorage;
	//data to represent the suscriber of the each postMan
	
	
	mapping(address => bool) subscribersMap;
	
	function checkSubscriber(address clientAddress) public returns(bool){
		return subscribersMap[clientAddress];
	}
	function addSubscriber(address clientAddress) public {
	subscribersMap[clientAddress]=true;
	}
	function deleteSubscriber(address clientAddress) public {
	subscribersMap[clientAddress]=false;
	}
	

}