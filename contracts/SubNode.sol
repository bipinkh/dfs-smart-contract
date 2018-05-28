pragma solidity^0.4.19;
import "./IsPostMan.sol";

contract SubNode is IsPostMan{

	struct subNodeInfo{
        // detail info can be stored here
        bool isActive;
	}
    
	mapping(address => mapping(address => subNodeInfo) ) subNodeMaps;
	// here the structure is ::  postman_address =>  ( subnode_address => subnodeinfo)
	
	function addSubNode(address postManAddress,address subNodeAddress) public onlyPostMan(postManAddress) {
		subNodeInfo memory sni = subNodeInfo(true);
		subNodeMaps[postManAddress][subNodeAddress] = sni;
	}
	
	function checkSubNodeStatus(address p, address sn) public view onlyPostMan(p) returns (bool){
	    return subNodeMaps[p][sn].isActive;
	}
	
	
	function deleteSubNode(address postManAddress,address subNodeAddress)public onlyPostMan(postManAddress){
	    delete subNodeMaps[postManAddress][subNodeAddress];
	}
	

}