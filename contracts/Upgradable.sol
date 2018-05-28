pragma solidity^0.4.19;
contract Upgradable{
	address destination;
	address dataStorage;
	function initialize();
	function dataStore(address _dataStorage) internal{
		dataStorage=_dataStorage;
	}
	function replace(address _target) internal{
	destination=_target;
	_target.delegatecall(bytes4(sha3("initialize()")));
	}
}
