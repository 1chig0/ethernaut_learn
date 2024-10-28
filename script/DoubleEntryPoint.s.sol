// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DoubleEntryPoint.sol";
import "../src/DoubleEntryPoint_exp.sol";
import {console, Script} from "forge-std/Script.sol";

contract DoubleEntryPointScript is Script{
    uint256 public deployer ;
    DoubleEntryPoint DET;
    CryptoVault vault;
    LegacyToken LGT;
    Forta forta;
    Myrobot r;
    address public recipient;

    function setUp() public {
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY_2");

        deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        DET = DoubleEntryPoint(address(0x60C922065532f1Bcc124E10505Ab5d1BcEfcC873));
        vault = CryptoVault(address(DET.cryptoVault()));
        LGT = LegacyToken(address(DET.delegatedFrom()));
        forta = Forta(address(DET.forta()));

        // LGT = new LegacyToken();
        
        // recipient = address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC);
        // vault = new CryptoVault(recipient);
        // forta = new Forta();
        // DET = new DoubleEntryPoint(address(LGT), address(vault), address(forta), address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));

        // LGT.mint(address(vault), 100 ether);
        // LGT.delegateToNewContract(DET);
        // vault.setUnderlying(address(DET));

        vm.stopBroadcast();


    }

    function run() public{
        // deployer = vm.envUint("ANVIL_PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // vault.sweepToken(LGT);  //attack
        r = new Myrobot(address(vault), address(forta));
        forta.setDetectionBot(address(r));
        // vault.sweepToken(LGT);  //attack
        vm.stopBroadcast();


    }
} 