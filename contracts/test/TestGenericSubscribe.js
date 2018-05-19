var GenericSubscribe=artifacts.require("GenericSubscribe");
var EternalStorage=artifacts.require("EternalStorage.sol");
contract('GenericSubscribe',function(accounts){
	let genericSubscribe
	let eternalStorage
	beforeEach('set up contract for each test',
		async function(){
			genericSubscribe=await GenericSubscribe.new()	//0
			eternalStorage=await EternalStorage.new();	//1
			//adding postman
			await genericSubscribe.addPostman(accounts[2])
			var resultBool=await genericSubscribe.checkPostManStatus(accounts[2])
			var expected=true
			assert.equal(resultBool,expected)
			//adding clients by postman
			await genericSubscribe.subscribeClient(eternalStorage.address, accounts[2],accounts[3])
			await genericSubscribe.subscribeClient(eternalStorage.address,accounts[2],accounts[4])
			await genericSubscribe.addSubNode(accounts[2],accounts[5]);
			await genericSubscribe.addSubNode(accounts[2],accounts[6]);
			
		}
	)
	/*it('looking my subscribed clients by postman',
		async function(){
			var expectedAccounts=[accounts[3],accounts[4]]
			//var expectedAccounts=accounts[3]
			var result=await genericSubscribe.getClientsList(eternalStorage.address,accounts[2])		
			assert.equal(result[0],expectedAccounts[0],"result      "+result[0]+"expected      "+expectedAccounts[0])
			//assert.equal(result,expectedAccounts,"result      "+result+"expected      "+expectedAccounts)
			
			assert.equal(result[1],expectedAccounts[1],"result      "+result[1]+"expected      "+expectedAccounts[1])
		}
	)*/
	
	it('unsubscribing clients by postman',
		async function(){
			
			await genericSubscribe.unSubscribeClient(eternalStorage.address,accounts[2],accounts[3])
			var result=await genericSubscribe.getClientStatus(eternalStorage.address,accounts[2],accounts[3])
			assert.equal(result,false)
			
			
		}
	)
	it('checking status of subscribed clients',
		async function(){
			var result=await genericSubscribe.getClientStatus(eternalStorage.address,accounts[2],accounts[3])
			assert.equal(result,true)
		})
	
	
	it('looking total clients for each postman',
		async function(){
			//adding clients by postman
			var expectedClients=2;	
			var result=await genericSubscribe.getTotalClientsPerPostMan(eternalStorage.address,accounts[2])
			assert.equal(result,expectedClients,"result      "+result+"expected      "+expectedClients)
		}
	)
	
	it('adding subnode to postman',
		async function(){
			//adding subnode
			var result=await genericSubscribe.checkSubNodeStatus(accounts[2],accounts[5])
			var expected=true
			assert.equal(result,expected,"result      "+result+"expected      "+expected)
		
		})
	it('delete subnode to postman',
		async function(){
			//adding subnode
			//await genericSubscribe.addSubNode(accounts[2],accounts[5]);
			//await genericSubscribe.checkSubNodeStatus(accounts[2],accounts[5]);
			//assert.equal(result,expected,"result      "+result+"expected      "+expected)
			//deleting subnode
			await genericSubscribe.deleteSubNode(accounts[2],accounts[5])
			var result=await genericSubscribe.checkSubNodeStatus(accounts[2],accounts[5])
			var expected=false;
			assert.equal(result,expected,"result      "+result+"expected      "+expected)
			
		
		})
	it('gets subnode list to postman',
		async function(){
			var expected=[accounts[5],accounts[6]]
			var result=await genericSubscribe.getSubNodeList(accounts[2])
			//=await genericSubscribe.checkSubNodeStatus(accounts[2],accounts[5]);
			
			assert.equal(result[0],expected[0],"result      "+result[0]+"expected      "+expected[0])
			assert.equal(result[1],expected[1],"result      "+result[1]+"expected      "+expected[1])
		
		})
})