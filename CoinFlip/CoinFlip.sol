// SPDX-License-Identifier: MIT
// I will be using the latest version of solidity for this contract (originally ^0.6.0)
pragma solidity ^0.8.0;

// Changed the import URL as the @openzeppelin did not compile in Remix IDE - found this URL with a simple Google search.
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/3bdf4bfd29b145288ec741bef259a384007ed5cf/contracts/utils/math/SafeMath.sol';

contract CoinFlip {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() public {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}
