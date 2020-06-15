const LumiToken = artifacts.require("LumiToken");

contract('LumiToken', function(accounts){
    it('sets the total supply upon deployment', function(){
        return LumiToken.deployed().then(function(instance){
            tokenInstance = instance;
            return tokenInstance.totalSupply();
        }).then(function(totalSupply){
           assert.equal(totalSupply.toNumber(), 10000000, 'sets the total supply to 10,000,000');
        });
    });
    
})