pragma solidity^0.4.19;
import "./Upgradable.sol";
contract Delegator is Upgradable{
	function Delegator(address target){
		replace(target);
	}
	function initialize(){
		revert;
	}
	function(){
		 var target = destination;
		 assembly { 
			calldatacopy(0x0, 0x0, calldatasize)    
			let success := delegatecall(sub(gas, 10000), target, 0x0, calldatasize, 0, 0)    
			let retSz := returndatasize   
			returndatacopy(0, 0, retSz)  
			switch success      
			case 0 {    
				revert(0, retSz)    
			}            
			default {
				return(0, retSz)
			}  
		} 
		
	}

}
