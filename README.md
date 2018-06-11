# DecentralizedDatabaseContracts

## Contract :[IsOwner](contracts/contracts/IsOwner.sol)

	keeps track of owner address and gives owner modifier
	
## Contract :[IsPostMan is IsOwner](contracts/contracts/IsPostMan.sol)

	maintains database of postmans address
	
## Contract :[NewSubNode is IsPostMan](contracts/contracts/NewSubNode.sol)

	maintains database of subnode address associated with particular postman

## Contract :[StoringChunk is NewSubNode](contracts/contracts/StoringChunk.sol)

	has function to manage chunklist per postman

## Contract :[GenericSubscribe is StoringChunk](contracts/contracts/GenericSubscribe.sol)

	has function to manage subscribers per postman

## Contract :[EternalStorage](contracts/contracts/EternalStorage.sol)

	has required data with getters and setters
