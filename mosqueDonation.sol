// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Mosque_Donation{

    uint256 public immutable goal;
    address payable owner;
    uint256 public progress;
    

    constructor(uint goal_) {
        goal = goal_ * 10 ** 18;
        owner = payable(msg.sender);
        
    }

    function deposit() external payable {
        require(msg.value >= 1 ether, "Minimum deposit is 1 ETH");
        require(progress <= goal, "You can deposit");
        progress += msg.value;
    }

    function getAddress() public view returns(address){
        return address(this);
    }

    function withdraw() public  {
        owner.transfer(address(this).balance);
    }

    function balance() public view returns(uint256){
        return progress;
    }

}
