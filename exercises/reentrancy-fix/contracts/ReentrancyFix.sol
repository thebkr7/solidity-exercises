pragma solidity 0.4.23;

import "./Balances.sol";


contract SecureBalancesWithCallValue is Balances {
    function withdraw() public {
        //balances[msg.sender] = 0;
        msg.sender.call.value(balances[msg.sender]).gas(2300)();
    }
}

contract SecureBalancesWithSend is Balances {
    function withdraw() public {
        // change code so it is not vulnerable using send
        msg.sender.send(balances[msg.sender]);
    }
}

contract SecureBalancesWithTransfer is Balances {
    function withdraw() public {
        // change code so it is not vulnerable using transfer
        msg.sender.transfer(balances[msg.sender]);
    }
}
