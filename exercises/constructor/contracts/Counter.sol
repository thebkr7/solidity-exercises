pragma solidity 0.4.23;

contract Counter {
    // declare public count variable (uint)
    uint public count;

    // create a constructor wich accepts initial value of the count variable
    constructor(uint _count) public {
        count = _count;
    }
}
