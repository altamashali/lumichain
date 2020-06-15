const LumiToken = artifacts.require("LumiToken");

module.exports = function(deployer) {
  deployer.deploy(LumiToken, 10000000);
};
