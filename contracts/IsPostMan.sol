//acess control
pragma solidity^0.4.19;
import "./IsOwner.sol";
contract IsPostMan is IsOwner{
	mapping(address=>bool)postMans;


	 modifier   onlyPostMan(address _address){
		require(postMans[_address]);
		_;
	}

	function addPostman(address postmanAddress)public onlyOwner returns (bool){
		if(!postMans[postmanAddress]){
			postMans[postmanAddress]=true;
            return true;
		}
        return false;
	}

	function deletePostman(address postmanAddress)public onlyOwner returns (bool){
		if(postMans[postmanAddress]){
			delete postMans[postmanAddress];
            return true;
		}
        return false;
	}

	function checkPostManStatus(address postManAddress)public view onlyOwner returns(bool){
		if(postMans[postManAddress] == true)
		{
			return true;
		}
		return false;
	}
}
