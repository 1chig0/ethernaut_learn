//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Reentrance_exp.sol";
import "../src/Reentrance.sol";
contract Reentrance_Script is Script{
    Reentrance_exp r_exp;
    Reentrance r;
    uint256 deployer;
    function  setUp() public {
        deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);
        r = new Reentrance{value:100}();
        address payable victim = payable(0x5FbDB2315678afecb367f032d93F642f64180aa3);

        // r_exp = new Reentrance_exp{value:0.0005 ether}();
        // r_exp.pwn(victim);
        r_exp = new Reentrance_exp{value:50}(victim);
        r_exp.pwn();
        vm.stopBroadcast();
    }

    function  run() public {
        
    }

}


