pragma solidity 0.4.23;


contract DelegatedDestruct {
    function prune(address _address) public {
        // 1. make sure address is non-zero
        require(_address != address(0));
        // 2. call selfdestruct and transfer balance
        selfdestruct(_address);
    }
}

contract Destruct {
    DelegatedDestruct delegate;
    uint public ping = 1;

    function () public payable {}

    constructor(DelegatedDestruct _delegate) public {
        delegate = _delegate;
    }

    function prune(address _address) public {
        // 1. make sure address is non-zero
        require(_address != address(0));
        // 2. call selfdestruct and transfer balance
        selfdestruct(_address);
    }

    function delegatePrune(address _address) public {
        // 3. implement delegatecall to delegate.prune(address)
        bool del = address(delegate).delegatecall(bytes4(keccak256("prune(address)")), _address);
        // 4. delegatecall returns true/false on success/failure, revert in case of the failure
        if (!del){
            revert();
        }
    }
}
