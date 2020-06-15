pragma solidity >=0.4.21 <0.7.0;
/* SPDX-License-Identifier: UNLICENSED */

contract LumiToken{
    // Constructor
    // Set the total number of tokens
    // Read the total number of token

    string public name = "Lumi Token"; // Name
    string public symbol = "LUMI"; // Symbol
    string public standard = "Lumi Token v1.0";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;

    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply; // allocate the initial supply of 10,000,000 tokens
    }

    // Transfer
    function transfer(address _to, uint256 _value) public returns (bool success){
        // Exception if account doesn't have enough
        require(balanceOf[msg.sender] >= _value, 'not enough tokens');
        // Transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // Transfer event
        emit Transfer(msg.sender, _to, _value);
        // Return a boolean
        return true;
    }


}