pragma solidity >=0.4.21 <0.7.0;
/* SPDX-License-Identifier: UNLICENSED */

contract LumiToken{

    string public name = "Lumi Token"; // Name
    string public symbol = "LUMI"; // Symbol
    string public standard = "Lumi Token v1.0";
    uint256 public totalSupply; // Read the total number of token

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance; // allowance: A approves B to spend C

    // Constructor
    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        // Set the total number of tokens
        // allocate the initial supply of 10,000,000 tokens
        totalSupply = _initialSupply;
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

    // *** Delegated Transfer ***
    // approve
    function approve(address _spender, uint256 _value) public returns (bool success){
        // allowance
        allowance[msg.sender][_spender] = _value;

        // Approve event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    // transferFrom
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        // Require _from has enough tokens
        require(_value <= balanceOf[_from], 'has enough tokens');

        // Require allowance is big enough
        require(_value <= allowance[_from][msg.sender], 'allowance is big enough');

        // Change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // Update the allowance
        allowance[_from][msg.sender] -= _value;

        // Transfer event
        emit Transfer(_from, _to, _value);

        // return a boolean
        return true;
    }

}