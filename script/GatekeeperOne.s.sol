//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console, console2} from "forge-std/Script.sol";

import "../src/GatekeeperOne_exp.sol";
import "../src/GatekeeperOne.sol";
contract GatekeeperOne_Script is Script {
    uint256 deployer = vm.envUint("PRIVATE_KEY");
    // uint256 deployer = vm.envUint("ANVIL_PRIVATE_KEY");
    GatekeeperOne_exp gate;
    
    
    function setUp() public  {
        vm.startBroadcast(deployer);
        gate =  new GatekeeperOne_exp();
        // GatekeeperOne gate =  new GatekeeperOne();
        gate.attack();
        vm.stopBroadcast();
    }

    function run() public {
        // vm.startBroadcast(deployer);
        // gate.attack();
        // vm.stopBroadcast();
    }

}



