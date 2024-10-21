//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Reentrancy_exp.sol";
import "../src/Reentrancy.sol";
contract Reentrancy_Script is Script{
    Reentrancy r;
    Reentrancy_exp r_exp;
    uint256 deployer;
    function  setUp() public {
        deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);
        r = new Reentrancy();
        // r_exp = Reentrancy_exp();
        vm.stopBroadcast();
    }

    function  run() public {
        
    }

}


