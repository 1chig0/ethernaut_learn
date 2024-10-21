// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../src/King.sol";
import "../src/King_exp.sol";
import {Script, console, console2} from "forge-std/Script.sol";


contract KingScript is Script {
    King king;
    King_exp king2;
    uint256 deployer;
    function setUp() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // king = King(payable(0xB656bD685011143cC2Ba4A5561f13663303d4997));
        king2 = new King_exp();
        king2.pwn{value : 102 wei}(payable(0x1EaA3e9900C5De042B82e38d8A37B833151c09Cf));
        vm.stopBroadcast();
    }

    function run() public{
        // vm.startBroadcast(deployer);
        // king2.pwn();
        // vm.stopBroadcast();

    }

}