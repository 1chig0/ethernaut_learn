// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/OwnerUpOnly.sol";
error Unauthorized();


contract OwnerUpOnlyTest is Test{
    OwnerUpOnly upOnly;
    function setUp() public {
        upOnly = new OwnerUpOnly();
    }

    function testIncrement() public {
        assertEq(upOnly.count(), 0);
        upOnly.increment();
        assertEq(upOnly.count(), 1);
    }



}