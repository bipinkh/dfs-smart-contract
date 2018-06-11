var DatabaseAccessControl=artifacts.require("DatabaseAccessControl");
contract('DatabaseAccessControl',function(accounts){
	let databaseAccessControl
	beforeEach('set up contract for each test',
		async function(){
			databaseAccessControl=await DatabaseAccessControl.new()
		}
	)
	it('has an owner',
		async function(){
			assert.equal(await databaseAccessControl.owner.call(),accounts[0])
		}
	)
	it('adds postman by owner',
		async function(){
			await databaseAccessControl.addPostman(accounts[1])
			var result=await databaseAccessControl.checkPostManStatus(accounts[1])
			var expected=true
			assert.equal(result,expected)
		}
	)
	it('deletes postman by owner',
		async function(){
			await databaseAccessControl.addPostman(accounts[1])
			await databaseAccessControl.deletePostman(accounts[1])
			var result=await databaseAccessControl.checkPostManStatus(accounts[1])
			var expected=false
			assert.equal(result,expected)
		}
	)
})