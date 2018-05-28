# DecentralizedDatabaseContracts
Contract :IsOwner
	keeps track of owner address and gives owner modifier
Contract :IsPostMan is IsOwner
	maintains database of postmans address
Contract :SubNode is IsPostMan
	maintains database of subnode address associated with particular postman
Contract :StoringChunk is SubNode
	has function to manage chunklist per postman
Contract :GenericSubscribe is StoringChunk
	has function to manage subscribers per postman
Contract EternalStorage
	has required data with getters and setters
