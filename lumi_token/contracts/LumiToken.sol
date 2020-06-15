pragma solidity >=0.4.21 <0.7.0;
/* SPDX-License-Identifier: UNLICENSED */

contract LumiToken{
    // Constructor
    // Set the total number of tokens
    // Read the total number of token
    uint256 public totalSupply;

    constructor () public {
        totalSupply = 10000000;
    }

}