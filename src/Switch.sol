// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {console,console2} from "forge-std/Script.sol";

contract Switch {
    bool public switchOn; // switch is off
    bytes4 public offSelector = bytes4(keccak256("turnSwitchOff()"));

    modifier onlyThis() {
        require(msg.sender == address(this), "Only the contract can call this");
        _;
    }

    modifier onlyOff() {
        // we use a complex data type to put in memory
        bytes32[1] memory selector;

        // console.log("[+]Before copy: ");
        // console.logBytes32(selector[0]);
        // console.log("[+]Call DATA: ");
        // console.logBytes32(bytes32(msg.data));

        // check that the calldata at position 68 (location of _data)
        assembly {
            calldatacopy(selector, 68, 4) // grab function selector from calldata
        }

        console.logBytes32(selector[0]);
        console.logBytes4(offSelector);


        require(selector[0] == offSelector, "Can only call the turnOffSwitch function");
        _;
    }

    function flipSwitch(bytes memory _data) public onlyOff {

        (bool success,) = address(this).call(_data);
        require(success, "call failed :(");
    }

    function turnSwitchOn() public onlyThis {
        switchOn = true;
    }

    function turnSwitchOff() public onlyThis {
        switchOn = false;
    }
}