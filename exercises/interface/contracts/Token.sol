pragma solidity 0.4.23;


interface ERC20Basic {
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}

contract Token is ERC20Basic {

    address owner;
    mapping(address => uint256) balances;

    uint256 totalSupply_;

    constructor(address _owner, uint _totalSupply) public {
        totalSupply_ = _totalSupply;
        balances[_owner] = _totalSupply;
        owner = _owner;
    }

    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }

    // implement totalSupply()
    function totalSupply() external view returns (uint256){
        return totalSupply_;
    }

    // implement transfer()
    function balanceOf(address who) external view returns (uint256){
        return balances[who];
    }

    // implement balanceOf()
    function transfer(address to, uint256 value) external onlyOwner returns (bool){
        require(to != address(0));
        require(balances[msg.sender] > value);
        balances[to] = value;
        balances[msg.sender] = balances[msg.sender] - value;
        return true;
    }

    function() private payable {  }
}
