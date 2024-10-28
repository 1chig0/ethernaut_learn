// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/access/Ownable.sol";
import "@openzeppelin/token/ERC20/ERC20.sol";
import "../src/DoubleEntryPoint.sol";


contract Myrobot is IDetectionBot{
    address public vault;
    address public forta;
    constructor(address v, address f) {
        vault = v;
        forta = f;
    }
    function handleTransaction(address user, bytes calldata msgData) external override{
        (address to, uint256 value, address origSender) = abi.decode(msgData[4:], (address, uint256, address));
        if (origSender == vault) {
            Forta(forta).raiseAlert(user);
        }
        
    }
}
