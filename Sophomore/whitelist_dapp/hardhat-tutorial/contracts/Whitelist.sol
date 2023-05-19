// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Whitelist {

    //maximum number of whitelist addresses
    uint8 public maxNumOfWhitelistAddress;

    //the number of addresses that have been whitelisted so far, which is initially 0
    uint8 public numOfAddressesWhitelisted;

    //mapping from address to its whitelist status(true/false)
    mapping (address => bool) public whitelistedAddress;

    constructor(uint8 _maxNumOfWhitelistAddress) {
        maxNumOfWhitelistAddress =  _maxNumOfWhitelistAddress;
    }

    //function to add an address to the Whitelist
    function addToWHitelist() public returns (string memory) {
        
        //check if the caller's address is already whitelisted
        require(!whitelistedAddress[msg.sender],"You're already whitelisted");

        //checking if the whitelist limit has been reached
        require(numOfAddressesWhitelisted<maxNumOfWhitelistAddress, "Sorry, whitelist limit has been reached");

        //adding the caller's address to the mapping and setting the status to be true
        whitelistedAddress[msg.sender] = true;

        //increasing the num of addresses whitelisted after adding the caller's address
        numOfAddressesWhitelisted += 1;

        return "Added to whitelist!";

    }
}

