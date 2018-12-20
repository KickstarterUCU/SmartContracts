pragma solidity ^0.4.25;

contract Project {
    address public owner;
    uint256 public gatheredAmount;
    uint256 public requiredAmount;
    bool public active;
    
    constructor(address ad, uint256 amount) public {
        owner = ad;
        requiredAmount = amount;
        gatheredAmount = 0;
        active = true;
    }
    
    function receive(uint256 amount) public {
        gatheredAmount += amount;
    }
    
    function complete() public view returns (bool) {
        if (gatheredAmount >= requiredAmount && active) active = false;
        return !active;
    }
    
    function info() public view returns (address, uint256, uint256, bool) {
        return (owner, gatheredAmount, requiredAmount, active);
    }
        
    
}