var GenericSubscribe=artifacts.require("GenericSubscribe");
var DatabaseAccessControl=artifacts.require("DatabaseAccessControl");
contract('GenericSubscribe',function(accounts){
	let genericSubscribe
	let databaseAccessControl
	beforeEach('set up contract for each test',
		async function(){
			databaseAccessControl=await DatabaseAccessControl.new()		//0
			genericSubscribe=await GenericSubscribe.new()	//1
			
		}
	)
	it('looking my subscribed clients by postman',
		async function(){
			//adding postman
			await databaseAccessControl.addPostman(accounts[2])
			var result=await databaseAccessControl.checkPostManStatus(accounts[2])
			var expected=true
			//assert.equal(result,expected)
			//adding clients by postman
			
			await genericSubscribe.subscribeClient(accounts[2],accounts[3])
			await genericSubscribe.subscribeClient(accounts[2],accounts[4])
			var result=genericSubscribe.seeMyClients(accounts[2])
			var expected=[account[3],account[4]];
			
			assert.equal(result,expected)
		}
	)
	
})