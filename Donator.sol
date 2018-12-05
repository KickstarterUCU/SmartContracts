pragma solidity ^0.4.25;


contract Donator {
    address owner;
    uint256 donated;

    constructor(address ow, uint256 amount) public {
        owner = ow;
        donated = amount;

    }
}
