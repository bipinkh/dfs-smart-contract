const SubNode = artifacts.require("SubNode");

contract ('Testing the subnode functions', async(accounts) => {

  it ( 'create new postman and verify it\'s status', async() => {
    let instance = await SubNode.deployed();
    await instance.addPostman(accounts[1]);
    var result2 = await instance.checkPostManStatus 	(accounts[1]);
   // assert.equal(true, result,'adding');
    assert.equal(true, result2,'verifying');
  });


})