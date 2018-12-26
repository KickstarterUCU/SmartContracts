pragma solidity ^0.4.25;
import './Project.sol';
import 'http://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract Kickstarter is Ownable {
    uint256 projectsId;
    mapping (address => uint256) _balances;
    mapping (uint256 => Project) _projects;
    
    constructor() public {
        projectsId = 0;
        _balances[owner()] = 0;
    }
  
    function balanceOf(address owner) public view returns (uint256) {
       return _balances[owner];
    }
    
    function projectStatus(uint256 id) public view returns (address, uint256, uint256, bool) {
        return _projects[id].info();
    }
    
    function createProject(address owner, uint256 requiredAmount) {
        _projects[projectsId] = new Project(owner, requiredAmount);
        projectsId++;
    }
    
    function pay(address to, uint256 value) {
        _balances[to] = _balances[to] + value;
    }
  
    function donate(uint256 to, uint256 value) {
        _projects[to].receive(value);
        if (_projects[to].complete()) {
            pay(_projects[to].owner(), _projects[to].gatheredAmount());
            _projects[to].receive(-(_projects[to].gatheredAmount()));
        }
    }
    
    function getProjectIds() view returns (uint256){
        return projectsId; 
    }
    
}