var GenericSubscribe=artifacts.require("GenericSubscribe");
contract('GenericSubscribe',function(accounts){
	let genericSubscribe
	beforeEach('set up contract for each test',
		async function(){
			genericSubscribe=await GenericSubscribe.new()	//1
			//adding postman
			await genericSubscribe.addPostman(accounts[2])
			var resultBool=await genericSubscribe.checkPostManStatus(accounts[2])
			var expected=true
			assert.equal(resultBool,expected)
			//adding clients by postman
			await genericSubscribe.subscribeClient(accounts[2],accounts[3])
			await genericSubscribe.subscribeClient(accounts[2],accounts[4])
			
		}
	)
	it('looking my subscribed clients by postman',
		async function(){
			var expectedAccounts=[accounts[3],accounts[4]]
			var result=await genericSubscribe.getClientsList(accounts[2])		
			assert.equal(result[0],expectedAccounts[0],"result      "+result[0]+"expected      "+expectedAccounts[0])
			assert.equal(result[1],expectedAccounts[1],"result      "+result[1]+"expected      "+expectedAccounts[1])
		}
	)
	it('unsubscribing clients by postman',
		async function(){
			
			await genericSubscribe.unSubscribeClient(accounts[2],accounts[3])
			var result=await genericSubscribe.getClientStatus(accounts[2],accounts[3])
			assert.equal(result,false)
			
			
		}
	)
	it('checking status of subscribed clients',
		async function(){
			var result=await genericSubscribe.getClientStatus(accounts[2],accounts[3])
			assert.equal(result,true)
		})
	
	
	it('looking total clients for each postman',
		async function(){
			//adding clients by postman
			var expectedClients=2;	
			var result=await genericSubscribe.getTotalClientsPerPostMan(accounts[2])
			assert.equal(result,expectedClients,"result      "+result+"expected      "+expectedClients)
		}
	)
})