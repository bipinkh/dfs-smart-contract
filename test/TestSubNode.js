const SubNode = artifacts.require("SubNode");

contract('testing the subnode functions', async(accounts) =>{

  let instance

  beforeEach('getting contract instance', async() => {
    instance = await SubNode.deployed();
  });

  it('create a postman', async() => {
    instance.addPostman(accounts[1]);
    assert.equal(true, await instance.checkPostManStatus.call(accounts[1]));
  });

  it('add sub-postmen accounts[2] and accounts[3] to the postman accounts[1]', async() =>{
    instance.addSubNode(accounts[1], accounts[2]);
    instance.addSubNode(accounts[1], accounts[3]);
    assert.equal(true, await instance.checkSubNodeStatus.call(accounts[1],accounts[2]),  'accounts[2] is subpostman');
    assert.equal(true, await instance.checkSubNodeStatus.call(accounts[1],accounts[3]), 'accounts[3] is subpostman');
    assert.equal(false, await instance.checkSubNodeStatus.call(accounts[1],accounts[4]), 'accounts[4] is not subpostman');
  });

  it('get subnodes of accounts[1]', async() =>{
    var subpostmen_list = await instance.getSubnodes.call(accounts[1]);
    assert.equal(2,subpostmen_list.length);
    assert.equal(accounts[2],subpostmen_list[0]);
    assert.equal(accounts[3],subpostmen_list[1]);
  });


})
