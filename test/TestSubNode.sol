pragma solidity ^0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SubNode.sol";
import "../contracts/IsPostMan.sol";

contract TestSubNode{

address adr_postman = 0x91c1C41E8B89D8b50640e06C13CB9B0a86CD42d7;
address adr_subnode1 = 0x9B22fe0F472135AAc4E9E713e28D4AC213C42336;
address adr_subnode2 = 0xD8c5FdcE4bA8D0014Cb5cD5C06e5FEd11673c7d9;
address adr_subnode3 = 0xc1AfB7A63495DEa49c4bEE2f2041fB95dA60299b;


function testingAddNewPostman() public{
    IsPostMan _IsPostMan = IsPostMan(DeployedAddresses.IsPostMan());
    bool expected = true;
    bool result = _IsPostMan.addPostman(adr_postman);
    Assert.equal(result,expected,"added new postman");
}


}