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
}

