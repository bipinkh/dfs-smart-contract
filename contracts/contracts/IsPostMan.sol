//acess control 
pragma solidity^0.4.19;
import "./IsOwner.sol";
contract IsPostMan is IsOwner{
	mapping(address=>bool)postMans;

	modifier   onlyPostMan(address _address){
		require(postMans[_address]);
		_;
	}
	function addPostman(address postmanAddress)
						public
						onlyOwner
						{
							if(!postMans[postmanAddress]){
								postMans[postmanAddress]=true;
							}
	}
	function deletePostman(address postmanAddress)
							public
							onlyOwner
							{
								if(postMans[postmanAddress]){
									delete postMans[postmanAddress];
								}
	}
	function checkPostManStatus(address postManAddress)
								public 
								view
								onlyOwner 
								returns(bool)
								{
									if(postMans[postManAddress])
									{
										return true;
									}
									return false;
	}
}
	
