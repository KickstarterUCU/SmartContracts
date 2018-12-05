pragma solidity ^0.4.25;

import "http://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Kickstarter is Ownable {
    event BalanceUpdate(address _to, uint256 _value);
    mapping (address => uint256) _balances;

    constructor() public {
        _balances[owner()] = 10000;
    }

    function balanceOf(address owner) public view returns (uint256) {
       return _balances[owner];
    }

    function pay(address to, uint256 value) {
        require(to != address(0));
        _balances[to] = _balances[to] += value;
        emit BalanceUpdate(to, value);
    }

}
