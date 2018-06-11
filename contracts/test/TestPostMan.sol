pragma solidity ^0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/postMan.sol";

contract TestPostMan {
	postMan _postMan = postMan(DeployedAddresses.postMan());
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
	function testInitiateContractWithClient()public{
		testSubscribingProcess();
		bool expected=true;
		bool result=_postMan.initiateContractWithClient(this,keccak256("i am blockchain developer"),keccak256("blockchain"));
		Assert.equal(result, expected, "subscriber deleted");
	}
}