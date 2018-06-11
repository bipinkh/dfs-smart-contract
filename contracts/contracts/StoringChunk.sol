pragma solidity^0.4.19;
import "./EternalStorage.sol";
import "./NewSubNode.sol";

contract StoringChunk is NewSubNode{
	function storeChunk(address storageAddress,
						address postManAddress,
						string chunkData,
						uint index)
						onlyPostMan(postManAddress)
						returns (bool)
						{
							EternalStorage externalStorage=EternalStorage(storageAddress);
							
									//externalStorage.setChunkInfo(postManAddress,fileHash,chunkHash,GMHash,index);
									externalStorage.setChunkInfo(postManAddress,chunkData,index);
									
									return true;
								
	
	}
	/*function deleteChunk(address storageAddress,
						address postManAddress,
						bytes32 fileHash,
						bytes32 chunkHash)
						onlyPostMan(postManAddress)
						returns (bool)
						{
							EternalStorage externalStorage=EternalStorage(storageAddress);
								
									externalStorage.deleteChunkInfo(postManAddress,fileHash,chunkHash);
									return true;
							
	}*/
	function viewChunkNumberPerPostman(address storageAddress,
						address postManAddress)
						view
						onlyPostMan(postManAddress)
						returns (uint)
						{
							EternalStorage externalStorage=EternalStorage(storageAddress);
									uint index=externalStorage.getTotalChunkPerPostman(postManAddress);
									return index;
	}
}