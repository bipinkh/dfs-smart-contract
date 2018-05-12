pragma solidity^0.4.19;
import "./Upgradable.sol";
import "./EternalStorage.sol";
import "./DatabaseAccessControl.sol";

contract StoringChunk is DatabaseAccessControl{
	function storeChunk(address storageAddress,
						address clientAddress,
						address postManAddress,
						bytes32 chunkHash,
						bytes32 GMHash)
						onlyPostMan(postManAddress)
						returns (bool)
						{
							EternalStorage externalStorage=EternalStorage(storageAddress);
							
									externalStorage.setChunkInfo(clientAddress,chunkHash,GMHash);
									return true;
								
	
	}
	function deleteChunk(address storageAddress,
						address clientAddress,
						address postManAddress)
						onlyPostMan(postManAddress)
						returns (bool)
						{
							EternalStorage externalStorage=EternalStorage(storageAddress);
								
									externalStorage.deleteChunkInfo(clientAddress);
									return true;
							
	}
	function viewChunk(address storageAddress,
						address clientAddress,
						address postManAddress)
						onlyPostMan(postManAddress)
						returns (bool)
						{
							EternalStorage externalStorage=EternalStorage(storageAddress);
							
									bytes32 chunkHash;
									bytes32 GMHash;
									(chunkHash,GMHash)=externalStorage.getChunkInfo(clientAddress);
									return true;
								
	}
}