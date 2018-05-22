pragma solidity 0.4.23;

// import "../../ownable/contracts/Ownable.sol";

contract Ownable {
    address public owner;

    constructor() public {
        // set owner using deployer address (use msg.sender)
        owner = msg.sender;
    }

    // implement onlyOwner modifier that requires sender to be an owner
    modifier onlyOwner() { 
        require(msg.sender == owner);
        _;
    }

    // implement transferOwnership that accepts and sets address of the new owner
    // only owner should be able to use transferOwnership (use onlyOwner modifier)
    function transferOwnership(address _newOwnerAddress) public onlyOwner() {
        owner = _newOwnerAddress;        
    }
}

contract Deposit is Ownable {

    uint public balance;
    // allow contract to accept funds upon creation
    constructor() public payable {
        balance = msg.value;
    }
    
    // allow contract to accept funds via regular transfer
    function send() payable public {
        // Track that calling account deposited ether
        balance = msg.value;
    }

    // allow owner to withdraw the entire balance
    function withdraw() public payable onlyOwner() returns (bool){
        owner.transfer(address(this).balance);
        return true;
    }

    function() private payable{
    // I dont understand the purpose of this one :)
    }
    
}
