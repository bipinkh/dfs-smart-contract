//acess control 
pragma solidity^0.4.19;
contract IsOwner{
	address owner;
	modifier onlyOwner(){
		require(msg.sender==owner);
		_;
	}
	constructor(){
		owner=msg.sender;
	}
}