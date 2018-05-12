//acess control 
pragma solidity^0.4.19;
contract DatabaseAccessControl{
	//owner
	address public owner;
	//we have collection of postmans
	//each postman will have collection of subscribed clients
	mapping(address=>bool)postmanMaps;
	
	modifier onlyPostMan(address _address){
		require(postmanMaps[_address]);
		_;
	}
	modifier onlyOwner(){
		require(msg.sender==owner);
		_;
	}
	function DatabaseAccessControl(){
		owner=msg.sender;
	}
	function addPostman(address postmanAddress)public onlyOwner{
		if(!postmanMaps[postmanAddress]){
			postmanMaps[postmanAddress]=true;
		}
	}
	function deletePostman(address postmanAddress)public onlyOwner{
		if(postmanMaps[postmanAddress]){
			delete postmanMaps[postmanAddress];
		}
	}
	function checkPostManStatus(address postManAddress)public view onlyOwner returns(bool){
		if(postmanMaps[postManAddress])
		{
			return true;
		}
		return false;
	}


}
