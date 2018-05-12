pragma solidity^0.4.19;
import "./Upgradable.sol";
import "./ExternalStorage.sol";
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
							ExternalStorage externalStorage=ExternalStorage(storageAddress);
								if(externalStorage.checkSubscriber(clientAddress)){
									externalStorage.setChunkInfo(clientAddress,chunkHash,GMHash);
									return true;
								}
								return false;
	
	}
	function deleteChunk(address storageAddress,
						address clientAddress,
						address postManAddress)
						onlyPostMan(postManAddress)
						returns (bool)
						{
							ExternalStorage externalStorage=ExternalStorage(storageAddress);
								if(externalStorage.checkSubscriber(clientAddress)){
									externalStorage.deleteChunkInfo(clientAddress);
									return true;
								}
								return false;
	}
	function viewChunk(address storageAddress,
						address clientAddress,
						address postManAddress)
						onlyPostMan(postManAddress)
						returns (bool)
						{
							ExternalStorage externalStorage=ExternalStorage(storageAddress);
								if(externalStorage.checkSubscriber(clientAddress)){
									bytes32 chunkHash;
									bytes32 GMHash;
									(chunkHash,GMHash)=externalStorage.getChunkInfo(clientAddress);
									return true;
								}
								return false;
	}
}