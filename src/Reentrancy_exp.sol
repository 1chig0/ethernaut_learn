//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "./Reentrancy.sol";

contract Reentrancy_exp{
    constructor() {
        Reentrancy r = new Reentrancy();
        r.donate(address(this));
        r.withdraw(1);
    }
}

