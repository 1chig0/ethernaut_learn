//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console, console2} from "forge-std/Script.sol";

import "../src/GatekeeperTwo_exp.sol";
import "../src/GatekeeperTwo.sol";
contract GatekeeperTwo_Script is Script {
    uint256 deployer = vm.envUint("PRIVATE_KEY");
    // uint256 deployer = vm.envUint("ANVIL_PRIVATE_KEY");
    GatekeeperTwo_exp gate;
    
    function setUp() public  {
        vm.startBroadcast(deployer);
        gate =  new GatekeeperTwo_exp();
        vm.stopBroadcast();
    }

    function run() public {

    }

}



