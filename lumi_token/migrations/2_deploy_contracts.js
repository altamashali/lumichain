const LumiToken = artifacts.require("LumiToken");
const LumiTokenSale = artifacts.require("LumiTokenSale");

module.exports = function(deployer) {
  deployer.deploy(LumiToken, 10000000).then(function(){
    // Token price is .001 ether
    var tokenPrice = 1000000000000000;
    return deployer.deploy(LumiTokenSale, LumiToken.address, tokenPrice);
  });
};
