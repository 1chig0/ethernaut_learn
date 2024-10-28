// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GoodSamaritan.sol";
import "../src/GoodSamaritan_exp.sol";
import {console, Script} from "forge-std/Script.sol";

contract GoodSamaritanScript is Script{
    uint256 public deployer ;
    GoodSamaritan samaritan;
    Coin coin;
    Wallet wallet;
    GoodSamaritan_exp exp;

    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY_2");

        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // samaritan = new GoodSamaritan();
        samaritan = GoodSamaritan(address(0x3f268B249F041e5Eb1C62750010F65410d7D9c42));

        vm.stopBroadcast();


    }

    function run() public{
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);
        exp = new GoodSamaritan_exp(address(samaritan));
        exp.request();
        vm.stopBroadcast();


    }
} 