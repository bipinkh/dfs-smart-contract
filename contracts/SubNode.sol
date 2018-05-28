pragma solidity^0.4.19;
import "./IsPostMan.sol";

contract SubNode is IsPostMan{


	struct subNodeInfo{
        bool isActive;
        uint listPointer;
	}

	struct nodeInfo{
	    mapping(address => subNodeInfo) subNodeMaps;    // subnode address to it's info
	    address[] subNodeKeys;      // list of all subscribed nodes
	}

	mapping(address => nodeInfo ) nodeMaps; // postman_address ==> postmaninfo


	function addSubNode(address postManAddress,address subNodeAddress) public onlyPostMan(postManAddress) returns (bool){
		require(! (nodeMaps[postManAddress].subNodeMaps[subNodeAddress].isActive) );
        uint myIndex = nodeMaps[postManAddress].subNodeKeys.push(subNodeAddress) - 1;
		subNodeInfo memory sni = subNodeInfo(true,myIndex);
    	nodeMaps[postManAddress].subNodeMaps[subNodeAddress] = sni;
        return true;
	}

	function checkSubNodeStatus(address p, address sn) view onlyPostMan(p) returns (bool){
	    return nodeMaps[p].subNodeMaps[sn].isActive;
	}


	function deleteSubNode(address postManAddress,address subNodeAddress)public onlyPostMan(postManAddress) returns (bool){
		require( nodeMaps[postManAddress].subNodeMaps[subNodeAddress].isActive );
	    uint deletingIndex = nodeMaps[postManAddress].subNodeMaps[subNodeAddress].listPointer;
	    uint lastIndex = nodeMaps[postManAddress].subNodeKeys.length - 1;
        address lastKey   = nodeMaps[postManAddress].subNodeKeys[lastIndex];
        nodeMaps[postManAddress].subNodeKeys[deletingIndex] = lastKey;
        nodeMaps[postManAddress].subNodeMaps[lastKey].listPointer = deletingIndex;
        nodeMaps[postManAddress].subNodeKeys.length--;
        delete nodeMaps[postManAddress].subNodeMaps[subNodeAddress];
        return true;
	}

	function getSubnodes (address p) view returns (address[]){
	    return nodeMaps[p].subNodeKeys;
	}


}
