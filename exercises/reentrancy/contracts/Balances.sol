pragma solidity 0.4.23;


contract Balances {
    mapping(address => uint) public balances;

    // implement deposit() function and track users balances, msg.value has to be greater than 1 finney
    function deposit() public payable {
        require(msg.value > 1 finney && msg.value != 0);
        balances[msg.sender] += msg.value;
    
    }
}