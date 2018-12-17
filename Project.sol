pragma solidity ^0.4.25;

contract Project {
    address public owner;
    uint256 public gatheredAmount;
    uint256 public requiredAmount;
    
    constructor(address ad, uint256 amount) public {
        owner = ad;
        requiredAmount = amount;
        gatheredAmount = 0;
    }
    
    function receive(uint256 amount) public {
        gatheredAmount += amount;
    }
    
    function complete() public view returns (bool) {
        return gatheredAmount >= requiredAmount;
    }
    
    function info() public view returns (address, uint256, uint256) {
        return (owner, gatheredAmount, requiredAmount);
    }
        
    
}