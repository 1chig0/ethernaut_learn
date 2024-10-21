// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/OwnerUpOnly.sol";

contract OwnerUpOnlyScript is Script {
    function setUp() public {}

    function run() public {
        // string memory mnemonic = vm.envString("MNEMONIC");
        // (address deployer, ) = deriveRememberKey(mnemonic, 0);
        // uint256 deployer = vm.envUint("PRIVATE_KEY");
        uint256 deployer = vm.envUint("ANVIL_PRIVATE_KEY");

        vm.startBroadcast(deployer);
        OwnerUpOnly c = new OwnerUpOnly();
        console.log("Deployed on %s", address(c));
        vm.stopBroadcast();
    }


}
