pragma solidity >=0.4.21 <0.7.0;
/* SPDX-License-Identifier: UNLICENSED */
import "./LumiToken.sol";

contract LumiTokenSale{
    address payable admin; // not public
    LumiToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor (LumiToken _tokenContract, uint256 _tokenPrice) public {
        // Assign an admin to start/end token sale
        admin = msg.sender;
        // Assign Token Contract
        tokenContract = _tokenContract;
        // Set Token Price
        tokenPrice = _tokenPrice;
    }
    // multiply
    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, 'safe multiplication');
    }

    // Buy Tokens
    function buyTokens(uint256 _numberOfTokens) public payable {
        // Require that value is equal to tokens
        require(msg.value == multiply(_numberOfTokens, tokenPrice), 'value is equal to tokens');
        // Require that the contract has enough tokens
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens, 'contract has enough tokens');
        // Require that a transfer is successful
        require(tokenContract.transfer(msg.sender, _numberOfTokens), 'transfer is sucessful');
        // Keep track of tokensSold
        tokensSold += _numberOfTokens;
        // Trigger Sell Event
        emit Sell(msg.sender, _numberOfTokens);
    }

    // Ending Token LumiTokenSale
    function endSale() public {
        // Require admin
        require(msg.sender == admin, 'require admin');
        // Transfer unsold tokens back to admin
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))), 'transfer unsold tokens to admin');
        // Just transfer the balance to the admin
        // Don't destroy contract
        admin.transfer(address(this).balance);
    }

}