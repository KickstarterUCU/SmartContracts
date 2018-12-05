pragma solidity ^0.4.25;

import './Donator.sol';

contract Project {
    address owner;
    uint256 requiredAmount;


    constructor(address ad, uint256 amount) public {
        owner = ad;
        requiredAmount = amount;
    }

    function donate(address addr, uint256 money) public {


    }


}
