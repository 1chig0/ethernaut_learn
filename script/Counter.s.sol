// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        // string memory mnemonic = vm.envString("MNEMONIC");
        // (address deployer, ) = deriveRememberKey(mnemonic, 0);
        uint256 deployer = vm.envUint("PRIVARE_KEY");
        vm.startBroadcast(deployer);
        Counter c = new Counter();
        console.log("Counter deployed on %s", address(c));
        vm.stopBroadcast();
    }
}
