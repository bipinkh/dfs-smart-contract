pragma solidity ^0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PostManUpgradable.sol";
contract TestPostManUpgradable {
	PostManUpgradable _postMan = PostManUpgradable(DeployedAddresses.PostManUpgradable());
	function testSubscribingProcess()public{
		bool expected=true;
		bool result=_postMan.subscribeClient(this);
		Assert.equal(result, expected, "subscriber not added");
	}
	function testUnSubscribingProcess()public{
		bool expected=true;
		bool result=_postMan.unSubscribeClient(this);
		Assert.equal(result, expected, "subscriber not deleted");
	}
}
