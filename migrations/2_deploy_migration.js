var SubNode = artifacts.require("SubNode");
var IsPostMan = artifacts.require("IsPostMan");

module.exports = function(deployer) {
  deployer.deploy(SubNode);
  deployer.deploy(IsPostMan);
};
