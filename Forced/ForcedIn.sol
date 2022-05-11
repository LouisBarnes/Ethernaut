//SPDX-License-Identifier: MIT

//Using the latest version of solidity
pragma solidity ^0.8.0;

contract ForcedIn {

    constructor() public payable {

    }
    // Ensure the function is payable unless using solidity versions lower than 0.5.0
    // _targetAddress will allow you to send the balance of this contract to ANY other address even if it has no fallback functions.
    function destroy(address payable _targetAddress) public {
        selfdestruct(_targetAddress);
    }
}
