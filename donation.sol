// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Donation{

    uint256 public goal;
    address payable owner;
    uint256 public progress;
    
    constructor(uint goal_) {
        goal = goal_ * 10 ** 18;
        owner = payable(msg.sender);
    }

    function deposit() external payable {
        require(msg.value >= 0.001 ether, "Minimum deposit is 0.001 ETH");
        require(progress <= goal, "You can deposit");
        progress += msg.value;
    }

   function balance() public view returns(uint256){
        return progress;
    }

}
