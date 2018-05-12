var Subscribe=artifacts.require("Subscribe");
var Database=artifacts.require("ExternalStorage");
var DatabaseAccessControl=artifacts.require("DatabaseAccessControl");
contract('Subscribe',function(accounts){
	let subscribe
	let database
	let databaseAccessControl
	beforeEach('set up contract for each test',
		async function(){
			databaseAccessControl=await DatabaseAccessControl.new()		//0
			database=await ExternalStorage.new();	//1
			subscribe=await Subscribe.new()	//2
			
		}
	)
	it('looking my subscribed clients by postman',
		async function(){
			
			//adding postman
			await databaseAccessControl.addPostman(accounts[3])
			var result=await databaseAccessControl.checkPostManStatus(accounts[1])
			var expected=true
			assert.equal(result,expected)
			//adding clients by postman
			
			var result=await subscribe.subscribeClient(accounts[2],accounts[3],accounts[4])
			
			var expected=true
			
			assert.equal(result,expected)
		}
	)
	
})