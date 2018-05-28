pragma solidity^0.4.19;
contract IPostman{
	function addClient(address postmanAddress,address clientAddress);
	function removeClient(address postmanAddress,address clientAddress);
}
