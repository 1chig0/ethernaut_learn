// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/Denial.sol";
import "../src/Denial_exp.sol";

contract CounterScript is Script {
    function setUp() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        Denial c = Denial(payable(0x613f2F3047253E5e7ea3f66720266Ec8615825BD));
        Denial_exp d = new Denial_exp();
        c.setWithdrawPartner(address(d));
        console.log("Counter deployed on %s", address(c));
        vm.stopBroadcast();
    }

    function run() public {

    }
}
