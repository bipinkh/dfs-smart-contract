pragma solidity^0.4.19;
import "./IsPostMan.sol";
contract SubNode is IsPostMan{

	/*struct subNodeInfo{
	    address subNodeAddress;
	}
	mapping(address=>subNodeInfo[]) subNodeMaps;
	
	
	function addSubNode(address postManAddress,
						address subNodeAddress) 
						public 
						onlyPostMan(postManAddress) 
						{
							subNodeMaps[postManAddress].push(subNodeInfo(subNodeAddress));
	}
	
	function deleteSubNode(address postManAddress,
							address subNodeAddress)
							public 
							onlyPostMan(postManAddress)
							{
								subNodeInfo[] memory totalSubNodes=subNodeMaps[postManAddress];
								uint totalSubNodeLength=totalSubNodes.length;
								
									for(uint i=0;i<totalSubNodeLength;i++){
										if(totalSubNodes[i].subNodeAddress==subNodeAddress){
											//there is client in subscriber list
											delete subNodeMaps[postManAddress][i];	
										}
									}
	}
	function checkSubNodeStatus(address postManAddress,
								address subNodeAddress)
								public 
								view 
								onlyPostMan(postManAddress) 
								returns(bool)
								{
									subNodeInfo[] memory totalSubNodes=subNodeMaps[postManAddress];
									uint totalSubNodesLength=totalSubNodes.length;
									for(uint i=0;i<totalSubNodesLength;i++){
										if(totalSubNodes[i].subNodeAddress==subNodeAddress){
											//there is subnode in postman list
											return true;
										}
									}
									return false;
	}
	function getSubNodeList(address postManAddress)
							public
							view 
							onlyPostMan(postManAddress)
							returns(address[])
							{
							  uint lengthOfSubNode=subNodeMaps[postManAddress].length;
								address[]    memory cAddress = new address[](lengthOfSubNode);
								
								for (uint i = 0; i < lengthOfSubNode; i++) {
									subNodeInfo memory clientsinfo = subNodeMaps[postManAddress][i];
									cAddress[i] = clientsinfo.subNodeAddress;
								}
								return cAddress;
							
	}*/
}
