// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
contract OwnerUpOnly {
    uint256 public count;
    address public immutable owner;
    constructor(){
        owner = msg.sender;
    }

    function increment() public {
        if (msg.sender != owner){
            revert();
        }
        count ++;
    }
}
