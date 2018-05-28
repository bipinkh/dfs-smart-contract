const IsPostMan = artifacts.require("IsPostMan");

contract ('IsPostMan Functions Test ::', async(accounts) => {
  let instance

  beforeEach('getting instance',async() => {
    instance = await IsPostMan.deployed();
  })

  it ( 'create new postman and verify it\'s status', async() => {
    await instance.addPostman(accounts[1]);
    assert.equal(true, await instance.checkPostManStatus.call(accounts[1]), 'verifying');
  })

  it ('deletePostman', async() => {
    await instance.deletePostman(accounts[1]);
    assert.equal(false, await instance.checkPostManStatus.call(accounts[1]), 'deleting');
  })

})
