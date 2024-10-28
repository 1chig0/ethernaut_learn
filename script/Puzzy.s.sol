// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "../src/Puzzy.sol";
import "../src/Puzzy_exp.sol";
import {console, Script} from "forge-std/Script.sol";


contract PuzzyScript is Script{
    uint256 deployer;

    PuzzleWallet wallet;
    PuzzleProxy px;
    Puzzy_exp puzzy_exp;

    function setUp() public {
        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        wallet = PuzzleWallet(payable(0xECc2f548CA34BE301E5be5723013Af76E18EFBdF));
        px = PuzzleProxy(payable(0xECc2f548CA34BE301E5be5723013Af76E18EFBdF));
        puzzy_exp = new Puzzy_exp{value: 0.001 ether}(wallet, px);
        puzzy_exp.attack();
        vm.stopBroadcast();

    }

    function run() public {
        
    }

}
